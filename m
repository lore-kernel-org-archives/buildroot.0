From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 23:21:01 +0200
Subject: [Buildroot] [git commit] package/nginx: fix dlopen support
Message-ID: <20160513212128.DA1E081FAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d02cc629caf9c58680c13bc306b23441530116d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only include dlfcn.h on systems that support it

This fixes:
 http://autobuild.buildroot.net/results/f72a9a81e21166af20332d835d71651be7c016c3/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-ngx_linux_config.h-only-include-dlfcn.h-.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch b/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
new file mode 100644
index 0000000..a6f7c0d
--- /dev/null
+++ b/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
@@ -0,0 +1,33 @@
+From 8dc9dffc1f99ac951865f3135dfb5061a08d1f85 Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Fri, 6 May 2016 16:29:17 +0100
+Subject: [PATCH 8/8] src/os/unix/ngx_linux_config.h: only include dlfcn.h if
+ available
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ src/os/unix/ngx_linux_config.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/os/unix/ngx_linux_config.h b/src/os/unix/ngx_linux_config.h
+index 2f6129d..4244086 100644
+--- a/src/os/unix/ngx_linux_config.h
++++ b/src/os/unix/ngx_linux_config.h
+@@ -55,10 +55,12 @@
+ #include <crypt.h>
+ #include <sys/utsname.h>        /* uname() */
+ 
+-#include <dlfcn.h>
++#include <ngx_auto_config.h>
+ 
+ 
+-#include <ngx_auto_config.h>
++#if (NGX_HAVE_DLOPEN)
++#include <dlfcn.h>
++#endif
+ 
+ 
+ #if (NGX_HAVE_POSIX_SEM)
+-- 
+2.8.2
+
