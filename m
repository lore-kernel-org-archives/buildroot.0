From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 20 Sep 2019 15:04:36 +0000
Subject: [Buildroot] [PATCH 1/1] package/apache: atomic creation of pid file.
Message-ID: <20190920150422.23409-1-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

This patch has been submitted upstream, but did receive no answer at all:
  https://bz.apache.org/bugzilla/show_bug.cgi?id=63140

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/apache/0003-corrupt-pid-file.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/apache/0003-corrupt-pid-file.patch

diff --git a/package/apache/0003-corrupt-pid-file.patch b/package/apache/0003-corrupt-pid-file.patch
new file mode 100644
index 0000000000..8208bc1ce5
--- /dev/null
+++ b/package/apache/0003-corrupt-pid-file.patch
@@ -0,0 +1,51 @@
+diff -ur httpd-2.4.35.ref/server/log.c httpd-2.4.35/server/log.c
+--- httpd-2.4.35.ref/server/log.c	2018-06-25 15:24:16.000000000 +0200
++++ httpd-2.4.35/server/log.c	2019-02-04 10:11:22.313157132 +0100
+@@ -1598,6 +1598,8 @@
+     pid_t mypid;
+     apr_status_t rv;
+     const char *fname;
++    char *temp_fname;
++    apr_fileperms_t perms;
+ 
+     if (!filename) {
+         return;
+@@ -1609,6 +1611,10 @@
+                      ap_server_conf, APLOGNO(00097) "Invalid PID file path %s, ignoring.", filename);
+         return;
+     }
++    temp_fname = apr_psprintf(p, "%s.XXXXXX", filename);
++    if (!temp_fname) {
++        return;
++    }
+ 
+     mypid = getpid();
+     if (mypid != saved_pid
+@@ -1626,19 +1632,23 @@
+                       fname);
+     }
+ 
+-    if ((rv = apr_file_open(&pid_file, fname,
+-                            APR_WRITE | APR_CREATE | APR_TRUNCATE,
+-                            APR_UREAD | APR_UWRITE | APR_GREAD | APR_WREAD, p))
++    if ((rv = apr_file_mktemp(&pid_file, temp_fname,
++                              APR_WRITE | APR_CREATE | APR_TRUNCATE, p))
+         != APR_SUCCESS) {
+         ap_log_error(APLOG_MARK, APLOG_ERR, rv, NULL, APLOGNO(00099)
+-                     "could not create %s", fname);
++                     "could not create %s", temp_fname);
+         ap_log_error(APLOG_MARK, APLOG_ERR, 0, NULL, APLOGNO(00100)
+                      "%s: could not log pid to file %s",
+                      ap_server_argv0, fname);
+         exit(1);
+     }
++
++    perms = APR_UREAD | APR_UWRITE | APR_GREAD | APR_WREAD;
++    apr_file_perms_set(temp_fname, perms);
++
+     apr_file_printf(pid_file, "%" APR_PID_T_FMT APR_EOL_STR, mypid);
+     apr_file_close(pid_file);
++    apr_file_rename(temp_fname, fname, p);
+     saved_pid = mypid;
+ }
+ 
-- 
2.20.1
