From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 21:44:49 +0200
Subject: [Buildroot] [git commit] package/libglib2: make util-linux an
 optional dependency
Message-ID: <20190917195454.2CE9B8E8D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5353e7558d556e8d452fb21bfb2e1a4d110128c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libglib2 needs util-linux only for libmount, which is a configuration option.
Instead, check if util-linux-libmount is selected, and if so, set the option
to true.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
