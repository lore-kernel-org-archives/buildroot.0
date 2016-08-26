From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 26 Aug 2016 23:27:27 +0200
Subject: [Buildroot] [PATCH v3] vlc: fix compile error with uClibc-ng
	Linuxthreads
Message-ID: <20160826212727.GA21169@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The fallback code path didn't work correctly, so fix it.

Fixes:
  http://autobuild.buildroot.net/results/3122287ddea1e316a64ccf0d0dc9415bfefebb49/

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v2 -> v3:
 - use git format patch, requested by Thomas Petazzoni
 - remove unneeded -lpthread, requested by Thomas Petazzoni
v1 -> v2:
 - rework autobuild failure, there is fallback code for non-NPTL,
   so fix it up. Suggested by Thomas Petazzoni
---
 ...ck-code-and-add-required-realtime-library.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch

diff --git a/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch b/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch
new file mode 100644
index 0000000..4d5c581
--- /dev/null
+++ b/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch
@@ -0,0 +1,40 @@
+From 381bcb7cb03bb602351a323daf3b69b2d4f45e77 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 26 Aug 2016 15:11:25 +0200
+Subject: [PATCH] fix fallback code and add required realtime library to link
+ command
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ configure.ac       | 1 +
+ src/posix/thread.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cb1de25..018c11c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -121,6 +121,7 @@ case "${host_os}" in
+     ;;
+   linux*)
+     SYS=linux
++    AC_CHECK_LIB([rt], [posix_spawnp], [VLC_ADD_LIBS([libvlccore],[-lrt])], [], [])
+     ;;
+   bsdi*)
+     SYS=bsdi
+diff --git a/src/posix/thread.c b/src/posix/thread.c
+index 07fa71e..8b8595f 100644
+--- a/src/posix/thread.c
++++ b/src/posix/thread.c
+@@ -85,7 +85,7 @@ static clockid_t vlc_clock_id;
+ 
+ static void vlc_clock_setup_once (void)
+ {
+-# if (_POSIX_MONOTONIC_CLOCK == 0)
++# if (_POSIX_MONOTONIC_CLOCK == 0) && (_POSIX_CLOCK_SELECTION > 0)
+     long val = sysconf (_SC_MONOTONIC_CLOCK);
+     assert (val != 0);
+     vlc_clock_id = (val < 0) ? CLOCK_REALTIME : CLOCK_MONOTONIC;
+-- 
+2.1.4
+
-- 
2.1.4
