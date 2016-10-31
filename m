From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 31 Oct 2016 03:46:24 -0400
Subject: [Buildroot] [PATCH v3 9/9] lttng-babeltrace: rename to babeltrace
In-Reply-To: <20161031074624.7576-1-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
Message-ID: <20161031074624.7576-10-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Babeltrace project is no longer part of the LTTng project.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
This is a new patch in v3.

 Config.in.legacy                                   |  8 ++++++
 package/Config.in                                  |  2 +-
 package/Config.in.host                             |  2 +-
 ...c-remove-elfutils-version-test-for-Buildr.patch |  0
 ...b-Makefile.am-remove-unneeded-static-flag.patch |  0
 package/{lttng-babeltrace => babeltrace}/Config.in | 12 ++++-----
 .../Config.in.host                                 |  4 +--
 .../babeltrace.hash}                               |  0
 package/babeltrace/babeltrace.mk                   | 29 ++++++++++++++++++++++
 package/lttng-babeltrace/lttng-babeltrace.mk       | 29 ----------------------
 10 files changed, 47 insertions(+), 39 deletions(-)
 rename package/{lttng-babeltrace => babeltrace}/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch (100%)
 rename package/{lttng-babeltrace => babeltrace}/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch (100%)
 rename package/{lttng-babeltrace => babeltrace}/Config.in (84%)
 rename package/{lttng-babeltrace => babeltrace}/Config.in.host (90%)
 rename package/{lttng-babeltrace/lttng-babeltrace.hash => babeltrace/babeltrace.hash} (100%)
 create mode 100644 package/babeltrace/babeltrace.mk
 delete mode 100644 package/lttng-babeltrace/lttng-babeltrace.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 8c41b05..d5ec061 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"

+config BR2_PACKAGE_LTTNG_BABELTRACE
+	bool "lttng-babeltrace has been renamed to babeltrace"
+	select BR2_PACKAGE_BABELTRACE
+	select BR2_LEGACY
+	help
+	  The lttng-babeltrace package has been renamed to match the
+	  project's name (separate from the LTTng project now).
+
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
 	bool "PHP CGI and CLI options are now seperate"
 	select BR2_PACKAGE_PHP_SAPI_CLI
diff --git a/package/Config.in b/package/Config.in
index 0f6260b..b61e95b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -67,6 +67,7 @@ menu "Compressors and decompressors"
 endmenu

 menu "Debugging, profiling and benchmark"
+	source "package/babeltrace/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
@@ -91,7 +92,6 @@ menu "Debugging, profiling and benchmark"
 	source "package/lsof/Config.in"
 	source "package/ltp-testsuite/Config.in"
 	source "package/ltrace/Config.in"
-	source "package/lttng-babeltrace/Config.in"
 	source "package/lttng-modules/Config.in"
 	source "package/lttng-tools/Config.in"
 	source "package/mcelog/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 3b115c5..1bcd24c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"

 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/babeltrace/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cramfs/Config.in.host"
@@ -22,7 +23,6 @@ menu "Host utilities"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
-	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mke2img/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
diff --git a/package/lttng-babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch b/package/babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
similarity index 100%
rename from package/lttng-babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
rename to package/babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
diff --git a/package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch b/package/babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
similarity index 100%
rename from package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
rename to package/babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
diff --git a/package/lttng-babeltrace/Config.in b/package/babeltrace/Config.in
similarity index 84%
rename from package/lttng-babeltrace/Config.in
rename to package/babeltrace/Config.in
index 55e2143..82a8c8c 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/babeltrace/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_LTTNG_BABELTRACE
-	bool "lttng-babeltrace"
+config BR2_PACKAGE_BABELTRACE
+	bool "babeltrace"
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
@@ -22,14 +22,14 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	  transfer the binary trace output from the target to your
 	  development workstation, and use babeltrace here.

-	  See the lttng-babeltrace host utility to install Babeltrace
+	  See the babeltrace host utility to install Babeltrace
 	  on the host.

 	  http://diamon.org/babeltrace

-if BR2_PACKAGE_LTTNG_BABELTRACE
+if BR2_PACKAGE_BABELTRACE

-config BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO
+config BR2_PACKAGE_BABELTRACE_DEBUG_INFO
 	bool
 	default y
 	depends on !BR2_bfin # elfutils
@@ -44,6 +44,6 @@ comment "handling debug info in traces needs a glibc or uClibc toolchain w/ dyna

 endif

-comment "lttng-babeltrace needs a toolchain w/ wchar, threads"
+comment "babeltrace needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lttng-babeltrace/Config.in.host b/package/babeltrace/Config.in.host
similarity index 90%
rename from package/lttng-babeltrace/Config.in.host
rename to package/babeltrace/Config.in.host
index 5da482e..be4cebe 100644
--- a/package/lttng-babeltrace/Config.in.host
+++ b/package/babeltrace/Config.in.host
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_HOST_LTTNG_BABELTRACE
-	bool "host lttng-babeltrace"
+config BR2_PACKAGE_HOST_BABELTRACE
+	bool "host babeltrace"
 	help
 	  The Babeltrace project provides trace read and write
 	  libraries, as well as a trace converter application. Plugins
diff --git a/package/lttng-babeltrace/lttng-babeltrace.hash b/package/babeltrace/babeltrace.hash
similarity index 100%
rename from package/lttng-babeltrace/lttng-babeltrace.hash
rename to package/babeltrace/babeltrace.hash
diff --git a/package/babeltrace/babeltrace.mk b/package/babeltrace/babeltrace.mk
new file mode 100644
index 0000000..d178a6c
--- /dev/null
+++ b/package/babeltrace/babeltrace.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# babeltrace
+#
+################################################################################
+
+BABELTRACE_SITE = http://www.efficios.com/files/babeltrace
+BABELTRACE_VERSION = 1.4.0
+BABELTRACE_SOURCE = babeltrace-$(BABELTRACE_VERSION).tar.bz2
+BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
+BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
+BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
+BABELTRACE_CONF_OPTS += --disable-debug-info
+HOST_BABELTRACE_DEPENDENCIES = \
+	host-popt host-util-linux host-libglib2 host-pkgconf
+HOST_BABELTRACE_CONF_OPTS += --disable-debug-info
+
+# For 0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
+BABELTRACE_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_BABELTRACE_DEBUG_INFO),y)
+BABELTRACE_DEPENDENCIES += elfutils
+BABELTRACE_CONF_OPTS += --enable-debug-info
+else
+BABELTRACE_CONF_OPTS += --disable-debug-info
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
deleted file mode 100644
index 260a8ee..0000000
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# lttng-babeltrace
-#
-################################################################################
-
-LTTNG_BABELTRACE_SITE = http://www.efficios.com/files/babeltrace
-LTTNG_BABELTRACE_VERSION = 1.4.0
-LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
-LTTNG_BABELTRACE_LICENSE = MIT, LGPLv2.1 (include/babeltrace/list.h), GPLv2 (test code)
-LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
-LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2 host-pkgconf
-LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
-HOST_LTTNG_BABELTRACE_DEPENDENCIES = \
-	host-popt host-util-linux host-libglib2 host-pkgconf
-HOST_LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
-
-# For 0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
-LTTNG_BABELTRACE_AUTORECONF = YES
-
-ifeq ($(BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO),y)
-LTTNG_BABELTRACE_DEPENDENCIES += elfutils
-LTTNG_BABELTRACE_CONF_OPTS += --enable-debug-info
-else
-LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
-endif
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
--
2.9.3
