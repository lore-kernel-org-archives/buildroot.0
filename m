From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  4 Dec 2015 21:01:22 +0100
Subject: [Buildroot] [PATCH v4] wiringpi: new package
Message-ID: <1449259282-5663-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix typo in commit message (wirinpi vs wiringpi)

Changes v2 -> v3:
  - moved from Hardware to Libraries/Hardware handling (suggested by Thomas Petazzoni)
  - add comment header (suggested by Thomas Petazzoni)
  - use original buildsystem install targets for libraries
  - rework the complete build/install (and add static build)
  - ...

Changes v3 -> v4:
  - add license information (suggested by Thomas Petazzoni)
  - bump version from 2.29 to 2.31
---
 package/Config.in                                  |   1 +
 .../wiringpi/0001-Adjust-for-buildroot-build.patch | 123 +++++++++++++++++++++
 package/wiringpi/Config.in                         |   6 +
 package/wiringpi/wiringpi.mk                       |  45 ++++++++
 4 files changed, 175 insertions(+)
 create mode 100644 package/wiringpi/0001-Adjust-for-buildroot-build.patch
 create mode 100644 package/wiringpi/Config.in
 create mode 100644 package/wiringpi/wiringpi.mk

diff --git a/package/Config.in b/package/Config.in
index bdc3063..4a7f637 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -900,6 +900,7 @@ menu "Hardware handling"
 	source "package/pcsc-lite/Config.in"
 	source "package/tslib/Config.in"
 	source "package/urg/Config.in"
