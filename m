From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 23 Feb 2018 07:22:31 +0200
Subject: [Buildroot] [PATCH] patch: security bump to version 2.7.6
Message-ID: <e16723b54e63c62981c659f83eb6991853bf529a.1519363351.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-10713: Out-of-bounds access within pch_write_line() in
pch.c can possibly lead to DoS via a crafted input file.

Add upstream patch fixing CVE-2018-6951: There is a segmentation fault,
associated with a NULL pointer dereference, leading to a denial of
service in the intuit_diff_type function in pch.c, aka a "mangled
rename" issue.

This bump does NOT fix CVE-2018-6952. See upstream bug #53133
(https://savannah.gnu.org/bugs/index.php?53133).

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...01-Fix-segfault-with-mangled-rename-patch.patch | 33 ++++++++++++++++++++++
 package/patch/patch.hash                           |  4 ++-
 package/patch/patch.mk                             |  2 +-
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch

diff --git a/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch b/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
new file mode 100644
index 000000000000..19a67573c410
--- /dev/null
+++ b/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
@@ -0,0 +1,33 @@
+From f290f48a621867084884bfff87f8093c15195e6a Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Mon, 12 Feb 2018 16:48:24 +0100
+Subject: [PATCH] Fix segfault with mangled rename patch
+
+http://savannah.gnu.org/bugs/?53132
+* src/pch.c (intuit_diff_type): Ensure that two filenames are specified
+for renames and copies (fix the existing check).
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit f290f48a6218
+
+ src/pch.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index ff9ed2cebb8a..bc6278c4032c 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -974,7 +974,8 @@ intuit_diff_type (bool need_header, mode_t *p_file_type)
+     if ((pch_rename () || pch_copy ())
+ 	&& ! inname
+ 	&& ! ((i == OLD || i == NEW) &&
+-	      p_name[! reverse] &&
++	      p_name[reverse] && p_name[! reverse] &&
++	      name_is_valid (p_name[reverse]) &&
+ 	      name_is_valid (p_name[! reverse])))
+       {
+ 	say ("Cannot %s file without two valid file names\n", pch_rename () ? "rename" : "copy");
+-- 
+2.16.1
+
diff --git a/package/patch/patch.hash b/package/patch/patch.hash
index d6e3a2d26118..917d951a94d1 100644
--- a/package/patch/patch.hash
+++ b/package/patch/patch.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	fd95153655d6b95567e623843a0e77b81612d502ecf78a489a4aed7867caa299	patch-2.7.5.tar.xz
+sha256	ac610bda97abe0d9f6b7c963255a11dcb196c25e337c61f94e4778d632f1d8fd	patch-2.7.6.tar.xz
+# Locally calculated
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 4c76a3123ba7..33f0039d6014 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PATCH_VERSION = 2.7.5
+PATCH_VERSION = 2.7.6
 PATCH_SOURCE = patch-$(PATCH_VERSION).tar.xz
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPL-3.0+
-- 
2.16.1
