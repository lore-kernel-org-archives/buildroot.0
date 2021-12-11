Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1340DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0C02607A9;
	Sat, 11 Dec 2021 20:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RcjH3pIdH34V; Sat, 11 Dec 2021 20:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2383E60757;
	Sat, 11 Dec 2021 20:53:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15B7E1BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E35CD60D7F
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id InPHdyVFU_nI for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2269F60D87
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0159982964; Sat, 11 Dec 2021 20:48:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 21:35:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d565a831d7316ffbd182694b25674ab0101718b
X-Git-Newrev: c988867fd2c72fe5abeb63c4abe92f10eea6499d
X-Patchwork-Hint: ignore
Message-Id: <20211211204815.0159982964@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: Don't print
 directory in 'make' call
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

commit: https://git.buildroot.net/buildroot/commit/?id=c988867fd2c72fe5abeb63c4abe92f10eea6499d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is possible that some users of buildroot have put it in a repository
and call into it from another Makefile such as:
.DEFAULT:
	$(MAKE) O=$(abspath $(O)) -C buildroot $(@)

This technique works well except that Make tells us that it changes into
the buildroot directory:
make[1]: Entering directory 'buildroot'

Because this line doesn't have an equals within it, python raises a
ValueError exception within pkg-stats.

This patch has python tell the invoked make not to print directories

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/pkg-stats | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3992c8312a..a435abff3d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -375,7 +375,8 @@ def get_config_packages():
 
 def package_init_make_info():
     # Fetch all variables at once
-    variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
+    variables = subprocess.check_output(["make", "--no-print-directory", "-s",
+                                         "BR2_HAVE_DOT_CONFIG=y", "printvars",
                                          "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"])
     variable_list = variables.decode().splitlines()
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
