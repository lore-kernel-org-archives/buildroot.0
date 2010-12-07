From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Wed,  8 Dec 2010 00:22:50 +0100
Subject: [Buildroot] [PATCH] New package: fbgrab
Message-ID: <1291764170-11947-1-git-send-email-daniel.nystrom@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FBGrab is a framebuffer screenshot program, capturing the linux frambuffer and converting it to a png-picture.

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
---
 package/Config.in                           |    1 +
 package/fbgrab/Config.in                    |    8 ++++++++
 package/fbgrab/fbgrab-proper_makefile.patch |   16 ++++++++++++++++
 package/fbgrab/fbgrab.mk                    |   16 ++++++++++++++++
 4 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/fbgrab/Config.in
 create mode 100644 package/fbgrab/fbgrab-proper_makefile.patch
 create mode 100644 package/fbgrab/fbgrab.mk

diff --git a/package/Config.in b/package/Config.in
index 08ffda6..2618ecb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -94,6 +94,7 @@ source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
 source "package/divine/Config.in"
 source "package/fbdump/Config.in"
+source "package/fbgrab/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/fbset/Config.in"
 endif
diff --git a/package/fbgrab/Config.in b/package/fbgrab/Config.in
new file mode 100644
index 0000000..0ede91e
--- /dev/null
+++ b/package/fbgrab/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FBGRAB
+	bool "fbgrab"
+	select BR2_PACKAGE_LIBPNG
+        select BR2_PACKAGE_ZLIB
+	help
+	  FBGrab is a framebuffer screenshot program, capturing the linux frambuffer and converting it to a png-picture.
+
+	  http://hem.bredband.net/gmogmo/fbgrab
diff --git a/package/fbgrab/fbgrab-proper_makefile.patch b/package/fbgrab/fbgrab-proper_makefile.patch
new file mode 100644
index 0000000..8f7919e
--- /dev/null
+++ b/package/fbgrab/fbgrab-proper_makefile.patch
@@ -0,0 +1,16 @@
+--- fbgrab-1.0.orig/Makefile	2010-12-07 22:57:24.000000000 +0100
++++ fbgrab-1.0/Makefile	2010-12-07 22:58:36.000000000 +0100
+@@ -3,9 +3,10 @@
+ ### modular. So this is a simple gnu Makefile...
+ ###
+ 
+-fbgrab: fbgrab.c
+-	splint +posixlib fbgrab.c
+-	gcc -g -Wall fbgrab.c -lpng -lz -o fbgrab
++LDFLAGS += -lpng -lz
++
++fbgrab: fbgrab.o
++	$(CC) $(LDFLAGS) fbgrab.o -o $@
+ 
+ install:
+ 	strip fbgrab
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
new file mode 100644
index 0000000..459fd37
--- /dev/null
+++ b/package/fbgrab/fbgrab.mk
@@ -0,0 +1,16 @@
+FBGRAB_VERSION = 1.0
+FBGRAB_SOURCE = fbgrab-$(FBGRAB_VERSION).tar.gz
+FBGRAB_SITE = http://hem.bredband.net/gmogmo/fbgrab
+FBGRAB_DEPENDENCIES = libpng zlib
+
+define FBGRAB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_LD)"
+endef
+
+define FBGRAB_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/fbgrab $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(call GENTARGETS,package,fbgrab))
-- 
1.7.1
