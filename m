From: Qais Yousef <qais.yousef@imgtec.com>
Date: Wed, 4 Apr 2012 12:16:00 +0100
Subject: [Buildroot] [PATCH v2] New Package: latencytop
Message-ID: <1333538160-14091-1-git-send-email-qais.yousef@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version uses $(TARGET_CONFIGURE_OPTS) instead of setting CC, LD
and PKG_CONFIG ourselves.


Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 package/Config.in                            |    1 +
 package/latencytop/Config.in                 |   15 ++++++++
 package/latencytop/latencytop-makefile.patch |   46 ++++++++++++++++++++++++++
 package/latencytop/latencytop.mk             |   21 ++++++++++++
 4 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 package/latencytop/Config.in
 create mode 100644 package/latencytop/latencytop-makefile.patch
 create mode 100644 package/latencytop/latencytop.mk

diff --git a/package/Config.in b/package/Config.in
index e1629c8..24e43f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -37,6 +37,7 @@ source "package/strace/Config.in"
 source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
 source "package/pv/Config.in"
+source "package/latencytop/Config.in"
 endmenu
 
 menu "Development tools"
diff --git a/package/latencytop/Config.in b/package/latencytop/Config.in
new file mode 100644
index 0000000..1c120c6
--- /dev/null
+++ b/package/latencytop/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LATENCYTOP
+	bool "latencytop"
+	help
+	  There are many types and causes of latency. LatencyTOP
+	  focuses on the type of latency that causes skips in audio,
+	  stutters in your desktop experience or that overloads your
+	  server (while you have plenty of CPU power left).
+
+	  LatencyTOP focuses on the cases where the applications want
+	  to run and execute useful code, but there's some resource
+	  that's not currently available (and the kernel then blocks
+	  the process). This is done both on a system level and on a
+	  per process level, so that you can see what's happening to
+	  the system, and which process is suffering and/or causing
+	  the delays.
diff --git a/package/latencytop/latencytop-makefile.patch b/package/latencytop/latencytop-makefile.patch
new file mode 100644
index 0000000..25be244
--- /dev/null
+++ b/package/latencytop/latencytop-makefile.patch
@@ -0,0 +1,46 @@
+pkg-config and gcc are always used, which prevents cross compiling.
+Use env variables to override the default behaviour.
+
+Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
+
+--- latencytop-0.5/Makefile.old	2012-04-03 14:42:09.135328435 +0100
++++ latencytop-0.5/Makefile	2012-04-03 15:05:47.878234542 +0100
+@@ -1,16 +1,17 @@
+ # FIXME: Use autoconf ?
+-HAS_GTK_GUI = 1
++HAS_GTK_GUI ?= 1
+ 
+-DESTDIR =
+-SBINDIR = /usr/sbin
+-XCFLAGS = -W  -g `pkg-config --cflags glib-2.0` -D_FORTIFY_SOURCE=2 -Wno-sign-compare
+-LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncursesw 
++DESTDIR ?=
++SBINDIR ?= /usr/sbin
++PKG_CONFIG ?= pkg-config
++XCFLAGS += -W  -g `$(PKG_CONFIG) --cflags glib-2.0` -D_FORTIFY_SOURCE=2 -Wno-sign-compare
++LDFLAGS += -Wl,--as-needed `$(PKG_CONFIG) --libs glib-2.0`   -lncurses 
+ 
+ OBJS= latencytop.o text_display.o translate.o fsync.o
+ 
+-ifdef HAS_GTK_GUI
+-  XCFLAGS += `pkg-config --cflags gtk+-2.0` -DHAS_GTK_GUI
+-  LDF += `pkg-config --libs gtk+-2.0`
++ifeq (HAS_GTK_GUI, 1)
++  XCFLAGS += `$(PKG_CONFIG) --cflags gtk+-2.0` -DHAS_GTK_GUI
++  LDFLAGS += `$(PKG_CONFIG) --libs gtk+-2.0`
+   OBJS += gtk_display.o 
+ endif
+ 
+@@ -26,10 +27,10 @@
+ 
+ # We write explicity this "implicit rule"
+ %.o : %.c
+-	gcc -c $(CFLAGS) $(XCFLAGS) $< -o $@
++	$(CC) -c $(CFLAGS) $(XCFLAGS) $< -o $@
+ 
+ latencytop:  $(OBJS) latencytop.h Makefile
+-	gcc $(CFLAGS) $(OBJS) $(LDF) -o latencytop 
++	$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) -o latencytop 
+ 
+ clean:
+ 	rm -f *~ latencytop DEADJOE *.o
diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
new file mode 100644
index 0000000..f55a564
--- /dev/null
+++ b/package/latencytop/latencytop.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# latencytop
+#
+#############################################################
+
+LATENCYTOP_VERSION = 0.5
+LATENCYTOP_SITE = http://www.latencytop.org/download/
+LATENCYTOP_DEPENDENCIES = libglib2 ncurses
+
+# NOTE: GTK is heavy weight, we intentionally build the text (ncurses)
+# version only
+define LATENCYTOP_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) HAS_GTK_GUI=0 -C $(@D)
+endef
+
+define LATENCYTOP_INSTALL_TARGET_CMDS
+	$(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.1
