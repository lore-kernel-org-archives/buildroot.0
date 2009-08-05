From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2009 09:23:29 +0200
Subject: [Buildroot] [git commit] gzip: add patch to fix glibc build
Message-ID: <20090805072359.489B2777B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=27c667c782d90c43fb6148134feb207307674019
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent glibc versions introduced a futimens() function, that gzip
already implemented. So waiting for a proper usage of this function in
gzip, we rename the gzip internal function to gz_futimens().

Patch inspired by
http://lists.pld-linux.org/mailman/pipermail/pld-cvs-commit/Week-of-Mon-20070514/155476.html

Fixes bug #537

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES                                        |    1 +
 package/gzip/gzip-1.3.12-rename-futimens.patch |   48 ++++++++++++++++++++++++
 package/gzip/gzip.mk                           |    1 +
 3 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/gzip/gzip-1.3.12-rename-futimens.patch

diff --git a/CHANGES b/CHANGES
index 0c1f667..905b9d4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -78,6 +78,7 @@
 	#509: Bump sqlite package to 3.6.16
 	#523: pciutils broken with external toolchain
 	#533: Update gamin to 0.1.10 to fix compilation
+	#537: Fix gzip build with recent glibc
 
 2009.05, Released June 1st, 2009:
 
diff --git a/package/gzip/gzip-1.3.12-rename-futimens.patch b/package/gzip/gzip-1.3.12-rename-futimens.patch
new file mode 100644
index 0000000..8315d7c
--- /dev/null
+++ b/package/gzip/gzip-1.3.12-rename-futimens.patch
@@ -0,0 +1,48 @@
+---
+ gzip.c        |    2 +-
+ lib/utimens.c |    4 ++--
+ lib/utimens.h |    2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+Index: gzip-1.3.12/gzip.c
+===================================================================
+--- gzip-1.3.12.orig/gzip.c
++++ gzip-1.3.12/gzip.c
+@@ -1637,7 +1637,7 @@
+ 	}
+       }
+ 
+-    if (futimens (ofd, ofname, timespec) != 0)
++    if (gz_futimens (ofd, ofname, timespec) != 0)
+       {
+ 	int e = errno;
+ 	WARN ((stderr, "%s: ", program_name));
+Index: gzip-1.3.12/lib/utimens.c
+===================================================================
+--- gzip-1.3.12.orig/lib/utimens.c
++++ gzip-1.3.12/lib/utimens.c
+@@ -75,7 +75,7 @@
+    Return 0 on success, -1 (setting errno) on failure.  */
+ 
+ int
+-futimens (int fd ATTRIBUTE_UNUSED,
++gz_futimens (int fd ATTRIBUTE_UNUSED,
+ 	  char const *file, struct timespec const timespec[2])
+ {
+   /* Some Linux-based NFS clients are buggy, and mishandle time stamps
+@@ -185,5 +185,5 @@
+ int
+ utimens (char const *file, struct timespec const timespec[2])
+ {
+-  return futimens (-1, file, timespec);
++  return gz_futimens (-1, file, timespec);
+ }
+Index: gzip-1.3.12/lib/utimens.h
+===================================================================
+--- gzip-1.3.12.orig/lib/utimens.h
++++ gzip-1.3.12/lib/utimens.h
+@@ -1,3 +1,3 @@
+ #include <time.h>
+-int futimens (int, char const *, struct timespec const [2]);
++int gz_futimens (int, char const *, struct timespec const [2]);
+ int utimens (char const *, struct timespec const [2]);
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index beffe9d..8403161 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -18,6 +18,7 @@ gzip-source: $(DL_DIR)/$(GZIP_SOURCE)
 
 $(GZIP_DIR)/.unpacked: $(DL_DIR)/$(GZIP_SOURCE)
 	$(GZIP_CAT) $(DL_DIR)/$(GZIP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(GZIP_DIR) package/gzip gzip\*.patch
 	touch $(GZIP_DIR)/.unpacked
 
 $(GZIP_DIR)/.configured: $(GZIP_DIR)/.unpacked
-- 
1.6.3.3
