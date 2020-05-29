From: Joris Offouga <offougajoris@gmail.com>
Date: Fri, 29 May 2020 16:20:12 +0200
Subject: [Buildroot] [PATCH V2 1/2] package/c-periphery: bump version to
 2.2.0
Message-ID: <20200529142012.3869-1-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit "cmake: add cmake build support"
(https://github.com/vsergeev/c-periphery/commit/952e1e906a5d65b78932128af24b7dbb8cce2e9dvsergeev/c-periphery at d0a973c),
c-periphery implement cmake build, so change generic-package instead of cmake-package

The hash of the license file is updated due to an update in the
copyright year:

  - Copyright (c) 2014-2019 vsergeev / Ivan (Vanya) A. Sergeev
  + Copyright (c) 2014-2020 vsergeev / Ivan (Vanya) A. Sergeev

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 change v1-v2:
 - fix correct copyright year 2020

 .../0001-gpio.c-add-__USE_XOPEN-define.patch  | 38 +++++++++++++++++++
 package/c-periphery/c-periphery.hash          |  4 +-
 package/c-periphery/c-periphery.mk            | 16 +-------
 3 files changed, 42 insertions(+), 16 deletions(-)
 create mode 100644 package/c-periphery/0001-gpio.c-add-__USE_XOPEN-define.patch

diff --git a/package/c-periphery/0001-gpio.c-add-__USE_XOPEN-define.patch b/package/c-periphery/0001-gpio.c-add-__USE_XOPEN-define.patch
new file mode 100644
index 0000000000..953165f6bd
--- /dev/null
+++ b/package/c-periphery/0001-gpio.c-add-__USE_XOPEN-define.patch
@@ -0,0 +1,38 @@
+From 7864e15c95c4500fbd8f64fcd543c707202dc09e Mon Sep 17 00:00:00 2001
+From: Joris Offouga <offougajoris@gmail.com>
+Date: Fri, 29 May 2020 13:48:58 +0200
+Subject: [PATCH] gpio.c: add __USE_XOPEN define
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The code needs __USE_XOPEN for some poll() flags.
+
+Fix build with uclibc:
+src/gpio.c: In function gpio_poll_multiple?:
+src/gpio.c:242:61: error: ?POLLRDNORM? undeclared (first use in this function)
+(POLLPRI | POLLERR) : (POLLIN | POLLRDNORM);
+                                ^
+
+Signed-off-by: Joris Offouga <offougajoris@gmail.com>
+[Upstream Status: https://github.com/vsergeev/c-periphery/pull/24]
+---
+ src/gpio.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/gpio.c b/src/gpio.c
+index b4039f1..5c48855 100644
+--- a/src/gpio.c
++++ b/src/gpio.c
+@@ -13,6 +13,8 @@
+ 
+ #include <unistd.h>
+ #include <fcntl.h>
++
++#define __USE_XOPEN
+ #include <poll.h>
+ #include <sys/stat.h>
+ #include <errno.h>
+-- 
+2.20.1
+
diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index 244f8f60f1..208ab5de97 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1c455c42b26818d199ac227cd19714f265623e15d363fdfdf47a2416a4165654  c-periphery-2.1.0.tar.gz
-sha256 e7b9464cb8511f19ddb40f9cf52fe86b3dfe38b2faed9d7bbc3d5707677ffbe3  LICENSE
+sha256 2c1714962f8e4a29ded69f3fc990f4e039162ac9d213a21062a4df9e105b83a4  c-periphery-2.2.0.tar.gz
+sha256 7121a0a2ba36ed9388be2f1a916f0e3584d8e49cc7888fbcfcf83bab2a8bebef  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index bb50434efa..67e637cfc7 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 2.1.0
+C_PERIPHERY_VERSION = 2.2.0
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 # only a static library
@@ -12,16 +12,4 @@ C_PERIPHERY_INSTALL_TARGET = NO
 C_PERIPHERY_LICENSE = MIT
 C_PERIPHERY_LICENSE_FILES = LICENSE
 
-define C_PERIPHERY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-endef
-
-# There is no 'install' rule in the Makefile, so we handle things
-# manually.
-define C_PERIPHERY_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/periphery.a $(STAGING_DIR)/usr/lib/libc-periphery.a
-	mkdir -p $(STAGING_DIR)/usr/include/c-periphery/
-	cp -dpfr $(@D)/src/*.h $(STAGING_DIR)/usr/include/c-periphery/
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.20.1
