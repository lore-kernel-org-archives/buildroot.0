From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 20 Aug 2017 12:30:08 +0200
Subject: [Buildroot] [PATCH] lttng-tools: disable build-time test failing
	for musl/uclibc
Message-ID: <20170820103008.GA28645@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable a failing build time test, which uses dlmopen
without the need for autoreconf.

Fixes:
  http://autobuild.buildroot.net/results/011/0111d1f3c18b3f482207a1052831cd0bc45172b3//

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../lttng-tools/0001-disable-dlmopen-test.patch    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/lttng-tools/0001-disable-dlmopen-test.patch

diff --git a/package/lttng-tools/0001-disable-dlmopen-test.patch b/package/lttng-tools/0001-disable-dlmopen-test.patch
new file mode 100644
index 000000000..7cc0f35ba
--- /dev/null
+++ b/package/lttng-tools/0001-disable-dlmopen-test.patch
@@ -0,0 +1,27 @@
+test is not appropriate for uclibc/musl as it uses
+dlmopen. Disable the test without need to autoreconf.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur lttng-tools-2.9.5.orig/tests/regression/ust/Makefile.in lttng-tools-2.9.5/tests/regression/ust/Makefile.in
+--- lttng-tools-2.9.5.orig/tests/regression/ust/Makefile.in	2017-06-14 20:30:16.729238010 +0200
++++ lttng-tools-2.9.5/tests/regression/ust/Makefile.in	2017-08-20 04:27:34.818432154 +0200
+@@ -88,7 +88,7 @@
+ build_triplet = @build@
+ host_triplet = @host@
+ target_triplet = @target@
+- at HAVE_LIBLTTNG_UST_CTL_TRUE@@HAVE_OBJCOPY_TRUE at am__append_1 = baddr-statedump ust-dl
++ at HAVE_LIBLTTNG_UST_CTL_TRUE@@HAVE_OBJCOPY_TRUE at am__append_1 = baddr-statedump
+ subdir = tests/regression/ust
+ ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+ am__aclocal_m4_deps = $(top_srcdir)/m4/ac_define_dir.m4 \
+@@ -178,8 +178,7 @@
+ 	multi-session overlap buffers-pid linking daemon exit-fast \
+ 	fork libc-wrapper periodical-metadata-flush java-jul \
+ 	java-log4j python-logging getcpu-override clock-override \
+-	type-declarations rotation-destroy-flush baddr-statedump \
+-	ust-dl
++	type-declarations rotation-destroy-flush baddr-statedump
+ am__DIST_COMMON = $(srcdir)/Makefile.in
+ DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
+ am__relativize = \
-- 
2.11.0
