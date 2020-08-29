From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:20:33 +0200
Subject: [Buildroot] [git commit branch/next] package/libblockdev: add
 support for crypto plugin
Message-ID: <20200829193456.08B50872F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c45cce332a93b45ed7a68eed210b9f4662d877b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in      | 11 +++++++++++
 package/libblockdev/libblockdev.mk |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 4e85b82ce2..f7a220603c 100644
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
 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 221a698386..67d9ab4483 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -18,7 +18,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--with-loop \
 	--without-bcache \
 	--without-btrfs \
-	--without-crypto \
 	--without-dm \
 	--without-dmraid \
 	--without-escrow \
@@ -38,4 +37,11 @@ LIBBLOCKDEV_CONF_OPTS = \
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
