From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  6 Dec 2018 20:10:09 +0100
Subject: [Buildroot] [RFC v2] localedef: update to glibc-2.28 and various
 fixes
Message-ID: <20181206191009.3830-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Follow up on original patch [1], various fixes and update according
to the given comments:

- update to glibc-2.28

- add ptxdist patch 0001-HACK-only-build-and-install-localedef.patch,
  needed for make target locale/others

- use make target locale/others (like ptxdist does)

- add 0002-HACK-accept-old-toolchains.patch, fix configure for old
  host toolchains

- remove various target related options

- remove stubs.h header creation

- do not change '--prefix=/usr' to '--prefix=$(HOST_DIR)', otherwise
  leads to the following failure:

  Generating locale en_US.UTF-8
  cannot create temporary file: .../target/home/seiderer/Buildroot-2018-11/build_2018_11_002/host/lib/locale/locale-archive.wXbLbC: No such file or directory
  Makefile:715: recipe for target 'target-finalize' failed
  make[1]: *** [target-finalize] Error 1
  Makefile:23: recipe for target '_all' failed
  make: *** [_all] Error 2

- remove uselsess '$(eval $(autotools-package))'

[1] https://patchwork.ozlabs.org/patch/950717/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - remove patch duplicate 0001-accept-old-as.patch-001
  - fix LOCALEDEF_SITE (GLIBC_VERSION vs. LOCALEDEF_VERSION)
  - update 0001-HACK-only-build-and-install-localedef.patch (add upstream
    url and signed-of-by)
  - update 0002-HACK-accept-old-toolchains.patch (convert to git patch,
    add signed-of-by)

Notes:

    The following programs shows the failure with Buildroot-2018.11/glibc-2.28:

      #include <stdio.h>
      #include <string.h>
      #include <locale.h>

      int main(int argc, char *argv[])
      {
          const char* set_locale = setlocale(LC_ALL, "");
          printf("set_locale: %s\n", set_locale);

          int delta = strcoll("a", "A");
          printf("strcoll(a, A): %d\n", delta);

          delta = strcoll("A", "a");
          printf("strcoll(A, a): %d\n", delta);

          return 0;
      }

            $ ./test
    set_locale: C
    strcoll(a, A): 32
    strcoll(A, a): -32

    This one should give the same output as the one with LC_COLLATE=en_US.UTF-8, but failes to do so:
            $ LC_ALL=en_US.UTF-8 ./test
    set_locale: (null)
    strcoll(a, A): 32
    strcoll(A, a): -32

            $ LC_COLLATE=en_US.UTF-8 ./test
    set_locale: LC_CTYPE=C;LC_NUMERIC=C;LC_TIME=C;LC_COLLATE=en_US.UTF-8;LC_MONETARY=C;LC_MESSAGES=C;LC_PAPER=C;LC_NAME=C;LC_ADDRESS=C;LC_TELEPHONE=C;LC_MEASUREMENT=C;LC_IDENTIFICATION=C
    strcoll(a, A): -5
    strcoll(A, a): 5
---
 ...ACK-only-build-and-install-localedef.patch | 63 +++++++++++++++++++
 .../0002-HACK-accept-old-toolchains.patch     | 44 +++++++++++++
 package/localedef/localedef.hash              |  2 +-
 package/localedef/localedef.mk                | 47 +++-----------
 4 files changed, 116 insertions(+), 40 deletions(-)
 create mode 100644 package/localedef/0001-HACK-only-build-and-install-localedef.patch
 create mode 100644 package/localedef/0002-HACK-accept-old-toolchains.patch

