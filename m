From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 21 Dec 2017 15:54:10 +0100
Subject: [Buildroot] [PATCH v7] package/i2c-tools: bump to version 4.0
Message-ID: <1513868050-6206-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps i2c-tools to version 4.0 and adds a couple of
new commands named i2ctransfer and eeprog.
It adds also several upstream commits not included in the release
that fix static compilation issues and parallel build issues.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changes:

v6 -> v7: Added and reordered all the upstream patches to fix parallel
building issues. Tested with several hundreds of compilation cycles 
and with test-pkg, no errors reported.

v5 -> v6: Adding another upstream patch to fix another parallel building
issue.

v4 -> v5: After working with the upstrea we identified several problems
with the build system and fixed them. Unfortunately the maintainer
doesn't want to release a new package with these fixes so I had to add
several patches.

 ...01-lib-Module.mk-Add-missing-dependencies.patch | 34 +++++++++++
 ...efile-Add-flag-to-disable-dynamic-library.patch | 64 +++++++++++++++++++++
 ...odule.mk-Drop-unused-variable-LIB_OBJECTS.patch | 33 +++++++++++
 ...-tools-Module.mk-Add-missing-dependencies.patch | 67 ++++++++++++++++++++++
 ...05-lib-Module.mk-Fix-LIB_LINKS-dependency.patch | 34 +++++++++++
 ...low-to-really-disable-the-dynamic-library.patch | 33 +++++++++++
 ...7-eeprog-Module.mk-Add-missing-dependency.patch | 30 ++++++++++
 package/i2c-tools/i2c-tools.hash                   |  2 +-
 package/i2c-tools/i2c-tools.mk                     | 16 +++++-
 9 files changed, 309 insertions(+), 4 deletions(-)
 create mode 100644 package/i2c-tools/0001-lib-Module.mk-Add-missing-dependencies.patch
 create mode 100644 package/i2c-tools/0002-Makefile-Add-flag-to-disable-dynamic-library.patch
 create mode 100644 package/i2c-tools/0003-lib-Module.mk-Drop-unused-variable-LIB_OBJECTS.patch
 create mode 100644 package/i2c-tools/0004-tools-Module.mk-Add-missing-dependencies.patch
 create mode 100644 package/i2c-tools/0005-lib-Module.mk-Fix-LIB_LINKS-dependency.patch
 create mode 100644 package/i2c-tools/0006-Makefile-Allow-to-really-disable-the-dynamic-library.patch
 create mode 100644 package/i2c-tools/0007-eeprog-Module.mk-Add-missing-dependency.patch

