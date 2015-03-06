From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Fri,  6 Mar 2015 12:35:57 -0500
Subject: [Buildroot] [PATCH 7/7] lttng-babeltrace: rename package to
	babeltrace
In-Reply-To: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <1425663357-22541-8-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although Babeltrace is closely related to the LTTng
project because it can decode LTTng's trace format (CTF),
Babeltrace aims at being an independent framework
for converting traces from one format to another,
whatever the tracer is.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/Config.in                                        |  2 +-
 .../0001-no-posix-fallocate-in-uclibc.patch              |  0
 package/{lttng-babeltrace => babeltrace}/Config.in       |  6 +++---
 .../lttng-babeltrace.hash => babeltrace/babeltrace.hash} |  0
 package/babeltrace/babeltrace.mk                         | 16 ++++++++++++++++
 package/lttng-babeltrace/lttng-babeltrace.mk             | 16 ----------------
 package/lttng-tools/Config.in                            |  2 +-
 package/lttng-tools/lttng-tools.mk                       |  4 ++--
 8 files changed, 23 insertions(+), 23 deletions(-)
 rename package/{lttng-babeltrace => babeltrace}/0001-no-posix-fallocate-in-uclibc.patch (100%)
 rename package/{lttng-babeltrace => babeltrace}/Config.in (89%)
 rename package/{lttng-babeltrace/lttng-babeltrace.hash => babeltrace/babeltrace.hash} (100%)
 create mode 100644 package/babeltrace/babeltrace.mk
 delete mode 100644 package/lttng-babeltrace/lttng-babeltrace.mk

diff --git a/package/Config.in b/package/Config.in
index ffc8260..1956430 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -77,7 +77,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 	source "package/ltp-testsuite/Config.in"
 	source "package/ltrace/Config.in"
-	source "package/lttng-babeltrace/Config.in"
+	source "package/babeltrace/Config.in"
 	source "package/lttng-modules/Config.in"
 	source "package/lttng-tools/Config.in"
 	source "package/mcelog/Config.in"
diff --git a/package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch b/package/babeltrace/0001-no-posix-fallocate-in-uclibc.patch
similarity index 100%
rename from package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
rename to package/babeltrace/0001-no-posix-fallocate-in-uclibc.patch
diff --git a/package/lttng-babeltrace/Config.in b/package/babeltrace/Config.in
similarity index 89%
rename from package/lttng-babeltrace/Config.in
rename to package/babeltrace/Config.in
index c5eb5e0..7fbc677 100644
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
@@ -28,7 +28,7 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 
 	  http://www.efficios.com/babeltrace
 
-comment "lttng-babeltrace needs a uclibc snapshot or (e)glib toolchain w/ wchar, threads, largefile"
+comment "babeltrace needs a uclibc snapshot or (e)glib toolchain w/ wchar, threads, largefile"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/lttng-babeltrace/lttng-babeltrace.hash b/package/babeltrace/babeltrace.hash
similarity index 100%
rename from package/lttng-babeltrace/lttng-babeltrace.hash
rename to package/babeltrace/babeltrace.hash
diff --git a/package/babeltrace/babeltrace.mk b/package/babeltrace/babeltrace.mk
new file mode 100644
index 0000000..7b36df5
--- /dev/null
+++ b/package/babeltrace/babeltrace.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# babeltrace
+#
+################################################################################
+
+BABELTRACE_SITE = http://lttng.org/files/babeltrace
+BABELTRACE_VERSION = 1.2.4
+BABELTRACE_SOURCE = babeltrace-$(BABELTRACE_VERSION).tar.bz2
+BABELTRACE_LICENSE = MIT; LGPLv2.1 for include/babeltrace/list.h; GPLv2 for test code
+BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
+
+BABELTRACE_DEPENDENCIES = popt util-linux libglib2
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
deleted file mode 100644
index dacb15a..0000000
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# lttng-babeltrace
-#
-################################################################################
-
-LTTNG_BABELTRACE_SITE = http://lttng.org/files/babeltrace
-LTTNG_BABELTRACE_VERSION = 1.2.4
-LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
-LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2.1 for include/babeltrace/list.h; GPLv2 for test code
-LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
-
-LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 2d3bbf1..6d15719 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	  on the host machine using the babeltrace utility. This
 	  utility is automatically built by Buildroot in
 	  $(O)/host/usr/bin/babeltrace, as a dependency of
-	  lttng-tools. However, there is also a lttng-babeltrace
+	  lttng-tools. However, there is also the babeltrace
 	  package for the target, if babeltrace on the target is
 	  interesting.
 
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 675e8eb..c27d669 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -11,11 +11,11 @@ LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ct
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr
 
-# The host-lttng-babeltrace technically isn't a required build
+# The host-babeltrace technically isn't a required build
 # dependency. However, having the babeltrace utilities built for the
 # host is very useful, since those tools allow to convert the binary
 # trace format into an human readable format.
-LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt host-lttng-babeltrace util-linux
+LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt host-babeltrace util-linux
 
 LTTNG_AUTORECONF = YES
 
-- 
2.2.1
