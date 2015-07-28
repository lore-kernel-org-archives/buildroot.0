From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 28 Jul 2015 17:40:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix compilation issue on
	SPARC
Message-ID: <1438101602-19760-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/b3c/b3cb6515496cf09d305a1077d01f87d75ece8a8d/

Patch added to improve detection of atomic support in the compiler.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 .../0001-fix-compile-time-atomic-detection.patch   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/libglib2/0001-fix-compile-time-atomic-detection.patch

diff --git a/package/libglib2/0001-fix-compile-time-atomic-detection.patch b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
new file mode 100644
index 0000000..f6d0c5d
--- /dev/null
+++ b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
@@ -0,0 +1,28 @@
+[PATCH] Fix compilation issues on architectures with limited atomic support
+
+Improved compile-time detection of atomic support in the compiler.
+
+Upstream-Status: submitted
+See : https://bugzilla.gnome.org/show_bug.cgi?id=752731
+
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ glib/gthread-posix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/gthread-posix.c b/glib/gthread-posix.c
+index ae5d805..8db8557 100644
+--- a/glib/gthread-posix.c
++++ b/glib/gthread-posix.c
+@@ -67,7 +67,7 @@
+ #endif
+ 
+ /* clang defines __ATOMIC_SEQ_CST but doesn't support the GCC extension */
+-#if defined(HAVE_FUTEX) && defined(__ATOMIC_SEQ_CST) && !defined(__clang__)
++#if defined(HAVE_FUTEX) && defined(__ATOMIC_SEQ_CST) && defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4) && !defined(__clang__)
+ #define USE_NATIVE_MUTEX
+ #endif
+ 
+-- 
+2.4.3
+
-- 
2.4.3
