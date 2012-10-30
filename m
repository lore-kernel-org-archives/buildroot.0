From: Alexander Varnin <fenixk19@mail.ru>
Date: Tue, 30 Oct 2012 17:35:19 +0400
Subject: [Buildroot] [PATCH] curlftpfs: new package
Message-ID: <1351604119-23101-1-git-send-email-fenixk19@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Richard Braun <rbraun@>

Signed-off-by: Richard Braun <rbraun@...>
Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
---
 package/Config.in                                  |    1 +
 package/curlftpfs/Config.in                        |   17 ++++++
 .../curlftpfs-000-fix-CURLOPT_INFILESIZE.patch     |   13 ++++
 ...curlftpfs-001-free_ftpfs_file-memleak-fix.patch |   14 +++++
 .../curlftpfs-002-nocache-memleak-fix.patch        |   59 ++++++++++++++++++++
 .../curlftpfs/curlftpfs-003-configureac-fix.patch  |   31 ++++++++++
 package/curlftpfs/curlftpfs.mk                     |   14 +++++
 7 files changed, 149 insertions(+), 0 deletions(-)
 create mode 100644 package/curlftpfs/Config.in
 create mode 100644 package/curlftpfs/curlftpfs-000-fix-CURLOPT_INFILESIZE.patch
 create mode 100644 package/curlftpfs/curlftpfs-001-free_ftpfs_file-memleak-fix.patch
 create mode 100644 package/curlftpfs/curlftpfs-002-nocache-memleak-fix.patch
 create mode 100644 package/curlftpfs/curlftpfs-003-configureac-fix.patch
 create mode 100644 package/curlftpfs/curlftpfs.mk

diff --git a/package/Config.in b/package/Config.in
index 85904fb..f11cd9d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -523,6 +523,7 @@ source "package/ctorrent/Config.in"
 source "package/cifs-utils/Config.in"
 source "package/conntrack-tools/Config.in"
 source "package/cups/Config.in"
