From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 12 Mar 2013 19:10:56 +0100
Subject: [Buildroot] [PATCH 3 of 3] oprofile 0.9.8: fix compilation on
	powerpc
In-Reply-To: <patchbomb.1363111853@BEANTN0L019720>
References: <patchbomb.1363111853@BEANTN0L019720>
Message-ID: <e866a53b0e64b92f119b.1363111856@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The oprofile build was broken on powerpc since version 0.9.8.
This was detected in several autobuilds, like
http://autobuild.buildroot.net/results/6f6c02d18495907d50fcdfc6003ac20d493c55fe/

The problem can be fixed by adding libpfm4 into the build and making a few
changes in the configure script. Because the configure script is changed,
we additionally need to prevent autoreconfiguring (which fails).
At the same time, I fixed the removed  --with-kernel-support configure
option.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/oprofile/Config.in                        |   1 +
 package/oprofile/oprofile-0.9.8-003-powerpc.patch |  27 +++++++++++++++++++++++++++
 package/oprofile/oprofile.mk                      |  16 ++++++++++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)

Note: this is compile-tested on x86 and powerpc, but I was not able to test
it on target.

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_aarch64 # binutils
 	help
diff --git a/package/oprofile/oprofile-0.9.8-003-powerpc.patch b/package/oprofile/oprofile-0.9.8-003-powerpc.patch
new file mode 100644
--- /dev/null
+++ b/package/oprofile/oprofile-0.9.8-003-powerpc.patch
@@ -0,0 +1,27 @@
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -104,7 +104,7 @@ AC_DEFINE_UNQUOTED(HAVE_PERF_EVENTS, $HA
+ if test "$HAVE_PERF_EVENTS" = "1"; then
+ 	PFM_LIB=
+ 	arch="`uname -m`"
+-	if test "$arch" = "ppc64"; then
++	if test "$arch" = "ppc64" || test "$arch" = "ppc"; then
+ 		AC_CHECK_HEADER(perfmon/pfmlib.h,,[AC_MSG_ERROR([pfmlib.h not found; usually provided in papi devel package])])
+ 		AC_CHECK_LIB(pfm,pfm_get_event_name, HAVE_LIBPFM3='1'; HAVE_LIBPFM='1', [
+ 			AC_CHECK_LIB(pfm,pfm_get_os_event_encoding, HAVE_LIBPFM3='0'; HAVE_LIBPFM='1',
+diff --git a/configure b/configure
+--- a/configure
++++ b/configure
+@@ -16985,7 +16985,7 @@ cat >>confdefs.h <<_ACEOF
+ if test "$HAVE_PERF_EVENTS" = "1"; then
+ 	PFM_LIB=
+ 	arch="`uname -m`"
+-	if test "$arch" = "ppc64"; then
++	if test "$arch" = "ppc64" || test "$arch" = "ppc"; then
+ 		if test "${ac_cv_header_perfmon_pfmlib_h+set}" = set; then
+   { $as_echo "$as_me:$LINENO: checking for perfmon/pfmlib.h" >&5
+ $as_echo_n "checking for perfmon/pfmlib.h... " >&6; }
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -8,7 +8,7 @@ OPROFILE_VERSION = 0.9.8
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_LICENSE = GPLv2+
 OPROFILE_LICENSE_FILES = COPYING
-OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel-support
+OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel=$(SYSROOT_DIR)
 OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
 OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
 OPROFILE_BINARIES += utils/op-check-perfevents pe_profiling/operf libabi/opimport
@@ -29,7 +29,19 @@ ifeq ($(OPROFILE_ARCH),)
 OPROFILE_ARCH = $(BR2_ARCH)
 endif
 
-OPROFILE_DEPENDENCIES = popt binutils
+OPROFILE_DEPENDENCIES = popt binutils libpfm4
+
+define OPROFILE_PREVENT_AUTOMAKE
+	# Prevent automake from running.
+	(cd $(@D); touch -c config* aclocal.m4 Makefile*);
+endef
+
+define OPROFILE_FIX_CROSS_UNAME
+	$(SED) 's/`uname -m`/$(OPROFILE_ARCH)/' $(@D)/configure
+endef
+
+OPROFILE_POST_PATCH_HOOKS += OPROFILE_PREVENT_AUTOMAKE
+OPROFILE_POST_PATCH_HOOKS += OPROFILE_FIX_CROSS_UNAME
 
 define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
