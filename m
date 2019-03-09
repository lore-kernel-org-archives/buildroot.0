From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  9 Mar 2019 22:32:35 +0100
Subject: [Buildroot] [PATCH v4] package/zbar: bump version to 0.22
Message-ID: <20190309213235.30830-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change from git download to official release and
  download site (drop need for autoreconf)

- drop dependency on kernel headers >= 3.17 (should be fixed with
  commit 'v4l2: make ZBar build and run on Kernels < 3.16' (see [1]),
  fall back to original kernel headers >= 3.0 dependency propagated
  from libv4l

[1] https://git.linuxtv.org/zbar.git/commit/?id=fa5c48127ec1e3670e28540c2e6a03431ebac5b8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - rebased on current master

Changes v2 -> v3:
  - propagate removal of header dependency to gst-plugins-bad
    (suggested by Thomas Petazzoni)

Changes v3 -> v4:
  - fix commit title (zbar -> package/zbar)
  - fall back to original kernel headers >= 3.0 dependency propagated
    from libv4l (suggested by Thomas Petazzoni)
---
 package/gstreamer/gst-plugins-bad/Config.in | 6 +++---
 package/zbar/Config.in                      | 6 +++---
 package/zbar/zbar.hash                      | 2 +-
 package/zbar/zbar.mk                        | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 411e4b6174..982edc2e4c 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -321,12 +321,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zbar-> libv4l
 	depends on BR2_USE_MMU # zbar-> libv4l
 	depends on BR2_INSTALL_LIBSTDCPP # zbar-> libv4l
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # zbar
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # zbar -> libv4l
 	select BR2_PACKAGE_ZBAR
 
-comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.17"
+comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 endif
diff --git a/package/zbar/Config.in b/package/zbar/Config.in
index e850c1f02b..0f4d115745 100644
--- a/package/zbar/Config.in
+++ b/package/zbar/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_ZBAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libv4l
 	depends on BR2_USE_MMU # libv4l
 	depends on BR2_INSTALL_LIBSTDCPP # libv4l
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # v4l2_query_ext_ctrl
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBV4L
 	help
@@ -11,7 +11,7 @@ config BR2_PACKAGE_ZBAR
 
 	  https://git.linuxtv.org/zbar.git/about/
 
-comment "zbar needs a toolchain w/ threads, C++ and headers >= 3.17"
+comment "zbar needs a toolchain w/ threads, C++ and headers >= 3.0"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index 47a080af12..0f44d0f5c0 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 7eb73c180c787184ede0f98806c52b23eb9c24609673e1ed51210504ea2937f5 zbar-681b0f305fb5c5bb0df8437f7d740b29a93a7889.tar.gz
+sha256 1ba9e94c7217a8bd3800f9f3abddf3ed393a62cdf141a709765aad2788744eb7 zbar-0.22.tar.bz2
 sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89 LICENSE
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 2146aee85b..63220774b9 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-ZBAR_VERSION = 681b0f305fb5c5bb0df8437f7d740b29a93a7889
-ZBAR_SITE = git://linuxtv.org/zbar.git
+ZBAR_VERSION = 0.22
+ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
+ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
 ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE
 ZBAR_INSTALL_STAGING = YES
-ZBAR_AUTORECONF = YES
 ZBAR_DEPENDENCIES = libv4l jpeg
 # add host-gettext for AM_ICONV macro
 ZBAR_DEPENDENCIES += host-gettext
-- 
2.21.0
