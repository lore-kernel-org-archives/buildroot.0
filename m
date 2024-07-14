Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D810C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 609D481372;
	Sun, 14 Jul 2024 09:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0qa3FEHQFta; Sun, 14 Jul 2024 09:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 730EC81396
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 730EC81396;
	Sun, 14 Jul 2024 09:08:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA5AA1BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D235760605
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8021BRXMZBKs for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10C77605E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10C77605E8
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADAC086737; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 10:09:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc2dedcfc649014702577ab89f550a37766bacf2
X-Git-Newrev: 32b4912a75d19b8883ddd8ed0c5851b4fe14e96b
X-Patchwork-Hint: ignore
Message-Id: <20240714090820.ADAC086737@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: instruct shellcheck
 to follow included files
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32b4912a75d19b8883ddd8ed0c5851b4fe14e96b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We do have a few shell scripts that have source directives (either with
'source' or with '.'), and they all are currently either globally
ignored in .checkpackageignore, or have shellcheck directives to ignore
the source statement (SC1090).

So, we can safely instruct shellcheck where to lookup for sourced files;
that does not trigger any new error.

This will alow fixing some shellcheck errors in later commits.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
[Arnout: use long option]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/checkpackagelib/tool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
index 907ada704f..dcca65f62a 100644
--- a/utils/checkpackagelib/tool.py
+++ b/utils/checkpackagelib/tool.py
@@ -31,7 +31,7 @@ class Flake8(_Tool):
 
 class Shellcheck(_Tool):
     def run(self):
-        cmd = ['shellcheck', self.filename]
+        cmd = ['shellcheck', "--external-sources", self.filename]
         try:
             p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             stdout = p.communicate()[0]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
