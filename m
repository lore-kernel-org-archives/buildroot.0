From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  2 Dec 2015 22:48:13 +0100
Subject: [Buildroot] [PATCH 4/4] package/lttng-tools: fix static build
In-Reply-To: <1449092893-30664-1-git-send-email-s.martin49@gmail.com>
References: <1449092893-30664-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1449092893-30664-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some unit tests depend on objects from src/common/.
This patch makes sure to points to the location of the non-PIC object files.
Otherwise, in case of static only build, the PIC object are not built, so
the link will fail.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...0003-tests-unit-fix-object-files-location.patch | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 package/lttng-tools/0003-tests-unit-fix-object-files-location.patch

diff --git a/package/lttng-tools/0003-tests-unit-fix-object-files-location.patch b/package/lttng-tools/0003-tests-unit-fix-object-files-location.patch
new file mode 100644
index 0000000..3233a1b
--- /dev/null
+++ b/package/lttng-tools/0003-tests-unit-fix-object-files-location.patch
@@ -0,0 +1,90 @@
+Upstream status: submitted
+Fetched from: https://lists.lttng.org/pipermail/lttng-dev/2015-December/025331.html
+From 15b43f3b61adecb62ed6b297fa709313ada7bf89 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Mon, 23 Nov 2015 00:11:36 +0100
+Subject: [PATCH] tests/unit: fix object files' location
+
+Referring to *.o files under a .libs/ directory is not recommended
+because this belongs to libtool's innards.
+
+Indeed, libtool decides to place the *.o files in an
+implementation-specific location:
+- PIC *.o files go into a .libs/ directory;
+- non-PIC *.o files are generated along side to their corresponding
+  source files.
+
+Using PIC objects to build executable is legit, thought it may
+introduce some minor overhead at runtime.
+
+However, hard-coding these PIC object files in the Makefile.am to build
+executables breaks the build in case of static only build.
+
+In this case, no PIC object files is generated, so the linker will not
+found some of the needed objects files.
+
+Changing these dependencies' path fixes the static build, keeping the
+shared one ok, though the non-PIC object files are now always built.
+
+Fixes #983.
+
+Fix tested on git master and v2.6 with no change needed.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ tests/unit/Makefile.am | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/tests/unit/Makefile.am b/tests/unit/Makefile.am
+index c0c9c45..7bfe65a 100644
+--- a/tests/unit/Makefile.am
++++ b/tests/unit/Makefile.am
+@@ -34,9 +34,9 @@ SESSIONS=$(top_builddir)/src/bin/lttng-sessiond/session.o	\
+ 	 $(top_builddir)/src/bin/lttng-sessiond/consumer.o \
+ 	 $(top_builddir)/src/bin/lttng-sessiond/utils.o \
+ 	 $(top_builddir)/src/bin/lttng-sessiond/snapshot.o \
+-	 $(top_builddir)/src/common/.libs/uri.o \
+-	 $(top_builddir)/src/common/.libs/utils.o \
+-	 $(top_builddir)/src/common/.libs/error.o \
++	 $(top_builddir)/src/common/uri.o \
++	 $(top_builddir)/src/common/utils.o \
++	 $(top_builddir)/src/common/error.o \
+ 	 $(top_builddir)/src/common/health/libhealth.la \
+ 	 $(top_builddir)/src/common/sessiond-comm/libsessiond-comm.la
+ 
+@@ -60,8 +60,8 @@ UST_DATA_TRACE=$(top_builddir)/src/bin/lttng-sessiond/trace-ust.o \
+ 		   $(top_builddir)/src/bin/lttng-sessiond/session.o \
+ 		   $(top_builddir)/src/bin/lttng-sessiond/snapshot.o \
+ 		   $(top_builddir)/src/bin/lttng-sessiond/agent.o \
+-		   $(top_builddir)/src/common/.libs/uri.o \
+-		   $(top_builddir)/src/common/.libs/utils.o \
++		   $(top_builddir)/src/common/uri.o \
++		   $(top_builddir)/src/common/utils.o \
+ 		   $(top_builddir)/src/common/health/libhealth.la \
+ 		   $(top_builddir)/src/common/sessiond-comm/libsessiond-comm.la
+ 
+@@ -75,8 +75,8 @@ endif
+ KERN_DATA_TRACE=$(top_builddir)/src/bin/lttng-sessiond/trace-kernel.o	\
+ 		$(top_builddir)/src/bin/lttng-sessiond/consumer.o	\
+ 		$(top_builddir)/src/bin/lttng-sessiond/utils.o \
+-		$(top_builddir)/src/common/.libs/uri.o \
+-		$(top_builddir)/src/common/.libs/utils.o \
++		$(top_builddir)/src/common/uri.o \
++		$(top_builddir)/src/common/utils.o \
+ 		$(top_builddir)/src/common/health/libhealth.la \
+ 		$(top_builddir)/src/common/sessiond-comm/libsessiond-comm.la
+ 
+@@ -86,8 +86,8 @@ test_kernel_data_LDADD = $(LIBTAP) $(LIBCOMMON) $(LIBRELAYD) $(LIBSESSIOND_COMM)
+ test_kernel_data_LDADD += $(KERN_DATA_TRACE)
+ 
+ # utils suffix for unit test
+-UTILS_SUFFIX=$(top_builddir)/src/common/.libs/utils.o \
+-		$(top_builddir)/src/common/.libs/runas.o
++UTILS_SUFFIX=$(top_builddir)/src/common/utils.o \
++		$(top_builddir)/src/common/runas.o
+ 
+ # parse_size_suffix unit test
+ test_utils_parse_size_suffix_SOURCES = test_utils_parse_size_suffix.c
+-- 
+2.6.2
+
-- 
2.6.2
