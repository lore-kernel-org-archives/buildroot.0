From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  3 Dec 2012 17:12:13 +0100
Subject: [Buildroot] [PATCH 3/4] linenoise: new package
In-Reply-To: <1354551135-30056-1-git-send-email-francois.perrad@gadz.org>
References: <1354551135-30056-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1354551135-30056-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                             |    1 +
 package/linenoise/Config.in                   |    6 ++++
 package/linenoise/linenoise-get-columns.patch |   17 ++++++++++
 package/linenoise/linenoise.mk                |   45 +++++++++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 package/linenoise/Config.in
 create mode 100644 package/linenoise/linenoise-get-columns.patch
 create mode 100644 package/linenoise/linenoise.mk

diff --git a/package/Config.in b/package/Config.in
index 5ba1f05..6117716 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -523,6 +523,7 @@ menu "Text and terminal handling"
 source "package/enchant/Config.in"
 source "package/icu/Config.in"
 source "package/libiconv/Config.in"
+source "package/linenoise/Config.in"
 source "package/ncurses/Config.in"
 source "package/newt/Config.in"
 source "package/pcre/Config.in"
diff --git a/package/linenoise/Config.in b/package/linenoise/Config.in
new file mode 100644
index 0000000..8e4ab91
--- /dev/null
+++ b/package/linenoise/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LINENOISE
+	bool "linenoise"
+	help
+	  A small self-contained alternative to readline and libedit
+
+	  https://github.com/antirez/linenoise
diff --git a/package/linenoise/linenoise-get-columns.patch b/package/linenoise/linenoise-get-columns.patch
new file mode 100644
index 0000000..180d1c3
--- /dev/null
+++ b/package/linenoise/linenoise-get-columns.patch
@@ -0,0 +1,17 @@
+see http://github.com/antirez/linenoise/pull/31
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/linenoise.c
+===================================================================
+--- a/linenoise.c
++++ b/linenoise.c
+@@ -182,7 +182,7 @@
+ static int getColumns(void) {
+     struct winsize ws;
+ 
+-    if (ioctl(1, TIOCGWINSZ, &ws) == -1) return 80;
++    if (ioctl(1, TIOCGWINSZ, &ws) == -1 || ws.ws_col == 0) return 80;
+     return ws.ws_col;
+ }
+ 
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
new file mode 100644
index 0000000..e7b6124
--- /dev/null
+++ b/package/linenoise/linenoise.mk
@@ -0,0 +1,45 @@
+#############################################################
+#
+# linenoise
+#
+#############################################################
+LINENOISE_VERSION = g8c9b481
+LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/master
+LINENOISE_LICENSE = BSD-2c
+LINENOISE_INSTALL_STAGING = YES
+
+define LINENOISE_BUILD_CMDS
+	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) -c linenoise.c
+	cd $(@D); $(TARGET_AR) rcu liblinenoise.a linenoise.o
+	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) -o linenoise_example example.c -L. -llinenoise
+endef
+
+define LINENOISE_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 644 -D $(@D)/linenoise.h          $(STAGING_DIR)/usr/include/linenoise.h
+	$(INSTALL) -m 644 -D $(@D)/liblinenoise.a       $(STAGING_DIR)/usr/lib/liblinenoise.a
+	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(STAGING_DIR)/usr/bin/linenoise_example
+endef
+
+define LINENOISE_UNINSTALL_STAGING_CMDS
+	rm -f   $(STAGING_DIR)/usr/include/linenoise.h
+	rm -f   $(STAGING_DIR)/usr/lib/liblinenoise.a
+	rm -f   $(STAGING_DIR)/usr/bin/linenoise_example
+endef
+
+define LINENOISE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/linenoise.h          $(TARGET_DIR)/usr/include/linenoise.h
+	$(INSTALL) -m 644 -D $(@D)/liblinenoise.a       $(TARGET_DIR)/usr/lib/liblinenoise.a
+	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(TARGET_DIR)/usr/bin/linenoise_example
+endef
+
+define LINENOISE_UNINSTALL_TARGET_CMDS
+	rm -f   $(TARGET_DIR)/usr/include/linenoise.h
+	rm -f   $(TARGET_DIR)/usr/lib/liblinenoise.a
+	rm -f   $(TARGET_DIR)/usr/bin/linenoise_example
+endef
+
+define LINENOISE_CLEAN_CMDS
+	rm -f $(@D)/*.o $(@D)/*.a $(@D)/linenoise_example
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
