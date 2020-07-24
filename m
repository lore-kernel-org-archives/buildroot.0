From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 16:25:58 -0700
Subject: [Buildroot] [PATCH v2 10/13] package/libblockdev: add support for
 swap plugin
In-Reply-To: <20200724232601.2441272-1-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
Message-ID: <20200724232601.2441272-11-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libblockdev/Config.in      | 4 ++++
 package/libblockdev/libblockdev.mk | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 82e317b25f..9d5d4e6071 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -57,6 +57,10 @@ config BR2_PACKAGE_LIBBLOCKDEV_PARTED
 comment "part plugin needs a toolchain w/ locale"
 	depends on !BR2_ENABLE_LOCALE
 
+config BR2_PACKAGE_LIBBLOCKDEV_SWAP
+	bool "swap"
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+
 endif
 
 comment "libblockdev needs udev /dev management and a toolchain w/ wchar, threads, dynamic library"
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 16e1dc46c9..83af24d727 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -26,7 +26,6 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-python2 \
 	--without-python3 \
 	--without-s390 \
-	--without-swap \
 	--without-tools \
 	--without-vdo
 
@@ -71,4 +70,10 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-part
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SWAP),y)
+LIBBLOCKDEV_CONF_OPTS += --with-swap
+else
+LIBBLOCKDEV_CONF_OPTS += --without-swap
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
