From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 22:42:04 +0100
Subject: [Buildroot] [git commit] package/zziplib: fix CVE-2018-17828
Message-ID: <20200303213155.DDD3F8F286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=401d18b2e938e31a632baabccd71f2d72701d036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Directory traversal vulnerability in ZZIPlib 0.13.69 allows attackers to
overwrite arbitrary files via a .. (dot dot) in a zip file, because of
the function unzzip_cat in the bins/unzzipcat-mem.c file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...any-components-from-pathnames-of-extracte.patch | 344 +++++++++++++++++++++
 package/zziplib/zziplib.mk                         |   3 +
 2 files changed, 347 insertions(+)

diff --git a/package/zziplib/0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch b/package/zziplib/0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch
new file mode 100644
index 0000000000..1554fff991
--- /dev/null
+++ b/package/zziplib/0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch
@@ -0,0 +1,344 @@
+From 81dfa6b3e08f6934885ba5c98939587d6850d08e Mon Sep 17 00:00:00 2001
+From: Josef Moellers <jmoellers@suse.de>
+Date: Thu, 4 Oct 2018 14:21:48 +0200
+Subject: [PATCH] Fix issue #62: Remove any "../" components from pathnames of
+ extracted files. [CVE-2018-17828]
+
+[Retrieved from:
+https://github.com/gdraheim/zziplib/commit/81dfa6b3e08f6934885ba5c98939587d6850d08e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ bins/unzzipcat-big.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
+ bins/unzzipcat-mem.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
+ bins/unzzipcat-mix.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
+ bins/unzzipcat-zip.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
+ 4 files changed, 224 insertions(+), 4 deletions(-)
+
+diff --git a/bins/unzzipcat-big.c b/bins/unzzipcat-big.c
+index 982d262..88c4d65 100644
+--- a/bins/unzzipcat-big.c
++++ b/bins/unzzipcat-big.c
+@@ -53,6 +53,48 @@ static void unzzip_cat_file(FILE* disk, char* name, FILE* out)
+     }
+ }
+ 
++/*
++ * NAME: remove_dotdotslash
++ * PURPOSE: To remove any "../" components from the given pathname
++ * ARGUMENTS: path: path name with maybe "../" components
++ * RETURNS: Nothing, "path" is modified in-place
++ * NOTE: removing "../" from the path ALWAYS shortens the path, never adds to it!
++ *	Also, "path" is not used after creating it.
++ *	So modifying "path" in-place is safe to do.
++ */
++static inline void
++remove_dotdotslash(char *path)
++{
++    /* Note: removing "../" from the path ALWAYS shortens the path, never adds to it! */
++    char *dotdotslash;
++    int warned = 0;
++
++    dotdotslash = path;
++    while ((dotdotslash = strstr(dotdotslash, "../")) != NULL)
++    {
++        /*
++         * Remove only if at the beginning of the pathname ("../path/name")
++         * or when preceded by a slash ("path/../name"),
++         * otherwise not ("path../name..")!
++         */
++        if (dotdotslash == path || dotdotslash[-1] == '/')
++        {
++            char *src, *dst;
++            if (!warned)
++            {
++                /* Note: the first time through the pathname is still intact */
++                fprintf(stderr, "Removing \"../\" path component(s) in %s\n", path);
++                warned = 1;
++            }
++            /* We cannot use strcpy(), as there "The strings may not overlap" */
++            for (src = dotdotslash+3, dst=dotdotslash; (*dst = *src) != '\0'; src++, dst++)
++                ;
++        }
++        else
++            dotdotslash +=3;	/* skip this instance to prevent infinite loop */
++    }
++}
++
+ static void makedirs(const char* name)
+ {
+       char* p = strrchr(name, '/');
+@@ -70,6 +112,16 @@ static void makedirs(const char* name)
+ 
+ static FILE* create_fopen(char* name, char* mode, int subdirs)
+ {
++   char *name_stripped;
++   FILE *fp;
++   int mustfree = 0;
++
++   if ((name_stripped = strdup(name)) != NULL)
++   {
++       remove_dotdotslash(name_stripped);
++       name = name_stripped;
++       mustfree = 1;
++   }
+    if (subdirs)
+    {
+       char* p = strrchr(name, '/');
+@@ -79,7 +131,10 @@ static FILE* create_fopen(char* name, char* mode, int subdirs)
+           free (dir_name);
+       }
+    }
+-   return fopen(name, mode);      
++   fp = fopen(name, mode);
++   if (mustfree)
++       free(name_stripped);
++    return fp;
+ }
+ 
+ 
+diff --git a/bins/unzzipcat-mem.c b/bins/unzzipcat-mem.c
+index 9bc966b..793bde8 100644
+--- a/bins/unzzipcat-mem.c
++++ b/bins/unzzipcat-mem.c
+@@ -58,6 +58,48 @@ static void unzzip_mem_disk_cat_file(ZZIP_MEM_DISK* disk, char* name, FILE* out)
+     }
+ }
+ 
++/*
++ * NAME: remove_dotdotslash
++ * PURPOSE: To remove any "../" components from the given pathname
++ * ARGUMENTS: path: path name with maybe "../" components
++ * RETURNS: Nothing, "path" is modified in-place
++ * NOTE: removing "../" from the path ALWAYS shortens the path, never adds to it!
++ *	Also, "path" is not used after creating it.
++ *	So modifying "path" in-place is safe to do.
++ */
++static inline void
++remove_dotdotslash(char *path)
++{
++    /* Note: removing "../" from the path ALWAYS shortens the path, never adds to it! */
++    char *dotdotslash;
++    int warned = 0;
++
++    dotdotslash = path;
++    while ((dotdotslash = strstr(dotdotslash, "../")) != NULL)
++    {
++        /*
++         * Remove only if at the beginning of the pathname ("../path/name")
++         * or when preceded by a slash ("path/../name"),
++         * otherwise not ("path../name..")!
++         */
++        if (dotdotslash == path || dotdotslash[-1] == '/')
++        {
++            char *src, *dst;
++            if (!warned)
++            {
++                /* Note: the first time through the pathname is still intact */
++                fprintf(stderr, "Removing \"../\" path component(s) in %s\n", path);
++                warned = 1;
++            }
++            /* We cannot use strcpy(), as there "The strings may not overlap" */
++            for (src = dotdotslash+3, dst=dotdotslash; (*dst = *src) != '\0'; src++, dst++)
++                ;
++        }
++        else
++            dotdotslash +=3;	/* skip this instance to prevent infinite loop */
++    }
++}
++
+ static void makedirs(const char* name)
+ {
+       char* p = strrchr(name, '/');
+@@ -75,6 +117,16 @@ static void makedirs(const char* name)
+ 
+ static FILE* create_fopen(char* name, char* mode, int subdirs)
+ {
++   char *name_stripped;
++   FILE *fp;
++   int mustfree = 0;
++
++   if ((name_stripped = strdup(name)) != NULL)
++   {
++       remove_dotdotslash(name_stripped);
++       name = name_stripped;
++       mustfree = 1;
++   }
+    if (subdirs)
+    {
+       char* p = strrchr(name, '/');
+@@ -84,7 +136,10 @@ static FILE* create_fopen(char* name, char* mode, int subdirs)
+           free (dir_name);
+       }
+    }
+-   return fopen(name, mode);      
++   fp = fopen(name, mode);
++   if (mustfree)
++       free(name_stripped);
++    return fp;
+ }
+ 
+ static int unzzip_cat (int argc, char ** argv, int extract)
+diff --git a/bins/unzzipcat-mix.c b/bins/unzzipcat-mix.c
+index 91c2f00..73b6ed6 100644
+--- a/bins/unzzipcat-mix.c
++++ b/bins/unzzipcat-mix.c
+@@ -69,6 +69,48 @@ static void unzzip_cat_file(ZZIP_DIR* disk, char* name, FILE* out)
+     }
+ }
+ 
++/*
++ * NAME: remove_dotdotslash
++ * PURPOSE: To remove any "../" components from the given pathname
++ * ARGUMENTS: path: path name with maybe "../" components
++ * RETURNS: Nothing, "path" is modified in-place
++ * NOTE: removing "../" from the path ALWAYS shortens the path, never adds to it!
++ *	Also, "path" is not used after creating it.
++ *	So modifying "path" in-place is safe to do.
++ */
++static inline void
++remove_dotdotslash(char *path)
++{
++    /* Note: removing "../" from the path ALWAYS shortens the path, never adds to it! */
++    char *dotdotslash;
++    int warned = 0;
++
++    dotdotslash = path;
++    while ((dotdotslash = strstr(dotdotslash, "../")) != NULL)
++    {
++        /*
++         * Remove only if at the beginning of the pathname ("../path/name")
++         * or when preceded by a slash ("path/../name"),
++         * otherwise not ("path../name..")!
++         */
++        if (dotdotslash == path || dotdotslash[-1] == '/')
++        {
++            char *src, *dst;
++            if (!warned)
++            {
++                /* Note: the first time through the pathname is still intact */
++                fprintf(stderr, "Removing \"../\" path component(s) in %s\n", path);
++                warned = 1;
++            }
++            /* We cannot use strcpy(), as there "The strings may not overlap" */
++            for (src = dotdotslash+3, dst=dotdotslash; (*dst = *src) != '\0'; src++, dst++)
++                ;
++        }
++        else
++            dotdotslash +=3;	/* skip this instance to prevent infinite loop */
++    }
++}
++
+ static void makedirs(const char* name)
+ {
+       char* p = strrchr(name, '/');
+@@ -86,6 +128,16 @@ static void makedirs(const char* name)
+ 
+ static FILE* create_fopen(char* name, char* mode, int subdirs)
+ {
++   char *name_stripped;
++   FILE *fp;
++   int mustfree = 0;
++
++   if ((name_stripped = strdup(name)) != NULL)
++   {
++       remove_dotdotslash(name_stripped);
++       name = name_stripped;
++       mustfree = 1;
++   }
+    if (subdirs)
+    {
+       char* p = strrchr(name, '/');
+@@ -95,7 +147,10 @@ static FILE* create_fopen(char* name, char* mode, int subdirs)
+           free (dir_name);
+       }
+    }
+-   return fopen(name, mode);      
++   fp = fopen(name, mode);
++   if (mustfree)
++       free(name_stripped);
++    return fp;
+ }
+ 
+ static int unzzip_cat (int argc, char ** argv, int extract)
+diff --git a/bins/unzzipcat-zip.c b/bins/unzzipcat-zip.c
+index 2810f85..7f7f3fa 100644
+--- a/bins/unzzipcat-zip.c
++++ b/bins/unzzipcat-zip.c
+@@ -69,6 +69,48 @@ static void unzzip_cat_file(ZZIP_DIR* disk, char* name, FILE* out)
+     }
+ }
+ 
++/*
++ * NAME: remove_dotdotslash
++ * PURPOSE: To remove any "../" components from the given pathname
++ * ARGUMENTS: path: path name with maybe "../" components
++ * RETURNS: Nothing, "path" is modified in-place
++ * NOTE: removing "../" from the path ALWAYS shortens the path, never adds to it!
++ *	Also, "path" is not used after creating it.
++ *	So modifying "path" in-place is safe to do.
++ */
++static inline void
++remove_dotdotslash(char *path)
++{
++    /* Note: removing "../" from the path ALWAYS shortens the path, never adds to it! */
++    char *dotdotslash;
++    int warned = 0;
++
++    dotdotslash = path;
++    while ((dotdotslash = strstr(dotdotslash, "../")) != NULL)
++    {
++        /*
++         * Remove only if at the beginning of the pathname ("../path/name")
++         * or when preceded by a slash ("path/../name"),
++         * otherwise not ("path../name..")!
++         */
++        if (dotdotslash == path || dotdotslash[-1] == '/')
++        {
++            char *src, *dst;
++            if (!warned)
++            {
++                /* Note: the first time through the pathname is still intact */
++                fprintf(stderr, "Removing \"../\" path component(s) in %s\n", path);
++                warned = 1;
++            }
++            /* We cannot use strcpy(), as there "The strings may not overlap" */
++            for (src = dotdotslash+3, dst=dotdotslash; (*dst = *src) != '\0'; src++, dst++)
++                ;
++        }
++        else
++            dotdotslash +=3;	/* skip this instance to prevent infinite loop */
++    }
++}
++
+ static void makedirs(const char* name)
+ {
+       char* p = strrchr(name, '/');
+@@ -86,6 +128,16 @@ static void makedirs(const char* name)
+ 
+ static FILE* create_fopen(char* name, char* mode, int subdirs)
+ {
++   char *name_stripped;
++   FILE *fp;
++   int mustfree = 0;
++
++   if ((name_stripped = strdup(name)) != NULL)
++   {
++       remove_dotdotslash(name_stripped);
++       name = name_stripped;
++       mustfree = 1;
++   }
+    if (subdirs)
+    {
+       char* p = strrchr(name, '/');
+@@ -95,7 +147,10 @@ static FILE* create_fopen(char* name, char* mode, int subdirs)
+           free (dir_name);
+       }
+    }
+-   return fopen(name, mode);
++   fp = fopen(name, mode);
++   if (mustfree)
++       free(name_stripped);
++    return fp;
+ }
+ 
+ static int unzzip_cat (int argc, char ** argv, int extract)
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index ead0158f3d..967cda033d 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -15,6 +15,9 @@ ZZIPLIB_INSTALL_STAGING = YES
 # 0003-One-more-free-to-avoid-memory-leak.patch
 ZZIPLIB_IGNORE_CVES += CVE-2018-16548
 
+# 0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch
+ZZIPLIB_IGNORE_CVES += CVE-2018-17828
+
 ZZIPLIB_DEPENDENCIES = host-pkgconf host-python zlib
 
 # zziplib is not python3 friendly, so force the python interpreter
