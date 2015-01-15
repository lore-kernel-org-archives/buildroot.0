From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Jan 2015 11:30:22 -0300
Subject: [Buildroot] [PATCH 7/7] m4: remove deprecated target package
In-Reply-To: <1421332222-15098-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421332222-15098-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421332222-15098-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's been deprecated for a year now so remove the target variant.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy     |  7 +++++++
 package/Config.in    |  1 -
 package/m4/Config.in | 16 ----------------
 package/m4/m4.mk     |  7 -------
 4 files changed, 7 insertions(+), 24 deletions(-)
 delete mode 100644 package/m4/Config.in

diff --git a/Config.in.legacy b/Config.in.legacy
index d6f32a0..a8c5dab 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,13 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_M4
+	bool "m4 target package removed"
+	select BR2_LEGACY
+	help
+	  The m4 target package has been removed, it's been
+	  deprecated for some time now.
+
 config BR2_PACKAGE_FLEX_BINARY
 	bool "flex binary in target option removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 9ab6a99..eeb363a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -123,7 +123,6 @@ endif
 	source "package/intltool/Config.in"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
-	source "package/m4/Config.in"
 	source "package/make/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/patch/Config.in"
diff --git a/package/m4/Config.in b/package/m4/Config.in
deleted file mode 100644
index e2ce5b3..0000000
--- a/package/m4/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_M4
-	bool "m4"
-	depends on BR2_USE_WCHAR
-	# uses fork()
-	depends on BR2_USE_MMU
-	# development tool, useless on the target
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	help
-	  An implementation of the traditional Unix macro processor.
-
-	  http://www.gnu.org/software/m4/m4.html
-
-comment "m4 needs a toolchain w/ wchar"
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 32dfef4..9b5d2d1 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -9,13 +9,6 @@ M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPLv3+
 M4_LICENSE_FILES = COPYING
-M4_CONF_ENV = gl_cv_func_gettimeofday_clobber=no
-
-ifneq ($(BR2_USE_WCHAR),y)
-M4_CONF_ENV += gt_cv_c_wchar_t=no gl_cv_absolute_wchar_h=__fpending.h
-endif
-
 HOST_M4_CONF_OPTS = --disable-static
 
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.0.5
