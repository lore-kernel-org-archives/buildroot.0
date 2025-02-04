Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0FFC02198
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1786A40669;
	Tue,  4 Feb 2025 15:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-YU-jpobkMb; Tue,  4 Feb 2025 15:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C927940659
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C927940659;
	Tue,  4 Feb 2025 15:47:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7D7E12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97E3740442
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTxKg_cux74Z for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B6E9400E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B6E9400E0
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:47:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53F5486EB5; Tue,  4 Feb 2025 15:47:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:45:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e1b098212add9a323bbb7d64823f989930d5e09
X-Git-Newrev: fdc1914e1d966285fa8eb31c0d80f87637c5b285
X-Patchwork-Hint: ignore
Message-Id: <20250204154744.53F5486EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cloop: bump to 3.14.1.3+nmu1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdc1914e1d966285fa8eb31c0d80f87637c5b285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the latest version available in Debian (which is our upstream
for this package). The changelog is:

   [ Ben Hutchings ]
   * Fix FTBFS with gcc 11 (Closes: #1005413):
     - Remove exception specifications
   * Fix module build for recent kernel versions (Closes: #1005414):
     - Stop generating module vermagic in cloop.c. This has always been handled
       by modpost and doing it here now results in build failure.
     - Avoid using inode::i_bdev, which was removed in Linux 5.11.
     - Use set_disk_ro() instead of set_device_ro(). The latter was not meant to
       be used by device drivers and was removed in Linux 5.11.
     - Use blk_{mq_alloc,cleanup}_disk() instead of separate queue and disk
       allocation and cleanup on Linux 5.15+, since alloc_disk() was removed.
     - Handle potential failure of add_disk() on Linux 5.15+.
     - Use kernel_read() instead of vfs_read() and set_fs(). set_fs() is no
       longer defined on some architectures, and kernel_read() has had large
       file support since Linux 2.6.31.
 .
   [ Vagrant Cascadian ]
   * debian/rules: Build tarball reproducibly, using consistent time, uid,
     gid and sort order. Thanks to Dhole for the initial patch.

The "Fix FTBFS with gcc 11" allows us to remove the -std=c++14
workaround added in commit
7e147e778fc3397cd2a069c8127fa4d2cc6c0355 ("package/cloop: fix build
with gcc >= 9").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: use debian snapshot instead of debian-debug]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/cloop/cloop.hash | 4 ++--
 package/cloop/cloop.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cloop/cloop.hash b/package/cloop/cloop.hash
index eb922764bb..3bc9e8ff79 100644
--- a/package/cloop/cloop.hash
+++ b/package/cloop/cloop.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop/cloop_3.14.1.3.dsc
-sha256  e3079e70f9edae8ed1ac64694af08f6c7dc710ca65a56e4770dcb1325a293193  cloop_3.14.1.3.tar.xz
+# From https://snapshot.debian.org/archive/debian/20221223T031011Z/pool/main/c/cloop/cloop_3.14.1.3%2Bnmu1.dsc
+sha256  04060d88231208b0db8ae8c3b54b0a46ee12139b617ebfc80b03d2ddd2cdb6ba  cloop_3.14.1.3+nmu1.tar.xz
 
 # Hash for license files
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  advancecomp-1.15/COPYING
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 6f6d5fe6a8..23132fe673 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CLOOP_VERSION = 3.14.1.3
+CLOOP_VERSION = 3.14.1.3+nmu1
 CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.xz
-CLOOP_SITE = http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop
+CLOOP_SITE = https://snapshot.debian.org/archive/debian/20221223T031011Z/pool/main/c/cloop
 CLOOP_LICENSE = GPL-2.0 (module), GPL-2.0+ (advancecomp)
 CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING
 
@@ -14,7 +14,7 @@ HOST_CLOOP_DEPENDENCIES = host-zlib
 
 define HOST_CLOOP_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) APPSONLY=yes \
-		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE" CPPFLAGS="-std=c++14"
+		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE"
 endef
 
 define HOST_CLOOP_INSTALL_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
