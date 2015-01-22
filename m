From: David Bender <codehero@gmail.com>
Date: Thu, 22 Jan 2015 14:11:43 -0500
Subject: [Buildroot] [PATCH 2/3] Restore cgiFormFileGetTempfileName and make
	creation permissions more secure
In-Reply-To: <1421953904-9156-1-git-send-email-codehero@gmail.com>
References: <20150117192144.GA2827@tarshish>
 <1421953904-9156-1-git-send-email-codehero@gmail.com>
Message-ID: <1421953904-9156-2-git-send-email-codehero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: David Bender <codehero@gmail.com>
---
 package/cgic/cgic-0001-file_enhancements.patch |   81 ++++++++++++++++++++++++
 1 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 package/cgic/cgic-0001-file_enhancements.patch

diff --git a/package/cgic/cgic-0001-file_enhancements.patch b/package/cgic/cgic-0001-file_enhancements.patch
new file mode 100644
index 0000000..f09a73f
--- /dev/null
+++ b/package/cgic/cgic-0001-file_enhancements.patch
@@ -0,0 +1,81 @@
+diff -rupN cgic206/cgic.c cgic206_tempfile/cgic.c
+--- cgic206/cgic.c	2014-03-16 18:17:11.000000000 -0400
++++ cgic206_tempfile/cgic.c	2015-01-21 11:58:45.436384908 -0500
+@@ -22,6 +22,8 @@
+ #define CGICDEBUGEND
+ #endif /* CGICDEBUG */
+ 
++#define _GNU_SOURCE
++
+ #include <stdio.h>
+ #include <string.h>
+ #include <ctype.h>
+@@ -34,11 +36,11 @@
+ #include <io.h>
+ 
+ /* cgic 2.01 */
+-#include <fcntl.h>
+ 
+ #else
+ #include <unistd.h>
+ #endif /* WIN32 */
++#include <fcntl.h>
+ #include "cgic.h"
+ 
+ #define cgiStrEq(a, b) (!strcmp((a), (b)))
+@@ -636,16 +638,17 @@ static cgiParseResultType getTempFileNam
+ 		window between the file's creation and the
+ 		chmod call (glibc 2.0.6 and lower might
+ 		otherwise have allowed this). */
++	mode_t umode;
+ 	int outfd; 
++	umode = umask(0600);
+ 	strcpy(tfileName, cgicTempDir "/cgicXXXXXX");
+-	outfd = mkstemp(tfileName);
++	outfd = mkostemp(tfileName, O_CLOEXEC | O_NOATIME);
++	umask(umode);
+ 	if (outfd == -1) {
+ 		return cgiParseIO;
+ 	}
+-	close(outfd);
+-	/* Fix the permissions */
+-	if (chmod(tfileName, 0600) != 0) {
+-		unlink(tfileName);
++
++	if (close(outfd)) {
+ 		return cgiParseIO;
+ 	}
+ #else
+@@ -1275,6 +1278,20 @@ cgiFormResultType cgiFormFileContentType
+ 	}
+ }
+ 
++const char* cgiFormFileGetTempfileName(
++	char* name)
++{
++	cgiFormEntry *e;
++	e = cgiFormEntryFindFirst(name);
++	if (!e) {
++		return NULL;
++	} else if (!strlen(e->tfileName)) {
++		return NULL;
++	} else {
++		return e->tfileName;
++	}
++}
++
+ cgiFormResultType cgiFormFileSize(
+ 	char *name, int *sizeP)
+ {
+diff -rupN cgic206/cgic.h cgic206_tempfile/cgic.h
+--- cgic206/cgic.h	2014-03-16 18:17:11.000000000 -0400
++++ cgic206_tempfile/cgic.h	2015-01-21 11:53:02.915148026 -0500
+@@ -141,6 +141,8 @@ extern cgiFormResultType cgiFormRadio(
+ 	char *name, char **valuesText, int valuesTotal, 
+ 	int *result, int defaultV);	
+ 
++extern const char* cgiFormFileGetTempfileName(char* name);
++
+ /* The paths returned by this function are the original names of files
+ 	as reported by the uploading web browser and shoult NOT be
+ 	blindly assumed to be "safe" names for server-side use! */
-- 
1.7.8.6
