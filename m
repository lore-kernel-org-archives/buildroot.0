From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 16 Jul 2012 23:38:06 +0200
Subject: [Buildroot] [PATCH v4 2/2] libglib2: fix install even if the host
	python binary refers to python3
In-Reply-To: <1342474686-10167-1-git-send-email-s.martin49@gmail.com>
References: <1342474686-10167-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1342474686-10167-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libglib2's build system uses some python2 scripts in the install rules.

This patch ensures to have a valid host python2 binary and enforces this python2
binary at configure-time.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d2445a1..500f309 100644
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
@@ -57,7 +60,9 @@ HOST_LIBGLIB2_CONF_OPT = \
 
 LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
 
-HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-libffi host-zlib
+HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-libffi host-zlib $(NEED_PYTHON2)
+
+LIBGLIB2_DEPENDENCIES += $(NEED_PYTHON2)
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
-- 
1.7.11.2
