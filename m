From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 May 2010 23:26:36 +0200
Subject: [Buildroot] [PATCH 2/9] gnuchess: add a patch to fix getline()
	conflict
In-Reply-To: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6bd1a449d61e2b7c989ec5a96037143b8f5024bb.1273440344.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gnuchess/gnuchess-5.07-getline-conflicts.patch |   48 ++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 package/games/gnuchess/gnuchess-5.07-getline-conflicts.patch

diff --git a/package/games/gnuchess/gnuchess-5.07-getline-conflicts.patch b/package/games/gnuchess/gnuchess-5.07-getline-conflicts.patch
new file mode 100644
index 0000000..94add79
--- /dev/null
+++ b/package/games/gnuchess/gnuchess-5.07-getline-conflicts.patch
@@ -0,0 +1,48 @@
+This patch fixes a conflict between the C library getline() function
+and gnuchess getline() function.
+
+Patch borrowed from the gnuchess Debian package.
+
+Index: gnuchess-5.07/src/input.c
+===================================================================
+--- gnuchess-5.07.orig/src/input.c	2009-09-29 16:01:38.000000000 +0200
++++ gnuchess-5.07/src/input.c	2009-09-29 16:02:57.000000000 +0200
+@@ -127,7 +127,7 @@
+ 	      (RealGameCnt+1)/2 + 1 );
+     }
+     pthread_mutex_lock(&input_mutex);
+-    getline(prompt);
++    get_line(prompt);
+     input_status = INPUT_AVAILABLE;
+     pthread_cond_signal(&input_cond);
+     pthread_mutex_unlock(&input_mutex);
+@@ -173,13 +173,13 @@
+ {
+ #ifdef HAVE_LIBREADLINE
+   if (isatty(STDIN_FILENO)) {
+-    getline = getline_readline;
++    get_line = getline_readline;
+     using_history();
+   } else {
+-    getline = getline_standard;
++    get_line = getline_standard;
+   }
+ #else
+-  getline = getline_standard;
++  get_line = getline_standard;
+ #endif
+   /* Start input thread */
+   pthread_create(&input_thread, NULL, input_func, NULL);
+Index: gnuchess-5.07/src/common.h
+===================================================================
+--- gnuchess-5.07.orig/src/common.h	2009-09-29 16:06:17.000000000 +0200
++++ gnuchess-5.07/src/common.h	2009-09-29 16:06:40.000000000 +0200
+@@ -745,7 +745,7 @@
+  * Input routine, initialized to one of the specific
+  * input routines. The given argument is the prompt.
+  */
+-void (*getline) (char *);
++void (*get_line) (char *);
+ 
+ #define MAXSTR 128
+ extern char inputstr[MAXSTR];
-- 
1.6.3.3
