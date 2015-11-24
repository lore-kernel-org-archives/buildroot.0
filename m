From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 24 Nov 2015 22:36:31 +0100
Subject: [Buildroot] [PATCH v2] wiringpi: new package
Message-ID: <1448400991-5011-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix typo in commit message (wirinpi vs wiringpi)
---
 package/Config.in                                  |  1 +
 ...-Fix-devLib-gpio-include-and-library-path.patch | 40 ++++++++++++++++++++++
 package/wiringpi/Config.in                         |  6 ++++
 package/wiringpi/wiringpi.mk                       | 29 ++++++++++++++++
 4 files changed, 76 insertions(+)
 create mode 100644 package/wiringpi/0001-Fix-devLib-gpio-include-and-library-path.patch
 create mode 100644 package/wiringpi/Config.in
 create mode 100644 package/wiringpi/wiringpi.mk

diff --git a/package/Config.in b/package/Config.in
index bdc3063..9d273e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -438,6 +438,7 @@ endif
 	source "package/w_scan/Config.in"
 	source "package/wf111/Config.in"
 	source "package/wipe/Config.in"
+	source "package/wiringpi/Config.in"
 	source "package/xorriso/Config.in"
 endmenu
 
diff --git a/package/wiringpi/0001-Fix-devLib-gpio-include-and-library-path.patch b/package/wiringpi/0001-Fix-devLib-gpio-include-and-library-path.patch
new file mode 100644
index 0000000..2a7e754
--- /dev/null
+++ b/package/wiringpi/0001-Fix-devLib-gpio-include-and-library-path.patch
@@ -0,0 +1,40 @@
+From d0e4c2ac47776e60fac64143a58b4fbe23f433be Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 24 Nov 2015 22:26:13 +0100
+Subject: [PATCH] Fix devLib/gpio include and library path.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ devLib/Makefile | 2 +-
+ gpio/Makefile   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/devLib/Makefile b/devLib/Makefile
+index 0fb0033..f956abe 100644
+--- a/devLib/Makefile
++++ b/devLib/Makefile
+@@ -37,7 +37,7 @@ DYNAMIC=libwiringPiDev.so.$(VERSION)
+ #DEBUG	= -g -O0
+ DEBUG	= -O2
+ CC	= gcc
+-INCLUDE	= -I.
++INCLUDE	= -I$(DESTDIR)$(PREFIX)/wiringPi  -I$(DESTDIR)$(PREFIX)/devLib
+ DEFS	= -D_GNU_SOURCE
+ CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
+ 
+diff --git a/gpio/Makefile b/gpio/Makefile
+index 7dcd090..f5b588a 100644
+--- a/gpio/Makefile
++++ b/gpio/Makefile
+@@ -33,7 +33,7 @@ endif
+ #DEBUG	= -g -O0
+ DEBUG	= -O2
+ CC	= gcc
+-INCLUDE	= -I$(DESTDIR)$(PREFIX)/include
++INCLUDE	= -I$(DESTDIR)$(PREFIX)/wiringPi  -I$(DESTDIR)$(PREFIX)/devLib
+ CFLAGS	= $(DEBUG) -Wall $(INCLUDE) -Winline -pipe
+ 
+ LDFLAGS	= -L$(DESTDIR)$(PREFIX)/lib
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
index 0000000..258bb25
--- /dev/null
+++ b/package/wiringpi/wiringpi.mk
@@ -0,0 +1,29 @@
+WIRINGPI_VERSION = 2.29
+WIRINGPI_SITE = git://git.drogon.net/wiringPi
+WIRINGPI_INSTALL_STAGING = YES
+
+define WIRINGPI_BUILD_CMDS
+	$(MAKE) -C $(@D)/wiringPi CC=$(TARGET_CC)
+	$(INSTALL) -D -m 0755 $(@D)/wiringPi/libwiringPi.so.2.29 $(STAGING_DIR)/usr/lib/libwiringPi.so.2.29
+	ln -sf $(STAGING_DIR)/usr/lib/libwiringPi.so.2.29 $(STAGING_DIR)/usr/lib/libwiringPi.so
+	$(MAKE) -C $(@D)/devLib CC=$(TARGET_CC) PREFIX=$(@D) DESTDIR=
+	$(INSTALL) -D -m 0755 $(@D)/devLib/libwiringPiDev.so.2.29 $(STAGING_DIR)/usr/lib/libwiringPiDev.so.2.29
+	ln -sf $(STAGING_DIR)/usr/lib/libwiringPiDev.so.2.29 $(STAGING_DIR)/usr/lib/libwiringPiDev.so
+	$(MAKE) -C $(@D)/gpio CC=$(TARGET_CC) PREFIX=$(@D) DESTDIR=
+endef
+
+define WIRINGPI_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/wiringPi/*.h $(STAGING_DIR)/usr/include
+	$(INSTALL) -D -m 0644 $(@D)/devLib/*.h $(STAGING_DIR)/usr/include
+endef
+
+define WIRINGPI_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/wiringPi/libwiringPi.so* $(TARGET_DIR)/usr/lib
+	ln -sf libwiringPi.so.2.29  $(TARGET_DIR)/usr/lib/libwiringPi.so
+	$(INSTALL) -D -m 0755 $(@D)/devLib/libwiringPiDev.so* $(TARGET_DIR)/usr/lib
+	ln -sf libwiringPiDev.so.2.29 $(TARGET_DIR)/usr/lib/libwiringPiDev.so
+	$(INSTALL) -D -m 0755 $(@D)/gpio/gpio $(TARGET_DIR)/usr/bin
+	$(INSTALL) -D -m 0755 $(@D)/gpio/pintest $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
