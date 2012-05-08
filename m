From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  8 May 2012 22:45:49 +0200
Subject: [Buildroot] [PATCH 2/2] libglib2: fix install even if the host
	python binary refers to python3
In-Reply-To: <1336509949-19630-1-git-send-email-s.martin49@gmail.com>
References: <1336509949-19630-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1336509949-19630-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d2445a1..4c372d8 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -42,7 +42,10 @@ LIBGLIB2_CONF_ENV = \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
 		ac_cv_func_posix_getgrgid_r=no \
-		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
+		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
+		ac_cv_path_PYTHON=$(PYTHON2)
+
+HOST_LIBGLIB2_CONF_ENV += ac_cv_path_PYTHON=$(PYTHON2)
 
 # old uClibc versions don't provide qsort_r
 ifeq ($(BR2_UCLIBC_VERSION_0_9_31)$(BR2_UCLIBC_VERSION_0_9_32)$(BR2_TOOLCHAIN_CTNG_uClibc)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
@@ -55,9 +58,19 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
-LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+LIBGLIB2_DEPENDENCIES = \
+		host-pkg-config \
+		host-libglib2 \
+		$(HOST_PYTHON2) \
+		libffi \
+		zlib \
+		$(if $(BR2_NEEDS_GETTEXT),gettext libintl)
 
-HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-libffi host-zlib
+HOST_LIBGLIB2_DEPENDENCIES = \
+		host-pkg-config \
+		host-libffi \
+		host-zlib \
+		$(HOST_PYTHON2)
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
-- 
1.7.10.1
