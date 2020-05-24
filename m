From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 May 2020 22:26:51 +0200
Subject: [Buildroot] [PATCH] package/wiringpi: remove
Message-ID: <20200524202651.20373-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The author has completely ripped off the git tree, so the sources
are no longer available, with that message:
    "Please look for alternatives for wiringPi"

And indeed there is a better alternative, using the kernel GPIO
subsystem and drivers.

Note that queezelite looses that functionality now, but upstream
squeezelite has done changes to do without wiringpi (hint for an
upgrade?).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
---
 Config.in.legacy                              |   8 ++
 DEVELOPERS                                    |   1 -
 package/Config.in                             |   1 -
 package/squeezelite/squeezelite.mk            |   5 -
 .../0001-Adjust-for-buildroot-build.patch     | 131 ------------------
 ...erial-fix-compile-for-missing-baud-d.patch |  47 -------
 package/wiringpi/Config.in                    |  13 --
 package/wiringpi/wiringpi.hash                |   3 -
 package/wiringpi/wiringpi.mk                  |  32 -----
 9 files changed, 8 insertions(+), 233 deletions(-)
 delete mode 100644 package/wiringpi/0001-Adjust-for-buildroot-build.patch
 delete mode 100644 package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
 delete mode 100644 package/wiringpi/Config.in
 delete mode 100644 package/wiringpi/wiringpi.hash
 delete mode 100644 package/wiringpi/wiringpi.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 9e2040a46c..3f273ad8c0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2020.05"
 
+config BR2_PACKAGE_WIRINGPI
+	bool "wiringpi package removed"
+	select BR2_LEGACY
+	help
+	  The author of wiringpir has deprecated the package, and completely
+	  removed the git tree that was serving the sources, with this message:
+	      Please look for alternatives for wiringPi
+
 config BR2_PACKAGE_PYTHON_PYCRYPTO
 	bool "python-pycrypto package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d1426f6227..99f47c3a37 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2058,7 +2058,6 @@ F:	package/postgresql/
 F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
-F:	package/wiringpi/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
diff --git a/package/Config.in b/package/Config.in
index 2871cabfcc..85d7326361 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1522,7 +1522,6 @@ menu "Hardware handling"
 	source "package/pcsc-lite/Config.in"
 	source "package/tslib/Config.in"
 	source "package/urg/Config.in"
-	source "package/wiringpi/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index 2ed3d8b769..b0347c4df9 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -40,11 +40,6 @@ ifeq ($(BR2_PACKAGE_SQUEEZELITE_VISEXPORT),y)
 SQUEEZELITE_MAKE_OPTS += -DVISEXPORT
 endif
 
-ifeq ($(BR2_PACKAGE_WIRINGPI),y)
-SQUEEZELITE_DEPENDENCIES += wiringpi
-SQUEEZELITE_MAKE_OPTS += -DRPI
-endif
-
 define SQUEEZELITE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
