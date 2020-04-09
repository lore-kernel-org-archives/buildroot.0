From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  9 Apr 2020 14:18:42 -0600
Subject: [Buildroot] [PATCH v2 1/2] package/gensio: bump to version 2.0.1
Message-ID: <20200409201843.62485-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch that is now upstream.

Removed GENSIO_AUTORECONF as we no longer patch configure.ac.

Fixes:
http://autobuild.buildroot.net/results/cce/ccebd933feddcea2253837b8a0bf1ef96356b4fb/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...r-Rename-some-variables-to-tr_stdxxx.patch | 109 ------------------
 package/gensio/gensio.hash                    |   6 +-
 package/gensio/gensio.mk                      |   4 +-
 3 files changed, 4 insertions(+), 115 deletions(-)
 delete mode 100644 package/gensio/0001-filter-Rename-some-variables-to-tr_stdxxx.patch

diff --git a/package/gensio/0001-filter-Rename-some-variables-to-tr_stdxxx.patch b/package/gensio/0001-filter-Rename-some-variables-to-tr_stdxxx.patch
deleted file mode 100644
index fdc78d334d..0000000000
--- a/package/gensio/0001-filter-Rename-some-variables-to-tr_stdxxx.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 601e6e56f44b91d957bb643662455f52540f336a Mon Sep 17 00:00:00 2001
-From: Corey Minyard <cminyard@mvista.com>
-Date: Tue, 25 Feb 2020 16:08:40 -0600
-Subject: [PATCH] filter: Rename some variables to tr_stdxxx
-
-stdout and stderr can be macros, don't use the names directly.
-
-Signed-off-by: Corey Minyard <cminyard@mvista.com>
-[james.hilliard1 at gmail.com: backport from upstream commit
-601e6e56f44b91d957bb643662455f52540f336a]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- lib/gensio_filter_trace.c | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/lib/gensio_filter_trace.c b/lib/gensio_filter_trace.c
-index d39d58b..abe2db6 100644
---- a/lib/gensio_filter_trace.c
-+++ b/lib/gensio_filter_trace.c
-@@ -32,8 +32,8 @@ struct trace_filter {
-     enum trace_dir dir;
-     bool raw;
-     char *filename;
--    bool stdout;
--    bool stderr;
-+    bool tr_stdout;
-+    bool tr_stderr;
- 
-     FILE *tr;
- };
-@@ -82,9 +82,9 @@ trace_try_connect(struct gensio_filter *filter, struct timeval *timeout)
- {
-     struct trace_filter *tfilter = filter_to_trace(filter);
- 
--    if (tfilter->stdout) {
-+    if (tfilter->tr_stdout) {
- 	tfilter->tr = stdout;
--    } else if (tfilter->stderr) {
-+    } else if (tfilter->tr_stderr) {
- 	tfilter->tr = stderr;
-     } else if (tfilter->filename) {
- 	tfilter->tr = fopen(tfilter->filename, "a+");
-@@ -99,7 +99,7 @@ trace_try_disconnect(struct gensio_filter *filter, struct timeval *timeout)
- {
-     struct trace_filter *tfilter = filter_to_trace(filter);
- 
--    if (!tfilter->stdout && !tfilter->stderr && tfilter->tr)
-+    if (!tfilter->tr_stdout && !tfilter->tr_stderr && tfilter->tr)
- 	fclose(tfilter->tr);
-     tfilter->tr = NULL;
-     return 0;
-@@ -331,12 +331,12 @@ static int gensio_trace_filter_func(struct gensio_filter *filter, int op,
- 
- static struct gensio_filter *
- gensio_trace_filter_raw_alloc(struct gensio_os_funcs *o, enum trace_dir dir,
--			      bool raw, const char *filename, bool stdout,
--			      bool stderr)
-+			      bool raw, const char *filename, bool tr_stdout,
-+			      bool tr_stderr)
- {
-     struct trace_filter *tfilter;
- 
--    if (!filename && !stdout && !stderr)
-+    if (!filename && !tr_stdout && !tr_stderr)
- 	dir = TRACE_NONE;
- 
-     tfilter = o->zalloc(o, sizeof(*tfilter));
-@@ -351,8 +351,8 @@ gensio_trace_filter_raw_alloc(struct gensio_os_funcs *o, enum trace_dir dir,
- 	if (!tfilter->filename)
- 	    goto out_nomem;
-     }
--    tfilter->stdout = stdout;
--    tfilter->stderr = stderr;
-+    tfilter->tr_stdout = tr_stdout;
-+    tfilter->tr_stderr = tr_stderr;
- 
-     tfilter->lock = o->alloc_lock(o);
-     if (!tfilter->lock)
-@@ -385,7 +385,7 @@ gensio_trace_filter_alloc(struct gensio_os_funcs *o,
- {
-     struct gensio_filter *filter;
-     int dir = TRACE_NONE;
--    bool raw = false, stdout = false, stderr = false;
-+    bool raw = false, tr_stdout = false, tr_stderr = false;
-     const char *filename = NULL;
-     unsigned int i;
- 
-@@ -396,15 +396,15 @@ gensio_trace_filter_alloc(struct gensio_os_funcs *o,
- 	    continue;
- 	if (gensio_check_keyvalue(args[i], "file", &filename) > 0)
- 	    continue;
--	if (gensio_check_keybool(args[i], "stdout", &stdout) > 0)
-+	if (gensio_check_keybool(args[i], "stdout", &tr_stdout) > 0)
- 	    continue;
--	if (gensio_check_keybool(args[i], "stderr", &stderr) > 0)
-+	if (gensio_check_keybool(args[i], "stderr", &tr_stderr) > 0)
- 	    continue;
- 	return GE_INVAL;
-     }
- 
-     filter = gensio_trace_filter_raw_alloc(o, dir, raw, filename,
--					   stdout, stderr);
-+					   tr_stdout, tr_stderr);
-     if (!filter)
- 	return GE_NOMEM;
- 
--- 
-2.20.1
-
diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index 202548bc40..be78696b5a 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  d6b0665266f738973b13450c53d83032  gensio-1.5.3.tar.gz
-sha1  8d041babe8d29f8acb48c6cb0fa543e6f9f63238  gensio-1.5.3.tar.gz
+md5  6676c877275f3475b59f584204d94daa  gensio-2.0.1.tar.gz
+sha1  0624b6ea0c9b939454df1e0265b20fdacd5383b1  gensio-2.0.1.tar.gz
 # Locally computed:
-sha256  f5097add3f269594e7a81016af93c147e8f5e8312f27f3d0bfbeeb3aad1ace53  gensio-1.5.3.tar.gz
+sha256  92333a2f0baa3d77a6ff13a81ae165e871d70e8a583882c46363fe4b710c7348  gensio-2.0.1.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 06e55875c0..101f2c2574 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 1.5.3
+GENSIO_VERSION = 2.0.1
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
-# We're patching configure.ac
-GENSIO_AUTORECONF = YES
 GENSIO_CONF_OPTS = \
 	--without-openipmi \
 	--without-swig \
-- 
2.20.1
