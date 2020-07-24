From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 16:25:53 -0700
Subject: [Buildroot] [PATCH v2 05/13] package/libblockdev: add support for
 fs plugin
In-Reply-To: <20200724232601.2441272-1-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
Message-ID: <20200724232601.2441272-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Change BR2_PACKAGE_UTIL_LINUX_LIBMOUNT to BR2_PACKAGE_PARTED which is the
    proper dependency on this plugin.

 package/libblockdev/Config.in      | 8 ++++++++
 package/libblockdev/libblockdev.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 50c84c0c4d..a514f01875 100644
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
index bb6fbcdda1..7cb5ceb9bb 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -19,7 +19,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-dm \
 	--without-dmraid \
 	--without-escrow \
-	--without-fs \
 	--without-kbd \
 	--without-loop \
 	--without-lvm \
@@ -42,4 +41,11 @@ else
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
-- 
2.26.2
