From: Koen Martens <gmc@sonologic.nl>
Date: Sat, 17 Jun 2017 09:04:52 +0200
Subject: [Buildroot] [PATCH 1/1] linuxconsoletools: new package
Message-ID: <201706170839.v5H8dn7C021102@mx1.sonologic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linuxconsoletools (http://sf.net/projects/linuxconsole/)
contains the inputattach utility to attach legacy serial
devices to the Linux kernel input layer and joystick
utilities to calibrate and test joysticks and joypads.

The buildroot package adds options to build only certain
tools and makes installation of man pages optional.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
---
 DEVELOPERS                                         |   3 +
 package/Config.in                                  |   1 +
 .../linuxconsoletools/0001-conditional-build.patch | 107 +++++++++++++++++++++
 package/linuxconsoletools/0002-sdl-config.patch    |  20 ++++
 package/linuxconsoletools/Config.in                |  43 +++++++++
 package/linuxconsoletools/linuxconsoletools.hash   |   2 +
 package/linuxconsoletools/linuxconsoletools.mk     |  52 ++++++++++
 7 files changed, 228 insertions(+)
 create mode 100644 package/linuxconsoletools/0001-conditional-build.patch
 create mode 100644 package/linuxconsoletools/0002-sdl-config.patch
 create mode 100644 package/linuxconsoletools/Config.in
 create mode 100644 package/linuxconsoletools/linuxconsoletools.hash
 create mode 100644 package/linuxconsoletools/linuxconsoletools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ade852..ae4c902 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -994,6 +994,9 @@ F:	package/ramsmp/
 N:	Kevin Joly <kevin.joly@sensefly.com>
 F:	package/libgphoto2/
 
+N:	Koen Martens <gmc@sonologic.nl>
+F:	package/linuxconsoletools/
+
 N:	Laurent Cans <laurent.cans@gmail.com>
 F:	package/aircrack-ng/
 
diff --git a/package/Config.in b/package/Config.in
index c997e2a..cb0bbe6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -422,6 +422,7 @@ endmenu
 	source "package/lcdproc/Config.in"
 	source "package/libuio/Config.in"
 	source "package/libump/Config.in"
+	source "package/linuxconsoletools/Config.in"
 	source "package/linux-backports/Config.in"
 	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
diff --git a/package/linuxconsoletools/0001-conditional-build.patch b/package/linuxconsoletools/0001-conditional-build.patch
new file mode 100644
index 0000000..7e98963
--- /dev/null
+++ b/package/linuxconsoletools/0001-conditional-build.patch
@@ -0,0 +1,107 @@
+Selectively build groups of tools (inputattach,
+joystick tools and/or force-feedback tools).
+
+Make installation of documentation (man pages)
+optional.
+
+Signed-off-by: Koen Martens <gmc@sonologic.nl>
+
+diff -Naur a/docs/Makefile b/docs/Makefile
+--- a/docs/Makefile	2016-04-19 23:45:26.000000000 +0200
++++ b/docs/Makefile	2017-06-13 09:54:38.046181000 +0200
+@@ -19,9 +19,26 @@
+ # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
+ # 02110-1301 USA.
+ 
+-MANPAGES	= inputattach.1 jstest.1 jscal.1 fftest.1 \
+-		  ffmvforce.1 ffset.1 ffcfstress.1 jscal-store.1 \
+-		  jscal-restore.1 evdev-joystick.1
++MANPAGES	= 
++
++ifdef ENABLE_INPUTATTACH
++MANPAGES += inputattach.1
++endif
++
++ifdef ENABLE_JOYSTICK
++MANPAGES += jstest.1
++MANPAGES += jscal.1
++MANPAGES += jscal-store.1
++MANPAGES += jscal-restore.1
++MANPAGES += evdev-joystick.1
++endif
++
++ifdef ENABLE_FORCEFEEDBACK
++MANPAGES += fftest.1
++MANPAGES += ffmvforce.1
++MANPAGES += ffset.1
++MANPAGES += ffcfstress.1
++endif
+ 
+ PREFIX          ?= /usr/local
+ 
+diff -Naur a/Makefile b/Makefile
+--- a/Makefile	2016-10-08 12:42:02.000000000 +0200
++++ b/Makefile	2017-06-13 10:07:31.156543000 +0200
+@@ -30,7 +30,9 @@
+ 
+ install:
+ 	$(MAKE) -C utils $@
++ifdef ENABLE_DOCS
+ 	$(MAKE) -C docs $@
++endif
+ 
+ dist: clean
+ 	rm -rf $(PACKAGE)
+diff -Naur a/utils/Makefile b/utils/Makefile
+--- a/utils/Makefile	2016-04-19 23:28:36.000000000 +0200
++++ b/utils/Makefile	2017-06-13 10:02:44.037055000 +0200
+@@ -27,8 +27,26 @@
+ 
+ CFLAGS		?= -g -O2 -Wall
+ 
+-PROGRAMS	= inputattach jstest jscal fftest ffmvforce ffset \
+-		  ffcfstress jscal-restore jscal-store evdev-joystick
++PROGRAMS    =
++
++ifdef ENABLE_INPUTATTACH
++PROGRAMS	+= inputattach
++endif
++
++ifdef ENABLE_JOYSTICK
++PROGRAMS    += jstest
++PROGRAMS    += jscal
++PROGRAMS    += jscal-restore
++PROGRAMS    += jscal-store
++PROGRAMS    += evdev-joystick
++endif
++
++ifdef ENABLE_FORCEFEEDBACK
++PROGRAMS    += fftest
++PROGRAMS    += ffmvforce
++PROGRAMS    += ffset
++PROGRAMS    += ffcfstress
++endif
+ 
+ PREFIX          ?= /usr/local
+ 
+@@ -79,13 +97,20 @@
+ 80-stelladaptor-joystick.rules: 80-stelladaptor-joystick.rules.in
+ 	sed "s^@@PREFIX@@^$(PREFIX)^g" < $^ > $@
+ 
++INSTALL_DEP = compile
++ifdef ENABLE_JOYSTICK
++INSTALL_DEP +=  80-stelladaptor-joystick.rules
++endif
++
+ install: compile 80-stelladaptor-joystick.rules
+ 	install -d $(DESTDIR)$(PREFIX)/bin
+ 	install $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
++ifdef ENABLE_JOYSTICK
+ 	install -d $(DESTDIR)$(PREFIX)/share/joystick
+ 	install extract filter ident $(DESTDIR)$(PREFIX)/share/joystick
+ 	install -d $(DESTDIR)/lib/udev/rules.d
+ 	install js-set-enum-leds $(DESTDIR)/lib/udev
+ 	install -m 644 80-stelladaptor-joystick.rules $(DESTDIR)/lib/udev/rules.d
++endif
+ 
+ .PHONY: compile clean distclean install
diff --git a/package/linuxconsoletools/0002-sdl-config.patch b/package/linuxconsoletools/0002-sdl-config.patch
new file mode 100644
index 0000000..c19c274
--- /dev/null
+++ b/package/linuxconsoletools/0002-sdl-config.patch
@@ -0,0 +1,20 @@
+Specify sdl-config to use instead of using host sdl-config.
+
+Signed-off-by: Koen Martens <gmc@sonologic.nl>
+
+diff -Naur a/utils/Makefile b/utils/Makefile
+--- a/utils/Makefile	2017-06-16 18:48:28.402824790 +0200
++++ b/utils/Makefile	2017-06-16 18:48:53.898696647 +0200
+@@ -69,10 +69,10 @@
+ 	$(CC) $(CFLAGS) $(CPPFLAGS) -funsigned-char $^ $(LDFLAGS) -lm -o $@
+ 
+ ffmvforce.o: ffmvforce.c
+-	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^ -o $@ `sdl-config --cflags`
++	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^ -o $@ `${SDL_CONFIG} --cflags`
+ 
+ ffmvforce: ffmvforce.o
+-	$(CC) $^ -o $@ $(LDFLAGS) -g -lm `sdl-config --libs`
++	$(CC) $^ -o $@ $(LDFLAGS) -g -lm `${SDL_CONFIG} --libs`
+ 
+ axbtnmap.o: axbtnmap.c axbtnmap.h
+ 
diff --git a/package/linuxconsoletools/Config.in b/package/linuxconsoletools/Config.in
new file mode 100644
index 0000000..557edae
--- /dev/null
+++ b/package/linuxconsoletools/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_LINUXCONSOLETOOLS
+	bool "linuxconsoletools"
+	default n
+	help
+	  Linuxconsoletools (http://sf.net/projects/linuxconsole/)
+	  contains the inputattach utility to attach legacy serial
+	  devices to the Linux kernel input layer and joystick
+	  utilities to calibrate and test joysticks and joypads.
+
+if BR2_PACKAGE_LINUXCONSOLETOOLS
+
+config BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH
+	bool "build inputattach"
+	default y
+	help
+	  The inputattach utility attaches legacy serial devices
+	  to the Linux kernel input layer.
+
+config BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK
+	bool "build joystick utilities"
+	default n
+	help
+	  Build joystick utilities (jstest, jscal, jscal-store,
+	  jscal-restore, evdev-joystick).
+
+config BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK
+	bool "build force-feedback utilities"
+	default n
+	depends on BR2_PACKAGE_SDL
+	help
+	  Build force-feedback driver utilities (fftest,
+	  ffmvforce, ffset, ffcfstress).
+
+comment "build force-feedback utilities depends on SDL"
+	depends on !BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_LINUXCONSOLETOOLS_DOCS
+	bool "install man pages"
+	default n
+	help
+	  Install documentation (manpages).
+
+endif
diff --git a/package/linuxconsoletools/linuxconsoletools.hash b/package/linuxconsoletools/linuxconsoletools.hash
new file mode 100644
index 0000000..756c9f4
--- /dev/null
+++ b/package/linuxconsoletools/linuxconsoletools.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	ced2efed00b67b45f82eddc69be07385835d558f658016315ac621fe2eaa8146	linuxconsoletools-1.6.0.tar.bz2
diff --git a/package/linuxconsoletools/linuxconsoletools.mk b/package/linuxconsoletools/linuxconsoletools.mk
new file mode 100644
index 0000000..25271ad
--- /dev/null
+++ b/package/linuxconsoletools/linuxconsoletools.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# linuxconsoletools
+#
+################################################################################
+
+LINUXCONSOLETOOLS_VERSION = 1.6.0
+LINUXCONSOLETOOLS_SOURCE = linuxconsoletools-${LINUXCONSOLETOOLS_VERSION}.tar.bz2
+LINUXCONSOLETOOLS_SITE = https://downloads.sourceforge.net/project/linuxconsole
+LINUXCONSOLETOOLS_LICENSE = GPLv2+
+LINUXCONSOLETOOLS_LICENSE_FILES = COPYING
+LINUXCONSOLETOOLS_DEPENDENCIES =
+LINUXCONSOLETOOLS_ENV = 
+
+SDL_CONFIG =
+
+ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH),y)
+	LINUXCONSOLETOOLS_ENV +=  ENABLE_INPUTATTACH=1 
+endif
+ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK),y)
+	LINUXCONSOLETOOLS_ENV +=  ENABLE_JOYSTICK=1 
+endif
+ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK),y)
+	LINUXCONSOLETOOLS_ENV +=  ENABLE_FORCEFEEDBACK=1 
+	LINUXCONSOLETOOLS_DEPENDENCIES += sdl
+	SDL_CONFIG = $(STAGING_DIR)/usr/bin/sdl-config
+endif
+ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_DOCS),y)
+	LINUXCONSOLETOOLS_ENV +=  ENABLE_DOCS=1 
+endif
+
+define LINUXCONSOLETOOLS_BUILD_CMDS
+	$(LINUXCONSOLETOOLS_ENV) \
+	$(TARGET_MAKE_ENV) \
+    CC="$(TARGET_CC)" \
+    CFLAGS="$(TARGET_CFLAGS)" \
+	SDL_CONFIG="$(SDL_CONFIG)" \
+	$(MAKE) -C $(@D)
+endef
+
+define LINUXCONSOLETOOLS_INSTALL_TARGET_CMDS
+	$(LINUXCONSOLETOOLS_ENV) \
+	$(TARGET_MAKE_ENV) \
+    CC="$(TARGET_CC)" \
+    CFLAGS="$(TARGET_CFLAGS)" \
+	SDL_CONFIG="$(SDL_CONFIG)" \
+	DESTDIR="$(TARGET_DIR)" \
+    PREFIX=/usr \
+	make -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
