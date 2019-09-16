From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 16 Sep 2019 12:16:05 -0700
Subject: [Buildroot] [PATCH 2/2] package/libglib2: Do not depend on
 util-linux
In-Reply-To: <20190916191605.86764-1-aduskett@gmail.com>
References: <20190916191605.86764-1-aduskett@gmail.com>
Message-ID: <20190916191605.86764-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

libglib2 needs util-linux only for libmount, which is a configuration option.
Instead, check if util-linux-libmount is selected, and if so, set the option
to true.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libglib2/Config.in   |  2 --
 package/libglib2/libglib2.mk | 10 +++++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index ea946ba05e..31f3649c75 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -7,8 +7,6 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_ZLIB
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 5183331c8d..1d5562e017 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -33,7 +33,7 @@ HOST_LIBGLIB2_CONF_OPTS = \
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 \
-	libffi pcre util-linux zlib $(TARGET_NLS_DEPENDENCIES)
+	libffi pcre zlib $(TARGET_NLS_DEPENDENCIES)
 
 HOST_LIBGLIB2_DEPENDENCIES = \
 	host-gettext \
@@ -80,6 +80,14 @@ define LIBGLIB2_REMOVE_GDB_FILES
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
+LIBGLIB2_CONF_OPTS += -Dlibmount=true
+LIBGLIB2_DEPENDENCIES += util-linux
+else
+LIBGLIB2_CONF_OPTS += -Dlibmount=false
+endif
+
+
 # Purge useless binaries from target
 define LIBGLIB2_REMOVE_DEV_FILES
 	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
-- 
2.21.0
