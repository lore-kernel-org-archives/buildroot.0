From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 Feb 2012 21:53:46 +0100
Subject: [Buildroot] [git commit] libglib2: fix build with legacy uClibc
	versions
Message-ID: <20120301130636.E5FC690BF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97165f123bd67b8d1a9a0a3bb41f2c4b8475156d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qsort_r was only added in uClibc 0.9.33, so only enable it when we're sure
it's available. For external/ctng toolchains we cannot easily know, so
simply disable it there.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglib2/libglib2.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d0d9c5c..d2445a1 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -41,9 +41,16 @@ LIBGLIB2_CONF_ENV = \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
-		ac_cv_func_posix_getgrgid_r=no glib_cv_have_qsort_r=yes \
+		ac_cv_func_posix_getgrgid_r=no \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
+# old uClibc versions don't provide qsort_r
+ifeq ($(BR2_UCLIBC_VERSION_0_9_31)$(BR2_UCLIBC_VERSION_0_9_32)$(BR2_TOOLCHAIN_CTNG_uClibc)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=no
+else
+LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=yes
+endif
+
 HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
