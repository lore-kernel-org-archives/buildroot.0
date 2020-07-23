From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Jul 2020 18:08:03 -0700
Subject: [Buildroot] [PATCH 05/12] package/libblockdev: add cryptography
 support
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723010810.3237608-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The cryptography plugin requires the volume-key package. Because of the large
number of required dependencies needed to build volume-key, adding a separate
config option to libblockdev's Config.in is preferable than checking if a user
selected the volume-key package independently.

This option is needed for newer versions of udisks.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libblockdev/Config.in      | 13 +++++++++++++
 package/libblockdev/libblockdev.mk | 12 ++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 19a6ed0974..6740b7ac6c 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -22,6 +22,19 @@ config BR2_PACKAGE_LIBBLOCKDEV
 
 	  https://github.com/storaged-project/libblockdev/
 
+if BR2_PACKAGE_LIBBLOCKDEV
+
+config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
+	bool "Crypto plugin"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # gpg2, libgpgme, libassuan
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # volume-key -> libnss -> libnspr
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # volume-key -> cryptsetup -> json-c
+	select BR2_PACKAGE_CRYPTSETUP
+	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_VOLUME_KEY
+
+endif
+
 comment "libblockdev needs udev /dev management and a glibc or musl toolchain w/ locale, wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index f48adbcdee..72163d8a94 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -24,8 +24,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--enable-introspection=no \
 	--without-bcache \
 	--without-btrfs \
-	--without-crypto \
-	--without-escrow \
 	--without-fs \
 	--without-dm \
 	--without-dmraid \
@@ -37,4 +35,14 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--with-part \
 	--with-swap
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_CRYPTO),y)
+LIBBLOCKDEV_CONF_OPTS += --with-crypto --with-escrow
+LIBBLOCKDEV_DEPENDENCIES += \
+	cryptsetup \
+	libnss \
+	volume-key
+else
+LIBBLOCKDEV_CONF_OPTS += --without-crypto --without-escrow
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
