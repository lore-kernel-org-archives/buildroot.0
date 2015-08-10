From: Simon Marchi <simon.marchi@polymtl.ca>
Date: Mon, 10 Aug 2015 16:37:55 -0400
Subject: [Buildroot] [PATCH v2] Add patch to fix linking issue
Message-ID: <1439239075-14631-1-git-send-email-simon.marchi@polymtl.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes this autobuild failure:

  http://autobuild.buildroot.net/results/e14/e14e1700d4fe359c56be57587bdb509e002e5753/build-end.log

The problem is caused by the -fvisibility-inlines-hidden switch.
Removing the switch is probably the least intrusive way we can make the
problem go away.  The first solution that was considered was to move the
definition of the offending method to the .cpp file.  However, with
other combinations of compilers and platforms, I suppose it could happen
with other methods as well.  Removing the switch ensures we catch them
all.

Built-tested with the config from the build bot, as well as with all OLA
options/plugins enabled.

Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>
---
 .../0001-Remove-fvisibiliy-inlines-hidden.patch    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch

diff --git a/package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch b/package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch
new file mode 100644
index 0000000..ac087f4
--- /dev/null
+++ b/package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch
@@ -0,0 +1,25 @@
+From c160119ff3ff595862e7ba2a7b8bcb3302f13f02 Mon Sep 17 00:00:00 2001
+From: Simon Marchi <simon.marchi@polymtl.ca>
+Date: Mon, 10 Aug 2015 15:01:42 -0400
+Subject: [PATCH] Remove -fvisibiliy-inlines-hidden
+
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 714e435..17a23e2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -32,7 +32,7 @@ AM_DISTCHECK_CONFIGURE_FLAGS = --enable-python-libs
+ COMMON_CXXFLAGS_ONLY_WARNINGS = \
+     -I$(top_srcdir)/include \
+     -I$(top_builddir)/include \
+-    -Wall -Wformat -W -fvisibility-inlines-hidden \
++    -Wall -Wformat -W \
+     $(libprotobuf_CFLAGS)
+ 
+ COMMON_CXXFLAGS = $(COMMON_CXXFLAGS_ONLY_WARNINGS)
+-- 
+2.4.6
+
-- 
2.4.6
