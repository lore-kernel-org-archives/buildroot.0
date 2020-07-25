From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 25 Jul 2020 16:06:11 -0700
Subject: [Buildroot] [PATCH v3 06/13] package/libblockdev: add support for
 loop plugin
In-Reply-To: <20200725230618.3640682-1-aduskett@gmail.com>
References: <20200725230618.3640682-1-aduskett@gmail.com>
Message-ID: <20200725230618.3640682-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libblockdev/Config.in      | 3 +++
 package/libblockdev/libblockdev.mk | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index a514f01875..6f0b3435fe 100644
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
index 7cb5ceb9bb..fddf7e2e87 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -20,7 +20,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-dmraid \
 	--without-escrow \
 	--without-kbd \
-	--without-loop \
 	--without-lvm \
 	--without-lvm_dbus \
 	--without-mdraid \
@@ -48,4 +47,10 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-fs
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_LOOP),y)
+LIBBLOCKDEV_CONF_OPTS += --with-loop
+else
+LIBBLOCKDEV_CONF_OPTS += --without-loop
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
