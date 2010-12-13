From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 13 Dec 2010 17:09:22 +0100
Subject: [Buildroot] [git commit master 1/1] New package: fbgrab
Message-ID: <20101213161116.127248E1D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f6cdaf5982097e3e2504c3e8209a2cc510a06576
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FBGrab is a framebuffer screenshot program, capturing the linux
frambuffer and converting it to a png-picture.

[Peter: drop zlib dep, add uninstall]
Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                     |    2 +-
 package/Config.in                           |    1 +
 package/fbgrab/Config.in                    |    8 ++++++++
 package/fbgrab/fbgrab-proper_makefile.patch |   23 +++++++++++++++++++++++
 package/fbgrab/fbgrab.mk                    |   18 ++++++++++++++++++
 5 files changed, 51 insertions(+), 1 deletions(-)
 create mode 100644 package/fbgrab/Config.in
 create mode 100644 package/fbgrab/fbgrab-proper_makefile.patch
 create mode 100644 package/fbgrab/fbgrab.mk

diff --git a/CHANGES b/CHANGES
index e346e09..2f602f8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,7 +8,7 @@
 	m4, openssh, openssl, pango, qt, rsync, sdl_gfx, sdl_sound,
 	udev, usbutils, xz, zlib
 
-	New packages: dhrystone, lsuio, rsh-redone, whetstone
+	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/Config.in b/package/Config.in
index 10d8918..b312ce1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -96,6 +96,7 @@ source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
 source "package/divine/Config.in"
 source "package/fbdump/Config.in"
+source "package/fbgrab/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/fbset/Config.in"
 endif
diff --git a/package/fbgrab/Config.in b/package/fbgrab/Config.in
new file mode 100644
index 0000000..ca6c6b7
--- /dev/null
+++ b/package/fbgrab/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FBGRAB
+	bool "fbgrab"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  FBGrab is a framebuffer screenshot program, capturing the linux
+	  frambuffer and converting it to a png-picture.
+
+	  http://hem.bredband.net/gmogmo/fbgrab
diff --git a/package/fbgrab/fbgrab-proper_makefile.patch b/package/fbgrab/fbgrab-proper_makefile.patch
new file mode 100644
index 0000000..e907ed7
--- /dev/null
+++ b/package/fbgrab/fbgrab-proper_makefile.patch
@@ -0,0 +1,23 @@
+[PATCH] fbgrab: A proper Makefile for cross compiling
+
+Respect to the CC, CFLAGS and LDFLAGS is required for cross compiling in
+Buildroot. And there's no need to run the source through splint.
+
+Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
+
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
index 0000000..37f82ea
--- /dev/null
+++ b/package/fbgrab/fbgrab.mk
@@ -0,0 +1,18 @@
+FBGRAB_VERSION = 1.0
+FBGRAB_SOURCE = fbgrab-$(FBGRAB_VERSION).tar.gz
+FBGRAB_SITE = http://hem.bredband.net/gmogmo/fbgrab
+FBGRAB_DEPENDENCIES = libpng
+
+define FBGRAB_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define FBGRAB_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/fbgrab $(TARGET_DIR)/usr/bin/fbgrab
+endef
+
+define FBGRAB_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/fbgrab
+endef
+
+$(eval $(call GENTARGETS,package,fbgrab))
-- 
1.7.2.2
