Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93AEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7498D81463;
	Sat,  8 Jan 2022 16:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMax2ms4hHhP; Sat,  8 Jan 2022 16:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9283A81466;
	Sat,  8 Jan 2022 16:15:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9D681BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5ED081466
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fx3Xks1v53-B for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:15:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7BD381463
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:15:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 25EB282E00; Sat,  8 Jan 2022 16:08:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 17:14:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1842a1cb2c7baebbc6e0f78993dac7953fd3309c
X-Git-Newrev: 97c74a73e5dee17530647f89b2c7d8692781eb14
X-Patchwork-Hint: ignore
Message-Id: <20220108160854.25EB282E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rockchip-mali: new package
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
Content-Type: multipart/mixed; boundary="===============2156916854722592133=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2156916854722592133==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=97c74a73e5dee17530647f89b2c7d8692781eb14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is already a package adding Mali blobs for Sunxi Mali Utgard
GPUs. Many Rockchip SoCs feature a Mali Bifrost GPU and need specific
libraries provided under binary form with a non-GPL compliant license
by Rockchip. Package these libraries.

While the repository at https://github.com/rockchip-linux/libmali
supports many GPU variants, this package for now only supports the
Bifrost GPU blob. Support for other GPU blobs can be added later.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
[Thomas:
- Rename to rockchip-mali, because it contains other blobs than
  Bifrost ones
- Add missing entry in DEVELOPERS file
- Change BR2_arm to BR2_ARM_EABIHF as only EABIhf blobs are provided
  for arm32
- Add BR2_TOOLCHAIN_HAS_THREADS inherited from libdrm.
- Expose as a libgbm provider.
- Drop the patch, which was not necessary.
- Rework the entire installation logic, to be much simpler.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  3 ++
 package/Config.in                        |  1 +
 package/rockchip-mali/Config.in          | 31 +++++++++++++
 package/rockchip-mali/rockchip-mali.hash |  2 +
 package/rockchip-mali/rockchip-mali.mk   | 77 ++++++++++++++++++++++++++++++++
 5 files changed, 114 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 73664feb48..a64a9ef384 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2020,6 +2020,9 @@ F:	package/libfribidi/
 N:	Min Xu <xuminready@gmail.com>
 F:	package/shadowsocks-libev/
 
+N:	Miquèl Raynal
+F:	package/rockchip-mali/
+
 N:	Mircea Gliga <gliga.mircea@gmail.com>
 F:	package/mbuffer/
 
diff --git a/package/Config.in b/package/Config.in
index a555e6fd78..bf7a346f75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -548,6 +548,7 @@ endmenu
 	source "package/raspi-gpio/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
+	source "package/rockchip-mali/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
diff --git a/package/rockchip-mali/Config.in b/package/rockchip-mali/Config.in
new file mode 100644
index 0000000000..b2033652a8
--- /dev/null
+++ b/package/rockchip-mali/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_ROCKCHIP_MALI
+	bool "rockchip-mali"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_ARM_EABIHF || BR2_aarch64
+	# lidbrm. This would normally need a Config.in comment, but
+	# these blobs are linked against glibc, so we are sure to have
+	# thread support, so don't bother.
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	select BR2_PACKAGE_LIBDRM
+	help
+	  Install the binary user-space libraries for the ARM Mali GPU
+	  suitable for Rockchip platforrms. This package requires a
+	  kernel with the ARM Mali GPU kernel driver enabled, as found
+	  in the 'mali-driver' package.
+
+if BR2_PACKAGE_ROCKCHIP_MALI
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "rockchip-mali"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "rockchip-mali"
+
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	default "rockchip-mali"
+
+endif
diff --git a/package/rockchip-mali/rockchip-mali.hash b/package/rockchip-mali/rockchip-mali.hash
new file mode 100644
index 0000000000..38efcb3077
--- /dev/null
+++ b/package/rockchip-mali/rockchip-mali.hash
@@ -0,0 +1,2 @@
+sha256 ee440d859e9d7dfdf29b9a00c7a633337913c407be567d3651c29c12eb75fd9c  rockchip-mali-721653b5b3b525a4f80d15aa7e2f9df7b7e60427.tar.gz
+sha256 a78acc73de9909efb879800d4daa4640c4aaa55cd751238a133954aba15e4285  END_USER_LICENCE_AGREEMENT.txt
diff --git a/package/rockchip-mali/rockchip-mali.mk b/package/rockchip-mali/rockchip-mali.mk
new file mode 100644
index 0000000000..6200191a73
--- /dev/null
+++ b/package/rockchip-mali/rockchip-mali.mk
@@ -0,0 +1,77 @@
+################################################################################
+#
+# rockchip-mali
+#
+################################################################################
+
+ROCKCHIP_MALI_VERSION = 721653b5b3b525a4f80d15aa7e2f9df7b7e60427
+ROCKCHIP_MALI_SITE = $(call github,rockchip-linux,libmali,$(ROCKCHIP_MALI_VERSION))
+ROCKCHIP_MALI_LICENSE = Proprietary
+ROCKCHIP_MALI_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
+ROCKCHIP_MALI_INSTALL_STAGING = YES
+ROCKCHIP_MALI_DEPENDENCIES = host-patchelf libdrm
+ROCKCHIP_MALI_PROVIDES = libegl libgles libgbm
+
+ROCKCHIP_MALI_LIB = libmali-bifrost-g31-rxp0$(ROCKCHIP_MALI_SUFFIX).so
+ROCKCHIP_MALI_PKGCONFIG_FILES = egl gbm glesv2 mali
+ROCKCHIP_MALI_ARCH_DIR = $(if $(BR2_arm),arm-linux-gnueabihf,aarch64-linux-gnu)
+ROCKCHIP_MALI_HEADERS = EGL FBDEV GLES GLES2 GLES3 KHR gbm.h
+
+# We need to create:
+# - The symlink that matches the library SONAME (libmali.so.1)
+# - The .so symlinks needed at compile time by the compiler (*.so)
+ROCKCHIP_MALI_LIB_SYMLINKS = \
+	libmali.so.1 \
+	libMali.so \
+	libEGL.so \
+	libgbm.so \
+	libGLESv1_CM.so \
+	libGLESv2.so
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+ROCKCHIP_MALI_SUFFIX = -wayland-gbm
+ROCKCHIP_MALI_PKGCONFIG_FILES += wayland-egl
+ROCKCHIP_MALI_LIB_SYMLINKS += libwayland-egl.so
+ROCKCHIP_MALI_DEPENDENCIES += wayland
+else
+ROCKCHIP_MALI_SUFFIX = -gbm
+endif
+
+define ROCKCHIP_MALI_INSTALL_CMDS
+# 	Install the library
+	$(INSTALL) -D -m 0755 \
+		$(@D)/lib/$(ROCKCHIP_MALI_ARCH_DIR)/$(ROCKCHIP_MALI_LIB) \
+		$(1)/usr/lib/$(ROCKCHIP_MALI_LIB)
+
+# 	Ensure it has a proper soname
+	$(HOST_DIR)/bin/patchelf --set-soname libmali.so.1 \
+		$(1)/usr/lib/$(ROCKCHIP_MALI_LIB)
+
+#	Generate and install the .pc files
+	mkdir -p $(1)/usr/lib/pkgconfig
+	$(foreach pkgconfig,$(ROCKCHIP_MALI_PKGCONFIG_FILES), \
+		sed -e 's%@CMAKE_INSTALL_LIBDIR@%lib%;s%@CMAKE_INSTALL_INCLUDEDIR@%include%' \
+			$(@D)/pkgconfig/$(pkgconfig).pc.cmake > \
+			$(1)/usr/lib/pkgconfig/$(pkgconfig).pc
+	)
+
+#	Install all headers
+	$(foreach d,$(ROCKCHIP_MALI_HEADERS), \
+		cp -dpfr $(@D)/include/$(d) $(1)/usr/include/
+	)
+
+#	Create symlinks
+	$(foreach symlink,$(ROCKCHIP_MALI_LIB_SYMLINKS), \
+		ln -sf $(ROCKCHIP_MALI_LIB) $(1)/usr/lib/$(symlink)
+	)
+endef
+
+define ROCKCHIP_MALI_INSTALL_TARGET_CMDS
+	$(call ROCKCHIP_MALI_INSTALL_CMDS,$(TARGET_DIR))
+endef
+
+define ROCKCHIP_MALI_INSTALL_STAGING_CMDS
+	$(call ROCKCHIP_MALI_INSTALL_CMDS,$(STAGING_DIR))
+endef
+
+$(eval $(generic-package))

--===============2156916854722592133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2156916854722592133==--
