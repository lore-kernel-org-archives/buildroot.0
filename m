From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 14:46:18 +0200
Subject: [Buildroot] [git commit] vlc: fix compile error with uClibc-ng
	Linuxthreads
Message-ID: <20160827124714.50BE6820E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3af7772d07aa5baa00b61709442a09e9ca5de7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fallback code path didn't work correctly, so fix it.

Fixes:
  http://autobuild.buildroot.net/results/3122287ddea1e316a64ccf0d0dc9415bfefebb49/

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ck-code-and-add-required-realtime-library.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch b/package/vlc/0008-fix-fallback-code-and-add-required-realtime-library.patch
new file mode 100644
index 0000000..43f197a
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
