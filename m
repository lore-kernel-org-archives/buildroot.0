From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 11:06:09 +0200
Subject: [Buildroot] [git commit] package/apache: atomic creation of pid
 file.
Message-ID: <20200413114657.0F9F98E9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67fbb903b60ad4832431d6c47161e312144365a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original pattern for creating the pid file was:
open_create(pid_file)
write(pid_file, pid)
close(pid_file)

But if a power outage occurs between open_create and write, the file will
be empty and httpd will refuse to start afterwards unless the corrupt pid
file is removed.

This patch uses the pattern:
open_create(temp_pid_file)
write(temp_pid_file)
close(temp_pid_file)
rename(temp_pid_file, pid_file)
which is guaranteed to be atomic, provided that temp_pid_file and pid_file
are located in the same file system, which this patch does by creating
a temporary file name with the pattern:
    pid_file_name + random_suffix

Patch is upstream as of
https://github.com/apache/httpd/commit/dd10a9352e87a868ad527022bbafdc3b82cc6d0a,
which will be in the next 2.5.x version.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
[Thomas: update to use upstreamed patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-ap_log_pid-Use-a-temporary-file-then-re.patch | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/package/apache/0004-server-log.c-ap_log_pid-Use-a-temporary-file-then-re.patch b/package/apache/0004-server-log.c-ap_log_pid-Use-a-temporary-file-then-re.patch
new file mode 100644
index 0000000000..af3cd47a30
--- /dev/null
+++ b/package/apache/0004-server-log.c-ap_log_pid-Use-a-temporary-file-then-re.patch
@@ -0,0 +1,77 @@
+From 5b95d256387b45fbe33f7ee7890ae35afdd5c371 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Fri, 13 Mar 2020 14:34:18 +0000
+Subject: [PATCH] * server/log.c (ap_log_pid): Use a temporary file, then
+ rename once   successfully written; also add error checking.  Avoids startup 
+  failures if a previous httpd invocation crashed while writing the   pidfile.
+
+Submitted by: Nicolas Carrier <carrier.nicolas0 gmail.com>, jorton
+Github: closes #100, closes #69
+PR: 63140
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk at 1875153 13f79535-47bb-0310-9956-ffa450edef68
+Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
+---
+ server/log.c | 33 ++++++++++++++++++++++++++-------
+ 1 file changed, 26 insertions(+), 7 deletions(-)
+
+diff --git a/server/log.c b/server/log.c
+index f0bde6e4b8..8d54b4e057 100644
+--- a/server/log.c
++++ b/server/log.c
+@@ -1598,6 +1598,9 @@ AP_DECLARE(void) ap_log_pid(apr_pool_t *p, const char *filename)
+     pid_t mypid;
+     apr_status_t rv;
+     const char *fname;
++    char *temp_fname;
++    apr_fileperms_t perms;
++    char pidstr[64];
+ 
+     if (!filename) {
+         return;
+@@ -1626,19 +1629,35 @@ AP_DECLARE(void) ap_log_pid(apr_pool_t *p, const char *filename)
+                       fname);
+     }
+ 
+-    if ((rv = apr_file_open(&pid_file, fname,
+-                            APR_WRITE | APR_CREATE | APR_TRUNCATE,
+-                            APR_UREAD | APR_UWRITE | APR_GREAD | APR_WREAD, p))
+-        != APR_SUCCESS) {
++    temp_fname = apr_pstrcat(p, fname, ".XXXXXX", NULL);
++    rv = apr_file_mktemp(&pid_file, temp_fname,
++                         APR_FOPEN_WRITE | APR_FOPEN_CREATE | APR_FOPEN_TRUNCATE, p);
++    if (rv != APR_SUCCESS) {
+         ap_log_error(APLOG_MARK, APLOG_ERR, rv, NULL, APLOGNO(00099)
+-                     "could not create %s", fname);
++                     "could not create %s", temp_fname);
+         ap_log_error(APLOG_MARK, APLOG_ERR, 0, NULL, APLOGNO(00100)
+                      "%s: could not log pid to file %s",
+                      ap_server_argv0, fname);
+         exit(1);
+     }
+-    apr_file_printf(pid_file, "%" APR_PID_T_FMT APR_EOL_STR, mypid);
+-    apr_file_close(pid_file);
++
++    apr_snprintf(pidstr, sizeof pidstr, "%" APR_PID_T_FMT APR_EOL_STR, mypid);
++
++    perms = APR_UREAD | APR_UWRITE | APR_GREAD | APR_WREAD;
++    rv = apr_file_perms_set(temp_fname, perms);    
++    if (rv == APR_SUCCESS)
++        rv = apr_file_write_full(pid_file, pidstr, strlen(pidstr), NULL);
++    if (rv == APR_SUCCESS)
++        rv = apr_file_close(pid_file);
++    if (rv == APR_SUCCESS)
++        rv = apr_file_rename(temp_fname, fname, p);
++    if (rv != APR_SUCCESS) {
++        ap_log_error(APLOG_MARK, APLOG_ERR, rv, NULL, APLOGNO(10231)
++                     "%s: Failed creating pid file %s",
++                     ap_server_argv0, temp_fname);
++        exit(1);
++    }
++
+     saved_pid = mypid;
+ }
+ 
+-- 
+2.25.2
+