diff --git a/package/localedef/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
new file mode 100644
index 0000000000..8d5fefbb82
--- /dev/null
+++ b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
@@ -0,0 +1,63 @@
+From 3a32e5840048ef7db7858ce324731be7a82ddf90 Mon Sep 17 00:00:00 2001
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
+index 706c8a74..04f3f333 100644
+--- a/Rules
++++ b/Rules
+@@ -188,10 +188,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
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
+index fd997227..a8541593 100644
+--- a/locale/Makefile
++++ b/locale/Makefile
+@@ -32,13 +32,13 @@ categories	= ctype messages monetary numeric time paper name \
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
+ 
+-extra-libs	= libBrokenLocale
++#extra-libs	= libBrokenLocale
+ extra-libs-others = $(extra-libs)
+ 
+ libBrokenLocale-routines = broken_cur_max
+-- 
+2.19.2
+
diff --git a/package/localedef/0002-HACK-accept-old-toolchains.patch b/package/localedef/0002-HACK-accept-old-toolchains.patch
new file mode 100644
index 0000000000..93305093ad
--- /dev/null
+++ b/package/localedef/0002-HACK-accept-old-toolchains.patch
@@ -0,0 +1,44 @@
+From 3781bea6277974169cb64d676aad19d3ff358212 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 6 Dec 2018 19:10:24 +0100
+Subject: [PATCH] HACK: accept old toolchains
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index fde57d63..44082866 100755
+--- a/configure
++++ b/configure
+@@ -4519,7 +4519,7 @@ $as_echo_n "checking version of $AS... " >&6; }
+   ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    2.1[0-9][0-9]*|2.2[5-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
++    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+@@ -4649,7 +4649,7 @@ $as_echo_n "checking version of $LD... " >&6; }
+   ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    2.1[0-9][0-9]*|2.2[5-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
++    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+@@ -5058,7 +5058,7 @@ int
+ main ()
+ {
+ 
+-#if !defined __GNUC__ || __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 9)
++#if !defined __GNUC__ || __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
+ #error insufficient compiler
+ #endif
+   ;
+-- 
+2.19.2
+
diff --git a/package/localedef/localedef.hash b/package/localedef/localedef.hash
index 6f2d6313b6..cfc8e984fa 100644
--- a/package/localedef/localedef.hash
+++ b/package/localedef/localedef.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 33189b3f10c88730a1f686fac794bc01f31765f12ffd75bc5e8a0f2a690d217a  localedef-glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e.tar.gz
+sha256 877c7b4741501d1762af8ef1a2518bdf2d722947d2e8d48b203e2d83cc600bca glibc-glibc-2.28.tar.gz
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c93132cc3f..9928590b9e 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -5,47 +5,15 @@
 ################################################################################
 
 # Use the same VERSION and SITE as target glibc
-LOCALEDEF_VERSION = glibc-2.27-57-g6c99e37f6fb640a50a3113b2dbee5d5389843c1e
-LOCALEDEF_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
+LOCALEDEF_VERSION = glibc-2.28
+LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
+LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 
 HOST_LOCALEDEF_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 HOST_LOCALEDEF_LICENSE_FILES = COPYING COPYING.LIB LICENSES
 
-# glibc is part of the toolchain so disable the toolchain dependency
-HOST_LOCALEDEF_ADD_TOOLCHAIN_DEPENDENCY = NO
-
 HOST_LOCALEDEF_SUBDIR = build
 
-# Thumb build is broken, build in ARM mode
-ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
-HOST_LOCALEDEF_EXTRA_CFLAGS += -marm
-endif
-
-# MIPS64 defaults to n32 so pass the correct -mabi if
-# we are using a different ABI. OABI32 is also used
-# in MIPS so we pass -mabi=32 in this case as well
-# even though it's not strictly necessary.
-ifeq ($(BR2_MIPS_NABI64),y)
-HOST_LOCALEDEF_EXTRA_CFLAGS += -mabi=64
-else ifeq ($(BR2_MIPS_OABI32),y)
-HOST_LOCALEDEF_EXTRA_CFLAGS += -mabi=32
-endif
-
-ifeq ($(BR2_ENABLE_DEBUG),y)
-HOST_LOCALEDEF_EXTRA_CFLAGS += -g
-endif
-
-# The stubs.h header is not installed by install-headers, but is
-# needed for the gcc build. An empty stubs.h will work, as explained
-# in http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html. The same trick
-# is used by Crosstool-NG.
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_HOST_LOCALEDEF),y)
-define HOST_LOCALEDEF_ADD_MISSING_STUB_H
-	mkdir -p $(STAGING_DIR)/usr/include/gnu
-	touch $(STAGING_DIR)/usr/include/gnu/stubs.h
-endef
-endif
-
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
 #
@@ -72,17 +40,18 @@ define HOST_LOCALEDEF_CONFIGURE_CMDS
 		--host=$(GNU_HOST_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		$(if $(BR2_SOFT_FLOAT),--without-fp,--with-fp) \
-		$(if $(BR2_x86_64),--enable-lock-elision) \
 		--with-pkgversion="Buildroot" \
 		--without-cvs \
 		--disable-profile \
 		--without-gd \
 		--enable-obsolete-rpc)
-	$(HOST_LOCALEDEF_ADD_MISSING_STUB_H)
 endef
 
-$(eval $(autotools-package))
+define HOST_LOCALEDEF_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_LOCALEDEF_MAKE_OPTS) \
+		-C $(@D)/build locale/others
+endef
+
 # The makefile does not implement an install target for localedef
 define HOST_LOCALEDEF_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/build/locale/localedef $(HOST_DIR)/bin/localedef
-- 
2.19.2
