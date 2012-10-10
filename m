From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Oct 2012 14:44:34 +0200
Subject: [Buildroot] [git commit] fb-test-app: new package
Message-ID: <20121010125600.61FDE99808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbfa50f3ead1f19e4d0bb9dcb7364d58225be139
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test suite for Linux framebuffer.

[Peter: add patch to build with our TARGET_CFLAGS]
Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/fb-test-app/Config.in                      |    6 +++
 .../fb-test-app/fb-test-app-override-cflags.patch  |   35 ++++++++++++++++++++
 package/fb-test-app/fb-test-app.mk                 |   34 +++++++++++++++++++
 4 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 331d879..fc6a26a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -118,6 +118,7 @@ source "package/fbset/Config.in"
 endif
 source "package/fbterm/Config.in"
 source "package/fbv/Config.in"
+source "package/fb-test-app/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
diff --git a/package/fb-test-app/Config.in b/package/fb-test-app/Config.in
new file mode 100644
index 0000000..23b5568
--- /dev/null
+++ b/package/fb-test-app/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_FB_TEST_APP
+	bool "fb-test-app"
+	help
+	  Test suite for Linux framebuffer.
+
+	  https://github.com/prpplague/fb-test-app
diff --git a/package/fb-test-app/fb-test-app-override-cflags.patch b/package/fb-test-app/fb-test-app-override-cflags.patch
new file mode 100644
index 0000000..550ca6e
--- /dev/null
+++ b/package/fb-test-app/fb-test-app-override-cflags.patch
@@ -0,0 +1,35 @@
+From deb5143e8e4580d7767de59a2e983dda262b0669 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Wed, 10 Oct 2012 14:38:13 +0200
+Subject: [PATCH] allow custom CFLAGS to passed on the make command line
+
+Ensure the required CFLAGS are appended to what is provided on the
+command line.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Makefile |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 057d539..c3102ea 100644
+--- a/Makefile
++++ b/Makefile
+@@ -11,10 +11,10 @@ else
+ 	CFLAGS=-O2 -Wall
+ endif
+ 
+-CFLAGS += -DVERSION=$(VERSION)
+-CFLAGS += -DPATCHLEVEL=$(PATCHLEVEL)
+-CFLAGS += -DSUBLEVEL=$(SUBLEVEL)
+-CFLAGS += -DVERSION_NAME=\"$(NAME)\"
++override CFLAGS += -DVERSION=$(VERSION)
++override CFLAGS += -DPATCHLEVEL=$(PATCHLEVEL)
++override CFLAGS += -DSUBLEVEL=$(SUBLEVEL)
++override CFLAGS += -DVERSION_NAME=\"$(NAME)\"
+ 
+ PROGS=perf rect fb-test offset
+ 
+-- 
+1.7.10.4
+
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
new file mode 100644
index 0000000..35e210b
--- /dev/null
+++ b/package/fb-test-app/fb-test-app.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# fb-test-app
+#
+#############################################################
+
+FB_TEST_APP_VERSION = v1.0.0
+FB_TEST_APP_SITE = http://github.com/prpplague/fb-test-app/tarball/$(FB_TEST_APP_VERSION)
+FB_TEST_APP_LICENSE = GPLv2
+FB_TEST_APP_LICENSE_FILE = COPYING
+
+define FB_TEST_APP_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define FB_TEST_APP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/perf $(TARGET_DIR)/usr/bin/fb-test-perf
+	$(INSTALL) -D -m 0755 $(@D)/rect $(TARGET_DIR)/usr/bin/fb-test-rect
+	$(INSTALL) -D -m 0755 $(@D)/fb-test $(TARGET_DIR)/usr/bin/fb-test
+	$(INSTALL) -D -m 0755 $(@D)/offset $(TARGET_DIR)/usr/bin/fb-test-offset
+endef
+
+define FB_TEST_APP_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/fb-test-perf
+	rm -f $(TARGET_DIR)/usr/bin/fb-test-rect
+	rm -f $(TARGET_DIR)/usr/bin/fb-test
+	rm -f $(TARGET_DIR)/usr/bin/fb-test-offset
+endef
+
+define FB_TEST_APP_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
