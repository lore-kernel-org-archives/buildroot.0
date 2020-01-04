From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 21:18:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/cpio: security bump to version 2.13
Message-ID: <20200104201837.292057-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch fixing CVE-2016-2037 which was applied upstream.

This release fixes CVE-2015-1197, CVE-2016-2037, CVE-2019-14866.

Switched to .bz2 tarball.
Added hashes provided by upstream and license hash.

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2019-11/msg00002.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cpio/0001-fix-CVE-2016-2037.patch | 51 -----------------------
 package/cpio/cpio.hash                    |  7 +++-
 package/cpio/cpio.mk                      |  3 +-
 3 files changed, 8 insertions(+), 53 deletions(-)
 delete mode 100644 package/cpio/0001-fix-CVE-2016-2037.patch

diff --git a/package/cpio/0001-fix-CVE-2016-2037.patch b/package/cpio/0001-fix-CVE-2016-2037.patch
deleted file mode 100644
index aec2ccb8e5..0000000000
--- a/package/cpio/0001-fix-CVE-2016-2037.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From: Pavel Raiskup
-Subject: [Bug-cpio] [PATCH] fix 1-byte out-of-bounds write
-Date: Tue, 26 Jan 2016 23:17:54 +0100
-
-Other calls to cpio_safer_name_suffix seem to be safe.
-
-* src/copyin.c (process_copy_in):  Make sure that file_hdr.c_name
-has at least two bytes allocated.
-* src/util.c (cpio_safer_name_suffix): Document that use of this
-function requires to be careful.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: fetched/submitted
-URL: https://lists.gnu.org/archive/html/bug-cpio/2016-01/msg00005.html
-
- src/copyin.c | 2 ++
- src/util.c   | 5 ++++-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/copyin.c b/src/copyin.c
-index cde911e..032d35f 100644
---- a/src/copyin.c
-+++ b/src/copyin.c
-@@ -1385,6 +1385,8 @@ process_copy_in ()
-          break;
-        }
-
-+      if (file_hdr.c_namesize <= 1)
-+        file_hdr.c_name = xrealloc(file_hdr.c_name, 2);
-       cpio_safer_name_suffix (file_hdr.c_name, false, !no_abs_paths_flag,
-                              false);
-
-diff --git a/src/util.c b/src/util.c
-index 6ff6032..2763ac1 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -1411,7 +1411,10 @@ set_file_times (int fd,
- }
- 
- /* Do we have to ignore absolute paths, and if so, does the filename
--   have an absolute path?  */
-+   have an absolute path?
-+   Before calling this function make sure that the allocated NAME buffer has
-+   capacity@least 2 bytes to allow us to store the "." string inside.  */
-+
- void
- cpio_safer_name_suffix (char *name, bool link_target, bool absolute_names,
-                        bool strip_leading_dots)
---
-2.5.0
diff --git a/package/cpio/cpio.hash b/package/cpio/cpio.hash
index 962a100cc4..a3a0d4b3f9 100644
--- a/package/cpio/cpio.hash
+++ b/package/cpio/cpio.hash
@@ -1,2 +1,7 @@
+# From https://lists.gnu.org/archive/html/info-gnu/2019-11/msg00002.html
+md5 f3438e672e3fa273a7dc26339dd1eed6  cpio-2.13.tar.bz2
+sha1 4dcefc0e1bc36b11506a354768d82b15e3fe6bb8  cpio-2.13.tar.bz2
 # Locally calculated after checking pgp signature
-sha256	08a35e92deb3c85d269a0059a27d4140a9667a6369459299d08c17f713a92e73	cpio-2.12.tar.gz
+sha256 eab5bdc5ae1df285c59f2a4f140a98fc33678a0bf61bdba67d9436ae26b46f6d  cpio-2.13.tar.bz2
+# Locally calculated
+sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index cc40838840..1d9c54669e 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-CPIO_VERSION = 2.12
+CPIO_VERSION = 2.13
+CPIO_SOURCE = cpio-$(CPIO_VERSION).tar.bz2
 CPIO_SITE = $(BR2_GNU_MIRROR)/cpio
 CPIO_CONF_OPTS = --bindir=/bin
 CPIO_LICENSE = GPL-3.0+
-- 
2.20.1
