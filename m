From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 13:57:41 +0100
Subject: [Buildroot] [git commit] coreutils: fix libintl, reorder ENV,
	OPTS & PROGS
Message-ID: <20141026125753.35055B06A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3aa6068c729dc1e2741bb534c3bdc95f27e7768
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move OPTS, ENV & PROGS up to the top, the fact that a conditional
(BR2_PACKAGE_BUSYBOX) was before them is bad style and confused me while
i tried to get them grouped together.
This was making all of the new disable OPTS fail, pretty much harmless
but still.

Account for libintl/gettext presence, it's not required in any toolchain
combination but it will fail if it's present, so use it when it's
selected by some other package. Fixes:
http://autobuild.buildroot.net/results/30d/30d0e3d27d8606443479466e60716e6f202a4711/

Add conditional on OpenSSL for faster hashing binaries as pointed again
by P??draig Brady.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coreutils/coreutils.mk |   94 ++++++++++++++++++++++------------------
 1 files changed, 52 insertions(+), 42 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 1a25a3a..41857e2 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -14,6 +14,48 @@ COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_AUTORECONF = YES
 COREUTILS_GETTEXTIZE = YES
 
+COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=shebangs
+COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
+	ac_cv_func_chown_works=yes \
+	ac_cv_func_euidaccess=no \
+	ac_cv_func_fstatat=yes \
+	ac_cv_func_getdelim=yes \
+	ac_cv_func_getgroups=yes \
+	ac_cv_func_getgroups_works=yes \
+	ac_cv_func_getloadavg=no \
+	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+	ac_cv_func_lstat_empty_string_bug=no \
+	ac_cv_func_strerror_r_char_p=no \
+	ac_cv_func_strnlen_working=yes \
+	ac_cv_func_strtod=yes \
+	ac_cv_func_working_mktime=yes \
+	ac_cv_have_decl_strerror_r=yes \
+	ac_cv_have_decl_strnlen=yes \
+	ac_cv_lib_getloadavg_getloadavg=no \
+	ac_cv_lib_util_getloadavg=no \
+	ac_fsusage_space=yes \
+	ac_use_included_regex=no \
+	am_cv_func_working_getline=yes \
+	fu_cv_sys_stat_statfs2_bsize=yes \
+	gl_cv_func_getcwd_null=yes \
+	gl_cv_func_getcwd_path_max=yes \
+	gl_cv_func_gettimeofday_clobber=no \
+	gl_cv_func_fstatat_zero_flag=no \
+	gl_cv_func_link_follows_symlink=no \
+	gl_cv_func_re_compile_pattern_working=yes \
+	gl_cv_func_svid_putenv=yes \
+	gl_cv_func_tzset_clobber=no \
+	gl_cv_func_working_mkstemp=yes \
+	gl_cv_func_working_utimes=yes \
+	gl_getline_needs_run_time_check=no \
+	gl_cv_have_proc_uptime=yes \
+	utils_cv_localtime_cache=no \
+	PERL=missing
+
+COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
+	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
+	uname join
+
 # If both coreutils and busybox are selected, make certain coreutils
 # wins the fight over who gets to have their utils actually installed.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -32,6 +74,12 @@ else
 COREUTILS_CONF_OPTS += --disable-xattr
 endif
 
+# It otherwise fails to link properly, not mandatory though
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+COREUTILS_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
+COREUTILS_DEPENDENCIES += gettext
+endif
+
 ifeq ($(BR2_PACKAGE_GMP),y)
 COREUTILS_DEPENDENCIES += gmp
 else
@@ -44,48 +92,10 @@ else
 COREUTILS_CONF_OPTS += --disable-libcap
 endif
 
-COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
-	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
-	uname join
-
-COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
-		ac_cv_func_chown_works=yes \
-		ac_cv_func_euidaccess=no \
-		ac_cv_func_fstatat=yes \
-		ac_cv_func_getdelim=yes \
-		ac_cv_func_getgroups=yes \
-		ac_cv_func_getgroups_works=yes \
-		ac_cv_func_getloadavg=no \
-		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no \
-		ac_cv_func_strerror_r_char_p=no \
-		ac_cv_func_strnlen_working=yes \
-		ac_cv_func_strtod=yes \
-		ac_cv_func_working_mktime=yes \
-		ac_cv_have_decl_strerror_r=yes \
-		ac_cv_have_decl_strnlen=yes \
-		ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no \
-		ac_fsusage_space=yes \
-		ac_use_included_regex=no \
-		am_cv_func_working_getline=yes \
-		fu_cv_sys_stat_statfs2_bsize=yes \
-		gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes \
-		gl_cv_func_gettimeofday_clobber=no \
-		gl_cv_func_fstatat_zero_flag=no \
-		gl_cv_func_link_follows_symlink=no \
-		gl_cv_func_re_compile_pattern_working=yes \
-		gl_cv_func_svid_putenv=yes \
-		gl_cv_func_tzset_clobber=no \
-		gl_cv_func_working_mkstemp=yes \
-		gl_cv_func_working_utimes=yes \
-		gl_getline_needs_run_time_check=no \
-		gl_cv_have_proc_uptime=yes \
-		utils_cv_localtime_cache=no \
-		PERL=missing
-
-COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=shebangs
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+COREUTILS_CONF_OPTS += --with-openssl=yes
+COREUTILS_DEPENDENCIES += openssl
+endif
 
 define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
