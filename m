From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 16 Jun 2012 22:40:15 +0200
Subject: [Buildroot] [git commit] lshw: new package
Message-ID: <20120616205908.7BD8B96F46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c75e768d7945d0b760e176ee9d2cc93796078870
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/lshw/Config.in           |   13 +++++++++++++
 package/lshw/lshw-add-LIBS.patch |   30 ++++++++++++++++++++++++++++++
 package/lshw/lshw.mk             |   23 +++++++++++++++++++++++
 4 files changed, 67 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d047ce8..263df2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -203,6 +203,7 @@ source "package/kbd/Config.in"
 source "package/lcdproc/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/lm-sensors/Config.in"
+source "package/lshw/Config.in"
 source "package/lsuio/Config.in"
 source "package/lvm2/Config.in"
 source "package/makedevs/Config.in"
diff --git a/package/lshw/Config.in b/package/lshw/Config.in
new file mode 100644
index 0000000..4960ac9
--- /dev/null
+++ b/package/lshw/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LSHW
+	bool "lshw"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	help
+	  lshw (Hardware Lister) is a small tool to provide
+	  detailed information on the hardware configuration of the machine.
+
+	  http://ezix.org/project/wiki/HardwareLiSter
+
+comment "lshw requires a toolchain with C++, LARGEFILE & WCHAR support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/lshw/lshw-add-LIBS.patch b/package/lshw/lshw-add-LIBS.patch
new file mode 100644
index 0000000..70b2a5b
--- /dev/null
+++ b/package/lshw/lshw-add-LIBS.patch
@@ -0,0 +1,30 @@
+We need to be able to pass extra LIBS when our toolchain lacks NLS support,
+this way we can build libintl and link to it.
+A good example is uClibc with locale support disabled.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura lshw-B.02.16.orig/src/gui/Makefile lshw-B.02.16/src/gui/Makefile
+--- lshw-B.02.16.orig/src/gui/Makefile	2012-05-28 12:32:49.303885759 -0300
++++ lshw-B.02.16/src/gui/Makefile	2012-05-28 12:33:33.850206001 -0300
+@@ -11,7 +11,7 @@
+ CXXFLAGS=-g -Wall $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
+ CFLAGS=$(CXXFLAGS) $(DEFINES)
+ GTKLIBS=$(shell pkg-config gtk+-2.0 gmodule-2.0 --libs)
+-LIBS=-L../core -llshw -lresolv -lsqlite3 $(GTKLIBS)
++LIBS+=-L../core -llshw -lresolv -lsqlite3 $(GTKLIBS)
+ LDFLAGS=
+ ifneq ($(shell $(LD) --help 2| grep -- --as-needed), )
+ 	LDFLAGS+= -Wl,--as-needed
+diff -Nura lshw-B.02.16.orig/src/Makefile lshw-B.02.16/src/Makefile
+--- lshw-B.02.16.orig/src/Makefile	2012-05-28 12:32:49.292885680 -0300
++++ lshw-B.02.16/src/Makefile	2012-05-28 12:33:24.530139060 -0300
+@@ -30,7 +30,7 @@
+ 	LDFLAGS+= -Wl,--as-needed
+ endif
+ LDSTATIC=-static
+-LIBS=-llshw -lresolv
++LIBS+=-llshw -lresolv
+ ifeq ($(SQLITE), 1)
+ 	LIBS+= $(shell pkg-config --libs sqlite3)
+ endif
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
new file mode 100644
index 0000000..8b4fcc6
--- /dev/null
+++ b/package/lshw/lshw.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# lshw
+#
+#############################################################
+
+LSHW_VERSION = B.02.16
+LSHW_SITE = http://ezix.org/software/files
+LSHW_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) AR=$(TARGET_AR) \
+	RPM_OPT_FLAGS="$(TARGET_CFLAGS)" all
+LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_GETTEXT),-lintl)"
+LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),libintl)
+
+define LSHW_BUILD_CMDS
+	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPT)
+endef
+
+define LSHW_INSTALL_TARGET_CMDS
+	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
+		$(LSHW_MAKE_OPT) install
+endef
+
+$(eval $(call GENTARGETS))
