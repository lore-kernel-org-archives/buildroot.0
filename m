From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 00:08:27 +0100
Subject: [Buildroot] [git commit] gstreamer1: fix riscv64 compile
Message-ID: <20181112230612.7F6B18271E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ec7fecb0b471afceef1d7366b07f8b204490de8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch [1]:

  gstconfig.h.in: initial RISC-V support

Fixes [2]:

  ../gst/gstconfig.h:112:4: error: #error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/commit/8a156d1725ecd03f2e8cdc8874e081dda2d3b43d
[2] http://autobuild.buildroot.net/results/07efafadff75ae2fb1d2b8d420be72345906af6c

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-gstconfig.h.in-initial-RISC-V-support.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/gstreamer1/gstreamer1/0001-gstconfig.h.in-initial-RISC-V-support.patch b/package/gstreamer1/gstreamer1/0001-gstconfig.h.in-initial-RISC-V-support.patch
new file mode 100644
index 0000000000..689346a3e8
--- /dev/null
+++ b/package/gstreamer1/gstreamer1/0001-gstconfig.h.in-initial-RISC-V-support.patch
@@ -0,0 +1,34 @@
+From 58982c0d28f1eb385319307ee47bd6522c812f22 Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Sun, 15 Apr 2018 00:49:55 +0200
+Subject: [PATCH] gstconfig.h.in: initial RISC-V support
+
+RISC-V supports unaligned accesses, but these might run extremely slowly
+depending on the implementation. Therefore set GST_HAVE_UNALIGNED_ACCESS
+to 0 on this architecture.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=795271
+
+Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/commit/8a156d1725ecd03f2e8cdc8874e081dda2d3b43d
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gst/gstconfig.h.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
+index 6351c04da..33dfed1f6 100644
+--- a/gst/gstconfig.h.in
++++ b/gst/gstconfig.h.in
+@@ -104,7 +104,7 @@
+  * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
+  * https://software.intel.com/en-us/node/583402
+  */
+-#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__) || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64) || defined(__xtensa__) || defined(__e2k__)
++#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__) || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64) || defined(__xtensa__) || defined(__e2k__) || defined(__riscv)
+ #  define GST_HAVE_UNALIGNED_ACCESS 0
+ #elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390__) || defined(__s390x__) || defined(__zarch__)
+ #  define GST_HAVE_UNALIGNED_ACCESS 1
+-- 
+2.19.1
+
