From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 23:51:33 +0100
Subject: [Buildroot] [PATCH 1/1] RFC: musl: Fix gettext support
Message-ID: <1454194293-17572-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The issue is discussed here:
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/127196

I consider this patch an ugly hack but I could compile ~900 packages
without a gettext-related error, so I put this patch up for discussion.

Fixes
http://autobuild.buildroot.net/results/911/9115ddb411ec15eb8bfa1d4f03a804f48e77ff76/
and many similar errors

To test use the defconfig mentioned above, then

make clean
make dos2unix (build will succeed either with or without this patch)

make clean
make gettext
make dos2unix (build fails because gettext replaced musl's libintl.h)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Makefile.in        |  6 ++++++
 package/gettext/gettext.mk | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index c5652af..16ab17f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -340,6 +340,11 @@ else
 BR2_AC_CV_C_BIGENDIAN = ac_cv_c_bigendian=no
 endif
 
+# configure script misdetects musl gettext support
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+BR2_GT_CV_FUNC_GNUGETTEXT1_LIBC = gt_cv_func_gnugettext1_libc=yes
+endif
+
 TARGET_CONFIGURE_ARGS = \
 	$(BR2_AC_CV_TRAP_CHECK) \
 	ac_cv_func_mmap_fixed_mapped=yes \
@@ -350,6 +355,7 @@ TARGET_CONFIGURE_ARGS = \
 	ac_cv_func_calloc_0_nonnull=yes \
 	ac_cv_func_realloc_0_nonnull=yes \
 	lt_cv_sys_lib_search_path_spec="" \
+	$(BR2_GT_CV_FUNC_GNUGETTEXT1_LIBC) \
 	$(BR2_AC_CV_C_BIGENDIAN)
 
 ################################################################################
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 0b4e5dd..f388ea8 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -27,6 +27,20 @@ GETTEXT_CONF_OPTS += \
 	--disable-relocatable \
 	--without-emacs
 
+# musl provides a gettext implementation, but gettext does not
+# recognize it as being a valid implementation.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+GETTEXT_CONF_ENV += \
+	ac_cv_gnu_library_2_1=yes \
+	ac_cv_gnu_library_2=yes
+
+# prevent gettext overwriting musl's libintl.h
+define GETTEXT_DO_NOT_INSTALL_LIBINTL_H
+	$(SED) '/\$$(INSTALL_DATA) libintl.h/d' $(@D)/gettext-runtime/intl/Makefile.in
+endef
+GETTEXT_POST_PATCH_HOOKS = GETTEXT_DO_NOT_INSTALL_LIBINTL_H
+endif
+
 HOST_GETTEXT_CONF_OPTS = \
 	--disable-libasprintf \
 	--disable-acl \
-- 
2.7.0.rc3
