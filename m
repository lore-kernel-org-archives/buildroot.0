From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:44:37 +0200
Subject: [Buildroot] [git commit] package/libblockdev: add support for fs
 plugin
Message-ID: <20200902161638.BBC7E85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=445813d8cce5c86d9350de9ac677b6ba8e40446f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in      | 8 ++++++++
 package/libblockdev/libblockdev.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index f7a220603c..8ef7247262 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -25,6 +25,14 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
 	select BR2_PACKAGE_CRYPTSETUP
 
+config BR2_PACKAGE_LIBBLOCKDEV_FS
+	bool "filesystem"
+	depends on BR2_ENABLE_LOCALE # parted
+	select BR2_PACKAGE_PARTED
+
+comment "filesystem plugin needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 endif
 
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 67d9ab4483..2b111df82b 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -21,7 +21,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-dm \
 	--without-dmraid \
 	--without-escrow \
-	--without-fs \
 	--without-kbd \
 	--without-loop \
 	--without-lvm \
@@ -44,4 +43,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-crypto
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_FS),y)
+LIBBLOCKDEV_DEPENDENCIES += parted
+LIBBLOCKDEV_CONF_OPTS += --with-fs
+else
+LIBBLOCKDEV_CONF_OPTS += --without-fs
+endif
+
 $(eval $(autotools-package))
