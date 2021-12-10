Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DB1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1536E61502;
	Fri, 10 Dec 2021 19:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cimZOVVc4ASl; Fri, 10 Dec 2021 19:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70C0D614FE;
	Fri, 10 Dec 2021 19:12:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8367E1BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FADE426E9
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWqNKASqgBof for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:12:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE175426E4
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:12:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 142E68251C; Fri, 10 Dec 2021 19:07:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 19:26:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc570eff964fbb2afb88b7e59ee08372ae0aaa32
X-Git-Newrev: 4910a175b3f1f4b55ff257a75945d8ffb14a4ceb
X-Patchwork-Hint: ignore
Message-Id: <20211210190713.142E68251C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib/lib_mk.py: check
 DEPENDENCIES
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4910a175b3f1f4b55ff257a75945d8ffb14a4ceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Check that {FOO}_DEPENDENCIES are never overriden in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/checkpackagelib/lib_mk.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 95501e5515..a304f71fd5 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -88,6 +88,8 @@ class OverriddenVariable(_CheckFunction):
         r"_SITE\s*=\s*",
         r"_SOURCE\s*=\s*",
         r"_VERSION\s*=\s*"])))
+    FORBIDDEN_OVERRIDDEN = re.compile(r"^[A-Z0-9_]+({})".format("|".join([
+        r"_DEPENDENCIES\s*=\s*"])))
 
     def before(self):
         self.conditional = 0
@@ -123,6 +125,10 @@ class OverriddenVariable(_CheckFunction):
                         .format(self.filename, lineno, variable),
                         text]
         else:
+            if self.FORBIDDEN_OVERRIDDEN.search(text):
+                return ["{}:{}: conditional override of variable {}"
+                        .format(self.filename, lineno, variable),
+                        text]
             if variable not in self.unconditionally_set:
                 self.conditionally_set.append(variable)
                 return
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