+source "package/curlftpfs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
new file mode 100644
index 0000000..23c7547
--- /dev/null
+++ b/package/curlftpfs/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CURLFTPFS
+	bool "curlftpfs (FUSE)"
+	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBCURL
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # glib2
+	help
+	  CurlFtpFS is a filesystem for accessing FTP hosts based on FUSE
+	  and libcurl.
+
+comment "curlftpfs requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/curlftpfs/curlftpfs-000-fix-CURLOPT_INFILESIZE.patch b/package/curlftpfs/curlftpfs-000-fix-CURLOPT_INFILESIZE.patch
new file mode 100644
index 0000000..dc83af0
--- /dev/null
+++ b/package/curlftpfs/curlftpfs-000-fix-CURLOPT_INFILESIZE.patch
@@ -0,0 +1,13 @@
+Borrowed from the curlftpfs_0.9.2-5 Debian package.
+
+CURLOPT_INFILESIZE does not support -1 arg. This fix bug #556012.
+--- curlftpfs-0.9.2/ftpfs.c.old	2009-12-13 14:12:25.000000000 +0100
++++ curlftpfs-0.9.2/ftpfs.c	2009-12-13 14:12:32.000000000 +0100
+@@ -503,7 +503,6 @@
+   
+   curl_easy_setopt_or_die(fh->write_conn, CURLOPT_URL, fh->full_path);
+   curl_easy_setopt_or_die(fh->write_conn, CURLOPT_UPLOAD, 1);
+-  curl_easy_setopt_or_die(fh->write_conn, CURLOPT_INFILESIZE, -1);
+   curl_easy_setopt_or_die(fh->write_conn, CURLOPT_READFUNCTION, write_data_bg);
+   curl_easy_setopt_or_die(fh->write_conn, CURLOPT_READDATA, fh);
+   curl_easy_setopt_or_die(fh->write_conn, CURLOPT_LOW_SPEED_LIMIT, 1);
diff --git a/package/curlftpfs/curlftpfs-001-free_ftpfs_file-memleak-fix.patch b/package/curlftpfs/curlftpfs-001-free_ftpfs_file-memleak-fix.patch
new file mode 100644
index 0000000..4966c9d
--- /dev/null
+++ b/package/curlftpfs/curlftpfs-001-free_ftpfs_file-memleak-fix.patch
@@ -0,0 +1,14 @@
+Borrowed from the curlftpfs_0.9.2-5 Debian package.
+
+Fix a memory leak. See Bug #587250.
+--- a/ftpfs.c	2008-04-30 01:05:47.000000000 +0200
++++ a/ftpfs.c.slesimple	2010-01-01 22:12:10.000000000 +0100
+@@ -615,6 +615,8 @@ static void free_ftpfs_file(struct ftpfs
+   sem_destroy(&fh->data_need);
+   sem_destroy(&fh->data_written);
+   sem_destroy(&fh->ready);
++  if (fh->buf.size) { buf_free(&fh->buf); }
++  if (fh->stream_buf.size) { buf_free(&fh->stream_buf); }
+   free(fh);
+ }
+ 
diff --git a/package/curlftpfs/curlftpfs-002-nocache-memleak-fix.patch b/package/curlftpfs/curlftpfs-002-nocache-memleak-fix.patch
new file mode 100644
index 0000000..00a4dd6
--- /dev/null
+++ b/package/curlftpfs/curlftpfs-002-nocache-memleak-fix.patch
@@ -0,0 +1,59 @@
+Borrowed from the curlftpfs_0.9.2-5 Debian package.
+
+Fix a memory leak when cache is disabled. Closes: #614347.
+diff -ur curlftpfs-0.9.2/cache.c curlftpfs-0.9.2-olexat/cache.c
+--- curlftpfs-0.9.2/cache.c	2008-04-30 01:03:09.000000000 +0200
++++ curlftpfs-0.9.2-olexat/cache.c	2011-02-04 16:43:05.000000000 +0100
+@@ -25,7 +25,7 @@
+     time_t last_cleaned;
+ };
+ 
+-static struct cache cache;
++struct cache cache;
+ 
+ struct node {
+     struct stat stat;
+diff -ur curlftpfs-0.9.2/ftpfs-ls.c curlftpfs-0.9.2-olexat/ftpfs-ls.c
+--- curlftpfs-0.9.2/ftpfs-ls.c	2008-04-23 12:55:41.000000000 +0200
++++ curlftpfs-0.9.2-olexat/ftpfs-ls.c	2011-02-07 17:23:37.000000000 +0100
+@@ -25,6 +25,13 @@
+ #include "charset_utils.h"
+ #include "ftpfs-ls.h"
+ 
++struct cache {
++    int on;
++    char incomplete[];
++};
++
++extern struct cache cache;
++
+ static int parse_dir_unix(const char *line,
+                           struct stat *sbuf,
+                           char *file,
+@@ -243,8 +256,10 @@
+           reallink = g_strdup(link);
+         }
+         int linksize = strlen(reallink);
+-        cache_add_link(full_path, reallink, linksize+1);
+-        DEBUG(1, "cache_add_link: %s %s\n", full_path, reallink);
++        if (cache.on) {
++          cache_add_link(full_path, reallink, linksize+1);
++          DEBUG(1, "cache_add_link: %s %s\n", full_path, reallink);
++        }
+         if (linkbuf && linklen) {
+           if (linksize > linklen) linksize = linklen - 1;
+           strncpy(linkbuf, reallink, linksize);
+@@ -257,8 +272,10 @@
+         DEBUG(1, "filler: %s\n", file);
+         filler(h, file, &stat_buf);
+       } else {
+-        DEBUG(1, "cache_add_attr: %s\n", full_path);
+-        cache_add_attr(full_path, &stat_buf);
++        if (cache.on) {
++          DEBUG(1, "cache_add_attr: %s\n", full_path);
++          cache_add_attr(full_path, &stat_buf);
++        }
+       }
+ 
+       DEBUG(2, "comparing %s %s\n", name, file);
+
diff --git a/package/curlftpfs/curlftpfs-003-configureac-fix.patch b/package/curlftpfs/curlftpfs-003-configureac-fix.patch
new file mode 100644
index 0000000..e667391
--- /dev/null
+++ b/package/curlftpfs/curlftpfs-003-configureac-fix.patch
@@ -0,0 +1,31 @@
+*** curlftpfs-0.9.2/configure.ac.old	2012-10-30 17:25:55.000000000 +0400
+--- curlftpfs-0.9.2/configure.ac	2012-10-30 17:23:01.000000000 +0400
+*************** if test "$libcurl_protocol_FTP" != yes;
+*** 19,25 ****
+  fi
+  
+  CFLAGS="$CFLAGS -Wall -W -Wno-sign-compare -D_REENTRANT $GLIB_CFLAGS $FUSE_CFLAGS $LIBCURL_CPPFLAGS"
+! LIBS="$GLIB_LIBS $FUSE_LIBS $LIBCURL"
+  
+  have_fuse_opt_parse=no
+  AC_CHECK_FUNC([fuse_opt_parse], [have_fuse_opt_parse=yes])
+--- 19,25 ----
+  fi
+  
+  CFLAGS="$CFLAGS -Wall -W -Wno-sign-compare -D_REENTRANT $GLIB_CFLAGS $FUSE_CFLAGS $LIBCURL_CPPFLAGS"
+! LIBS="$GLIB_LIBS $FUSE_LIBS $LIBCURL -lpthread"
+  
+  have_fuse_opt_parse=no
+  AC_CHECK_FUNC([fuse_opt_parse], [have_fuse_opt_parse=yes])
+*************** AC_STRUCT_TM
+*** 46,54 ****
+  
+  # Checks for library functions.
+  AC_FUNC_CHOWN
+- AC_FUNC_MALLOC
+  AC_FUNC_MKTIME
+- AC_FUNC_REALLOC
+  AC_FUNC_SELECT_ARGTYPES
+  AC_FUNC_STRFTIME
+  AC_FUNC_UTIME_NULL
+--- 46,52 ----
diff --git a/package/curlftpfs/curlftpfs.mk b/package/curlftpfs/curlftpfs.mk
new file mode 100644
index 0000000..9e77eb0
--- /dev/null
+++ b/package/curlftpfs/curlftpfs.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# curlftpfs
+#
+#############################################################
+
+CURLFTPFS_VERSION = 0.9.2
+CURLFTPFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/curlftpfs/$(CURLFTPFS_VERSION)
+CURLFTPFS_DEPENDENCIES = \
+	libglib2 libfuse openssl libcurl \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_ENABLE_LOCALE),,libiconv)
+
+$(eval $(autotools-package))
-- 
1.7.2.5
