From: Martin Bark <martin@barkynet.com>
Date: Mon,  9 May 2016 12:29:02 +0100
Subject: [Buildroot] [PATCH 4/5] package/nginx: fix dlopen support
In-Reply-To: <1462793343-20234-1-git-send-email-martin@barkynet.com>
References: <1462793343-20234-1-git-send-email-martin@barkynet.com>
Message-ID: <1462793343-20234-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only include dlfcn.h on systems that support it

This fixes:
 http://autobuild.buildroot.net/results/f72a9a81e21166af20332d835d71651be7c016c3/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 ...-ngx_linux_config.h-only-include-dlfcn.h-.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch

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
-- 
2.8.2
