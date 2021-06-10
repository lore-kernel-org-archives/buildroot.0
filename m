From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:12:32 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/apache: security
 bump version to 2.4.48
Message-ID: <20210610194753.B539D8132C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9c25c425722b180067857d832bc84a80ef5e7a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.48

Fixes CVE-2021-31618:
mod_http2: Fix a potential NULL pointer dereference [Ivan Zhakov]

Removed patch 0004 which is included in upstream release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 351122979b2841560f0e3e5278e183579daa1419)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-ap_log_pid-Use-a-temporary-file-then-re.patch | 77 ----------------------
 package/apache/apache.hash                         |  4 +-
 package/apache/apache.mk                           |  2 +-
 3 files changed, 3 insertions(+), 80 deletions(-)

diff --git a/package/apache/0004-server-log.c-ap_log_pid-Use-a-temporary-file-then-re.patch b/package/apache/0004-server-log.c-ap_log_pid-Use-a-temporary-file-then-re.patch
deleted file mode 100644
index af3cd47a30..0000000000
--- a/package/apache/0004-server-log.c-ap_log_pid-Use-a-temporary-file-then-re.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 5b95d256387b45fbe33f7ee7890ae35afdd5c371 Mon Sep 17 00:00:00 2001
-From: Joe Orton <jorton@apache.org>
-Date: Fri, 13 Mar 2020 14:34:18 +0000
-Subject: [PATCH] * server/log.c (ap_log_pid): Use a temporary file, then
- rename once   successfully written; also add error checking.  Avoids startup 
-  failures if a previous httpd invocation crashed while writing the   pidfile.
-
-Submitted by: Nicolas Carrier <carrier.nicolas0 gmail.com>, jorton
-Github: closes #100, closes #69
-PR: 63140
-
-git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk at 1875153 13f79535-47bb-0310-9956-ffa450edef68
-Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
----
- server/log.c | 33 ++++++++++++++++++++++++++-------
- 1 file changed, 26 insertions(+), 7 deletions(-)
-
-diff --git a/server/log.c b/server/log.c
-index f0bde6e4b8..8d54b4e057 100644
---- a/server/log.c
-+++ b/server/log.c
-@@ -1598,6 +1598,9 @@ AP_DECLARE(void) ap_log_pid(apr_pool_t *p, const char *filename)
-     pid_t mypid;
-     apr_status_t rv;
-     const char *fname;
-+    char *temp_fname;
-+    apr_fileperms_t perms;
-+    char pidstr[64];
- 
-     if (!filename) {
-         return;
-@@ -1626,19 +1629,35 @@ AP_DECLARE(void) ap_log_pid(apr_pool_t *p, const char *filename)
-                       fname);
-     }
- 
--    if ((rv = apr_file_open(&pid_file, fname,
--                            APR_WRITE | APR_CREATE | APR_TRUNCATE,
--                            APR_UREAD | APR_UWRITE | APR_GREAD | APR_WREAD, p))
--        != APR_SUCCESS) {
-+    temp_fname = apr_pstrcat(p, fname, ".XXXXXX", NULL);
-+    rv = apr_file_mktemp(&pid_file, temp_fname,
-+                         APR_FOPEN_WRITE | APR_FOPEN_CREATE | APR_FOPEN_TRUNCATE, p);
-+    if (rv != APR_SUCCESS) {
-         ap_log_error(APLOG_MARK, APLOG_ERR, rv, NULL, APLOGNO(00099)
--                     "could not create %s", fname);
-+                     "could not create %s", temp_fname);
-         ap_log_error(APLOG_MARK, APLOG_ERR, 0, NULL, APLOGNO(00100)
-                      "%s: could not log pid to file %s",
-                      ap_server_argv0, fname);
-         exit(1);
-     }
--    apr_file_printf(pid_file, "%" APR_PID_T_FMT APR_EOL_STR, mypid);
--    apr_file_close(pid_file);
-+
-+    apr_snprintf(pidstr, sizeof pidstr, "%" APR_PID_T_FMT APR_EOL_STR, mypid);
-+
-+    perms = APR_UREAD | APR_UWRITE | APR_GREAD | APR_WREAD;
-+    rv = apr_file_perms_set(temp_fname, perms);    
-+    if (rv == APR_SUCCESS)
-+        rv = apr_file_write_full(pid_file, pidstr, strlen(pidstr), NULL);
-+    if (rv == APR_SUCCESS)
-+        rv = apr_file_close(pid_file);
-+    if (rv == APR_SUCCESS)
-+        rv = apr_file_rename(temp_fname, fname, p);
-+    if (rv != APR_SUCCESS) {
-+        ap_log_error(APLOG_MARK, APLOG_ERR, rv, NULL, APLOGNO(10231)
-+                     "%s: Failed creating pid file %s",
-+                     ap_server_argv0, temp_fname);
-+        exit(1);
-+    }
-+
-     saved_pid = mypid;
- }
- 
--- 
-2.25.2
-
diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index bd3f6ac7ba..c03934b40a 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
 # From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.{sha256,sha512}
-sha256  740eddf6e1c641992b22359cabc66e6325868c3c5e2e3f98faf349b61ecf41ea  httpd-2.4.46.tar.bz2
-sha512  5936784bb662e9d8a4f7fe38b70c043b468114d931cd10ea831bfe74461ea5856b64f88f42c567ab791fc8907640a99884ba4b6a600f86d661781812735b6f13  httpd-2.4.46.tar.bz2
+sha256  1bc826e7b2e88108c7e4bf43c026636f77a41d849cfb667aa7b5c0b86dbf966c  httpd-2.4.48.tar.bz2
+sha512  6c250626f1e7d10428a92d984fd48ff841effcc8705f7816ab71b681bbd51d0012ad158dcd13763fe7d630311f2de258b27574603140d648be42796ab8326724  httpd-2.4.48.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 6b9d18ac00..7dbd1a4512 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.46
+APACHE_VERSION = 2.4.48
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
