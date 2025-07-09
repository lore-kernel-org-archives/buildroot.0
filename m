Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6529BC83F03
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 19:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FB6E81549;
	Wed,  9 Jul 2025 19:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLeNr6aMHBnh; Wed,  9 Jul 2025 19:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 619B88111C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 619B88111C;
	Wed,  9 Jul 2025 19:11:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7D1F12E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C57044020A
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_A5aBdzJPpu for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 19:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C61D4016F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C61D4016F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:11:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16D118630A; Wed,  9 Jul 2025 19:11:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Jul 2025 21:07:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de9d24bf2c3ccaa69707503ed1201a8b714da6c1
X-Git-Newrev: e3a52cc941c154a2ddf6c71df3c8c1daf70a4f86
X-Patchwork-Hint: ignore
Message-Id: <20250709191107.16D118630A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ufs-utils: bump to version 7.14.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5678743904905433348=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5678743904905433348==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e3a52cc941c154a2ddf6c71df3c8c1daf70a4f86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding _GNU_SOURCE to CFLAGS was necessary to fix the following error
raised during the compilation of the new version:

ufs_emon.c: In function ‘do_emon’:
ufs_emon.c:455:51: error: ‘O_DIRECT’ undeclared (first use in this function); did you mean ‘O_DIRECTORY’?
  455 |         fill_data_fd = open("fill_file", O_RDWR | O_DIRECT | O_CREAT,
      |                                                   ^~~~~~~~
      |                                                   O_DIRECTORY
ufs_emon.c:455:51: note: each undeclared identifier is reported only once for each function it appears in

This _GNU_SOURCE define was added upstream in commit [1] in the Makefile
default CFLAGS, but since Buildroot redefines those it needs to be added
back.

Release notes:
https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v7.14.11

[1] https://github.com/SanDisk-Open-Source/ufs-utils/commit/183e0deb28f13cfb3caf161fc6d0f3cd1edb05c2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: add link to upstream commit to justify _GNU_SOURCE]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ufs-utils/ufs-utils.hash | 2 +-
 package/ufs-utils/ufs-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ufs-utils/ufs-utils.hash b/package/ufs-utils/ufs-utils.hash
index 39cf6516c6..f67534cd1e 100644
--- a/package/ufs-utils/ufs-utils.hash
+++ b/package/ufs-utils/ufs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b46f1dbd3688d3b72009c54ae789dd60ea386546cd433325c05970208d36c8a3  ufs-utils-6.14.11.tar.gz
+sha256  07d80ddd2dcfbe5e844515648c494fab33790be5450d150b88e3612da9b1895b  ufs-utils-7.14.11.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ufs-utils/ufs-utils.mk b/package/ufs-utils/ufs-utils.mk
index 672041a119..cafc825fab 100644
--- a/package/ufs-utils/ufs-utils.mk
+++ b/package/ufs-utils/ufs-utils.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-UFS_UTILS_VERSION = 6.14.11
+UFS_UTILS_VERSION = 7.14.11
 UFS_UTILS_SITE = $(call github,SanDisk-Open-Source,ufs-utils,v$(UFS_UTILS_VERSION))
 UFS_UTILS_LICENSE = GPL-2.0
 UFS_UTILS_LICENSE_FILES = COPYING
 
 define UFS_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 endef
 
 define UFS_UTILS_INSTALL_TARGET_CMDS

--===============5678743904905433348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5678743904905433348==--
