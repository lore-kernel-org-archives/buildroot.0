From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:34:26 +0100
Subject: [Buildroot] [PATCH 13/13] package: move autotools specific stuff to
	pkg-autotargets.mk
In-Reply-To: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <91711f9a8cd03a56455ba4516aaf235d90601d53.1331148806.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in        |   73 --------------------------------------------
 package/pkg-autotargets.mk |   70 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 73 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 29ba497..a008fe7 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -223,79 +223,6 @@ HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
 		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
-
-#######################################################################
-# settings we need to pass to configure
-
-# does unaligned access trap?
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=yes
-ifeq ($(BR2_i386),y)
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
-endif
-ifeq ($(BR2_x86_64),y)
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
-endif
-ifeq ($(BR2_m68k),y)
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
-endif
-ifeq ($(BR2_powerpc)$(BR2_ENDIAN),yBIG)
-BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
-endif
-
-ifeq ($(BR2_ENDIAN),"BIG")
-BR2_AC_CV_C_BIGENDIAN=ac_cv_c_bigendian=yes
-else
-BR2_AC_CV_C_BIGENDIAN=ac_cv_c_bigendian=no
-endif
-
-TARGET_CONFIGURE_ARGS= \
-	$(BR2_AC_CV_TRAP_CHECK) \
-	ac_cv_func_mmap_fixed_mapped=yes \
-	ac_cv_func_memcmp_working=yes \
-	ac_cv_have_decl_malloc=yes \
-	gl_cv_func_malloc_0_nonnull=yes \
-	ac_cv_func_malloc_0_nonnull=yes \
-	ac_cv_func_calloc_0_nonnull=yes \
-	ac_cv_func_realloc_0_nonnull=yes \
-	lt_cv_sys_lib_search_path_spec="" \
-	$(BR2_AC_CV_C_BIGENDIAN)
-
-#######################################################################
-
-ifeq ($(BR2_ENABLE_LOCALE),y)
-DISABLE_NLS:=
-else
-DISABLE_NLS:=--disable-nls
-endif
-
-ifneq ($(BR2_LARGEFILE),y)
-DISABLE_LARGEFILE= --disable-largefile
-endif
-
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-DISABLE_DOCUMENTATION=--disable-gtk-doc
-endif
-
-ifneq ($(BR2_INET_IPV6),y)
-DISABLE_IPV6= --disable-ipv6
-endif
-
-ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-TARGET_CONFIGURE_OPTS+=CXX=false
-endif
-
-ifeq ($(BR2_ENABLE_DEBUG),y)
-ENABLE_DEBUG:=--enable-debug
-else
-ENABLE_DEBUG:=
-endif
-
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
-SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
-else
-SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
-endif
-
 include package/pkg-utils.mk
 include package/pkg-download.mk
 include package/pkg-autotargets.mk
diff --git a/package/pkg-autotargets.mk b/package/pkg-autotargets.mk
index c9887c2..a1539bb 100644
--- a/package/pkg-autotargets.mk
+++ b/package/pkg-autotargets.mk
@@ -36,6 +36,76 @@ define CONFIG_UPDATE
 	done
 endef
 
+#
+# Calculate values of well-known settings for configure scripts
+#
+
+# does unaligned access trap?
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=yes
+ifeq ($(BR2_i386),y)
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+else ifeq ($(BR2_x86_64),y)
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+else ifeq ($(BR2_m68k),y)
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+else ifeq ($(BR2_powerpc)$(BR2_ENDIAN),yBIG)
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+endif
+
+ifeq ($(BR2_ENDIAN),"BIG")
+BR2_AC_CV_C_BIGENDIAN=ac_cv_c_bigendian=yes
+else
+BR2_AC_CV_C_BIGENDIAN=ac_cv_c_bigendian=no
+endif
+
+TARGET_CONFIGURE_ARGS= \
+	$(BR2_AC_CV_TRAP_CHECK) \
+	ac_cv_func_mmap_fixed_mapped=yes \
+	ac_cv_func_memcmp_working=yes \
+	ac_cv_have_decl_malloc=yes \
+	gl_cv_func_malloc_0_nonnull=yes \
+	ac_cv_func_malloc_0_nonnull=yes \
+	ac_cv_func_calloc_0_nonnull=yes \
+	ac_cv_func_realloc_0_nonnull=yes \
+	lt_cv_sys_lib_search_path_spec="" \
+	$(BR2_AC_CV_C_BIGENDIAN)
+
+# Calculate values of well-known configure script options
+
+ifeq ($(BR2_ENABLE_LOCALE),y)
+DISABLE_NLS:=
+else
+DISABLE_NLS:=--disable-nls
+endif
+
+ifneq ($(BR2_LARGEFILE),y)
+DISABLE_LARGEFILE= --disable-largefile
+endif
+
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+DISABLE_DOCUMENTATION=--disable-gtk-doc
+endif
+
+ifneq ($(BR2_INET_IPV6),y)
+DISABLE_IPV6= --disable-ipv6
+endif
+
+ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
+TARGET_CONFIGURE_OPTS+=CXX=false
+endif
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+ENABLE_DEBUG:=--enable-debug
+else
+ENABLE_DEBUG:=
+endif
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
+else
+SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
+endif
+
 ################################################################################
 # AUTOTARGETS_INNER -- defines how the configuration, compilation and
 # installation of an autotools package should be done, implements a
-- 
1.7.4.1
