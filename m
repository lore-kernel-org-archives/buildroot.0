From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 23 Nov 2014 18:19:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/nginx: fix build failure
In-Reply-To: <1416763150-28951-1-git-send-email-s.martin49@gmail.com>
References: <1416763150-28951-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1416763150-28951-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sysctl syscall may not be enabled in the kernel config, so do a build-test
to enable/disable sysctl function call.

Fixes:
  http://autobuild.buildroot.org/results/730/730105fc0a89b381b3b29192d07f28ef1f13cbb3/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...inux-add-check-for-sysctl-sycall-presence.patch | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 package/nginx/0006-linux-add-check-for-sysctl-sycall-presence.patch

diff --git a/package/nginx/0006-linux-add-check-for-sysctl-sycall-presence.patch b/package/nginx/0006-linux-add-check-for-sysctl-sycall-presence.patch
new file mode 100644
index 0000000..c71e928
--- /dev/null
+++ b/package/nginx/0006-linux-add-check-for-sysctl-sycall-presence.patch
@@ -0,0 +1,87 @@
+Fetched from: http://mailman.nginx.org/pipermail/nginx-devel/2014-November/006284.html
+---
+
+linux: add check for sysctl sycall presence
+
+And also disable call to the sysctl function when the sysctl syscall
+is disabled in the kernel configuration.
+
+This fixes:
+  http://autobuild.buildroot.org/results/730/730105fc0a89b381b3b29192d07f28ef1f13cbb3/build-end.log
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+diff -r 1be88123e98c -r 41f4a5daf486 auto/os/linux
+--- a/auto/os/linux	Sat Aug 02 00:30:55 2014 +0200
++++ b/auto/os/linux	Sun Nov 23 17:17:05 2014 +0100
+@@ -44,6 +44,20 @@
+     have=NGX_HAVE_POSIX_FADVISE . auto/nohave
+ fi
+ 
++# sysctl syscall
++
++ngx_feature="sysctl_syscall"
++ngx_feature_name="NGX_HAVE_SYSCTL_SYSCALL"
++ngx_feature_run=no
++ngx_feature_run_force_result="$ngx_force_have_sysctl_syscall"
++ngx_feature_incs="#include <sys/sysctl.h>"
++ngx_feature_path=
++ngx_feature_libs=
++ngx_feature_test="int name[2] = { CTL_KERN, KERN_RTSIGMAX };
++                  int old;
++                  sysctl(name, 2, &old, sizeof(old), NULL, 0);"
++. auto/feature
++
+ # epoll, EPOLLET version
+ 
+ ngx_feature="epoll"
+diff -r 1be88123e98c -r 41f4a5daf486 src/event/modules/ngx_rtsig_module.c
+--- a/src/event/modules/ngx_rtsig_module.c	Sat Aug 02 00:30:55 2014 +0200
++++ b/src/event/modules/ngx_rtsig_module.c	Sun Nov 23 17:17:05 2014 +0100
+@@ -621,6 +621,7 @@
+ 
+         if (tested >= rtscf->overflow_test) {
+ 
++#if (NGX_HAVE_SYSCTL_SYSCALL)
+             if (ngx_linux_rtsig_max) {
+ 
+                 /*
+@@ -668,7 +669,9 @@
+                 }
+ 
+             } else {
+-
++#else
++            {
++#endif
+                 /*
+                  * Linux has not KERN_RTSIGMAX since 2.6.6-mm2
+                  * so drain the rt signal queue unconditionally
+diff -r 1be88123e98c -r 41f4a5daf486 src/os/unix/ngx_linux_config.h
+--- a/src/os/unix/ngx_linux_config.h	Sat Aug 02 00:30:55 2014 +0200
++++ b/src/os/unix/ngx_linux_config.h	Sun Nov 23 17:17:05 2014 +0100
+@@ -84,8 +84,10 @@
+ 
+ #if (NGX_HAVE_RTSIG)
+ #include <poll.h>
++#if (NGX_HAVE_SYSCTL_SYSCALL)
+ #include <sys/sysctl.h>
+ #endif
++#endif
+ 
+ 
+ #if (NGX_HAVE_EPOLL)
+diff -r 1be88123e98c -r 41f4a5daf486 src/os/unix/ngx_linux_init.c
+--- a/src/os/unix/ngx_linux_init.c	Sat Aug 02 00:30:55 2014 +0200
++++ b/src/os/unix/ngx_linux_init.c	Sun Nov 23 17:17:05 2014 +0100
+@@ -46,7 +46,7 @@
+     (void) ngx_cpystrn(ngx_linux_kern_osrelease, (u_char *) u.release,
+                        sizeof(ngx_linux_kern_osrelease));
+ 
+-#if (NGX_HAVE_RTSIG)
++#if (NGX_HAVE_RTSIG) && (NGX_HAVE_SYSCTL_SYSCALL)
+     {
+     int        name[2];
+     size_t     len;
+
+
-- 
2.1.3
