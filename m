From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 8 Feb 2017 19:02:18 +0530
Subject: [Buildroot] [PATCH] wget: add upstream patch to fix build failure
Message-ID: <1486560738-4708-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/fed/fed53124d43c37629295ddc4cdc371f4dc862860

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 ...-define-clash-with-gnulib-s-unlink-module.patch | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/wget/0001-Fix-include-define-clash-with-gnulib-s-unlink-module.patch

diff --git a/package/wget/0001-Fix-include-define-clash-with-gnulib-s-unlink-module.patch b/package/wget/0001-Fix-include-define-clash-with-gnulib-s-unlink-module.patch
new file mode 100644
index 0000000..03c0a61
--- /dev/null
+++ b/package/wget/0001-Fix-include-define-clash-with-gnulib-s-unlink-module.patch
@@ -0,0 +1,71 @@
+From 31ac36e170f4777655451fce10a2fa5b2b27ecd7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Sat, 4 Feb 2017 18:02:54 +0100
+Subject: [PATCH] Fix include/define clash with gnulib's unlink module
+
+* src/options.h: Rename options.unlink to options.unlink_requested
+* src/init.c: Replace options unlink member by unlink_requested
+* src/http.c: Likewise
+* src/ftp.c: Likewise
+---
+ src/ftp.c     | 2 +-
+ src/http.c    | 2 +-
+ src/init.c    | 2 +-
+ src/options.h | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/ftp.c b/src/ftp.c
+index fe09817..2f2866c 100644
+--- a/src/ftp.c
++++ b/src/ftp.c
+@@ -1463,7 +1463,7 @@ Error in server response, closing control connection.\n"));
+       else if (opt.noclobber || opt.always_rest || opt.timestamping || opt.dirstruct
+                || opt.output_document || count > 0)
+         {
+-          if (opt.unlink && file_exists_p (con->target))
++          if (opt.unlink_requested && file_exists_p (con->target))
+             {
+               if (unlink (con->target) < 0)
+                 {
+diff --git a/src/http.c b/src/http.c
+index bd1f115..3c3c8b2 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -2486,7 +2486,7 @@ open_output_stream (struct http_stat *hs, int count, FILE **fp)
+         }
+       else if (ALLOW_CLOBBER || count > 0)
+         {
+-          if (opt.unlink && file_exists_p (hs->local_file))
++          if (opt.unlink_requested && file_exists_p (hs->local_file))
+             {
+               if (unlink (hs->local_file) < 0)
+                 {
+diff --git a/src/init.c b/src/init.c
+index 271bc77..623ef9d 100644
+--- a/src/init.c
++++ b/src/init.c
+@@ -321,7 +321,7 @@ static const struct {
+   { "timestamping",     &opt.timestamping,      cmd_boolean },
+   { "tries",            &opt.ntry,              cmd_number_inf },
+   { "trustservernames", &opt.trustservernames,  cmd_boolean },
+-  { "unlink",           &opt.unlink,            cmd_boolean },
++  { "unlink",           &opt.unlink_requested,  cmd_boolean },
+   { "useaskpass" ,      &opt.use_askpass,       cmd_use_askpass },
+   { "useproxy",         &opt.use_proxy,         cmd_boolean },
+   { "user",             &opt.user,              cmd_string },
+diff --git a/src/options.h b/src/options.h
+index d713acc..8a818ca 100644
+--- a/src/options.h
++++ b/src/options.h
+@@ -61,7 +61,7 @@ struct options
+   bool add_hostdir;             /* Do we add hostname directory? */
+   bool protocol_directories;    /* Whether to prepend "http"/"ftp" to dirs. */
+   bool noclobber;               /* Disables clobbering of existing data. */
+-  bool unlink;                  /* remove file before clobbering */
++  bool unlink_requested;        /* remove file before clobbering */
+   char *dir_prefix;             /* The top of directory tree */
+   char *lfilename;              /* Log filename */
+   char *input_filename;         /* Input filename */
+-- 
+2.6.2
+
-- 
2.6.2