+	source "package/wiringpi/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/wiringpi/0001-Adjust-for-buildroot-build.patch b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
new file mode 100644
index 0000000..4add46e
--- /dev/null
+++ b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
@@ -0,0 +1,123 @@
+From a16012bf4ea63f714468d80ebe101481c917e4b8 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 2 Dec 2015 00:22:26 +0100
+Subject: [PATCH] Adjust for buildroot build.
+
+ - enable CC override
+ - fix devLib/gpio include path for local build (without installing first)
+ - change CFLAGS from '=' to '+=' to honour buildroot given flags
+ - add linker name link for libwiringPiDev and libwiringPi for local linking
+   (without installing first)
+ - fix install linker name link (do not link with absolute path)
+ - add gpio-static linking target
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ devLib/Makefile   |  9 +++++----
+ gpio/Makefile     | 12 ++++++++----
+ wiringPi/Makefile |  7 ++++---
+ 3 files changed, 17 insertions(+), 11 deletions(-)
+
+diff --git a/devLib/Makefile b/devLib/Makefile
+index 0fb0033..3117479 100644
+--- a/devLib/Makefile
++++ b/devLib/Makefile
+@@ -36,10 +36,10 @@ DYNAMIC=libwiringPiDev.so.$(VERSION)
+ 
+ #DEBUG	= -g -O0
+ DEBUG	= -O2
+-CC	= gcc
+-INCLUDE	= -I.
++CC	?= gcc
++INCLUDE	= -I../wiringPi
+ DEFS	= -D_GNU_SOURCE
+-CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
++CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
+ 
+ LIBS    =
+ 
+@@ -67,6 +67,7 @@ $(STATIC):	$(OBJ)
+ $(DYNAMIC):	$(OBJ)
+ 	$Q echo "[Link (Dynamic)]"
+ 	$Q $(CC) -shared -Wl,-soname,libwiringPiDev.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPiDev.so.$(VERSION) -lpthread $(OBJ)
++	$Q ln -sf libwiringPiDev.so.$(VERSION) libwiringPiDev.so
+ 
+ .c.o:
+ 	$Q echo [Compile] $<
+@@ -91,7 +92,7 @@ install:	$(DYNAMIC)
+ 	$Q echo "[Install Dynamic Lib]"
+ 	$Q install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
+ 	$Q install -m 0755 libwiringPiDev.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)
+-	$Q ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)	$(DESTDIR)/lib/libwiringPiDev.so
++	$Q ln -sf libwiringPiDev.so.$(VERSION)				$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so
+ 	$Q $(LDCONFIG)
+ 
+ .PHONY:	install-static
+diff --git a/gpio/Makefile b/gpio/Makefile
+index 7dcd090..e8e43f9 100644
+--- a/gpio/Makefile
++++ b/gpio/Makefile
+@@ -32,11 +32,11 @@ endif
+ 
+ #DEBUG	= -g -O0
+ DEBUG	= -O2
+-CC	= gcc
+-INCLUDE	= -I$(DESTDIR)$(PREFIX)/include
+-CFLAGS	= $(DEBUG) -Wall $(INCLUDE) -Winline -pipe
++CC	?= gcc
++INCLUDE	= -I../wiringPi -I../devLib
++CFLAGS	+= $(DEBUG) -Wall $(INCLUDE) -Winline -pipe
+ 
+-LDFLAGS	= -L$(DESTDIR)$(PREFIX)/lib
++LDFLAGS	= -L../wiringPi -L../devLib
+ LIBS    = -lwiringPi -lwiringPiDev -lpthread
+ 
+ # May not need to  alter anything below this line
+@@ -55,6 +55,10 @@ gpio:	$(OBJ)
+ 	$Q echo [Link]
+ 	$Q $(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)
+ 
++gpio-static: $(OBJ)
++	$Q echo [Link]
++	$Q $(CC) -o gpio $(OBJ) ../wiringPi/libwiringPi.a ../devLib/libwiringPiDev.a -lpthread
++
+ .c.o:
+ 	$Q echo [Compile] $<
+ 	$Q $(CC) -c $(CFLAGS) $< -o $@
+diff --git a/wiringPi/Makefile b/wiringPi/Makefile
+index 6bbcc5d..e0ccc52 100644
+--- a/wiringPi/Makefile
++++ b/wiringPi/Makefile
+@@ -36,10 +36,10 @@ DYNAMIC=libwiringPi.so.$(VERSION)
+ 
+ #DEBUG	= -g -O0
+ DEBUG	= -O2
+-CC	= gcc
++CC	?= gcc
+ INCLUDE	= -I.
+ DEFS	= -D_GNU_SOURCE
+-CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
++CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
+ 
+ LIBS    =
+ 
+@@ -90,6 +90,7 @@ $(STATIC):	$(OBJ)
+ $(DYNAMIC):	$(OBJ)
+ 	$Q echo "[Link (Dynamic)]"
+ 	$Q $(CC) -shared -Wl,-soname,libwiringPi.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPi.so.$(VERSION) -lpthread $(OBJ)
++	$Q ln -sf libwiringPi.so.$(VERSION) libwiringPi.so
+ 
+ .c.o:
+ 	$Q echo [Compile] $<
+@@ -115,7 +116,7 @@ install:	$(DYNAMIC)
+ 	$Q echo "[Install Dynamic Lib]"
+ 	$Q install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
+ 	$Q install -m 0755 libwiringPi.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)
+-	$Q ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)	$(DESTDIR)/lib/libwiringPi.so
++	$Q ln -sf libwiringPi.so.$(VERSION)				$(DESTDIR)$(PREFIX)/lib/libwiringPi.so
+ 	$Q $(LDCONFIG)
+ 
+ .PHONY:	install-static
+-- 
+2.1.4
+
diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
new file mode 100644
index 0000000..9275b82
--- /dev/null
+++ b/package/wiringpi/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_WIRINGPI
+	bool "wiringpi"
+	help
+	  wiringPi libraries (and gpio command)
+
+	  http://wiringpi.com/
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
new file mode 100644
index 0000000..4c0fc34
--- /dev/null
+++ b/package/wiringpi/wiringpi.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# wiringpi
+#
+################################################################################
+
+WIRINGPI_VERSION = 2.31
+WIRINGPI_SITE = git://git.drogon.net/wiringPi
+WIRINGPI_LICENSE = LGPLv3+
+WIRINGPI_LICENSE_FILES = COPYING.LESSER
+WIRINGPI_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+WIRINGPI_LIB_BUILD_TARGETS = static
+WIRINGPI_LIB_INSTALL_TARGETS = install-static
+WIRINGPI_BIN_BUILD_TARGETS = gpio-static
+else ifeq ($(BR2_SHARED_LIBS),y)
+WIRINGPI_LIB_BUILD_TARGETS = all
+WIRINGPI_LIB_INSTALL_TARGETS = install
+WIRINGPI_BIN_BUILD_TARGETS = all
+else
+WIRINGPI_LIB_BUILD_TARGETS = all static
+WIRINGPI_LIB_INSTALL_TARGETS = install install-static
+WIRINGPI_BIN_BUILD_TARGETS = all
+endif
+
+define WIRINGPI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_BUILD_TARGETS)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/devLib $(WIRINGPI_LIB_BUILD_TARGETS)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/gpio $(WIRINGPI_BIN_BUILD_TARGETS)
+endef
+
+define WIRINGPI_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
+	$(MAKE) -C $(@D)/devLib $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
+endef
+
+define WIRINGPI_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
+	$(MAKE) -C $(@D)/devLib $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
+	$(INSTALL) -D -m 0755 $(@D)/gpio/gpio $(TARGET_DIR)/usr/bin/gpio
+	$(INSTALL) -D -m 0755 $(@D)/gpio/pintest $(TARGET_DIR)/usr/bin/pintest
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
