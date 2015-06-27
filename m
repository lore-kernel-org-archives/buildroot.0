From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Jun 2015 07:30:34 -0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.1.0
Message-ID: <1435401034-1531-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...c-make-build-conditional-on-having-libmnl.patch | 30 ++++++++++++++++++++++
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 package/iproute2/0001-tipc-make-build-conditional-on-having-libmnl.patch

diff --git a/package/iproute2/0001-tipc-make-build-conditional-on-having-libmnl.patch b/package/iproute2/0001-tipc-make-build-conditional-on-having-libmnl.patch
new file mode 100644
index 0000000..b03c8fb
--- /dev/null
+++ b/package/iproute2/0001-tipc-make-build-conditional-on-having-libmnl.patch
@@ -0,0 +1,30 @@
+From e06edc4c74569fe6bfce9f5113a780bdc1ab11ad Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sat, 27 Jun 2015 07:24:03 -0300
+Subject: [PATCH iproute2] tipc: make build conditional on having libmnl
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ Makefile | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 67176be..8153445 100644
+--- a/Makefile
++++ b/Makefile
+@@ -41,7 +41,11 @@ WFLAGS += -Wmissing-declarations -Wold-style-definition -Wformat=2
+ CFLAGS := $(WFLAGS) $(CCOPTS) -I../include $(DEFINES) $(CFLAGS)
+ YACCFLAGS = -d -t -v
+ 
+-SUBDIRS=lib ip tc bridge misc netem genl tipc man
++SUBDIRS=lib ip tc bridge misc netem genl man
++
++ifeq ($(HAVE_MNL),y)
++SUBDIRS += tipc
++endif
+ 
+ LIBNETLINK=../lib/libnetlink.a ../lib/libutil.a
+ LDLIBS += $(LIBNETLINK)
+-- 
+2.3.6
+
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 336d6b6..659e275 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,2 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	5cd06eb1050b858b308b65705725042bb566fd261135e35a73dafb48cd632618	iproute2-4.0.0.tar.xz
+sha256	d1326696c6a8f81ba66aaf48d858005cf280c81d3284d8d2c99748e3d0746146	iproute2-4.1.0.tar.xz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index a8f4400..023b7bf 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 4.0.0
+IPROUTE2_VERSION = 4.1.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf
-- 
2.3.6
