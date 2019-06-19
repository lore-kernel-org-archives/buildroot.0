From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 13:40:37 +0200
Subject: [Buildroot] [git commit] package/localedef: compile against
 glibc-2.29
Message-ID: <20190619114051.9F32181E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ec7169e6c8cfb4bb54defb685bd04bb1da0a2aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In glibc 2.27 the following change occurred:
"Statically compiled applications attempting to load locales compiled
for the GNU C Library version 2.27 will fail and fall back to the
builtin C/POSIX locale."

This impacts us since upstream buildroot uses a localdef built against
an older eglibc release, as reported at [0].

This is a combination of my patch to move to glibc and Peter Seiderer's
patch to avoid building all of glibc just for localedef.

 [0] https://bugs.busybox.net/show_bug.cgi?id=11096

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
[localedef build & fixups:]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Thomas: share the tarball with the glibc package]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../localedef/0001-Don-t-include-xlocale.h.patch   | 50 -----------------
 ...001-HACK-only-build-and-install-localedef.patch | 65 ++++++++++++++++++++++
 .../localedef.hash                                 |  7 +++
 package/localedef/localedef.hash                   |  4 +-
 package/localedef/localedef.mk                     | 47 +++++++++++++---
 5 files changed, 112 insertions(+), 61 deletions(-)

