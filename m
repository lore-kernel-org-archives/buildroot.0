From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 29 Jan 2020 22:05:42 +0100
Subject: [Buildroot] [PATCH v2,1/2] package/daq3: new package
Message-ID: <20200129210543.244766-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add daq3 package to be able to add the snort3 package.

snort3 has an official dependency on daq 2.2.2 but this version is two
years old so it seems more reasonable to add a daq3 package instead of
a daq22 package.

daq3 (and daq 2.2.x) is not compatatible with snort as daq_load_modules
has been removed from daq 2.2.x

daq3 package has been created from the daq package, here is a summary of
the changes:
- Drop patch (not needed anymore)
- Enable parallel build as there is no more tokdefs.h
- Drop libdnet dependency
- Drop host-bison and host-flex dependencies
- Drop libpcap workarounds
- ipq module dropped since version 3.0.0-alpha1 and
  https://github.com/snort3/libdaq/commit/80c62799a936118c80894bf91f396c8aa8ba45a6
- Add LICENSE file (same content than COPYING)
- Update hash of COPYING (project name and GPLv2 text updated with
  https://github.com/snort3/libdaq/commit/46e8722da230082a5728175270ea3c04432d1af0)
- Add a dependency on gcc 4.9 for {t,u}h_{d,s}port that are protected on
  glibc by _FAVOR_BSD (and so !defined _GNU_SOURCE) until version 2.19:
  https://sourceware.org/git/?p=glibc.git;a=commit;h=7011c2622fe3e10a29dbe74f06aaebd07710127d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...0001-configure.ac-make-C-11-optional.patch | 38 ++++++++++++++++++
 ...lly-disable-FST-module-if-C-11-is-no.patch | 39 +++++++++++++++++++
 package/daq3/Config.in                        | 14 +++++++
 package/daq3/daq3.hash                        |  6 +++
 package/daq3/daq3.mk                          | 30 ++++++++++++++
 7 files changed, 129 insertions(+)
 create mode 100644 package/daq3/0001-configure.ac-make-C-11-optional.patch
 create mode 100644 package/daq3/0002-configure.ac-really-disable-FST-module-if-C-11-is-no.patch
 create mode 100644 package/daq3/Config.in
 create mode 100644 package/daq3/daq3.hash
 create mode 100644 package/daq3/daq3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d5f7bdb8f7..e9cc2442ce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -823,6 +823,7 @@ F:	package/openzwave/
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
 F:	package/boinc/
 F:	package/cairo/
+F:	package/daq3/
 F:	package/duktape/
 F:	package/expat/
 F:	package/flatbuffers/
diff --git a/package/Config.in b/package/Config.in
index db35848fed..31396650cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1617,6 +1617,7 @@ menu "Networking"
 	source "package/curlpp/Config.in"
 	source "package/czmq/Config.in"
 	source "package/daq/Config.in"
+	source "package/daq3/Config.in"
 	source "package/davici/Config.in"
 	source "package/enet/Config.in"
 	source "package/filemq/Config.in"
diff --git a/package/daq3/0001-configure.ac-make-C-11-optional.patch b/package/daq3/0001-configure.ac-make-C-11-optional.patch
new file mode 100644
index 0000000000..d8f59326bc
--- /dev/null
+++ b/package/daq3/0001-configure.ac-make-C-11-optional.patch
@@ -0,0 +1,38 @@
+From b4008beada22d705d8a9aa5486b68789c31b139c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 27 Jan 2020 13:44:15 +0100
+Subject: [PATCH 2/2] configure.ac: make C++11 optional
+
+C++11 is optional otherwise build without C++ will fail on:
+checking whether no supports C++11 features with -std=gnu++11... no
+checking whether no supports C++11 features with -std=gnu++0x... no
+checking whether no supports C++11 features with -std=c++11... no
+checking whether no supports C++11 features with +std=c++11... no
+checking whether no supports C++11 features with -h std=c++11... no
+checking whether no supports C++11 features with -std=c++0x... no
+checking whether no supports C++11 features with +std=c++0x... no
+checking whether no supports C++11 features with -h std=c++0x... no
+configure: error: *** A compiler with support for C++11 language features is required.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2b7d67d..0add302 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29,7 +29,7 @@ AC_PROG_CXX
+ AM_PROG_AR
+ AC_PROG_SED
+ 
+-AX_CXX_COMPILE_STDCXX_11
++AX_CXX_COMPILE_STDCXX_11(,optional)
+ 
+ LT_INIT
+ 
+-- 
+2.24.1
+
diff --git a/package/daq3/0002-configure.ac-really-disable-FST-module-if-C-11-is-no.patch b/package/daq3/0002-configure.ac-really-disable-FST-module-if-C-11-is-no.patch
new file mode 100644
index 0000000000..ec84c88ce3
--- /dev/null
+++ b/package/daq3/0002-configure.ac-really-disable-FST-module-if-C-11-is-no.patch
@@ -0,0 +1,39 @@
+From 60dd4f4efe447f8df38ef7a5742b849bc23c498a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 27 Jan 2020 13:54:28 +0100
+Subject: [PATCH 2/2] configure.ac: really disable FST module if C++11 is not
+ available
+
+Move AM_CONDITIONAL that set [BUILD_FST_MODULE] after the check for
+C++11 otherwise FST will always be enabled and the build will fail
+without C++11
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/snort3/libdaq/pull/6]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f669875..0634420 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -185,7 +185,6 @@ AM_COND_IF([BUILD_DUMP_MODULE], [AC_CONFIG_FILES([modules/dump/libdaq_static_dum
+ AC_ARG_ENABLE(fst-module,
+               AS_HELP_STRING([--disable-fst-module],[do not build the bundled FST module]),
+               [enable_fst_module="$enableval"], [enable_fst_module="$DEFAULT_ENABLE"])
+-AM_CONDITIONAL([BUILD_FST_MODULE], [test "$enable_fst_module" = yes])
+ if test "$enable_fst_module" = yes; then
+     if test "$HAVE_CXX11" = 1 ; then
+         DAQ_FST_LIBS="-lstdc++"
+@@ -200,6 +199,7 @@ if test "$enable_fst_module" = yes; then
+         enable_fst_module=no
+     fi
+ fi
++AM_CONDITIONAL([BUILD_FST_MODULE], [test "$enable_fst_module" = yes])
+ AM_COND_IF([BUILD_FST_MODULE], [AC_CONFIG_FILES([modules/fst/libdaq_static_fst.pc])])
+ 
+ # Netmap Module
+-- 
+2.24.1
+
diff --git a/package/daq3/Config.in b/package/daq3/Config.in
new file mode 100644
index 0000000000..ad7d55db5b
--- /dev/null
+++ b/package/daq3/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_DAQ3
+	bool "daq3"
+	depends on !BR2_PACKAGE_DAQ
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	help
+	  DAQ is a Data Acquisition library for packet I/O from the
+	  Snort project.
+
+	  https://www.snort.org
+
+comment "daq3 needs a toolchain w/ dynamic library, gcc >= 4.9"
+	depends on !BR2_PACKAGE_DAQ
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
new file mode 100644
index 0000000000..643e1768f6
--- /dev/null
+++ b/package/daq3/daq3.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256 5a54e804d57b4fa4e31bff331af3d5b96edcd6d45156805843275f6725097e40  daq3-3.0.0-alpha3.tar.gz
+
+# Hash for license files:
+sha256 64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
+sha256 64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  LICENSE
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
new file mode 100644
index 0000000000..0fc4c8aa1b
--- /dev/null
+++ b/package/daq3/daq3.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# daq3
+#
+################################################################################
+
+DAQ3_VERSION = 3.0.0-alpha3
+DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
+DAQ3_LICENSE = GPL-2.0
+DAQ3_LICENSE_FILES = COPYING LICENSE
+DAQ3_INSTALL_STAGING = YES
+DAQ3_DEPENDENCIES = host-pkgconf
+# From git
+DAQ3_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
+DAQ3_DEPENDENCIES += libnetfilter_queue
+DAQ3_CONF_OPTS += --enable-nfq-module
+else
+DAQ3_CONF_OPTS += --disable-nfq-module
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+DAQ3_DEPENDENCIES += libpcap
+DAQ3_CONF_OPTS += --enable-pcap-module
+else
+DAQ3_CONF_OPTS += --disable-pcap-module
+endif
+
+$(eval $(autotools-package))
-- 
2.24.1
