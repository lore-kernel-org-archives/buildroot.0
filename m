Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A245EC531DF
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 10:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70B5480F19;
	Sun, 18 Aug 2024 10:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENKktiHHkfIa; Sun, 18 Aug 2024 10:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CAF780F1A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAF780F1A;
	Sun, 18 Aug 2024 10:11:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00E451BF297
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E11094026E
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7g6c5h9J0z7P for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 10:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE0440268
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDE0440268
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 10:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E669D85FD5; Sun, 18 Aug 2024 10:11:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 12:08:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d33d394c2c9659f8c487929bf45f7daf673e521
X-Git-Newrev: da5c25c9f91b17a3c00ff0b35164881f2d1aa425
X-Patchwork-Hint: ignore
Message-Id: <20240818101127.E669D85FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: do not use
 BR2_BACKUP_SITE for some builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=da5c25c9f91b17a3c00ff0b35164881f2d1aa425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to test that upstream sites are still working, we need to NOT
fallback to sources.buildroot.net for some builds.

As there is anyway a local cache in the autobuilder instances, we need
to do quite a lot of builds without any BR2_BACKUP_SITE configured to
have a chance to catch issues, which is why a 50% chance is used to
unset BR2_BACKUP_SITE.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index c83999a7cf..3e17819325 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -562,6 +562,11 @@ async def gen_config(args):
         configlines.append("BR2_REPRODUCIBLE=y\n")
         configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
 
+    # From time to time, ignore sources.buildroot.net to really fetch
+    # from upstream
+    if randint(0, 1) == 0:
+        configlines.append("""BR2_BACKUP_SITE=""\n""")
+
     with open(configfile, "a") as configf:
         configf.writelines(configlines)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
