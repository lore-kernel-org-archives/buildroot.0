From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 25 Aug 2016 21:08:32 +0200
Subject: [Buildroot] [PATCH v2] vlc: fix compile error with uClibc-ng
	Linuxthreads
Message-ID: <20160825190832.GA4674@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The fallback code path didn't work correctly, so fix it.

Fixes:
  http://autobuild.buildroot.net/results/3122287ddea1e316a64ccf0d0dc9415bfefebb49/

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
---
v1 -> v2:
 - rework autobuild failure, there is fallback code for non-NPTL,
   so fix it up. Suggested by Thomas Petazzoni 
---
 package/vlc/0008-fix-fallback-time.patch | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/vlc/0008-fix-fallback-time.patch

diff --git a/package/vlc/0008-fix-fallback-time.patch b/package/vlc/0008-fix-fallback-time.patch
new file mode 100644
index 0000000..9692001
--- /dev/null
+++ b/package/vlc/0008-fix-fallback-time.patch
@@ -0,0 +1,27 @@
+fix fallback code and add missing libraries to link command
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur vlc-2.2.4.orig/configure.ac vlc-2.2.4/configure.ac
+--- vlc-2.2.4.orig/configure.ac	2016-05-31 18:11:07.000000000 +0200
++++ vlc-2.2.4/configure.ac	2016-08-24 21:15:50.555256426 +0200
+@@ -121,6 +121,7 @@
+     ;;
+   linux*)
+     SYS=linux
++    AC_CHECK_LIB([rt], [posix_spawnp], [VLC_ADD_LIBS([libvlccore],[-lpthread -lrt])], [], [-lpthread])
+     ;;
+   bsdi*)
+     SYS=bsdi
+diff -Nur vlc-2.2.4.orig/src/posix/thread.c vlc-2.2.4/src/posix/thread.c
+--- vlc-2.2.4.orig/src/posix/thread.c	2015-02-02 20:42:32.000000000 +0100
++++ vlc-2.2.4/src/posix/thread.c	2016-08-24 19:46:02.717783031 +0200
+@@ -85,7 +85,7 @@
+ 
+ static void vlc_clock_setup_once (void)
+ {
+-# if (_POSIX_MONOTONIC_CLOCK == 0)
++# if (_POSIX_MONOTONIC_CLOCK == 0) && (_POSIX_CLOCK_SELECTION > 0)
+     long val = sysconf (_SC_MONOTONIC_CLOCK);
+     assert (val != 0);
+     vlc_clock_id = (val < 0) ? CLOCK_REALTIME : CLOCK_MONOTONIC;
-- 
2.1.4