diff --git a/package/localedef/0001-Don-t-include-xlocale.h.patch b/package/localedef/0001-Don-t-include-xlocale.h.patch
deleted file mode 100644
index 9a6c2f8e90..0000000000
--- a/package/localedef/0001-Don-t-include-xlocale.h.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From: Bernhard Walle <bernhard@bwalle.de>
-Date: Mon, 2 Oct 2017 16:55:23 +0200
-Subject: [PATCH] Don't include <xlocale.h>
-
-This header has been removed in glibc 2.26:
-
-https://abi-laboratory.pro/tracker/changelog/glibc/2.26/log.html
-
------------------------- >8 ------------------------
-* The nonstandard header <xlocale.h> has been removed.  Most programs should
-  use <locale.h> instead.  If you have a specific need for the definition of
-  locale_t with no other declarations, please contact
-  libc-alpha at sourceware.org and explain.
------------------------- 8< ------------------------
-
-Signed-off-by: Bernhard Walle <bernhard@bwalle.de>
-
-Upstream: https://git.pengutronix.de/cgit/ptxdist/tree/patches/localedef-eglibc-2.14.1-r17443-ptx1/0003-Don-t-include-xlocale.h.patch
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- eglibc/locale/langinfo.h | 2 +-
- eglibc/locale/locale.h   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/eglibc/locale/langinfo.h b/eglibc/locale/langinfo.h
-index 0a5336507196..76707a4584c1 100644
---- a/eglibc/locale/langinfo.h
-+++ b/eglibc/locale/langinfo.h
-@@ -589,7 +589,7 @@ extern char *nl_langinfo (nl_item __item) __THROW;
-    more information.  */
- 
- /* Get locale datatype definition.  */
--# include <xlocale.h>
-+# include <locale.h>
- 
- /* Just like nl_langinfo but get the information from the locale object L.  */
- extern char *nl_langinfo_l (nl_item __item, __locale_t __l);
-diff --git a/eglibc/locale/locale.h b/eglibc/locale/locale.h
-index 2aa19e76acb2..18be711a2d40 100644
---- a/eglibc/locale/locale.h
-+++ b/eglibc/locale/locale.h
-@@ -143,7 +143,7 @@ __END_NAMESPACE_STD
-    This is a proof-of-concept implementation.  */
- 
- /* Get locale datatype definition.  */
--# include <xlocale.h>
-+# include_next <locale.h>
- 
- /* Return a reference to a data structure representing a set of locale
-    datasets.  Unlike for the CATEGORY parameter for `setlocale' the
diff --git a/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/0001-HACK-only-build-and-install-localedef.patch
new file mode 100644
index 0000000000..d327008c1d
--- /dev/null
+++ b/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/0001-HACK-only-build-and-install-localedef.patch
@@ -0,0 +1,65 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Michael Olbrich <m.olbrich@pengutronix.de>
+Date: Mon, 21 May 2018 16:45:02 +0200
+Subject: [PATCH] HACK: only build and install localedef
+
+Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
+
+Upstream: https://git.pengutronix.de/cgit/ptxdist/plain/patches/localedef-glibc-2.27/0001-HACK-only-build-and-install-localedef.patch?id=47116f66f411d4dadfce42c2fdd6d41b351ccfd4
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Rules           | 14 ++++++++++----
+ locale/Makefile |  6 +++---
+ 2 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/Rules b/Rules
+index 16afa6acaa..6c208db788 100644
+--- a/Rules
++++ b/Rules
+@@ -190,10 +190,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
+ 				       $(binaries-all-notests))
+ 
+ ifneq "$(strip $(binaries-shared-notests))" ""
+-$(addprefix $(objpfx),$(binaries-shared-notests)): %: %.o \
+-  $(sort $(filter $(common-objpfx)lib%,$(link-libc))) \
+-  $(addprefix $(csu-objpfx),start.o) $(+preinit) $(+postinit)
+-	$(+link)
++$(addprefix $(objpfx),$(binaries-shared-notests)): %: %.o
++	$(CC) -o $@ \
++	      $(sysdep-LDFLAGS) $(LDFLAGS) $(LDFLAGS-$(@F)) \
++	      $(combreloc-LDFLAGS) $(relro-LDFLAGS) $(hashstyle-LDFLAGS) \
++	      $(filter-out $(addprefix $(csu-objpfx),start.o \
++						     $(start-installed-name))\
++			   $(+preinit) \
++			   $(link-extra-libs) \
++			   $(common-objpfx)libc% $(+postinit),$^) \
++	      $(link-extra-libs)
+ endif
+ 
+ ifneq "$(strip $(binaries-shared-tests))" ""
+diff --git a/locale/Makefile b/locale/Makefile
+index 764e751c36..c28322d71f 100644
+--- a/locale/Makefile
++++ b/locale/Makefile
+@@ -32,15 +32,15 @@ categories	= ctype messages monetary numeric time paper name \
+ 		  address telephone measurement identification collate
+ aux		= $(categories:%=lc-%) $(categories:%=C-%) SYS_libc C_name \
+ 		  xlocale localename global-locale coll-lookup
+-others		= localedef locale
++others		= localedef
+ #others-static	= localedef locale
+-install-bin	= localedef locale
++install-bin	= localedef
+ extra-objs	= $(localedef-modules:=.o) $(localedef-aux:=.o) \
+ 		  $(locale-modules:=.o) $(lib-modules:=.o)
+ generated 	+= C-translit.h
+ before-compile	+= $(objpfx)C-translit.h
+ 
+-extra-libs	= libBrokenLocale
++#extra-libs	= libBrokenLocale
+ extra-libs-others = $(extra-libs)
+ 
+ libBrokenLocale-routines = broken_cur_max
+-- 
+2.21.0
+
diff --git a/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/localedef.hash b/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/localedef.hash
new file mode 100644
index 0000000000..b62487ce19
--- /dev/null
+++ b/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/localedef.hash
@@ -0,0 +1,7 @@
+# Locally calculated (fetched from Github)
+sha256  a5d4cbe7eceaefd8bce1104994379818169961b59346d2f3897966912237b1e6  glibc-2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436.tar.gz
+
+# Hashes for license files
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  35bdb41dc0bcb10702ddacbd51ec4c0fe6fb3129f734e8c85fc02e4d3eb0ce3f  LICENSES
diff --git a/package/localedef/localedef.hash b/package/localedef/localedef.hash
index ee14fb16b8..5316f03b10 100644
--- a/package/localedef/localedef.hash
+++ b/package/localedef/localedef.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 9a60f7cdab6fb39adf23a12102f2d950d5f07f0cd7e51e85ec327e07440a79c6  localedef-eglibc-2.14.1-r17443-ptx1.tar.bz2
+# This hash file is not used; instead, update the
+# hash files in the per-version sub-directories.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 11d9ba3848..4005737434 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -4,19 +4,48 @@
 #
 ################################################################################
 
-LOCALEDEF_VERSION = 2.14.1-r17443-ptx1
-LOCALEDEF_SOURCE = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
-LOCALEDEF_SITE = http://www.pengutronix.de/software/ptxdist/temporary-src
+# Use the same VERSION and SITE as target glibc
+# As in glibc.mk, generate version string using:
+#   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
+LOCALEDEF_VERSION = 2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436
+LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
+LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
+LOCALEDEF_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+HOST_LOCALEDEF_DL_SUBDIR = glibc
 
-HOST_LOCALEDEF_CONF_OPTS += \
-	--prefix=/usr \
-	--with-glibc=./eglibc
+HOST_LOCALEDEF_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
 
-HOST_LOCALEDEF_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -fgnu89-inline"
+# Even though we use the autotools-package infrastructure, we have to override
+# the default configure commands for since we have to build out-of-tree, but we
+# can't use the same 'symbolic link to configure' used with the gcc packages.
+define HOST_LOCALEDEF_CONFIGURE_CMDS
+	mkdir -p $(@D)/build
+	# Do the configuration
+	(cd $(@D)/build; \
+		$(HOST_LOCALEDEF_CONF_ENV) \
+		$(HOST_CONFIGURE_OPTS) \
+		$(SHELL) $(@D)/configure \
+		libc_cv_forced_unwind=yes \
+		libc_cv_ssp=no \
+		--target=$(GNU_HOST_NAME) \
+		--host=$(GNU_HOST_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--with-pkgversion="Buildroot" \
+		--without-cvs \
+		--disable-profile \
+		--without-gd \
+		--enable-obsolete-rpc)
+endef
+
+define HOST_LOCALEDEF_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(BR2_MAKE1) $(HOST_LOCALEDEF_MAKE_OPTS) \
+		-C $(@D)/build locale/others
+endef
 
-# The makefile does not implement an install target
+# The makefile does not implement an install target for localedef
 define HOST_LOCALEDEF_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/localedef $(HOST_DIR)/bin/localedef
+	$(INSTALL) -D -m 0755 $(@D)/build/locale/localedef $(HOST_DIR)/bin/localedef
 endef
 
 $(eval $(host-autotools-package))
