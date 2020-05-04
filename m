From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 May 2020 16:52:12 +0200
Subject: [Buildroot] [PATCH] package/zziplib: bump to version 0.13.71
Message-ID: <20200504145212.3205471-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patches and CVE tags.

Switch the dependency to python3 added by [1].

Update indentation of hash file (two spaces).

[1] https://github.com/gdraheim/zziplib/commit/a144bec8d06302e7be11f0f46e02947b0becf574

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...eak-from-__zzip_parse_root_directory.patch |  74 ----
 ...k-from-__zzip_parse_root_directory-2.patch |  53 ---
 ...3-One-more-free-to-avoid-memory-leak.patch |  25 --
 ...omponents-from-pathnames-of-extracte.patch | 344 ------------------
 package/zziplib/zziplib.hash                  |   8 +-
 package/zziplib/zziplib.mk                    |  15 +-
 6 files changed, 7 insertions(+), 512 deletions(-)
 delete mode 100644 package/zziplib/0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch
 delete mode 100644 package/zziplib/0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch
 delete mode 100644 package/zziplib/0003-One-more-free-to-avoid-memory-leak.patch
 delete mode 100644 package/zziplib/0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch

diff --git a/package/zziplib/0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch b/package/zziplib/0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch
deleted file mode 100644
index 1c352236ab..0000000000
--- a/package/zziplib/0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 9411bde3e4a70a81ff3ffd256b71927b2d90dcbb Mon Sep 17 00:00:00 2001
-From: jmoellers <josef.moellers@suse.com>
-Date: Fri, 7 Sep 2018 11:32:04 +0200
-Subject: [PATCH] Avoid memory leak from __zzip_parse_root_directory().
-
-[Retrieved (and slightly updated to remove test.zip) from:
-https://github.com/gdraheim/zziplib/commit/9411bde3e4a70a81ff3ffd256b71927b2d90dcbb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- test/test.zip | Bin 1361 -> 1361 bytes
- zzip/zip.c    |  36 ++++++++++++++++++++++++++++++++++--
- 2 files changed, 34 insertions(+), 2 deletions(-)
-
-diff --git a/zzip/zip.c b/zzip/zip.c
-index 88b833b..a685280 100644
---- a/zzip/zip.c
-+++ b/zzip/zip.c
-@@ -475,9 +475,15 @@ __zzip_parse_root_directory(int fd,
-         } else
-         {
-             if (io->fd.seeks(fd, zz_rootseek + zz_offset, SEEK_SET) < 0)
-+	    {
-+	    	free(hdr0);
-                 return ZZIP_DIR_SEEK;
-+	    }
-             if (io->fd.read(fd, &dirent, sizeof(dirent)) < __sizeof(dirent))
-+	    {
-+	    	free(hdr0);
-                 return ZZIP_DIR_READ;
-+	    }
-             d = &dirent;
-         }
- 
-@@ -577,12 +583,38 @@ __zzip_parse_root_directory(int fd,
- 
-         if (hdr_return)
-             *hdr_return = hdr0;
-+	else
-+	{
-+	    /* If it is not assigned to *hdr_return, it will never be free()'d */
-+	    free(hdr0);
-+	    /* Make sure we don't free it again in case of error */
-+	    hdr0 = NULL;
-+	}
-     }                           /* else zero (sane) entries */
- #  ifndef ZZIP_ALLOW_MODULO_ENTRIES
--    return (entries != zz_entries ? ZZIP_CORRUPTED : 0);
-+    if (entries != zz_entries)
-+    {
-+	/* If it was assigned to *hdr_return, undo assignment */
-+	if (p_reclen && hdr_return)
-+	    *hdr_return = NULL;
-+	/* Free it, if it was not already free()'d */
-+	if (hdr0 != NULL)
-+	    free(hdr0);
-+	return ZZIP_CORRUPTED;
-+    }
- #  else
--    return ((entries & (unsigned)0xFFFF) != zz_entries ? ZZIP_CORRUPTED : 0);
-+    if (((entries & (unsigned)0xFFFF) != zz_entries)
-+    {
-+	/* If it was assigned to *hdr_return, undo assignment */
-+	if (p_reclen && hdr_return)
-+	    *hdr_return = NULL;
-+	/* Free it, if it was not already free()'d */
-+	if (hdr0 != NULL)
-+	    free(hdr0);
-+	return ZZIP_CORRUPTED;
-+    }
- #  endif
-+    return 0;
- }
- 
- /* ------------------------- high-level interface ------------------------- */
diff --git a/package/zziplib/0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch b/package/zziplib/0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch
deleted file mode 100644
index b0e8858f64..0000000000
--- a/package/zziplib/0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d2e5d5c53212e54a97ad64b793a4389193fec687 Mon Sep 17 00:00:00 2001
-From: jmoellers <josef.moellers@suse.com>
-Date: Fri, 7 Sep 2018 11:49:28 +0200
-Subject: [PATCH] Avoid memory leak from __zzip_parse_root_directory().
-
-[Retrieved from:
-https://github.com/gdraheim/zziplib/commit/d2e5d5c53212e54a97ad64b793a4389193fec687]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- zzip/zip.c | 25 ++-----------------------
- 1 file changed, 2 insertions(+), 23 deletions(-)
-
-diff --git a/zzip/zip.c b/zzip/zip.c
-index a685280..51a1a4d 100644
---- a/zzip/zip.c
-+++ b/zzip/zip.c
-@@ -587,34 +587,13 @@ __zzip_parse_root_directory(int fd,
- 	{
- 	    /* If it is not assigned to *hdr_return, it will never be free()'d */
- 	    free(hdr0);
--	    /* Make sure we don't free it again in case of error */
--	    hdr0 = NULL;
- 	}
-     }                           /* else zero (sane) entries */
- #  ifndef ZZIP_ALLOW_MODULO_ENTRIES
--    if (entries != zz_entries)
--    {
--	/* If it was assigned to *hdr_return, undo assignment */
--	if (p_reclen && hdr_return)
--	    *hdr_return = NULL;
--	/* Free it, if it was not already free()'d */
--	if (hdr0 != NULL)
--	    free(hdr0);
--	return ZZIP_CORRUPTED;
--    }
-+    return (entries != zz_entries) ? ZZIP_CORRUPTED : 0;
- #  else
--    if (((entries & (unsigned)0xFFFF) != zz_entries)
--    {
--	/* If it was assigned to *hdr_return, undo assignment */
--	if (p_reclen && hdr_return)
--	    *hdr_return = NULL;
--	/* Free it, if it was not already free()'d */
--	if (hdr0 != NULL)
--	    free(hdr0);
--	return ZZIP_CORRUPTED;
--    }
-+    return ((entries & (unsigned)0xFFFF) != zz_entries) ? ZZIP_CORRUPTED : 0;
- #  endif
--    return 0;
- }
- 
- /* ------------------------- high-level interface ------------------------- */
diff --git a/package/zziplib/0003-One-more-free-to-avoid-memory-leak.patch b/package/zziplib/0003-One-more-free-to-avoid-memory-leak.patch
deleted file mode 100644
index b0506f0cf6..0000000000
--- a/package/zziplib/0003-One-more-free-to-avoid-memory-leak.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 0e1dadb05c1473b9df2d7b8f298dab801778ef99 Mon Sep 17 00:00:00 2001
-From: jmoellers <josef.moellers@suse.com>
-Date: Fri, 7 Sep 2018 13:55:35 +0200
-Subject: [PATCH] One more free() to avoid memory leak.
-
-[Retrieved from:
-https://github.com/gdraheim/zziplib/commit/0e1dadb05c1473b9df2d7b8f298dab801778ef99]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- zzip/zip.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/zzip/zip.c b/zzip/zip.c
-index 51a1a4d..bc6c080 100644
---- a/zzip/zip.c
-+++ b/zzip/zip.c
-@@ -589,6 +589,8 @@ __zzip_parse_root_directory(int fd,
- 	    free(hdr0);
- 	}
-     }                           /* else zero (sane) entries */
-+    else
-+        free(hdr0);
- #  ifndef ZZIP_ALLOW_MODULO_ENTRIES
-     return (entries != zz_entries) ? ZZIP_CORRUPTED : 0;
- #  else
diff --git a/package/zziplib/0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch b/package/zziplib/0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch
deleted file mode 100644
index 1554fff991..0000000000
--- a/package/zziplib/0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch
+++ /dev/null
@@ -1,344 +0,0 @@
-From 81dfa6b3e08f6934885ba5c98939587d6850d08e Mon Sep 17 00:00:00 2001
-From: Josef Moellers <jmoellers@suse.de>
-Date: Thu, 4 Oct 2018 14:21:48 +0200
-Subject: [PATCH] Fix issue #62: Remove any "../" components from pathnames of
- extracted files. [CVE-2018-17828]
-
-[Retrieved from:
-https://github.com/gdraheim/zziplib/commit/81dfa6b3e08f6934885ba5c98939587d6850d08e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- bins/unzzipcat-big.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
- bins/unzzipcat-mem.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
- bins/unzzipcat-mix.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
- bins/unzzipcat-zip.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
- 4 files changed, 224 insertions(+), 4 deletions(-)
-
-diff --git a/bins/unzzipcat-big.c b/bins/unzzipcat-big.c
-index 982d262..88c4d65 100644
---- a/bins/unzzipcat-big.c
-+++ b/bins/unzzipcat-big.c
-@@ -53,6 +53,48 @@ static void unzzip_cat_file(FILE* disk, char* name, FILE* out)
-     }
- }
- 
-+/*
-+ * NAME: remove_dotdotslash
-+ * PURPOSE: To remove any "../" components from the given pathname
-+ * ARGUMENTS: path: path name with maybe "../" components
-+ * RETURNS: Nothing, "path" is modified in-place
-+ * NOTE: removing "../" from the path ALWAYS shortens the path, never adds to it!
-+ *	Also, "path" is not used after creating it.
-+ *	So modifying "path" in-place is safe to do.
-+ */
-+static inline void
-+remove_dotdotslash(char *path)
-+{
-+    /* Note: removing "../" from the path ALWAYS shortens the path, never adds to it! */
-+    char *dotdotslash;
-+    int warned = 0;
-+
-+    dotdotslash = path;
-+    while ((dotdotslash = strstr(dotdotslash, "../")) != NULL)
-+    {
-+        /*
-+         * Remove only if at the beginning of the pathname ("../path/name")
-+         * or when preceded by a slash ("path/../name"),
-+         * otherwise not ("path../name..")!
-+         */
-+        if (dotdotslash == path || dotdotslash[-1] == '/')
-+        {
-+            char *src, *dst;
-+            if (!warned)
-+            {
-+                /* Note: the first time through the pathname is still intact */
-+                fprintf(stderr, "Removing \"../\" path component(s) in %s\n", path);
-+                warned = 1;
-+            }
-+            /* We cannot use strcpy(), as there "The strings may not overlap" */
-+            for (src = dotdotslash+3, dst=dotdotslash; (*dst = *src) != '\0'; src++, dst++)
-+                ;
-+        }
-+        else
-+            dotdotslash +=3;	/* skip this instance to prevent infinite loop */
-+    }
-+}
-+
- static void makedirs(const char* name)
- {
-       char* p = strrchr(name, '/');
-@@ -70,6 +112,16 @@ static void makedirs(const char* name)
- 
- static FILE* create_fopen(char* name, char* mode, int subdirs)
- {
-+   char *name_stripped;
-+   FILE *fp;
-+   int mustfree = 0;
-+
-+   if ((name_stripped = strdup(name)) != NULL)
-+   {
-+       remove_dotdotslash(name_stripped);
-+       name = name_stripped;
-+       mustfree = 1;
-+   }
-    if (subdirs)
-    {
-       char* p = strrchr(name, '/');
-@@ -79,7 +131,10 @@ static FILE* create_fopen(char* name, char* mode, int subdirs)
-           free (dir_name);
-       }
-    }
--   return fopen(name, mode);      
-+   fp = fopen(name, mode);
-+   if (mustfree)
-+       free(name_stripped);
-+    return fp;
- }
- 
- 
-diff --git a/bins/unzzipcat-mem.c b/bins/unzzipcat-mem.c
-index 9bc966b..793bde8 100644
---- a/bins/unzzipcat-mem.c
-+++ b/bins/unzzipcat-mem.c
-@@ -58,6 +58,48 @@ static void unzzip_mem_disk_cat_file(ZZIP_MEM_DISK* disk, char* name, FILE* out)
-     }
- }
- 
-+/*
-+ * NAME: remove_dotdotslash
-+ * PURPOSE: To remove any "../" components from the given pathname
-+ * ARGUMENTS: path: path name with maybe "../" components
-+ * RETURNS: Nothing, "path" is modified in-place
-+ * NOTE: removing "../" from the path ALWAYS shortens the path, never adds to it!
-+ *	Also, "path" is not used after creating it.
-+ *	So modifying "path" in-place is safe to do.
-+ */
-+static inline void
-+remove_dotdotslash(char *path)
-+{
-+    /* Note: removing "../" from the path ALWAYS shortens the path, never adds to it! */
-+    char *dotdotslash;
-+    int warned = 0;
-+
-+    dotdotslash = path;
-+    while ((dotdotslash = strstr(dotdotslash, "../")) != NULL)
-+    {
-+        /*
-+         * Remove only if at the beginning of the pathname ("../path/name")
-+         * or when preceded by a slash ("path/../name"),
-+         * otherwise not ("path../name..")!
-+         */
-+        if (dotdotslash == path || dotdotslash[-1] == '/')
-+        {
-+            char *src, *dst;
-+            if (!warned)
-+            {
-+                /* Note: the first time through the pathname is still intact */
-+                fprintf(stderr, "Removing \"../\" path component(s) in %s\n", path);
-+                warned = 1;
-+            }
-+            /* We cannot use strcpy(), as there "The strings may not overlap" */
-+            for (src = dotdotslash+3, dst=dotdotslash; (*dst = *src) != '\0'; src++, dst++)
-+                ;
-+        }
-+        else
-+            dotdotslash +=3;	/* skip this instance to prevent infinite loop */
-+    }
-+}
-+
- static void makedirs(const char* name)
- {
-       char* p = strrchr(name, '/');
-@@ -75,6 +117,16 @@ static void makedirs(const char* name)
- 
- static FILE* create_fopen(char* name, char* mode, int subdirs)
- {
-+   char *name_stripped;
-+   FILE *fp;
-+   int mustfree = 0;
-+
-+   if ((name_stripped = strdup(name)) != NULL)
-+   {
-+       remove_dotdotslash(name_stripped);
-+       name = name_stripped;
-+       mustfree = 1;
-+   }
-    if (subdirs)
-    {
-       char* p = strrchr(name, '/');
-@@ -84,7 +136,10 @@ static FILE* create_fopen(char* name, char* mode, int subdirs)
-           free (dir_name);
-       }
-    }
--   return fopen(name, mode);      
-+   fp = fopen(name, mode);
-+   if (mustfree)
-+       free(name_stripped);
-+    return fp;
- }
- 
- static int unzzip_cat (int argc, char ** argv, int extract)
-diff --git a/bins/unzzipcat-mix.c b/bins/unzzipcat-mix.c
-index 91c2f00..73b6ed6 100644
---- a/bins/unzzipcat-mix.c
-+++ b/bins/unzzipcat-mix.c
-@@ -69,6 +69,48 @@ static void unzzip_cat_file(ZZIP_DIR* disk, char* name, FILE* out)
-     }
- }
- 
-+/*
-+ * NAME: remove_dotdotslash
-+ * PURPOSE: To remove any "../" components from the given pathname
-+ * ARGUMENTS: path: path name with maybe "../" components
-+ * RETURNS: Nothing, "path" is modified in-place
-+ * NOTE: removing "../" from the path ALWAYS shortens the path, never adds to it!
-+ *	Also, "path" is not used after creating it.
-+ *	So modifying "path" in-place is safe to do.
-+ */
-+static inline void
-+remove_dotdotslash(char *path)
-+{
-+    /* Note: removing "../" from the path ALWAYS shortens the path, never adds to it! */
-+    char *dotdotslash;
-+    int warned = 0;
-+
-+    dotdotslash = path;
-+    while ((dotdotslash = strstr(dotdotslash, "../")) != NULL)
-+    {
-+        /*
-+         * Remove only if at the beginning of the pathname ("../path/name")
-+         * or when preceded by a slash ("path/../name"),
-+         * otherwise not ("path../name..")!
-+         */
-+        if (dotdotslash == path || dotdotslash[-1] == '/')
-+        {
-+            char *src, *dst;
-+            if (!warned)
-+            {
-+                /* Note: the first time through the pathname is still intact */
-+                fprintf(stderr, "Removing \"../\" path component(s) in %s\n", path);
-+                warned = 1;
-+            }
-+            /* We cannot use strcpy(), as there "The strings may not overlap" */
-+            for (src = dotdotslash+3, dst=dotdotslash; (*dst = *src) != '\0'; src++, dst++)
-+                ;
-+        }
-+        else
-+            dotdotslash +=3;	/* skip this instance to prevent infinite loop */
-+    }
-+}
-+
- static void makedirs(const char* name)
- {
-       char* p = strrchr(name, '/');
-@@ -86,6 +128,16 @@ static void makedirs(const char* name)
- 
- static FILE* create_fopen(char* name, char* mode, int subdirs)
- {
-+   char *name_stripped;
-+   FILE *fp;
-+   int mustfree = 0;
-+
-+   if ((name_stripped = strdup(name)) != NULL)
-+   {
-+       remove_dotdotslash(name_stripped);
-+       name = name_stripped;
-+       mustfree = 1;
-+   }
-    if (subdirs)
-    {
-       char* p = strrchr(name, '/');
-@@ -95,7 +147,10 @@ static FILE* create_fopen(char* name, char* mode, int subdirs)
-           free (dir_name);
-       }
-    }
--   return fopen(name, mode);      
-+   fp = fopen(name, mode);
-+   if (mustfree)
-+       free(name_stripped);
-+    return fp;
- }
- 
- static int unzzip_cat (int argc, char ** argv, int extract)
-diff --git a/bins/unzzipcat-zip.c b/bins/unzzipcat-zip.c
-index 2810f85..7f7f3fa 100644
---- a/bins/unzzipcat-zip.c
-+++ b/bins/unzzipcat-zip.c
-@@ -69,6 +69,48 @@ static void unzzip_cat_file(ZZIP_DIR* disk, char* name, FILE* out)
-     }
- }
- 
-+/*
-+ * NAME: remove_dotdotslash
-+ * PURPOSE: To remove any "../" components from the given pathname
-+ * ARGUMENTS: path: path name with maybe "../" components
-+ * RETURNS: Nothing, "path" is modified in-place
-+ * NOTE: removing "../" from the path ALWAYS shortens the path, never adds to it!
-+ *	Also, "path" is not used after creating it.
-+ *	So modifying "path" in-place is safe to do.
-+ */
-+static inline void
-+remove_dotdotslash(char *path)
-+{
-+    /* Note: removing "../" from the path ALWAYS shortens the path, never adds to it! */
-+    char *dotdotslash;
-+    int warned = 0;
-+
-+    dotdotslash = path;
-+    while ((dotdotslash = strstr(dotdotslash, "../")) != NULL)
-+    {
-+        /*
-+         * Remove only if at the beginning of the pathname ("../path/name")
-+         * or when preceded by a slash ("path/../name"),
-+         * otherwise not ("path../name..")!
-+         */
-+        if (dotdotslash == path || dotdotslash[-1] == '/')
-+        {
-+            char *src, *dst;
-+            if (!warned)
-+            {
-+                /* Note: the first time through the pathname is still intact */
-+                fprintf(stderr, "Removing \"../\" path component(s) in %s\n", path);
-+                warned = 1;
-+            }
-+            /* We cannot use strcpy(), as there "The strings may not overlap" */
-+            for (src = dotdotslash+3, dst=dotdotslash; (*dst = *src) != '\0'; src++, dst++)
-+                ;
-+        }
-+        else
-+            dotdotslash +=3;	/* skip this instance to prevent infinite loop */
-+    }
-+}
-+
- static void makedirs(const char* name)
- {
-       char* p = strrchr(name, '/');
-@@ -86,6 +128,16 @@ static void makedirs(const char* name)
- 
- static FILE* create_fopen(char* name, char* mode, int subdirs)
- {
-+   char *name_stripped;
-+   FILE *fp;
-+   int mustfree = 0;
-+
-+   if ((name_stripped = strdup(name)) != NULL)
-+   {
-+       remove_dotdotslash(name_stripped);
-+       name = name_stripped;
-+       mustfree = 1;
-+   }
-    if (subdirs)
-    {
-       char* p = strrchr(name, '/');
-@@ -95,7 +147,10 @@ static FILE* create_fopen(char* name, char* mode, int subdirs)
-           free (dir_name);
-       }
-    }
--   return fopen(name, mode);
-+   fp = fopen(name, mode);
-+   if (mustfree)
-+       free(name_stripped);
-+    return fp;
- }
- 
- static int unzzip_cat (int argc, char ** argv, int extract)
diff --git a/package/zziplib/zziplib.hash b/package/zziplib/zziplib.hash
index 88f618b7bf..b667b95373 100644
--- a/package/zziplib/zziplib.hash
+++ b/package/zziplib/zziplib.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256 846246d7cdeee405d8d21e2922c6e97f55f24ecbe3b6dcf5778073a88f120544  zziplib-0.13.69.tar.gz
-sha256 94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  docs/COPYING.LIB
-sha256 c2aa7d58cebd24cb877bbf11d6b13a4bb7cd08b9d7db5d3037ca06c46bf4cfd8  docs/COPYING.MPL
-sha256 1c6da11efe8c43ee853fe5b21501dd72b81831ae84d58ea376bddc0620a5c361  docs/copying.htm
+sha256  2ee1e0fbbb78ec7cc46bde5b62857bc51f8d665dd265577cf93584344b8b9de2  zziplib-0.13.71.tar.gz
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  docs/COPYING.LIB
+sha256  c2aa7d58cebd24cb877bbf11d6b13a4bb7cd08b9d7db5d3037ca06c46bf4cfd8  docs/COPYING.MPL
+sha256  1c6da11efe8c43ee853fe5b21501dd72b81831ae84d58ea376bddc0620a5c361  docs/copying.htm
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 967cda033d..aab091ac6a 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -4,23 +4,14 @@
 #
 ################################################################################
 
-ZZIPLIB_VERSION = 0.13.69
+ZZIPLIB_VERSION = 0.13.71
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
 ZZIPLIB_INSTALL_STAGING = YES
 
-# 0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch
-# 0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch
-# 0003-One-more-free-to-avoid-memory-leak.patch
-ZZIPLIB_IGNORE_CVES += CVE-2018-16548
+ZZIPLIB_DEPENDENCIES = host-pkgconf host-python3 zlib
 
-# 0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch
-ZZIPLIB_IGNORE_CVES += CVE-2018-17828
-
-ZZIPLIB_DEPENDENCIES = host-pkgconf host-python zlib
-
-# zziplib is not python3 friendly, so force the python interpreter
-ZZIPLIB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
+ZZIPLIB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3
 
 $(eval $(autotools-package))
-- 
2.25.4
