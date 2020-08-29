From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:45:58 +0200
Subject: [Buildroot] [git commit] package/libblockdev: add support for loop
 plugin
Message-ID: <20200902161638.C56DE85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63759893f74a007b32bd56b25a2d4e18791a5e1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in      | 3 +++
 package/libblockdev/libblockdev.mk | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 8ef7247262..9f7f401dd3 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -33,6 +33,9 @@ config BR2_PACKAGE_LIBBLOCKDEV_FS
 comment "filesystem plugin needs a toolchain w/ locale"
 	depends on !BR2_ENABLE_LOCALE
 
+config BR2_PACKAGE_LIBBLOCKDEV_LOOP
+	bool "loop"
+
 endif
 
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 2b111df82b..9216fc9932 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -22,7 +22,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-dmraid \
 	--without-escrow \
 	--without-kbd \
-	--without-loop \
 	--without-lvm \
 	--without-lvm_dbus \
 	--without-mdraid \
@@ -50,4 +49,10 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-fs
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_LOOP),y)
+LIBBLOCKDEV_CONF_OPTS += --with-loop
+else
+LIBBLOCKDEV_CONF_OPTS += --without-loop
+endif
+
 $(eval $(autotools-package))
