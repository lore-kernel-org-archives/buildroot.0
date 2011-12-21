From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2011 23:30:27 +0100
Subject: [Buildroot] [PATCH 6/7] lttng-babeltrace: new package
In-Reply-To: <cover.1324506157.git.thomas.petazzoni@free-electrons.com>
References: <cover.1324506157.git.thomas.petazzoni@free-electrons.com>
Message-ID: <124a86f025a4de55e66f13db70cf01c54dba4ece.1324506157.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |    1 +
 package/lttng-babeltrace/Config.in           |   22 ++++++++++++++++++++++
 package/lttng-babeltrace/bleh.patch          |   13 +++++++++++++
 package/lttng-babeltrace/lttng-babeltrace.mk |   17 +++++++++++++++++
 4 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 package/lttng-babeltrace/Config.in
 create mode 100644 package/lttng-babeltrace/bleh.patch
 create mode 100644 package/lttng-babeltrace/lttng-babeltrace.mk

diff --git a/package/Config.in b/package/Config.in
index df49778..30e0567 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -24,6 +24,7 @@ source "package/kexec/Config.in"
 source "package/lmbench/Config.in"
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"
+source "package/lttng-babeltrace/Config.in"
 source "package/lttng-modules/Config.in"
 source "package/lttng-tools/Config.in"
 source "package/ltrace/Config.in"
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
new file mode 100644
index 0000000..4134b61
--- /dev/null
+++ b/package/lttng-babeltrace/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LTTNG_BABELTRACE
+        bool "lttng-babeltrace"
+	depends on BR2_PACKAGE_LTTNG_TOOLS
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Babeltrace is part of the LTTng 2.x project.
+
+	  This project provides trace read and write libraries, as
+	  well as a trace converter. A plugin can be created for any
+	  trace format to allow its conversion to/from another trace
+	  format.
+
+	  Having this tool on the target is not mandatory. You can
+	  transfer the binary trace output from the target to your
+	  development workstation, and use babeltrace here. Buildroot
+	  automatically builds a host babeltrace in
+	  $(O)/host/usr/bin/babeltrace as a dependency of the
+	  lttng-tools package.
+
+	  http://lttng.org
diff --git a/package/lttng-babeltrace/bleh.patch b/package/lttng-babeltrace/bleh.patch
new file mode 100644
index 0000000..cb01307
--- /dev/null
+++ b/package/lttng-babeltrace/bleh.patch
@@ -0,0 +1,13 @@
+diff --git a/formats/ctf/metadata/Makefile.am b/formats/ctf/metadata/Makefile.am
+index 09f105f..92e69ee 100644
+--- a/formats/ctf/metadata/Makefile.am
++++ b/formats/ctf/metadata/Makefile.am
+@@ -16,7 +16,7 @@ libctf_ast_la_SOURCES = ctf-visitor-xml.c \
+ 		ctf-visitor-generate-io-struct.c
+ 
+ libctf_ast_la_LIBADD = \
+-		 $(top_builddir)/types/libbabeltrace_types.la
++		 ../../../types/libbabeltrace_types.la
+ 
+ bin_PROGRAMS = ctf-parser-test
+ ctf_parser_test_SOURCES = ctf-parser-test.c
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
new file mode 100644
index 0000000..5977dda
--- /dev/null
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -0,0 +1,17 @@
+LTTNG_BABELTRACE_SITE    = http://lttng.org/files/bundles/20111214/
+LTTNG_BABELTRACE_VERSION = 0.8
+LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
+
+# Needed to fix libtool handling, otherwise the build fails when
+# building the ctf-parser-test program, which depends on libctf-ast.so
+# which itself depends on libbabeltrace_types.so.0 (and libtool gets
+# lost in the middle of this).
+LTTNG_BABELTRACE_AUTORECONF      = YES
+HOST_LTTNG_BABELTRACE_AUTORECONF = YES
+
+LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
+
+HOST_LTTNG_BABELTRACE_DEPENDENCIES = host-popt host-libglib2 host-util-linux
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.4.1
