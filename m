From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 23 Feb 2015 12:32:48 +0100
Subject: [Buildroot] [PATCH v2 1/2] libsigrok: enable building C++ bindings
In-Reply-To: <1424691169-14397-1-git-send-email-bgolaszewski@baylibre.com>
References: <1424691169-14397-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1424691169-14397-2-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/libsigrok/Config.in    | 12 ++++++++++++
 package/libsigrok/libsigrok.mk |  9 ++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index 47f812c..468c8bc 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -16,6 +16,18 @@ config BR2_PACKAGE_LIBSIGROK
 
 	  http://sigrok.org/wiki/Libsigrok
 
+config BR2_PACKAGE_LIBSIGROKCXX
+	bool "build C++ bindings"
+	select BR2_PACKAGE_GLIBMM
+	depends on BR2_PACKAGE_LIBSIGROK
+	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
+	help
+	  Build libsigrok C++ bindings as well.
+
 comment "libsigrok needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libsigrokcxx needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_LIBSIGROK
+	depends on !BR2_TOOLCHAIN_BUILDROOT_CXX
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 6bc210e..1e6080d 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -13,7 +13,7 @@ LIBSIGROK_LICENSE_FILES = COPYING
 LIBSIGROK_AUTORECONF = YES
 LIBSIGROK_INSTALL_STAGING = YES
 LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
-LIBSIGROK_CONF_OPTS = --disable-bindings --disable-glibtest
+LIBSIGROK_CONF_OPTS = --disable-glibtest --disable-java --disable-python
 
 define LIBSIGROK_ADD_MISSING
 	mkdir -p $(@D)/autostuff
@@ -46,4 +46,11 @@ ifeq ($(BR2_PACKAGE_GLIBMM),y)
 LIBSIGROK_DEPENDENCIES += glibmm
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
+LIBSIGROK_CONF_OPTS += --enable-cxx
+LIBSIGROK_DEPENDENCIES += host-autoconf-archive glibmm
+else
+LIBSIGROK_CONF_OPTS += --disable-cxx
+endif
+
 $(eval $(autotools-package))
-- 
2.1.4
