From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 22:42:01 +0100
Subject: [Buildroot] [git commit] package/zziplib: fix CVE-2018-16548
Message-ID: <20200303213155.CB3228F2F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffd556f407fda94deb270d499cc894b2627b2760
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An issue was discovered in ZZIPlib through 0.13.69. There is a memory
leak triggered in the function __zzip_parse_root_directory in zip.c,
which will lead to a denial of service attack.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ory-leak-from-__zzip_parse_root_directory.patch | 74 ++++++++++++++++++++++
 ...y-leak-from-__zzip_parse_root_directory-2.patch | 53 ++++++++++++++++
 .../0003-One-more-free-to-avoid-memory-leak.patch  | 25 ++++++++
 package/zziplib/zziplib.mk                         |  5 ++
 4 files changed, 157 insertions(+)

diff --git a/package/zziplib/0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch b/package/zziplib/0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch
new file mode 100644
index 0000000000..1c352236ab
--- /dev/null
+++ b/package/zziplib/0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch
@@ -0,0 +1,74 @@
+From 9411bde3e4a70a81ff3ffd256b71927b2d90dcbb Mon Sep 17 00:00:00 2001
+From: jmoellers <josef.moellers@suse.com>
+Date: Fri, 7 Sep 2018 11:32:04 +0200
+Subject: [PATCH] Avoid memory leak from __zzip_parse_root_directory().
+
+[Retrieved (and slightly updated to remove test.zip) from:
+https://github.com/gdraheim/zziplib/commit/9411bde3e4a70a81ff3ffd256b71927b2d90dcbb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ test/test.zip | Bin 1361 -> 1361 bytes
+ zzip/zip.c    |  36 ++++++++++++++++++++++++++++++++++--
+ 2 files changed, 34 insertions(+), 2 deletions(-)
+
+diff --git a/zzip/zip.c b/zzip/zip.c
+index 88b833b..a685280 100644
+--- a/zzip/zip.c
++++ b/zzip/zip.c
+@@ -475,9 +475,15 @@ __zzip_parse_root_directory(int fd,
+         } else
+         {
+             if (io->fd.seeks(fd, zz_rootseek + zz_offset, SEEK_SET) < 0)
++	    {
++	    	free(hdr0);
+                 return ZZIP_DIR_SEEK;
++	    }
+             if (io->fd.read(fd, &dirent, sizeof(dirent)) < __sizeof(dirent))
++	    {
++	    	free(hdr0);
+                 return ZZIP_DIR_READ;
++	    }
+             d = &dirent;
+         }
+ 
+@@ -577,12 +583,38 @@ __zzip_parse_root_directory(int fd,
+ 
+         if (hdr_return)
+             *hdr_return = hdr0;
++	else
++	{
++	    /* If it is not assigned to *hdr_return, it will never be free()'d */
++	    free(hdr0);
++	    /* Make sure we don't free it again in case of error */
++	    hdr0 = NULL;
++	}
+     }                           /* else zero (sane) entries */
+ #  ifndef ZZIP_ALLOW_MODULO_ENTRIES
+-    return (entries != zz_entries ? ZZIP_CORRUPTED : 0);
++    if (entries != zz_entries)
++    {
++	/* If it was assigned to *hdr_return, undo assignment */
++	if (p_reclen && hdr_return)
++	    *hdr_return = NULL;
++	/* Free it, if it was not already free()'d */
++	if (hdr0 != NULL)
++	    free(hdr0);
++	return ZZIP_CORRUPTED;
++    }
+ #  else
+-    return ((entries & (unsigned)0xFFFF) != zz_entries ? ZZIP_CORRUPTED : 0);
++    if (((entries & (unsigned)0xFFFF) != zz_entries)
++    {
++	/* If it was assigned to *hdr_return, undo assignment */
++	if (p_reclen && hdr_return)
++	    *hdr_return = NULL;
++	/* Free it, if it was not already free()'d */
++	if (hdr0 != NULL)
++	    free(hdr0);
++	return ZZIP_CORRUPTED;
++    }
+ #  endif
++    return 0;
+ }
+ 
+ /* ------------------------- high-level interface ------------------------- */
diff --git a/package/zziplib/0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch b/package/zziplib/0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch
new file mode 100644
index 0000000000..b0e8858f64
--- /dev/null
+++ b/package/zziplib/0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch
@@ -0,0 +1,53 @@
+From d2e5d5c53212e54a97ad64b793a4389193fec687 Mon Sep 17 00:00:00 2001
+From: jmoellers <josef.moellers@suse.com>
+Date: Fri, 7 Sep 2018 11:49:28 +0200
+Subject: [PATCH] Avoid memory leak from __zzip_parse_root_directory().
+
+[Retrieved from:
+https://github.com/gdraheim/zziplib/commit/d2e5d5c53212e54a97ad64b793a4389193fec687]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ zzip/zip.c | 25 ++-----------------------
+ 1 file changed, 2 insertions(+), 23 deletions(-)
+
+diff --git a/zzip/zip.c b/zzip/zip.c
+index a685280..51a1a4d 100644
+--- a/zzip/zip.c
++++ b/zzip/zip.c
+@@ -587,34 +587,13 @@ __zzip_parse_root_directory(int fd,
+ 	{
+ 	    /* If it is not assigned to *hdr_return, it will never be free()'d */
+ 	    free(hdr0);
+-	    /* Make sure we don't free it again in case of error */
+-	    hdr0 = NULL;
+ 	}
+     }                           /* else zero (sane) entries */
+ #  ifndef ZZIP_ALLOW_MODULO_ENTRIES
+-    if (entries != zz_entries)
+-    {
+-	/* If it was assigned to *hdr_return, undo assignment */
+-	if (p_reclen && hdr_return)
+-	    *hdr_return = NULL;
+-	/* Free it, if it was not already free()'d */
+-	if (hdr0 != NULL)
+-	    free(hdr0);
+-	return ZZIP_CORRUPTED;
+-    }
++    return (entries != zz_entries) ? ZZIP_CORRUPTED : 0;
+ #  else
+-    if (((entries & (unsigned)0xFFFF) != zz_entries)
+-    {
+-	/* If it was assigned to *hdr_return, undo assignment */
+-	if (p_reclen && hdr_return)
+-	    *hdr_return = NULL;
+-	/* Free it, if it was not already free()'d */
+-	if (hdr0 != NULL)
+-	    free(hdr0);
+-	return ZZIP_CORRUPTED;
+-    }
++    return ((entries & (unsigned)0xFFFF) != zz_entries) ? ZZIP_CORRUPTED : 0;
+ #  endif
+-    return 0;
+ }
+ 
+ /* ------------------------- high-level interface ------------------------- */
diff --git a/package/zziplib/0003-One-more-free-to-avoid-memory-leak.patch b/package/zziplib/0003-One-more-free-to-avoid-memory-leak.patch
new file mode 100644
index 0000000000..b0506f0cf6
--- /dev/null
+++ b/package/zziplib/0003-One-more-free-to-avoid-memory-leak.patch
@@ -0,0 +1,25 @@
+From 0e1dadb05c1473b9df2d7b8f298dab801778ef99 Mon Sep 17 00:00:00 2001
+From: jmoellers <josef.moellers@suse.com>
+Date: Fri, 7 Sep 2018 13:55:35 +0200
+Subject: [PATCH] One more free() to avoid memory leak.
+
+[Retrieved from:
+https://github.com/gdraheim/zziplib/commit/0e1dadb05c1473b9df2d7b8f298dab801778ef99]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ zzip/zip.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/zzip/zip.c b/zzip/zip.c
+index 51a1a4d..bc6c080 100644
+--- a/zzip/zip.c
++++ b/zzip/zip.c
+@@ -589,6 +589,8 @@ __zzip_parse_root_directory(int fd,
+ 	    free(hdr0);
+ 	}
+     }                           /* else zero (sane) entries */
++    else
++        free(hdr0);
+ #  ifndef ZZIP_ALLOW_MODULO_ENTRIES
+     return (entries != zz_entries) ? ZZIP_CORRUPTED : 0;
+ #  else
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 90bbaf1a17..ead0158f3d 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -10,6 +10,11 @@ ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
 ZZIPLIB_INSTALL_STAGING = YES
 
+# 0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch
+# 0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch
+# 0003-One-more-free-to-avoid-memory-leak.patch
+ZZIPLIB_IGNORE_CVES += CVE-2018-16548
+
 ZZIPLIB_DEPENDENCIES = host-pkgconf host-python zlib
 
 # zziplib is not python3 friendly, so force the python interpreter
