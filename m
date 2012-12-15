From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Dec 2012 18:29:39 +0100
Subject: [Buildroot] [PATCH 2/5] util-linux: rename versioned patch without
	version
In-Reply-To: <1355592582-31374-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1355592582-31374-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1355592582-31374-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

util-linux-2.20.1-sscanf-no-ms-as.patch has a version in its name, and
therefore the other patch, unversioned,
util-linux-uclibc-build-fix.patch, never gets applied.

Fix this by renaming util-linux-2.20.1-sscanf-no-ms-as.patch to
util-linux-sscanf-no-ms-as.patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../util-linux-2.20.1-sscanf-no-ms-as.patch        |   87 --------------------
 .../util-linux/util-linux-sscanf-no-ms-as.patch    |   87 ++++++++++++++++++++
 2 files changed, 87 insertions(+), 87 deletions(-)
 delete mode 100644 package/util-linux/util-linux-2.20.1-sscanf-no-ms-as.patch
 create mode 100644 package/util-linux/util-linux-sscanf-no-ms-as.patch

diff --git a/package/util-linux/util-linux-2.20.1-sscanf-no-ms-as.patch b/package/util-linux/util-linux-2.20.1-sscanf-no-ms-as.patch
deleted file mode 100644
index 5b0ac36..0000000
--- a/package/util-linux/util-linux-2.20.1-sscanf-no-ms-as.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-[PATCH] Fix libmount build under uClibc
-
-Taken from gentoo-hardened:
-http://git.overlays.gentoo.org/gitweb/?p=proj/hardened-dev.git;a=commit;h=91879751
-
-For details, see https://bugs.gentoo.org/show_bug.cgi?id=406303
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-diff -Naur util-linux-2.20.1.orig/libmount/src/tab_parse.c util-linux-2.20.1/libmount/src/tab_parse.c
---- util-linux-2.20.1.orig/libmount/src/tab_parse.c	2011-12-12 20:51:06.646614964 -0500
-+++ util-linux-2.20.1/libmount/src/tab_parse.c	2011-12-12 21:02:03.587865010 -0500
-@@ -51,19 +51,21 @@
-  */
- static int mnt_parse_table_line(struct libmnt_fs *fs, char *s)
- {
--	int rc, n = 0;
--	char *src, *fstype, *optstr;
--
--	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
--			UL_SCNsA" "	/* (2) target */
--			UL_SCNsA" "	/* (3) FS type */
--			UL_SCNsA" "	/* (4) options */
-+	int rc, n = 0, len = strlen (s) + 1;
-+	char *src     = malloc (sizeof *src * len);
-+  char *fstype  = malloc (sizeof *fstype * len);
-+  char *optstr  = malloc (sizeof *optstr * len);
-+
-+	rc = sscanf(s,	"%s"" "	/* (1) source */
-+			"%s"" "	/* (2) target */
-+			"%s"" "	/* (3) FS type */
-+			"%s"" "	/* (4) options */
- 			"%n",		/* byte count */
- 
--			&src,
--			&fs->target,
--			&fstype,
--			&optstr,
-+			src,
-+			fs->target,
-+			fstype,
-+			optstr,
- 			&n);
- 
- 	if (rc == 4) {
-@@ -108,16 +110,20 @@
-  */
- static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
- {
--	int rc, end = 0;
-+	int rc, end = 0, len = strlen (s) + 1;
- 	unsigned int maj, min;
- 	char *fstype, *src, *p;
- 
-+  fs->root        = malloc (sizeof *fs->root * len);
-+  fs->target      = malloc (sizeof *fs->target * len);
-+  fs->vfs_optstr  = malloc (sizeof *fs->vfs_optstr * len);
-+
- 	rc = sscanf(s,	"%u "		/* (1) id */
- 			"%u "		/* (2) parent */
- 			"%u:%u "	/* (3) maj:min */
--			UL_SCNsA" "	/* (4) mountroot */
--			UL_SCNsA" "	/* (5) target */
--			UL_SCNsA	/* (6) vfs options (fs-independent) */
-+			"%s"" "	/* (4) mountroot */
-+			"%s"" "	/* (5) target */
-+			"%s"	/* (6) vfs options (fs-independent) */
- 			"%n",		/* number of read bytes */
- 
- 			&fs->id,
-@@ -139,9 +145,14 @@
- 	}
- 	s = p + 3;
- 
--	rc += sscanf(s,	UL_SCNsA" "	/* (8) FS type */
--			UL_SCNsA" "	/* (9) source */
--			UL_SCNsA,	/* (10) fs options (fs specific) */
-+  len           = strlen (s) + 1;
-+	fstype        = malloc (sizeof *fstype * len);
-+  src           = malloc (sizeof *src * len);
-+  fs->fs_optstr = malloc (sizeof *fs->fs_optstr * len);
-+
-+	rc += sscanf(s,	"%s"" "	/* (8) FS type */
-+			"%s"" "	/* (9) source */
-+			"%s",	/* (10) fs options (fs specific) */
- 
- 			&fstype,
- 			&src,
diff --git a/package/util-linux/util-linux-sscanf-no-ms-as.patch b/package/util-linux/util-linux-sscanf-no-ms-as.patch
new file mode 100644
index 0000000..5b0ac36
--- /dev/null
+++ b/package/util-linux/util-linux-sscanf-no-ms-as.patch
@@ -0,0 +1,87 @@
+[PATCH] Fix libmount build under uClibc
+
+Taken from gentoo-hardened:
+http://git.overlays.gentoo.org/gitweb/?p=proj/hardened-dev.git;a=commit;h=91879751
+
+For details, see https://bugs.gentoo.org/show_bug.cgi?id=406303
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+diff -Naur util-linux-2.20.1.orig/libmount/src/tab_parse.c util-linux-2.20.1/libmount/src/tab_parse.c
+--- util-linux-2.20.1.orig/libmount/src/tab_parse.c	2011-12-12 20:51:06.646614964 -0500
++++ util-linux-2.20.1/libmount/src/tab_parse.c	2011-12-12 21:02:03.587865010 -0500
+@@ -51,19 +51,21 @@
+  */
+ static int mnt_parse_table_line(struct libmnt_fs *fs, char *s)
+ {
+-	int rc, n = 0;
+-	char *src, *fstype, *optstr;
+-
+-	rc = sscanf(s,	UL_SCNsA" "	/* (1) source */
+-			UL_SCNsA" "	/* (2) target */
+-			UL_SCNsA" "	/* (3) FS type */
+-			UL_SCNsA" "	/* (4) options */
++	int rc, n = 0, len = strlen (s) + 1;
++	char *src     = malloc (sizeof *src * len);
++  char *fstype  = malloc (sizeof *fstype * len);
++  char *optstr  = malloc (sizeof *optstr * len);
++
++	rc = sscanf(s,	"%s"" "	/* (1) source */
++			"%s"" "	/* (2) target */
++			"%s"" "	/* (3) FS type */
++			"%s"" "	/* (4) options */
+ 			"%n",		/* byte count */
+ 
+-			&src,
+-			&fs->target,
+-			&fstype,
+-			&optstr,
++			src,
++			fs->target,
++			fstype,
++			optstr,
+ 			&n);
+ 
+ 	if (rc == 4) {
+@@ -108,16 +110,20 @@
+  */
+ static int mnt_parse_mountinfo_line(struct libmnt_fs *fs, char *s)
+ {
+-	int rc, end = 0;
++	int rc, end = 0, len = strlen (s) + 1;
+ 	unsigned int maj, min;
+ 	char *fstype, *src, *p;
+ 
++  fs->root        = malloc (sizeof *fs->root * len);
++  fs->target      = malloc (sizeof *fs->target * len);
++  fs->vfs_optstr  = malloc (sizeof *fs->vfs_optstr * len);
++
+ 	rc = sscanf(s,	"%u "		/* (1) id */
+ 			"%u "		/* (2) parent */
+ 			"%u:%u "	/* (3) maj:min */
+-			UL_SCNsA" "	/* (4) mountroot */
+-			UL_SCNsA" "	/* (5) target */
+-			UL_SCNsA	/* (6) vfs options (fs-independent) */
++			"%s"" "	/* (4) mountroot */
++			"%s"" "	/* (5) target */
++			"%s"	/* (6) vfs options (fs-independent) */
+ 			"%n",		/* number of read bytes */
+ 
+ 			&fs->id,
+@@ -139,9 +145,14 @@
+ 	}
+ 	s = p + 3;
+ 
+-	rc += sscanf(s,	UL_SCNsA" "	/* (8) FS type */
+-			UL_SCNsA" "	/* (9) source */
+-			UL_SCNsA,	/* (10) fs options (fs specific) */
++  len           = strlen (s) + 1;
++	fstype        = malloc (sizeof *fstype * len);
++  src           = malloc (sizeof *src * len);
++  fs->fs_optstr = malloc (sizeof *fs->fs_optstr * len);
++
++	rc += sscanf(s,	"%s"" "	/* (8) FS type */
++			"%s"" "	/* (9) source */
++			"%s",	/* (10) fs options (fs specific) */
+ 
+ 			&fstype,
+ 			&src,
-- 
1.7.9.5
