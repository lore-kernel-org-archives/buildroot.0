From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 11 Mar 2011 16:13:30 +0800
Subject: [Buildroot] [PATCH 4/9] cairo : bump to 1.10.2
In-Reply-To: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
References: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
Message-ID: <1299831215-26466-4-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/cairo/cairo-1.8.10-directfb.patch |   39 -----------------------------
 package/cairo/cairo.mk                    |   28 +--------------------
 2 files changed, 1 insertions(+), 66 deletions(-)
 delete mode 100644 package/cairo/cairo-1.8.10-directfb.patch

diff --git a/package/cairo/cairo-1.8.10-directfb.patch b/package/cairo/cairo-1.8.10-directfb.patch
deleted file mode 100644
index 12a51ec..0000000
--- a/package/cairo/cairo-1.8.10-directfb.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-diff --git a/src/cairo-directfb-surface.c b/src/cairo-directfb-surface.c
-index bb02dbf..65f2d55 100644
---- a/src/cairo-directfb-surface.c
-+++ b/src/cairo-directfb-surface.c
-@@ -609,6 +609,8 @@ _cairo_directfb_surface_release_dest_image (void                  *abstract_surf
- 		     surface->dfbsurface->Blit (surface->dfbsurface,
- 						buffer, NULL,
- 						image_rect->x, image_rect->y));
-+
-+    surface->dfbsurface->ReleaseSource (surface->dfbsurface);
-     }
- 
-     cairo_surface_destroy (&image->base);
-@@ -848,6 +850,9 @@ _directfb_finish_composite (cairo_directfb_surface_t   *dst,
-                             cairo_surface_attributes_t *src_attr)
- {
-     _cairo_pattern_release_surface (src_pattern, src, src_attr);
-+
-+    if (dst->dfbsurface)
-+         dst->dfbsurface->ReleaseSource( dst->dfbsurface );
- }
- #endif /* DFB_COMPOSITE || DFB_COMPOSITE_TRAPEZOIDS */
- 
-@@ -1555,6 +1560,7 @@ _directfb_acquire_font_cache (cairo_directfb_surface_t     *surface,
- 
- 	    new_cache->dfbsurface->Blit (new_cache->dfbsurface,
- 					 cache->dfbsurface, NULL, 0, 0);
-+        new_cache->dfbsurface->ReleaseSource (new_cache->dfbsurface);
- 
- 	    _directfb_destroy_font_cache (cache);
- 	    scaled_font->surface_private = cache = new_cache;
-@@ -1778,6 +1784,7 @@ _cairo_directfb_surface_show_glyphs (void                *abstract_dst,
-     RUN_CLIPPED (dst, NULL,
- 		 dst->dfbsurface->BatchBlit (dst->dfbsurface,
- 					     cache->dfbsurface, rects, points, num));
-+    dst->dfbsurface->ReleaseSource (dst->dfbsurface);
- 
-     return CAIRO_STATUS_SUCCESS;
- }
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 7955e08..3acbf15 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -3,39 +3,13 @@
 # cairo
 #
 #############################################################
-CAIRO_VERSION = 1.8.10
+CAIRO_VERSION = 1.10.2
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.gz
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_AUTORECONF = NO
 CAIRO_INSTALL_STAGING = YES
 CAIRO_INSTALL_TARGET = YES
 
-CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
-		glib_cv_uscore=no ac_cv_func_strtod=yes \
-		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes ac_cv_func_getgroups_works=yes \
-		ac_cv_func_chown_works=yes ac_cv_have_decl_euidaccess=no \
-		ac_cv_func_euidaccess=no ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes ac_cv_have_decl_strerror_r=yes \
-		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no jm_cv_func_gettimeofday_clobber=no \
-		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
-		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no gl_cv_c_restrict=no
-
 CAIRO_DEPENDENCIES = host-pkg-config fontconfig pixman
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-- 
1.7.0.4