diff --git a/package/i2c-tools/0001-lib-Module.mk-Add-missing-dependencies.patch b/package/i2c-tools/0001-lib-Module.mk-Add-missing-dependencies.patch
new file mode 100644
index 0000000..09a78da
--- /dev/null
+++ b/package/i2c-tools/0001-lib-Module.mk-Add-missing-dependencies.patch
@@ -0,0 +1,34 @@
+From a6a59693066fd8da81f7107479df3e32a129247d Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Wed, 6 Dec 2017 09:55:04 +0100
+Subject: [PATCH] lib/Module.mk: Add missing dependencies
+
+The lib symlinks lacked a dependency to the actual library file, so
+parallel builds could run into a race and break.
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+---
+ lib/Module.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/Module.mk b/lib/Module.mk
+index 432a051..fd2c8c4 100644
+--- a/lib/Module.mk
++++ b/lib/Module.mk
+@@ -42,11 +42,11 @@ endif
+ $(LIB_DIR)/$(LIB_SHLIBNAME): $(LIB_DIR)/smbus.o
+ 	$(CC) -shared $(LDFLAGS) -Wl,--version-script=$(LIB_DIR)/libi2c.map -Wl,-soname,$(LIB_SHSONAME) -o $@ $^ -lc
+ 
+-$(LIB_DIR)/$(LIB_SHSONAME):
++$(LIB_DIR)/$(LIB_SHSONAME): $(LIB_DIR)/$(LIB_SHLIBNAME)
+ 	$(RM) $@
+ 	$(LN) $(LIB_SHLIBNAME) $@
+ 
+-$(LIB_DIR)/$(LIB_SHBASENAME):
++$(LIB_DIR)/$(LIB_SHBASENAME): $(LIB_DIR)/$(LIB_SHLIBNAME)
+ 	$(RM) $@
+ 	$(LN) $(LIB_SHLIBNAME) $@
+ 
+-- 
+2.7.4
+
diff --git a/package/i2c-tools/0002-Makefile-Add-flag-to-disable-dynamic-library.patch b/package/i2c-tools/0002-Makefile-Add-flag-to-disable-dynamic-library.patch
new file mode 100644
index 0000000..b5ec547
--- /dev/null
+++ b/package/i2c-tools/0002-Makefile-Add-flag-to-disable-dynamic-library.patch
@@ -0,0 +1,64 @@
+From 9906b2ecb6aec02d6348d6237b784135e6930d0b Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Wed, 6 Dec 2017 10:12:07 +0100
+Subject: Makefile: Add flag to disable dynamic library
+
+In such cases where you need to disable entirely the dynamic
+library compilation, now you can use the BUILD_DYNAMIC_LIB=0
+flag.
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+---
+ Makefile      | 10 +++++++++-
+ lib/Module.mk |  6 +++++-
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index c85317c..1bb5572 100644
+--- a/Makefile
++++ b/Makefile
+@@ -32,12 +32,20 @@ CFLAGS		?= -O2
+ CFLAGS		+= -Wall
+ SOCFLAGS	:= -fpic -D_REENTRANT $(CFLAGS)
+ 
+-USE_STATIC_LIB ?= 0
++BUILD_DYNAMIC_LIB ?= 1
+ BUILD_STATIC_LIB ?= 1
++USE_STATIC_LIB ?= 0
++
+ ifeq ($(USE_STATIC_LIB),1)
+ BUILD_STATIC_LIB := 1
+ endif
+ 
++ifeq ($(BUILD_DYNAMIC_LIB),0)
++ifeq ($(BUILD_STATIC_LIB),0)
++$(error BUILD_DYNAMIC_LIB and BUILD_STATIC_LIB cannot be disabled at the same time)
++endif
++endif
++
+ KERNELVERSION	:= $(shell uname -r)
+ 
+ .PHONY: all strip clean install uninstall
+diff --git a/lib/Module.mk b/lib/Module.mk
+index fd2c8c4..44fa938 100644
+--- a/lib/Module.mk
++++ b/lib/Module.mk
+@@ -27,9 +27,13 @@ LIB_SHSONAME	:= $(LIB_SHBASENAME).$(LIB_MAINVER)
+ LIB_SHLIBNAME	:= $(LIB_SHBASENAME).$(LIB_VER)
+ LIB_STLIBNAME	:= libi2c.a
+ 
+-LIB_TARGETS	:= $(LIB_SHLIBNAME)
+ LIB_LINKS	:= $(LIB_SHSONAME) $(LIB_SHBASENAME)
+ LIB_OBJECTS	:= smbus.o
++
++LIB_TARGETS	:=
++ifeq ($(BUILD_DYNAMIC_LIB),1)
++LIB_TARGETS	+= $(LIB_SHLIBNAME)
++endif
+ ifeq ($(BUILD_STATIC_LIB),1)
+ LIB_TARGETS	+= $(LIB_STLIBNAME)
+ LIB_OBJECTS	+= smbus.ao
+-- 
+2.7.4
+
diff --git a/package/i2c-tools/0003-lib-Module.mk-Drop-unused-variable-LIB_OBJECTS.patch b/package/i2c-tools/0003-lib-Module.mk-Drop-unused-variable-LIB_OBJECTS.patch
new file mode 100644
index 0000000..43c915c
--- /dev/null
+++ b/package/i2c-tools/0003-lib-Module.mk-Drop-unused-variable-LIB_OBJECTS.patch
@@ -0,0 +1,33 @@
+From 1831b618fbedf0bcf15b0465981d133d9e3c53ee Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Wed, 6 Dec 2017 10:46:56 +0100
+Subject: lib/Module.mk: Drop unused variable LIB_OBJECTS
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+---
+ lib/Module.mk | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/lib/Module.mk b/lib/Module.mk
+index 44fa938..8a58f5b 100644
+--- a/lib/Module.mk
++++ b/lib/Module.mk
+@@ -28,7 +28,6 @@ LIB_SHLIBNAME	:= $(LIB_SHBASENAME).$(LIB_VER)
+ LIB_STLIBNAME	:= libi2c.a
+ 
+ LIB_LINKS	:= $(LIB_SHSONAME) $(LIB_SHBASENAME)
+-LIB_OBJECTS	:= smbus.o
+ 
+ LIB_TARGETS	:=
+ ifeq ($(BUILD_DYNAMIC_LIB),1)
+@@ -36,7 +35,6 @@ LIB_TARGETS	+= $(LIB_SHLIBNAME)
+ endif
+ ifeq ($(BUILD_STATIC_LIB),1)
+ LIB_TARGETS	+= $(LIB_STLIBNAME)
+-LIB_OBJECTS	+= smbus.ao
+ endif
+ 
+ #
+-- 
+2.7.4
+
diff --git a/package/i2c-tools/0004-tools-Module.mk-Add-missing-dependencies.patch b/package/i2c-tools/0004-tools-Module.mk-Add-missing-dependencies.patch
new file mode 100644
index 0000000..d18090b
--- /dev/null
+++ b/package/i2c-tools/0004-tools-Module.mk-Add-missing-dependencies.patch
@@ -0,0 +1,67 @@
+From 08b0d67ba7eceb862cb17f52eb1911e9579726ea Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Thu, 14 Dec 2017 08:52:26 +0100
+Subject: [PATCH] tools/Module.mk: Add missing dependencies
+
+Better build the library before building the tools which link against
+it, otherwise parallel builds could run into a race and break.
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+Acked-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+---
+ lib/Module.mk   |  7 +++++++
+ tools/Module.mk | 10 +++++-----
+ 2 files changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/lib/Module.mk b/lib/Module.mk
+index 8a58f5b..67afe91 100644
+--- a/lib/Module.mk
++++ b/lib/Module.mk
+@@ -37,6 +37,13 @@ ifeq ($(BUILD_STATIC_LIB),1)
+ LIB_TARGETS	+= $(LIB_STLIBNAME)
+ endif
+ 
++# Library file to link against (static or dynamic)
++ifeq ($(USE_STATIC_LIB),1)
++LIB_DEPS	:= $(LIB_DIR)/$(LIB_STLIBNAME)
++else
++LIB_DEPS	:= $(LIB_DIR)/$(LIB_SHBASENAME)
++endif
++
+ #
+ # Libraries
+ #
+diff --git a/tools/Module.mk b/tools/Module.mk
+index 6421a23..609de7a 100644
+--- a/tools/Module.mk
++++ b/tools/Module.mk
+@@ -24,19 +24,19 @@ TOOLS_TARGETS	:= i2cdetect i2cdump i2cset i2cget i2ctransfer
+ # Programs
+ #
+ 
+-$(TOOLS_DIR)/i2cdetect: $(TOOLS_DIR)/i2cdetect.o $(TOOLS_DIR)/i2cbusses.o
++$(TOOLS_DIR)/i2cdetect: $(TOOLS_DIR)/i2cdetect.o $(TOOLS_DIR)/i2cbusses.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+ 
+-$(TOOLS_DIR)/i2cdump: $(TOOLS_DIR)/i2cdump.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
++$(TOOLS_DIR)/i2cdump: $(TOOLS_DIR)/i2cdump.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+ 
+-$(TOOLS_DIR)/i2cset: $(TOOLS_DIR)/i2cset.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
++$(TOOLS_DIR)/i2cset: $(TOOLS_DIR)/i2cset.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+ 
+-$(TOOLS_DIR)/i2cget: $(TOOLS_DIR)/i2cget.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
++$(TOOLS_DIR)/i2cget: $(TOOLS_DIR)/i2cget.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+ 
+-$(TOOLS_DIR)/i2ctransfer: $(TOOLS_DIR)/i2ctransfer.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
++$(TOOLS_DIR)/i2ctransfer: $(TOOLS_DIR)/i2ctransfer.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+ 
+ #
+-- 
+2.7.4
+
diff --git a/package/i2c-tools/0005-lib-Module.mk-Fix-LIB_LINKS-dependency.patch b/package/i2c-tools/0005-lib-Module.mk-Fix-LIB_LINKS-dependency.patch
new file mode 100644
index 0000000..37a8ebc
--- /dev/null
+++ b/package/i2c-tools/0005-lib-Module.mk-Fix-LIB_LINKS-dependency.patch
@@ -0,0 +1,34 @@
+From de278d0933e3caea2508f95fd00e7e338bc12e8f Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Thu, 14 Dec 2017 13:34:29 +0100
+Subject: lib/Module.mk: Fix LIB_LINKS dependency
+
+LIB_LINKS should be added as a dependency only when
+BUILD_DYNAMIC_LIB is enabled.
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Fixes: 9906b2ecb6ae ("Makefile: Add flag to disable dynamic library"
+---
+ lib/Module.mk | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/Module.mk b/lib/Module.mk
+index 67afe91..2ebc70d 100644
+--- a/lib/Module.mk
++++ b/lib/Module.mk
+@@ -27,10 +27,9 @@ LIB_SHSONAME	:= $(LIB_SHBASENAME).$(LIB_MAINVER)
+ LIB_SHLIBNAME	:= $(LIB_SHBASENAME).$(LIB_VER)
+ LIB_STLIBNAME	:= libi2c.a
+ 
+-LIB_LINKS	:= $(LIB_SHSONAME) $(LIB_SHBASENAME)
+-
+ LIB_TARGETS	:=
+ ifeq ($(BUILD_DYNAMIC_LIB),1)
++LIB_LINKS	:= $(LIB_SHSONAME) $(LIB_SHBASENAME)
+ LIB_TARGETS	+= $(LIB_SHLIBNAME)
+ endif
+ ifeq ($(BUILD_STATIC_LIB),1)
+-- 
+2.7.4
+
diff --git a/package/i2c-tools/0006-Makefile-Allow-to-really-disable-the-dynamic-library.patch b/package/i2c-tools/0006-Makefile-Allow-to-really-disable-the-dynamic-library.patch
new file mode 100644
index 0000000..85438cb
--- /dev/null
+++ b/package/i2c-tools/0006-Makefile-Allow-to-really-disable-the-dynamic-library.patch
@@ -0,0 +1,33 @@
+From 57d2c370493f2e9e33b30e8767624c648f138ec4 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Thu, 14 Dec 2017 13:34:34 +0100
+Subject: Makefile: Allow to really disable the dynamic library
+
+If the user disables the build of the dynamic library, we have to
+link the tools with the static library. If we don't, the dependencies
+will cause the dynamic library to be built regardless of the user's
+request.
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Fixes: 9906b2ecb6ae ("Makefile: Add flag to disable dynamic library")
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 1bb5572..6bb741f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -43,6 +43,8 @@ endif
+ ifeq ($(BUILD_DYNAMIC_LIB),0)
+ ifeq ($(BUILD_STATIC_LIB),0)
+ $(error BUILD_DYNAMIC_LIB and BUILD_STATIC_LIB cannot be disabled at the same time)
++else
++USE_STATIC_LIB := 1
+ endif
+ endif
+ 
+-- 
+2.7.4
+
diff --git a/package/i2c-tools/0007-eeprog-Module.mk-Add-missing-dependency.patch b/package/i2c-tools/0007-eeprog-Module.mk-Add-missing-dependency.patch
new file mode 100644
index 0000000..126d388
--- /dev/null
+++ b/package/i2c-tools/0007-eeprog-Module.mk-Add-missing-dependency.patch
@@ -0,0 +1,30 @@
+From f87c97317012a3b96b67237925893b8ffd5f4f50 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@gmail.com>
+Date: Tue, 19 Dec 2017 13:46:15 +0100
+Subject: [PATCH] eeprog/Module.mk: Add missing dependency
+
+Absence of this dependency caused parallel build to run into a race
+and break.
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+---
+ eeprog/Module.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/eeprog/Module.mk b/eeprog/Module.mk
+index 9d36869..d215855 100644
+--- a/eeprog/Module.mk
++++ b/eeprog/Module.mk
+@@ -20,7 +20,7 @@ EEPROG_TARGETS	:= eeprog
+ # Programs
+ #
+ 
+-$(EEPROG_DIR)/eeprog: $(EEPROG_DIR)/eeprog.o $(EEPROG_DIR)/24cXX.o
++$(EEPROG_DIR)/eeprog: $(EEPROG_DIR)/eeprog.o $(EEPROG_DIR)/24cXX.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(EEPROG_LDFLAGS)
+ 
+ #
+-- 
+2.7.4
+
diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index 464219d..3475d20 100644
--- a/package/i2c-tools/i2c-tools.hash
+++ b/package/i2c-tools/i2c-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 6d6079153cd49a62d4addacef4c092db1a46ba60b2807070a3fbe050262aef87  i2c-tools-3.1.2.tar.xz
+sha256 d900ca1c11c51ea20caa50b096f948008b8a7ad832311b23353e21baa7af28d6  i2c-tools-4.0.tar.xz
 
 # License file
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 3bbaf38..0f71fd4 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = 3.1.2
+I2C_TOOLS_VERSION = 4.0
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
+I2C_TOOLS_MAKE_OPTS = EXTRA=eeprog
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 I2C_TOOLS_DEPENDENCIES += python
@@ -22,6 +23,14 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 I2C_TOOLS_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+I2C_TOOLS_MAKE_OPTS += BUILD_DYNAMIC_LIB=0 USE_STATIC_LIB=1
+endif
+
+ifeq ($(BR2_SHARED_LIBS),y)
+I2C_TOOLS_MAKE_OPTS += BUILD_STATIC_LIB=0
+endif
+
 # Build/install steps mirror the distutil python package type in the python package
 # infrastructure
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
@@ -47,15 +56,16 @@ endef
 endif # BR2_PACKAGE_PYTHON
 
 define I2C_TOOLS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(I2C_TOOLS_MAKE_OPTS) -C $(@D)
 	$(I2C_TOOLS_BUILD_PYSMBUS)
 endef
 
 define I2C_TOOLS_INSTALL_TARGET_CMDS
-	for i in i2cdump i2cget i2cset i2cdetect; \
+	for i in i2cdump i2cget i2cset i2cdetect i2ctransfer; \
 	do \
 		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/sbin/$$i; \
 	done
+	$(INSTALL) -m 755 -D $(@D)/eeprog/eeprog $(TARGET_DIR)/usr/bin/eeprog;
 	$(I2C_TOOLS_INSTALL_PYSMBUS)
 endef
 
-- 
2.7.4
