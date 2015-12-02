From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Dec 2015 07:34:07 -0300
Subject: [Buildroot] [PATCH] p11-kit: bump to version 0.23.1
Message-ID: <1449052447-653-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's required for the new gnutls version, fixes:
http://autobuild.buildroot.net/results/3ec/3ecac965455dc169162cbdb50f8ff07e2880e504/

Patch status: repoted upstream:
https://bugs.freedesktop.org/show_bug.cgi?id=93211

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ansport.c-include-sys-select.h-for-fd_set.patch | 36 ++++++++++++++++++++++
 package/p11-kit/p11-kit.hash                       |  2 +-
 package/p11-kit/p11-kit.mk                         |  2 +-
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 package/p11-kit/0002-rpc-transport.c-include-sys-select.h-for-fd_set.patch

diff --git a/package/p11-kit/0002-rpc-transport.c-include-sys-select.h-for-fd_set.patch b/package/p11-kit/0002-rpc-transport.c-include-sys-select.h-for-fd_set.patch
new file mode 100644
index 0000000..bff732c
--- /dev/null
+++ b/package/p11-kit/0002-rpc-transport.c-include-sys-select.h-for-fd_set.patch
@@ -0,0 +1,36 @@
+From 1071268d06da269de56c895af940e6f15bcf79e7 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 2 Dec 2015 07:15:43 -0300
+Subject: [PATCH] rpc-transport.c: include sys/select.h for fd_set
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fd_set and friends, according to POSIX.1-2001, needs sys/select.h, so
+include it otherwise the build fails for uClibc:
+
+p11-kit/rpc-transport.c: In function ?rpc_socket_read?:
+p11-kit/rpc-transport.c:350:2: error: unknown type name ?fd_set?
+p11-kit/rpc-transport.c:416:4: warning: implicit declaration of function
+?FD_ZERO? [-Wimplicit-function-declaration]
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ p11-kit/rpc-transport.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/p11-kit/rpc-transport.c b/p11-kit/rpc-transport.c
+index 7176b39..5251e11 100644
+--- a/p11-kit/rpc-transport.c
++++ b/p11-kit/rpc-transport.c
+@@ -55,6 +55,7 @@
+ #include <string.h>
+ 
+ #ifdef OS_UNIX
++#include <sys/select.h>
+ #include <sys/socket.h>
+ #include <sys/wait.h>
+ #include <sys/un.h>
+-- 
+2.4.10
+
diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 955b890..d43a8fd 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	68405492fe466b33927d461302aa98e703db3b8a596411585508bc33084484d2	p11-kit-0.20.7.tar.gz
+sha256	e57371669f3b157141b86c429bd9c29741994b2f5ff115fcb8a03e751b0f6ac4	p11-kit-0.23.1.tar.gz
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index d661c1f..03d26e2 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.20.7
+P11_KIT_VERSION = 0.23.1
 P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
 P11_KIT_DEPENDENCIES = host-pkgconf libffi libtasn1
 P11_KIT_INSTALL_STAGING = YES
-- 
2.4.10
