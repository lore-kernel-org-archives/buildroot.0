From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 21:42:54 +0200
Subject: [Buildroot] [git commit] linuxconsoletools: new package
Message-ID: <20170619194226.3B71181DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d274324de74d0b9ea58d88f1807184879a7b615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linuxconsoletools contains the inputattach utility
to attach legacy serial devices to the Linux kernel
input layer and joystick utilities to calibrate and
test joysticks and joypads.

The buildroot package adds options to build only certain
tools.

website: http://sf.net/projects/linuxconsole/

Signed-off-by: Koen Martens <gmc@sonologic.nl>
[Thomas: minor tweaks to Config.in and .mk file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 .../linuxconsoletools/0001-conditional-build.patch | 58 ++++++++++++++++++++++
 package/linuxconsoletools/0002-sdl-config.patch    | 20 ++++++++
 package/linuxconsoletools/Config.in                | 33 ++++++++++++
 package/linuxconsoletools/linuxconsoletools.hash   |  2 +
 package/linuxconsoletools/linuxconsoletools.mk     | 41 +++++++++++++++
 7 files changed, 158 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f86a5dc..afc4596 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -997,6 +997,9 @@ F:	package/ramsmp/
 N:	Kevin Joly <kevin.joly@sensefly.com>
 F:	package/libgphoto2/
 
+N:	Koen Martens <gmc@sonologic.nl>
+F:	package/linuxconsoletools/
+
 N:	Laurent Cans <laurent.cans@gmail.com>
 F:	package/aircrack-ng/
 
diff --git a/package/Config.in b/package/Config.in
index aeb7430..9df0b42 100644
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
index 0000000..9f462a6
--- /dev/null
+++ b/package/linuxconsoletools/0001-conditional-build.patch
@@ -0,0 +1,58 @@
+Selectively build groups of tools (inputattach,
+joystick tools and/or force-feedback tools).
+
+Signed-off-by: Koen Martens <gmc@sonologic.nl>
+
+diff -Naur a/utils/Makefile b/utils/Makefile
+--- a/utils/Makefile	2016-04-19 23:28:36.000000000 +0200
++++ b/utils/Makefile	2017-06-19 08:54:20.152184000 +0200
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
index 0000000..d2b0117
--- /dev/null
+++ b/package/linuxconsoletools/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_LINUXCONSOLETOOLS
+	bool "linuxconsoletools"
+	help
+	  Linuxconsoletools contains the inputattach utility
+	  to attach legacy serial devices to the Linux kernel
+	  input layer and joystick utilities to calibrate and
+	  test joysticks and joypads.
+
+	  http://sf.net/projects/linuxconsole/
+
+if BR2_PACKAGE_LINUXCONSOLETOOLS
+
+config BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH
+	bool "inputattach"
+	default y
+	help
+	  The inputattach utility attaches legacy serial devices
+	  to the Linux kernel input layer.
+
+config BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK
+	bool "joystick utilities"
+	help
+	  Joystick utilities (jstest, jscal, jscal-store,
+	  jscal-restore, evdev-joystick).
+
+config BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK
+	bool "force-feedback utilities"
+	select BR2_PACKAGE_SDL
+	help
+	  Build force-feedback driver utilities (fftest,
+	  ffmvforce, ffset, ffcfstress).
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
index 0000000..82ff4c3
--- /dev/null
+++ b/package/linuxconsoletools/linuxconsoletools.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# linuxconsoletools
+#
+################################################################################
+
+LINUXCONSOLETOOLS_VERSION = 1.6.0
+LINUXCONSOLETOOLS_SOURCE = linuxconsoletools-$(LINUXCONSOLETOOLS_VERSION).tar.bz2
+LINUXCONSOLETOOLS_SITE = https://downloads.sourceforge.net/project/linuxconsole
+LINUXCONSOLETOOLS_LICENSE = GPL-2.0+
+LINUXCONSOLETOOLS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH),y)
+LINUXCONSOLETOOLS_MAKE_OPTS += ENABLE_INPUTATTACH=1
+endif
+
+ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK),y)
+LINUXCONSOLETOOLS_MAKE_OPTS += ENABLE_JOYSTICK=1
+endif
+
+ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK),y)
+LINUXCONSOLETOOLS_MAKE_OPTS += \
+	ENABLE_FORCEFEEDBACK=1 \
+	SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
+LINUXCONSOLETOOLS_DEPENDENCIES += sdl
+endif
+
+define LINUXCONSOLETOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(LINUXCONSOLETOOLS_MAKE_OPTS)
+endef
+
+define LINUXCONSOLETOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(LINUXCONSOLETOOLS_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" \
+		PREFIX=/usr \
+		install
+endef
+
+$(eval $(generic-package))
