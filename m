From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 25 Jul 2020 16:06:13 -0700
Subject: [Buildroot] [PATCH v3 08/13] package/libblockdev: add support for
 mdraid plugin
In-Reply-To: <20200725230618.3640682-1-aduskett@gmail.com>
References: <20200725230618.3640682-1-aduskett@gmail.com>
Message-ID: <20200725230618.3640682-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libblockdev/Config.in      | 4 ++++
 package/libblockdev/libblockdev.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 9da9685bd9..c51449b6ca 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -45,6 +45,10 @@ config BR2_PACKAGE_LIBBLOCKDEV_LVM2
 comment "lvm2 support needs a toolchain w/ locale"
 	depends on !BR2_ENABLE_LOCALE
 
+config BR2_PACKAGE_LIBBLOCKDEV_MDRAID
+	bool "mdraid"
+	select BR2_PACKAGE_LIBBYTESIZE
+
 endif
 
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 457f368663..6bf3ad477a 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -21,7 +21,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-escrow \
 	--without-kbd \
 	--without-lvm_dbus \
-	--without-mdraid \
 	--without-mpath \
 	--without-nvdimm \
 	--without-parted \
@@ -59,4 +58,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-lvm
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_MDRAID),y)
+LIBBLOCKDEV_DEPENDENCIES += libbytesize
+LIBBLOCKDEV_CONF_OPTS += --with-mdraid
+else
+LIBBLOCKDEV_CONF_OPTS += --without-mdraid
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
