From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 00:22:22 +0200
Subject: [Buildroot] [git commit master 1/1] dash: fix build of native
	helpers
Message-ID: <20100721222317.9A58982C1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cbcc06c3bbcd92e48f8f91cd47bc70d71594b291
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../dash-0.5.5.1-no-config.h-for-helpers.patch     |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 package/dash/dash-0.5.5.1-no-config.h-for-helpers.patch

diff --git a/package/dash/dash-0.5.5.1-no-config.h-for-helpers.patch b/package/dash/dash-0.5.5.1-no-config.h-for-helpers.patch
new file mode 100644
index 0000000..9fd449c
--- /dev/null
+++ b/package/dash/dash-0.5.5.1-no-config.h-for-helpers.patch
@@ -0,0 +1,35 @@
+[PATCH] Don't include config.h when building helpers using the native compiler
+
+config.h contains settings for the cross compiler (most importantly
+32/64bit versions of functions), so don't include it when calling the
+native compiler to build the helpers.
+
+Otherwise we get build errors like:
+
+/usr/bin/gcc -include ../config.h -DBSD=1 -DSHELL -DIFS_BROKEN  -g -O2 -Wall    -o mkinit mkinit.c
+In file included from /usr/include/sys/stat.h:107,
+                 from /usr/include/fcntl.h:38,
+                 from mkinit.c:50:
+/usr/include/bits/stat.h:117: error: redefinition of ???struct stat???
+In file included from /usr/include/fcntl.h:38,
+                 from mkinit.c:50:
+/usr/include/sys/stat.h:504: error: redefinition of ???stat???
+/usr/include/sys/stat.h:455: note: previous definition of ???stat??? was here
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/Makefile.in |    1 -
+ 1 file changed, 1 deletion(-)
+
+Index: dash-0.5.5.1/src/Makefile.in
+===================================================================
+--- dash-0.5.5.1.orig/src/Makefile.in
++++ dash-0.5.5.1/src/Makefile.in
+@@ -165,7 +165,6 @@ COMMON_CPPFLAGS = \
+ AM_CFLAGS = $(COMMON_CFLAGS)
+ AM_CPPFLAGS = $(COMMON_CPPFLAGS)
+ AM_CFLAGS_FOR_BUILD = -g -O2 $(COMMON_CFLAGS) 
+-AM_CPPFLAGS_FOR_BUILD = $(COMMON_CPPFLAGS)
+ COMPILE_FOR_BUILD = \
+ 	$(CC_FOR_BUILD) $(AM_CPPFLAGS_FOR_BUILD) $(CPPFLAGS_FOR_BUILD) \
+ 	$(AM_CFLAGS_FOR_BUILD) $(CFLAGS_FOR_BUILD) 
-- 
1.7.1
