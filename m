From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:27:15 +0200
Subject: [Buildroot] [git commit] package/gnuchess: bump version to 6.2.1
Message-ID: <20150426102758.153618075F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f2b0fa0f732a39344992097e8e1a72edacfaa3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed unneeded patches, Debian did the same:
http://metadata.ftp-master.debian.org/changelogs/main/g/gnuchess/unstable_changelog

gnuchess (6.0.2-1) unstable; urgency=low

  * New upstream version (Closes: #637722)
[...]
    - Drop patches

The patch is no longer needed because the gnuchess code has been
reworked. The input.c file no longer exists, and there is no longer a
getline() function being defined.

[Thomas: tweak commit log.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuchess/0001-getline-conflicts.patch |   48 -------------------------
 package/gnuchess/0002-misc-fixes.patch        |   11 ------
 package/gnuchess/gnuchess.mk                  |    2 +-
 3 files changed, 1 insertions(+), 60 deletions(-)

diff --git a/package/gnuchess/0001-getline-conflicts.patch b/package/gnuchess/0001-getline-conflicts.patch
deleted file mode 100644
index 94add79..0000000
--- a/package/gnuchess/0001-getline-conflicts.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-This patch fixes a conflict between the C library getline() function
-and gnuchess getline() function.
-
-Patch borrowed from the gnuchess Debian package.
-
-Index: gnuchess-5.07/src/input.c
-===================================================================
---- gnuchess-5.07.orig/src/input.c	2009-09-29 16:01:38.000000000 +0200
-+++ gnuchess-5.07/src/input.c	2009-09-29 16:02:57.000000000 +0200
-@@ -127,7 +127,7 @@
- 	      (RealGameCnt+1)/2 + 1 );
-     }
-     pthread_mutex_lock(&input_mutex);
--    getline(prompt);
-+    get_line(prompt);
-     input_status = INPUT_AVAILABLE;
-     pthread_cond_signal(&input_cond);
-     pthread_mutex_unlock(&input_mutex);
-@@ -173,13 +173,13 @@
- {
- #ifdef HAVE_LIBREADLINE
-   if (isatty(STDIN_FILENO)) {
--    getline = getline_readline;
-+    get_line = getline_readline;
-     using_history();
-   } else {
--    getline = getline_standard;
-+    get_line = getline_standard;
-   }
- #else
--  getline = getline_standard;
-+  get_line = getline_standard;
- #endif
-   /* Start input thread */
-   pthread_create(&input_thread, NULL, input_func, NULL);
-Index: gnuchess-5.07/src/common.h
-===================================================================
---- gnuchess-5.07.orig/src/common.h	2009-09-29 16:06:17.000000000 +0200
-+++ gnuchess-5.07/src/common.h	2009-09-29 16:06:40.000000000 +0200
-@@ -745,7 +745,7 @@
-  * Input routine, initialized to one of the specific
-  * input routines. The given argument is the prompt.
-  */
--void (*getline) (char *);
-+void (*get_line) (char *);
- 
- #define MAXSTR 128
- extern char inputstr[MAXSTR];
diff --git a/package/gnuchess/0002-misc-fixes.patch b/package/gnuchess/0002-misc-fixes.patch
deleted file mode 100644
index 18979b6..0000000
--- a/package/gnuchess/0002-misc-fixes.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/src/input.c	2003-07-01 13:06:43.000000000 -0400
-+++ a/src/input.c	2008-02-13 12:24:43.000000000 -0500
-@@ -92,7 +92,7 @@ void getline_standard(char *p)
-   fgets(inputstr, MAXSTR, stdin);
- }
- 
--static pthread_t input_thread;
-+pthread_t input_thread;
- 
- /* Mutex and condition variable for thread communication */
- 
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 1ab22db..48e8bc8 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUCHESS_VERSION = 5.07
+GNUCHESS_VERSION = 6.2.1
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPLv2+
 GNUCHESS_LICENSE_FILES = COPYING
