From: Matthew Weber <matthew.weber@collins.com>
Date: Fri, 21 May 2021 09:41:49 -0500
Subject: [Buildroot] [PATCH] package/nginx: fix NGINX pidfile handling
 systemd
Message-ID: <20210521144149.35725-1-matthew.weber@collins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on https://git.launchpad.net/ubuntu/+source/nginx/plain/debian/patches/nginx-fix-pidfile.patch
Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/nginx/+bug/1581864
Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=876365

Upstream bug: (deferred fix)
https://trac.nginx.org/nginx/ticket/1897?cversion=0&cnum_hist=2

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 .../0010-Fix-NGINX-pidfile-handling.patch     | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 package/nginx/0010-Fix-NGINX-pidfile-handling.patch

diff --git a/package/nginx/0010-Fix-NGINX-pidfile-handling.patch b/package/nginx/0010-Fix-NGINX-pidfile-handling.patch
new file mode 100644
index 0000000000..9a50118434
--- /dev/null
+++ b/package/nginx/0010-Fix-NGINX-pidfile-handling.patch
@@ -0,0 +1,105 @@
+From 2491379370059c7b9a2b956a49c90a9de55f5dcb Mon Sep 17 00:00:00 2001
+From: Tj <ubuntu@iam.tj>
+Date: Fri, 21 May 2021 09:35:53 -0500
+Subject: [PATCH] Fix NGINX pidfile handling
+
+Based on https://git.launchpad.net/ubuntu/+source/nginx/plain/debian/patches/nginx-fix-pidfile.patch
+Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/nginx/+bug/1581864
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=876365
+Last-Update: 2020-06-24
+
+Upstream bug: (deferred fix)
+https://trac.nginx.org/nginx/ticket/1897?cversion=0&cnum_hist=2
+
+Signed-off-by: Tj <ubuntu@iam.tj>
+Signed-off-by: Matthew Weber <matthew.weber@collins.com>
+---
+ src/core/nginx.c         | 24 +++++++++++++++++++++---
+ src/os/unix/ngx_daemon.c |  8 ++++++--
+ 2 files changed, 27 insertions(+), 5 deletions(-)
+
+diff --git a/src/core/nginx.c b/src/core/nginx.c
+index 9fcb0eb..083eba1 100644
+--- a/src/core/nginx.c
++++ b/src/core/nginx.c
+@@ -338,14 +338,21 @@ main(int argc, char *const *argv)
+         ngx_process = NGX_PROCESS_MASTER;
+     }
+ 
++    /* tell-tale to detect if this is parent or child process */
++    ngx_int_t child_pid = NGX_BUSY;
++
+ #if !(NGX_WIN32)
+ 
+     if (ngx_init_signals(cycle->log) != NGX_OK) {
+         return 1;
+     }
+ 
++    /* tell-tale that this code has been executed */
++    child_pid--;
++
+     if (!ngx_inherited && ccf->daemon) {
+-        if (ngx_daemon(cycle->log) != NGX_OK) {
++        child_pid = ngx_daemon(cycle->log);
++        if (child_pid == NGX_ERROR) {
+             return 1;
+         }
+ 
+@@ -358,8 +365,19 @@ main(int argc, char *const *argv)
+ 
+ #endif
+ 
+-    if (ngx_create_pidfile(&ccf->pid, cycle->log) != NGX_OK) {
+-        return 1;
++    /* If ngx_daemon() returned the child's PID in the parent process
++     * after the fork() set ngx_pid to the child_pid, which gets
++     * written to the PID file, then exit.
++     * For NGX_WIN32 always write the PID file
++     * For others, only write it from the parent process */
++    if (child_pid < NGX_OK || child_pid > NGX_OK) {
++	ngx_pid = child_pid > NGX_OK ? child_pid : ngx_pid;
++        if (ngx_create_pidfile(&ccf->pid, cycle->log) != NGX_OK) {
++            return 1;
++	}
++    }
++    if (child_pid > NGX_OK) {
++        exit(0);
+     }
+ 
+     if (ngx_log_redirect_stderr(cycle) != NGX_OK) {
+diff --git a/src/os/unix/ngx_daemon.c b/src/os/unix/ngx_daemon.c
+index 385c49b..3719854 100644
+--- a/src/os/unix/ngx_daemon.c
++++ b/src/os/unix/ngx_daemon.c
+@@ -7,14 +7,17 @@
+ 
+ #include <ngx_config.h>
+ #include <ngx_core.h>
++#include <unistd.h>
+ 
+ 
+ ngx_int_t
+ ngx_daemon(ngx_log_t *log)
+ {
+     int  fd;
++    /* retain the return value for passing back to caller */
++    pid_t pid_child = fork();
+ 
+-    switch (fork()) {
++    switch (pid_child) {
+     case -1:
+         ngx_log_error(NGX_LOG_EMERG, log, ngx_errno, "fork() failed");
+         return NGX_ERROR;
+@@ -23,7 +26,8 @@ ngx_daemon(ngx_log_t *log)
+         break;
+ 
+     default:
+-        exit(0);
++        /* let caller do the exit() */
++        return pid_child;
+     }
+ 
+     ngx_parent = ngx_pid;
+-- 
+2.17.1
+
-- 
2.17.1
