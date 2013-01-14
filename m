From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 22:31:31 +0100
Subject: [Buildroot] [git commit] curlftpfs: new package
Message-ID: <20130114213706.22AFE999A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72df08ee45dbe32e90eecdb763cdb98c6dd59e99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: updated with BR changes, Config.in tweaks, dropped configure.ac patch]
Signed-off-by: Richard Braun <rbraun@...>
Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/curlftpfs/Config.in                        |   20 +++++++
 .../curlftpfs-000-fix-CURLOPT_INFILESIZE.patch     |   13 ++++
 ...curlftpfs-001-free_ftpfs_file-memleak-fix.patch |   14 +++++
 .../curlftpfs-002-nocache-memleak-fix.patch        |   59 ++++++++++++++++++++
 package/curlftpfs/curlftpfs.mk                     |   14 +++++
 6 files changed, 121 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7c49235..42cde07 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -185,6 +185,7 @@ endmenu
 menu "Filesystem and flash utilities"
 source "package/cifs-utils/Config.in"
 source "package/cramfs/Config.in"
+source "package/curlftpfs/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
 source "package/flashbench/Config.in"
diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
new file mode 100644
index 0000000..e946d0a
--- /dev/null
+++ b/package/curlftpfs/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_CURLFTPFS
+	bool "curlftpfs (FUSE)"
+	select BR2_PACKAGE_LIBFUSE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBCURL
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_USE_MMU # libfuse
+	help
+	  CurlFtpFS is a filesystem for accessing FTP hosts based on FUSE
+	  and libcurl.
+
+	  http://curlftpfs.sourceforge.net/
+
+comment "curlftpfs requires a toolchain with LARGEFILE, WCHAR and threads support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
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
diff --git a/package/curlftpfs/curlftpfs.mk b/package/curlftpfs/curlftpfs.mk
new file mode 100644
index 0000000..c7d04ae
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
+CURLFTPFS_SITE = http://downloads.sourceforge.net/project/curlftpfs/curlftpfs/$(CURLFTPFS_VERSION)
+CURLFTPFS_DEPENDENCIES = \
+	libglib2 libfuse openssl libcurl \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(if $(BR2_ENABLE_LOCALE),,libiconv)
+
+$(eval $(autotools-package))
