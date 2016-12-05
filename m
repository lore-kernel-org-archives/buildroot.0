From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  5 Dec 2016 21:27:15 +0100
Subject: [Buildroot] [PATCH v1] gstreamer1: fix compile for microblaze and
	xtensa architectures
Message-ID: <20161205202715.22139-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix unaligned access support detection introduced to gstreamer
by commit 'gstconfig.h: Detect unaligned access support at compile-time' ([1])
by assuming no unaligned support for unknown architectures.

Fixes [2], [3]:

  ../gst/gstconfig.h:112:4: error: #error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."
  #  error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."

[1] https://cgit.freedesktop.org/gstreamer/gstreamer/commit/?h=1.10&id=6ef601367e0f5adb7a8b02cec94dec04fccf701a
[2] http://autobuild.buildroot.net/results/c1cd60d3f44f2938e5f42453d034ea070898f837
[3] http://autobuild.buildroot.net/results/c3a6662f0acfda179a58cdad9165f36826229826

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ed-access-support-for-unknown-architectur.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/gstreamer1/gstreamer1/0001-Fix-unaligned-access-support-for-unknown-architectur.patch

diff --git a/package/gstreamer1/gstreamer1/0001-Fix-unaligned-access-support-for-unknown-architectur.patch b/package/gstreamer1/gstreamer1/0001-Fix-unaligned-access-support-for-unknown-architectur.patch
new file mode 100644
index 000000000..d0f8b43ce
--- /dev/null
+++ b/package/gstreamer1/gstreamer1/0001-Fix-unaligned-access-support-for-unknown-architectur.patch
@@ -0,0 +1,37 @@
+From 20bbce5758abf3493f3d7dc10edd335701c3a02c Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 5 Dec 2016 20:54:55 +0100
+Subject: [PATCH] Fix unaligned access support for unknown architectures.
+
+Better be save (assume no unaligned access) than sorry (bail out
+with error message at compile time).
+
+Fixes compile for xtensa and microblaze architectures.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gst/gstconfig.h.in | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
+index c2e8361..3a17398 100644
+--- a/gst/gstconfig.h.in
++++ b/gst/gstconfig.h.in
+@@ -104,12 +104,10 @@
+  * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
+  * https://software.intel.com/en-us/node/583402
+  */
+-#if defined(__alpha__) || defined(__arm__) || defined(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__mips__) || defined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc) || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M_IA64)
+-#  define GST_HAVE_UNALIGNED_ACCESS 0
+-#elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390__) || defined(__s390x__) || defined(__zarch__)
++#if defined(__i386__) || defined(__i386) || defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) || defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390__) || defined(__s390x__) || defined(__zarch__)
+ #  define GST_HAVE_UNALIGNED_ACCESS 1
+ #else
+-#  error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."
++#  define GST_HAVE_UNALIGNED_ACCESS 0
+ #endif
+ 
+ /**
+-- 
+2.11.0
+
-- 
2.11.0
