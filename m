From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 16:25:52 -0700
Subject: [Buildroot] [PATCH v2 04/13] package/libblockdev: add support for
 crypto plugin
In-Reply-To: <20200724232601.2441272-1-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
Message-ID: <20200724232601.2441272-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Only depend on and select the cryptsetup package.
    The volume-key and libnss packages are only necessary if --with-escrow is
    passed as a conf opt.

 package/libblockdev/Config.in      | 11 +++++++++++
 package/libblockdev/libblockdev.mk |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 4fd80f1f5c..50c84c0c4d 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -16,6 +16,17 @@ config BR2_PACKAGE_LIBBLOCKDEV
 
 	  https://github.com/storaged-project/libblockdev/
 
+if BR2_PACKAGE_LIBBLOCKDEV
+
+comment "plugins"
+
+config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
+	bool "crypto"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
+	select BR2_PACKAGE_CRYPTSETUP
+
+endif
+
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 3040a2a690..bb6fbcdda1 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -16,7 +16,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--with-loop \
 	--without-bcache \
 	--without-btrfs \
-	--without-crypto \
 	--without-dm \
 	--without-dmraid \
 	--without-escrow \
@@ -36,4 +35,11 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-tools \
 	--without-vdo
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_CRYPTO),y)
+LIBBLOCKDEV_DEPENDENCIES += cryptsetup
+LIBBLOCKDEV_CONF_OPTS += --with-crypto
+else
+LIBBLOCKDEV_CONF_OPTS += --without-crypto
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