diff --git a/package/wiringpi/0001-Adjust-for-buildroot-build.patch b/package/wiringpi/0001-Adjust-for-buildroot-build.patch
deleted file mode 100644
index 2f4f0c1f0a..0000000000
--- a/package/wiringpi/0001-Adjust-for-buildroot-build.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From 17ffb0cb301d4bf6ef900c8698d716f68cb77360 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Wed, 2 Dec 2015 00:22:26 +0100
-Subject: [PATCH] Adjust for buildroot build.
-
- - enable CC override
- - fix devLib/gpio include path for local build (without installing first)
- - change CFLAGS from '=' to '+=' to honour buildroot given flags
- - add linker name link for libwiringPiDev and libwiringPi for local linking
-   (without installing first)
- - fix install linker name link (do not link with absolute path)
- - add gpio-static linking target
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-
- - Rebased for wiringpi-8d188fa0e00bb8c6ff6eddd07bf92857e9bd533a
-
-Signed-off-by: Atanas Palavrov <palavrov@gmail.com>
----
- devLib/Makefile   |  9 +++++----
- gpio/Makefile     | 14 +++++++++-----
- wiringPi/Makefile |  7 ++++---
- 3 files changed, 18 insertions(+), 12 deletions(-)
-
-diff --git a/devLib/Makefile b/devLib/Makefile
-index cf665d6..3fb41e8 100644
---- a/devLib/Makefile
-+++ b/devLib/Makefile
-@@ -36,10 +36,10 @@ DYNAMIC=libwiringPiDev.so.$(VERSION)
- 
- #DEBUG	= -g -O0
- DEBUG	= -O2
--CC	= gcc
--INCLUDE	= -I.
-+CC	?= gcc
-+INCLUDE	= -I../wiringPi
- DEFS	= -D_GNU_SOURCE
--CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
-+CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Winline $(INCLUDE) -pipe -fPIC
- 
- LIBS    =
- 
-@@ -69,6 +69,7 @@ $(STATIC):	$(OBJ)
- $(DYNAMIC):	$(OBJ)
- 	$Q echo "[Link (Dynamic)]"
- 	$Q $(CC) -shared -Wl,-soname,libwiringPiDev.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPiDev.so.$(VERSION) -lpthread $(OBJ)
-+	$Q ln -sf libwiringPiDev.so.$(VERSION) libwiringPiDev.so
- 
- .c.o:
- 	$Q echo [Compile] $<
-@@ -93,7 +94,7 @@ install:	$(DYNAMIC)
- 	$Q echo "[Install Dynamic Lib]"
- 	$Q install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
- 	$Q install -m 0755 libwiringPiDev.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)
--	$Q ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so.$(VERSION)	$(DESTDIR)/lib/libwiringPiDev.so
-+	$Q ln -sf libwiringPiDev.so.$(VERSION)				$(DESTDIR)$(PREFIX)/lib/libwiringPiDev.so
- 	$Q $(LDCONFIG)
- 
- .PHONY:	install-static
-diff --git a/gpio/Makefile b/gpio/Makefile
-index 9ec160d..360d64c 100644
---- a/gpio/Makefile
-+++ b/gpio/Makefile
-@@ -32,11 +32,11 @@ endif
- 
- #DEBUG	= -g -O0
- DEBUG	= -O2
--CC	= gcc
--INCLUDE	= -I$(DESTDIR)$(PREFIX)/include
--CFLAGS	= $(DEBUG) -Wall -Wextra $(INCLUDE) -Winline -pipe
-+CC	?= gcc
-+INCLUDE	= -I../wiringPi -I../devLib
-+CFLAGS	+= $(DEBUG) -Wall -Wextra $(INCLUDE) -Winline -pipe
- 
--LDFLAGS	= -L$(DESTDIR)$(PREFIX)/lib
-+LDFLAGS	= -L../wiringPi -L../devLib
- LIBS    = -lwiringPi -lwiringPiDev -lpthread -lrt -lm -lcrypt
- 
- # May not need to  alter anything below this line
-@@ -52,9 +52,13 @@ version.h:	../VERSION
- 	$Q echo Need to run newVersion above.
- 
- gpio:	$(OBJ)
--	$Q echo [Link]
-+	$Q echo "[Link (Dynamic)]"
- 	$Q $(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)
- 
-+gpio-static: $(OBJ)
-+	$Q echo "[Link (Static)]"
-+	$Q $(CC) -static -o gpio $(OBJ) ../wiringPi/libwiringPi.a ../devLib/libwiringPiDev.a -lpthread
-+
- .c.o:
- 	$Q echo [Compile] $<
- 	$Q $(CC) -c $(CFLAGS) $< -o $@
-diff --git a/wiringPi/Makefile b/wiringPi/Makefile
-index 287fa58..81595d3 100644
---- a/wiringPi/Makefile
-+++ b/wiringPi/Makefile
-@@ -36,10 +36,10 @@ DYNAMIC=libwiringPi.so.$(VERSION)
- 
- #DEBUG	= -g -O0
- DEBUG	= -O2
--CC	= gcc
-+CC	?= gcc
- INCLUDE	= -I.
- DEFS	= -D_GNU_SOURCE
--CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) -pipe -fPIC
-+CFLAGS	+= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Winline $(INCLUDE) -pipe -fPIC
- #CFLAGS	= $(DEBUG) $(DEFS) -Wformat=2 -Wall -Wextra -Wconversion -Winline $(INCLUDE) -pipe -fPIC
- 
- LIBS    = -lm -lpthread -lrt -lcrypt
-@@ -76,6 +76,7 @@ static:
- $(DYNAMIC):	$(OBJ)
- 	$Q echo "[Link (Dynamic)]"
- 	$Q $(CC) -shared -Wl,-soname,libwiringPi.so$(WIRINGPI_SONAME_SUFFIX) -o libwiringPi.so.$(VERSION) $(LIBS) $(OBJ)
-+	$Q ln -sf libwiringPi.so.$(VERSION) libwiringPi.so
- 
- .c.o:
- 	$Q echo [Compile] $<
-@@ -101,7 +102,7 @@ install:	$(DYNAMIC)
- 	$Q echo "[Install Dynamic Lib]"
- 	$Q install -m 0755 -d						$(DESTDIR)$(PREFIX)/lib
- 	$Q install -m 0755 libwiringPi.so.$(VERSION)			$(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)
--	$Q ln -sf $(DESTDIR)$(PREFIX)/lib/libwiringPi.so.$(VERSION)	$(DESTDIR)/lib/libwiringPi.so
-+	$Q ln -sf libwiringPi.so.$(VERSION)				$(DESTDIR)$(PREFIX)/lib/libwiringPi.so
- 	$Q $(LDCONFIG)
- 
- .PHONY:	install-deb
--- 
-2.11.0
-
diff --git a/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch b/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
deleted file mode 100644
index c9c4385d48..0000000000
--- a/package/wiringpi/0002-wiringPi-wiringSerial-fix-compile-for-missing-baud-d.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 1e7a7a625ca20633062406ce525b19d168c356af Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 20 Mar 2017 20:51:20 +0100
-Subject: [PATCH] wiringPi/wiringSerial: fix compile for missing baud defines
-
-For sparc-buildroot-linux-uclibc/sysroot/usr/include/asm/termbits.h
-containing:
-
-  /* These have totally bogus values and nobody uses them
-     so far. Later on we'd have to use say 0x10000x and
-     adjust CBAUD constant and drivers accordingly.
-  #define B2500000  0x00001010
-  #define B3000000  0x00001011
-  #define B3500000  0x00001012
-  #define B4000000  0x00001013  */
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- wiringPi/wiringSerial.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/wiringPi/wiringSerial.c b/wiringPi/wiringSerial.c
-index e1587ad..4ac8d1e 100644
---- a/wiringPi/wiringSerial.c
-+++ b/wiringPi/wiringSerial.c
-@@ -75,10 +75,18 @@ int serialOpen (const char *device, const int baud)
-     case 1152000:	myBaud = B1152000 ; break ;
-     case 1500000:	myBaud = B1500000 ; break ;
-     case 2000000:	myBaud = B2000000 ; break ;
-+#if defined(B2500000)
-     case 2500000:	myBaud = B2500000 ; break ;
-+#endif
-+#if defined(B3000000)
-     case 3000000:	myBaud = B3000000 ; break ;
-+#endif
-+#if defined(B3500000)
-     case 3500000:	myBaud = B3500000 ; break ;
-+#endif
-+#if defined(B4000000)
-     case 4000000:	myBaud = B4000000 ; break ;
-+#endif
- 
-     default:
-       return -2 ;
--- 
-2.11.0
-
diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
deleted file mode 100644
index 92f5dc6539..0000000000
--- a/package/wiringpi/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_WIRINGPI
-	bool "wiringpi"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  wiringPi libraries (and gpio command)
-
-	  http://wiringpi.com/
-
-comment "wiringpi needs a toolchain w/ threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wiringpi/wiringpi.hash b/package/wiringpi/wiringpi.hash
deleted file mode 100644
index 83885e4b6d..0000000000
--- a/package/wiringpi/wiringpi.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  2455fc97d2b60ed169675dccbaabf55e1958c3c2499b246c96edfc8b036e9073  wiringpi-2.46.tar.gz
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
deleted file mode 100644
index 0c3774917c..0000000000
--- a/package/wiringpi/wiringpi.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# wiringpi
-#
-################################################################################
-
-WIRINGPI_VERSION = 2.46
-WIRINGPI_SITE = git://git.drogon.net/wiringPi
-
-WIRINGPI_LICENSE = LGPL-3.0+
-WIRINGPI_LICENSE_FILES = COPYING.LESSER
-WIRINGPI_INSTALL_STAGING = YES
-
-define WIRINGPI_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/wiringPi all
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/devLib all
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/gpio all
-endef
-
-define WIRINGPI_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi install DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/devLib install DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
-endef
-
-define WIRINGPI_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi install DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/devLib install DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
-	$(INSTALL) -D -m 0755 $(@D)/gpio/gpio $(TARGET_DIR)/usr/bin/gpio
-	$(INSTALL) -D -m 0755 $(@D)/gpio/pintest $(TARGET_DIR)/usr/bin/pintest
-endef
-
-$(eval $(generic-package))
-- 
2.20.1
