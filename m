From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 10:28:08 +0200
Subject: [Buildroot] [PATCH] libdvd{nav,
	read}: add patches to fix build on NIOS II
Message-ID: <1400315288-29162-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/628/62839c4b2e687b940b97ad61bceb41cd5eb6e17a/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libdvdnav/libdvdnav-01-fix-os2-support.patch   | 32 ++++++++++++++++++++++
 .../libdvdread/libdvdread-01-fix-os2-support.patch | 31 +++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 package/libdvdnav/libdvdnav-01-fix-os2-support.patch
 create mode 100644 package/libdvdread/libdvdread-01-fix-os2-support.patch

diff --git a/package/libdvdnav/libdvdnav-01-fix-os2-support.patch b/package/libdvdnav/libdvdnav-01-fix-os2-support.patch
new file mode 100644
index 0000000..0f75f2f
--- /dev/null
+++ b/package/libdvdnav/libdvdnav-01-fix-os2-support.patch
@@ -0,0 +1,32 @@
+configure: fix build on NIOS II platform
+
+NIOS II is a CPU architecture from Altera, which uses 'nios2' as the
+architecture part of the tuple. Unfortunately, 'nios2' matches the
+current '*os2*' test done by libdvdnav's configure script to detect
+the OS/2 operating system. This leads to build issues as the build
+process of libdvdnav then tries to use OS/2 specific compiler
+options, that do not exist in the gcc used for Linux/NIOS2.
+
+To fix this, this patch makes the test for OS/2 a little bit more
+specific: in the case of the OS/2 operating system, the OS part of the
+tuple contains just 'os2' (confirmed by looking at config.guess and
+config.sub in the gnuconfig project). So using '*-os2-*' will properly
+match the OS/2 operating system but not the NIOS II architecture.
+
+Upstream-status: not needed, newer upstream versions no longer have
+		 this test
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -166,7 +166,7 @@
+   *cygwin*)
+     LDFLAGS="-no-undefined $LDFLAGS"
+     ;;
+-  *os2*)
++  *-os2-*)
+     LDFLAGS="-no-undefined -Zbin-files $LDFLAGS"
+     ;;
+   *)
diff --git a/package/libdvdread/libdvdread-01-fix-os2-support.patch b/package/libdvdread/libdvdread-01-fix-os2-support.patch
new file mode 100644
index 0000000..755bfaf
--- /dev/null
+++ b/package/libdvdread/libdvdread-01-fix-os2-support.patch
@@ -0,0 +1,31 @@
+configure: fix build on NIOS II platform
+
+NIOS II is a CPU architecture from Altera, which uses 'nios2' as the
+architecture part of the tuple. Unfortunately, 'nios2' matches the
+current '*os2*' test done by libdvdread's configure script to detect
+the OS/2 operating system. This leads to build issues as the build
+process of libdvdread then tries to use OS/2 specific compiler
+options, that do not exist in the gcc used for Linux/NIOS2.
+
+To fix this, this patch makes the test for OS/2 a little bit more
+specific: in the case of the OS/2 operating system, the OS part of the
+tuple contains just 'os2' (confirmed by looking at config.guess and
+config.sub in the gnuconfig project). So using '*-os2-*' will properly
+match the OS/2 operating system but not the NIOS II architecture.
+
+Upstream-status: submitted
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -146,7 +146,7 @@
+   *cygwin*)
+     LDFLAGS="-no-undefined $LDFLAGS"
+     ;;
+-  *os2*)
++  *-os2-*)
+     LDFLAGS="-no-undefined -Zbin-files $LDFLAGS"
+     ;;
+   *)
-- 
1.9.3
