Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F66C0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 07:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB3B80C3D;
	Thu, 27 Jul 2023 07:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AB3B80C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 50Os86v4xBTE; Thu, 27 Jul 2023 07:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C03280BA7;
	Thu, 27 Jul 2023 07:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C03280BA7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1411BF83A
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 07:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 044D8801EC
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 07:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 044D8801EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLu31hSuzze5 for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 07:13:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD63381585
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 07:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD63381585
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A666B83614; Thu, 27 Jul 2023 07:13:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 09:12:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cfff4e120f18322df676160caa9a0162644d3f9a
X-Git-Newrev: 41493cae71a25a4a1a1819b078717793eda7ffff
X-Patchwork-Hint: ignore
Message-Id: <20230727071327.A666B83614@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: not using kernel-module infra
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1643987077163713549=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1643987077163713549==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=41493cae71a25a4a1a1819b078717793eda7ffff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zfs already builds the kernel module from the autotools infrastructure.

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zfs/Config.in | 1 +
 package/zfs/zfs.mk    | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/zfs/Config.in b/package/zfs/Config.in
index 6209c5865b..049e0716f3 100644
--- a/package/zfs/Config.in
+++ b/package/zfs/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_ZFS
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_USE_MMU  # util-linux (libblkid)
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # libtirpc
+	select BR2_LINUX_NEEDS_MODULES
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 6d5d46a305..b852d8d4e2 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -15,7 +15,7 @@ ZFS_CPE_ID_PRODUCT = openzfs
 # 0001-removal-of-LegacyVersion-broke-ax_python_dev.m4.patch
 ZFS_AUTORECONF = YES
 
-ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl
+ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib libcurl linux
 
 # sysvinit installs only a commented-out modules-load.d/ config file
 ZFS_CONF_OPTS = \
@@ -79,5 +79,7 @@ define ZFS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_ZLIB_INFLATE)
 endef
 
-$(eval $(kernel-module))
+# Even though zfs builds a kernel module, it gets built directly by
+# the autotools logic, so we don't use the kernel-module
+# infrastructure.
 $(eval $(autotools-package))

--===============1643987077163713549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1643987077163713549==--
