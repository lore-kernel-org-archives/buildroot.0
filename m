From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:46:26 +0200
Subject: [Buildroot] [git commit branch/next] package/libblockdev: add
 support for lvm plugin
Message-ID: <20200829194942.2064481466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05c46e723abd7ebb9dbcae472ac6904e9429b81b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in      | 9 +++++++++
 package/libblockdev/libblockdev.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 9f7f401dd3..732ac410b0 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -36,6 +36,15 @@ comment "filesystem plugin needs a toolchain w/ locale"
 config BR2_PACKAGE_LIBBLOCKDEV_LOOP
 	bool "loop"
 
+config BR2_PACKAGE_LIBBLOCKDEV_LVM2
+	bool "lvm2"
+	depends on BR2_ENABLE_LOCALE # parted
+	select BR2_PACKAGE_PARTED
+	select BR2_PACKAGE_LVM2
+
+comment "lvm2 support needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 endif
 
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 9216fc9932..b0b0852e8d 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -22,7 +22,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-dmraid \
 	--without-escrow \
 	--without-kbd \
-	--without-lvm \
 	--without-lvm_dbus \
 	--without-mdraid \
 	--without-mpath \
@@ -55,4 +54,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-loop
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_LVM2),y)
+LIBBLOCKDEV_DEPENDENCIES += lvm2 parted
+LIBBLOCKDEV_CONF_OPTS += --with-lvm
+else
+LIBBLOCKDEV_CONF_OPTS += --without-lvm
+endif
+
 $(eval $(autotools-package))
