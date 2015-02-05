From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 5 Feb 2015 15:06:56 +0000
Subject: [Buildroot] [PATCH v2] libvips: requires C++ support
Message-ID: <1423148816-9029-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libvips requires C++ support, otherwise it will fail with an error
message like this one:

error: ../libvips/.libs/libvips.so: No such file or directory

The '--disable-cxx' configure option seems to be broken, so in the
meantime a compiler with C++ support is required in order to build
libvips successfully.

Reported upstream:

  https://github.com/jcupitt/libvips/issues/231

Fixes:

  http://autobuild.buildroot.net/results/cdc7cf5d3501f80c74b70aa09f93b2ad4e2f8602/
  http://autobuild.buildroot.net/results/39173dbcbbd0a243900ea583cec024b51f8b803a/
  http://autobuild.buildroot.net/results/6794705195bcdb636a8e6582ef5a1e153d4d66b3/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libvips/Config.in  |    8 ++++++--
 package/libvips/libvips.mk |    6 ++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libvips/Config.in b/package/libvips/Config.in
index 1a0d35c..ad7a103 100644
--- a/package/libvips/Config.in
+++ b/package/libvips/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_LIBVIPS
 	depends on BR2_USE_WCHAR # gettext, libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # fork()
+	# C++ support is required to build libvips
+	# https://github.com/jcupitt/libvips/issues/231
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -13,6 +16,7 @@ config BR2_PACKAGE_LIBVIPS
 
 	  http://www.vips.ecs.soton.ac.uk/
 
-comment "libvips needs a toolchain w/ wchar, threads"
+comment "libvips needs a toolchain w/ wchar, threads, C++"
         depends on BR2_USE_MMU
-        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index 35e7684..1efe21a 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -33,11 +33,9 @@ LIBVIPS_DEPENDENCIES = \
 	host-pkgconf libglib2 \
 	libxml2 $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+# --disable-cxx is broken upstream
+# https://github.com/jcupitt/libvips/issues/231
 LIBVIPS_CONF_OPTS += --enable-cxx
-else
-LIBVIPS_CONF_OPTS += --disable-cxx
-endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBVIPS_CONF_OPTS += --with-jpeg
-- 
1.7.1
