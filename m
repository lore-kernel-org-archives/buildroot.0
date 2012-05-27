From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 26 May 2012 21:45:52 -0400
Subject: [Buildroot] [PATCH] sstrip preserve permissions
Message-ID: <1338083152-2359-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unlike "strip", the "sstrip" does not preserve the file permissions
of its target.  So if you have a package that sets special permissions,
such as the setuid bit, sstrip will remove it.  This patch adds some
minimal lines to preserve the permissions of stripped files.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 .../sstrip/sstrip-20154-preserve-permissions.patch |   43 ++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/sstrip/sstrip-20154-preserve-permissions.patch

diff --git a/package/sstrip/sstrip-20154-preserve-permissions.patch b/package/sstrip/sstrip-20154-preserve-permissions.patch
new file mode 100644
index 0000000..0bd9162
--- /dev/null
+++ b/package/sstrip/sstrip-20154-preserve-permissions.patch
@@ -0,0 +1,43 @@
+diff -urN sstrip.ORIG/src/sstrip.c sstrip/src/sstrip.c
+--- sstrip.ORIG/src/sstrip.c	2010-12-11 23:59:51.464374000 -0500
++++ sstrip/src/sstrip.c	2012-02-21 11:58:56.320295827 -0500
+@@ -60,6 +60,10 @@
+ #include	<fcntl.h>
+ #include	<elf.h>
+ 
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <unistd.h>
++
+ #ifndef TRUE
+ #define	TRUE		1
+ #define	FALSE		0
+@@ -427,6 +431,7 @@
+ 
+ 	for (arg = argv + 1 ; *arg != NULL ; ++arg) {
+ 		filename = *arg;
++		struct stat sb;
+ 
+ 		fd = open(*arg, O_RDWR);
+ 		if (fd < 0) {
+@@ -435,6 +440,9 @@
+ 			continue;
+ 		}
+ 
++		/* Get original file's permissions */
++		if (fstat(fd, &sb) == -1) { perror("fstat"); sb.st_mode = 0; }
++
+ 		switch (readelfheaderident(fd, &e.ehdr32)) {
+ 			case ELFCLASS32:
+ 				if (!(readelfheader32(fd, &e.ehdr32)					&&
+@@ -458,6 +466,10 @@
+ 				++failures;
+ 				break;
+ 		}
++
++		/* Set original file's permissions, including setuid */
++		if (sb.st_mode != 0) { fchmod(fd, sb.st_mode & 07777); }
++
+ 		close(fd);
+ 	}
+ 
-- 
1.7.9.5
