From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 23:51:45 +0100
Subject: [Buildroot] [git commit] lttng-babeltrace: new package
Message-ID: <20120131232310.0934090953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2605833a3207c1037337c296a0bd0d1be15c7fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop redundant HOST_.._DEPENDENCIES setting]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                            |    1 +
 package/lttng-babeltrace/Config.in           |   22 ++++++++++++++++++++++
 package/lttng-babeltrace/lttng-babeltrace.mk |   15 +++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7c3eb2e..c506df8 100644
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
index 0000000..e6f3845
--- /dev/null
+++ b/package/lttng-babeltrace/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LTTNG_BABELTRACE
+	bool "lttng-babeltrace"
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
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
new file mode 100644
index 0000000..5173028
--- /dev/null
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -0,0 +1,15 @@
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
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
