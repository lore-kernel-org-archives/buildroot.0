From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 21:06:20 +0200
Subject: [Buildroot] [git commit] ola: Add patch to fix linking issue
Message-ID: <20150818190626.6E80581DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=932442e7a30e6d2e08c1ba8cb1d4c1cf7464926c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Remove-fvisibiliy-inlines-hidden.patch    |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch b/package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch
new file mode 100644
index 0000000..f2bf247
--- /dev/null
+++ b/package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch
@@ -0,0 +1,26 @@
+From cd4f5d9d8a10c368584e8e714ebb0f9695267063 Mon Sep 17 00:00:00 2001
+From: Simon Marchi <simon.marchi@polymtl.ca>
+Date: Mon, 10 Aug 2015 15:01:42 -0400
+Subject: [PATCH] Remove -fvisibiliy-inlines-hidden
+
+Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>
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
+2.5.0
+
