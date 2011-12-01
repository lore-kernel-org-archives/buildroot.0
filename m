From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Dec 2011 08:58:54 -0000
Subject: [Buildroot] [git commit] diffutils: bump to version 3.2
Message-ID: <20111201085832.BB0EC8F75B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0f4ddfbe02a2eec7f6f2158d3258a511a55bf56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to diffutils version 3.2
Drop all unnecessary configure hints.
There's no point in installing diffutils to staging so drop that too.
Build after busybox if it's enabled to prefer full-blown diff.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/diffutils/Config.in                       |    4 ++
 package/diffutils/diffutils-2.8.1-__mempcpy.patch |   47 -----------------
 package/diffutils/diffutils.mk                    |   57 ++-------------------
 3 files changed, 9 insertions(+), 99 deletions(-)

diff --git a/package/diffutils/Config.in b/package/diffutils/Config.in
index df3e426..86da5d3 100644
--- a/package/diffutils/Config.in
+++ b/package/diffutils/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_DIFFUTILS
 	bool"diffutils"
+	depends on BR2_USE_WCHAR
 	help
 	  GNU diff. Compare files per line.
 
 	  http://www.gnu.org/software/diffutils/diffutils.html
+
+comment "diffutils requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/diffutils/diffutils-2.8.1-__mempcpy.patch b/package/diffutils/diffutils-2.8.1-__mempcpy.patch
deleted file mode 100644
index 94144c1..0000000
--- a/package/diffutils/diffutils-2.8.1-__mempcpy.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-[PATCH] diffutils: Don't use glibc specific __mempcpy
-
-The configure script checks for mempcpy, but the code uses the (glibc
-specific) __mempcpy instead. Fix it to use mempcpy which is more
-portable.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>x
----
- lib/getopt.c |    4 ++--
- lib/regex.c  |    2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-Index: diffutils-2.8.1/lib/getopt.c
-===================================================================
---- diffutils-2.8.1.orig/lib/getopt.c
-+++ diffutils-2.8.1/lib/getopt.c
-@@ -334,7 +334,7 @@ exchange (argv)
- 	nonoption_flags_len = nonoption_flags_max_len = 0;
-       else
- 	{
--	  memset (__mempcpy (new_str, __getopt_nonoption_flags,
-+	  memset (mempcpy (new_str, __getopt_nonoption_flags,
- 			     nonoption_flags_max_len),
- 		  '\0', top + 1 - nonoption_flags_max_len);
- 	  nonoption_flags_max_len = top + 1;
-@@ -445,7 +445,7 @@ _getopt_initialize (argc, argv, optstrin
- 	      if (__getopt_nonoption_flags == NULL)
- 		nonoption_flags_max_len = -1;
- 	      else
--		memset (__mempcpy (__getopt_nonoption_flags, orig_str, len),
-+		memset (mempcpy (__getopt_nonoption_flags, orig_str, len),
- 			'\0', nonoption_flags_max_len - len);
- 	    }
- 	}
-Index: diffutils-2.8.1/lib/regex.c
-===================================================================
---- diffutils-2.8.1.orig/lib/regex.c
-+++ diffutils-2.8.1/lib/regex.c
-@@ -8314,7 +8314,7 @@ regerror (errcode, preg, errbuf, errbuf_
-       if (msg_size > errbuf_size)
-         {
- #if defined HAVE_MEMPCPY || defined _LIBC
--	  *((char *) __mempcpy (errbuf, msg, errbuf_size - 1)) = '\0';
-+	  *((char *) mempcpy (errbuf, msg, errbuf_size - 1)) = '\0';
- #else
-           memcpy (errbuf, msg, errbuf_size - 1);
-           errbuf[errbuf_size - 1] = 0;
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 693b0c8..6d1896a 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -3,62 +3,15 @@
 # diffutils
 #
 #############################################################
-DIFFUTILS_VERSION=2.8.1
-DIFFUTILS_SOURCE:=diffutils-$(DIFFUTILS_VERSION).tar.gz
-DIFFUTILS_SITE:=$(BR2_GNU_MIRROR)/diffutils
-
-DIFFUTILS_INSTALL_STAGING = YES
 
+DIFFUTILS_VERSION = 3.2
+DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBINTL),libintl)
 
-DIFFUTILS_CONF_ENV = ac_cv_func_strtod=yes
-		ac_fsusage_space=yes \
-		fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no \
-		ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no \
-		ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes \
-		ac_cv_func_getgroups_works=yes \
-		ac_cv_func_chown_works=yes \
-		ac_cv_have_decl_euidaccess=no \
-		ac_cv_func_euidaccess=no \
-		ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes \
-		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no \
-		ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no \
-		ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes \
-		gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes \
-		ac_cv_have_decl_strerror_r=yes \
-		ac_cv_func_strerror_r_char_p=no \
-		jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes \
-		ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes \
-		utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no \
-		jm_cv_func_gettimeofday_clobber=no \
-		am_cv_func_working_getline=yes \
-		gl_cv_func_working_readdir=yes \
-		jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no \
-		ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no \
-		gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes \
-		ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no \
-		am_cv_func_working_getline=yes \
-		gl_cv_func_mkdir_trailing_slash_bug=no \
-		gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes \
-		jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+DIFFUTILS_DEPENDENCIES += busybox
+endif
 
 $(eval $(call AUTOTARGETS))
