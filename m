Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C042BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DDA282C8F;
	Sat, 30 Apr 2022 18:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOFoV18zLuZg; Sat, 30 Apr 2022 18:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A255D82B34;
	Sat, 30 Apr 2022 18:56:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6F01BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11490404C3
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vi8OhFCS7Qvp for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65C95404DB
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 018CF84B54; Sat, 30 Apr 2022 18:44:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:40:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 854e18cc2579f21a53617667055bfe49192a3908
X-Git-Newrev: 3c98eb26db6501a373cc405c80505ba72fde9e96
X-Patchwork-Hint: ignore
Message-Id: <20220430184418.018CF84B54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: increase default
 target rootfs size to 5G
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c98eb26db6501a373cc405c80505ba72fde9e96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since there isn't a way to reliably compute the required size lets
just set it to what should be a high enough value to not run out
of space.

Both ext2 and fsfs create sparse files, so this is not a waste of disk
space.

Fixes:
 - http://autobuild.buildroot.net/results/a3c68cdc515353c0d2650ee743aa3bd8ab99a418
 - http://autobuild.buildroot.net/results/ad426ff903d78a92de8f0208876e2196136a09a8

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index adefb8f502..ab1f6f43b1 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -200,6 +200,8 @@ def fixup_config(sysinfo, configfile):
     with open(configfile) as configf:
         configlines = configf.readlines()
 
+    ROOTFS_SIZE = '5G'
+
     BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
 
     if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
@@ -441,6 +443,16 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
         configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
 
+    if 'BR2_TARGET_ROOTFS_EXT2_GEN=y\n' in configlines and \
+       'BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n' in configlines:
+        configlines.remove('BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n')
+        configlines.append('BR2_TARGET_ROOTFS_EXT2_SIZE="%s"\n' % ROOTFS_SIZE)
+
+    if 'BR2_TARGET_ROOTFS_F2FS=y\n' in configlines and \
+       'BR2_TARGET_ROOTFS_F2FS_SIZE="100M"\n' in configlines:
+        configlines.remove('BR2_TARGET_ROOTFS_F2FS_SIZE="100M"\n')
+        configlines.append('BR2_TARGET_ROOTFS_F2FS_SIZE="%s"\n' % ROOTFS_SIZE)
+
     if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
        'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
         configlines.remove('BR2_TARGET_S500_BOOTLOADER=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
