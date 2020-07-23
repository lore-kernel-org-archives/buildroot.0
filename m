From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Jul 2020 18:08:04 -0700
Subject: [Buildroot] [PATCH 06/12] package/libblockdev: add fs plugin support
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723010810.3237608-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This plugin enables the fs plugin for the libblockdev library, which is
required for newer versions of the udisks package.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libblockdev/Config.in      | 4 ++++
 package/libblockdev/libblockdev.mk | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 6740b7ac6c..db67afd648 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -33,6 +33,10 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
 	select BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_VOLUME_KEY
 
+config BR2_PACKAGE_LIBBLOCKDEV_FS
+	bool "Filesystem plugin"
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+
 endif
 
 comment "libblockdev needs udev /dev management and a glibc or musl toolchain w/ locale, wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 72163d8a94..2fd24e6103 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -24,7 +24,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--enable-introspection=no \
 	--without-bcache \
 	--without-btrfs \
-	--without-fs \
 	--without-dm \
 	--without-dmraid \
 	--without-nvdimm \
@@ -45,4 +44,10 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-crypto --without-escrow
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_FS),y)
+LIBBLOCKDEV_CONF_OPTS += --with-fs
+else
+LIBBLOCKDEV_CONF_OPTS += --without-fs
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
