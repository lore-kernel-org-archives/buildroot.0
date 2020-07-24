From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 16:25:57 -0700
Subject: [Buildroot] [PATCH v2 09/13] package/libblockdev: add support for
 part plugin
In-Reply-To: <20200724232601.2441272-1-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
Message-ID: <20200724232601.2441272-10-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libblockdev/Config.in      | 8 ++++++++
 package/libblockdev/libblockdev.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index c51449b6ca..82e317b25f 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -49,6 +49,14 @@ config BR2_PACKAGE_LIBBLOCKDEV_MDRAID
 	bool "mdraid"
 	select BR2_PACKAGE_LIBBYTESIZE
 
+config BR2_PACKAGE_LIBBLOCKDEV_PART
+	bool "part"
+	depends on BR2_ENABLE_LOCALE # parted
+	select BR2_PACKAGE_PARTED
+
+comment "part plugin needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 endif
 
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 3b5bf00b90..16e1dc46c9 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -23,7 +23,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-lvm_dbus \
 	--without-mpath \
 	--without-nvdimm \
-	--without-parted \
 	--without-python2 \
 	--without-python3 \
 	--without-s390 \
@@ -65,4 +64,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-mdraid
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_PART),y)
+LIBBLOCKDEV_DEPENDENCIES += parted
+LIBBLOCKDEV_CONF_OPTS += --with-part
+else
+LIBBLOCKDEV_CONF_OPTS += --without-part
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
