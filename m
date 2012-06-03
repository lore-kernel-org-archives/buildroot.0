From: Murat Demirten <mdemirten@yh.com.tr>
Date: Sun, 3 Jun 2012 05:57:46 +0300
Subject: [Buildroot] [PATCH] jpeg-turbo: new package
Message-ID: <CA+pfegELseWchx5hbbChKKi-=xtQMO9CWTyKBEV+6RpRQVEqBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Murat Demirten <mdemirten@yh.com.tr>

Signed-off-by: Murat Demirten <mdemirten@yh.com.tr>
---
 package/Config.in                |    1 +
 package/jpeg-turbo/Config.in     |   26 ++++++++++++++++++++++++++
 package/jpeg-turbo/jpeg-turbo.mk |   23 +++++++++++++++++++++++
 3 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/jpeg-turbo/Config.in
 create mode 100644 package/jpeg-turbo/jpeg-turbo.mk

diff --git a/package/Config.in b/package/Config.in
index ca8fc96..5a23f66 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -336,6 +336,7 @@ source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
+source "package/jpeg-turbo/Config.in"
 source "package/libart/Config.in"
 source "package/libdmtx/Config.in"
 source "package/libdrm/Config.in"
diff --git a/package/jpeg-turbo/Config.in b/package/jpeg-turbo/Config.in
new file mode 100644
index 0000000..a398079
--- /dev/null
+++ b/package/jpeg-turbo/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_JPEG_TURBO
+ bool "jpeg-turbo"
+ help
+   It is a derivative of libjpeg that uses SIMD instructions
+   (MMX, SSE2, NEON) to accelerate baseline JPEG compression
+   and decompression on x86, x86-64, and ARM systems.
+
+   http://libjpeg-turbo.virtualgl.org
+
+choice
+ prompt "libjpeg api version"
+ default BR2_PACKAGE_JPEG_TURBO_APIVERSION_80
+ depends on BR2_PACKAGE_JPEG_TURBO
+ help
+   Selects libjpeg compatible api version.
+
+config BR2_PACKAGE_JPEG_TURBO_APIVERSION_62
+ bool "62"
+
+config BR2_PACKAGE_JPEG_TURBO_APIVERSION_70
+ bool "70"
+
+config BR2_PACKAGE_JPEG_TURBO_APIVERSION_80
+ bool "80"
+
+endchoice
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/
jpeg-turbo.mk
new file mode 100644
index 0000000..7cfd8c1
--- /dev/null
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# jpeg-turbo
+#
+#############################################################
+JPEG_TURBO_VERSION = 1.2.0
+JPEG_TURBO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).
dl.sourceforge.net/sourceforge/libjpeg-turbo
+JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
+
+ifeq ($(BR2_PACKAGE_JPEG_TURBO_APIVERSION_80),y)
+ JPEG_TURBO_CONF_ENV += JPEG_LIB_VERSION=80
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG_TURBO_APIVERSION_70),y)
+ JPEG_TURBO_CONF_ENV += JPEG_LIB_VERSION=70
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG_TURBO_APIVERSION_62),y)
+ JPEG_TURBO_CONF_ENV += JPEG_LIB_VERSION=62
+endif
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.5.4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120603/01f50de5/attachment.html>
