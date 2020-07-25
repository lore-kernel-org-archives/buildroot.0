From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 25 Jul 2020 16:06:15 -0700
Subject: [Buildroot] [PATCH v3 10/13] package/libblockdev: add support for
 swap plugin
In-Reply-To: <20200725230618.3640682-1-aduskett@gmail.com>
References: <20200725230618.3640682-1-aduskett@gmail.com>
Message-ID: <20200725230618.3640682-11-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
 - Add missing dependency on util-linux and also select util-linux and
   util-linux-libblkdit in the Config.in file. (Thomas)

 package/libblockdev/Config.in      | 5 +++++
 package/libblockdev/libblockdev.mk | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index ffc92a89d1..8b7b832795 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -57,6 +57,11 @@ config BR2_PACKAGE_LIBBLOCKDEV_PART
 comment "part plugin needs a toolchain w/ locale"
 	depends on !BR2_ENABLE_LOCALE
 
+config BR2_PACKAGE_LIBBLOCKDEV_SWAP
+	bool "swap"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+
 endif
 
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 41c64acc9c..b9eb0571f6 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -26,7 +26,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-python2 \
 	--without-python3 \
 	--without-s390 \
-	--without-swap \
 	--without-tools \
 	--without-vdo
 
@@ -71,4 +70,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-part
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SWAP),y)
+LIBBLOCKDEV_DEPENDENCIES += util-linux
+LIBBLOCKDEV_CONF_OPTS += --with-swap
+else
+LIBBLOCKDEV_CONF_OPTS += --without-swap
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
