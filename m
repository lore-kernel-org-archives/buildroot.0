From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 16:25:55 -0700
Subject: [Buildroot] [PATCH v2 07/13] package/libblockdev: add support for
 lvm plugin
In-Reply-To: <20200724232601.2441272-1-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
Message-ID: <20200724232601.2441272-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libblockdev/Config.in      | 9 +++++++++
 package/libblockdev/libblockdev.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 6f0b3435fe..9da9685bd9 100644
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
index fddf7e2e87..9362fc10ec 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -20,7 +20,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-dmraid \
 	--without-escrow \
 	--without-kbd \
-	--without-lvm \
 	--without-lvm_dbus \
 	--without-mdraid \
 	--without-mpath \
@@ -53,4 +52,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-loop
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_LVM2),y)
+LIBBLOCKDEV_DEPENDENCIES += lvm2
+LIBBLOCKDEV_CONF_OPTS += --with-lvm
+else
+LIBBLOCKDEV_CONF_OPTS += --without-lvm
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
