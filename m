From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:08:33 +0100
Subject: [Buildroot] [git commit] package/i2c-tools: bump to version 4.1
Message-ID: <20181213210506.9EF998BE56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbb2f0d7952de1e74da0749431e8ec11eb5db4c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Rename 'prefix' to 'PREFIX' following upstream change.

Update README hash for build documentation changes unrelated to license.

Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-lib-Module.mk-Add-missing-dependencies.patch | 34 -----------
 ...efile-Add-flag-to-disable-dynamic-library.patch | 64 ---------------------
 ...odule.mk-Drop-unused-variable-LIB_OBJECTS.patch | 33 -----------
 ...-tools-Module.mk-Add-missing-dependencies.patch | 67 ----------------------
 ...05-lib-Module.mk-Fix-LIB_LINKS-dependency.patch | 34 -----------
 ...low-to-really-disable-the-dynamic-library.patch | 33 -----------
 ...7-eeprog-Module.mk-Add-missing-dependency.patch | 30 ----------
 ...mk-don-t-install-dynamic-library-when-dis.patch | 41 -------------
 package/i2c-tools/i2c-tools.hash                   |  4 +-
 package/i2c-tools/i2c-tools.mk                     |  6 +-
 10 files changed, 5 insertions(+), 341 deletions(-)

diff --git a/package/i2c-tools/0001-lib-Module.mk-Add-missing-dependencies.patch b/package/i2c-tools/0001-lib-Module.mk-Add-missing-dependencies.patch
deleted file mode 100644
index 09a78dae0e..0000000000
--- a/package/i2c-tools/0001-lib-Module.mk-Add-missing-dependencies.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a6a59693066fd8da81f7107479df3e32a129247d Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Wed, 6 Dec 2017 09:55:04 +0100
-Subject: [PATCH] lib/Module.mk: Add missing dependencies
-
-The lib symlinks lacked a dependency to the actual library file, so
-parallel builds could run into a race and break.
-
-Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
----
- lib/Module.mk | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/Module.mk b/lib/Module.mk
-index 432a051..fd2c8c4 100644
---- a/lib/Module.mk
-+++ b/lib/Module.mk
-@@ -42,11 +42,11 @@ endif
- $(LIB_DIR)/$(LIB_SHLIBNAME): $(LIB_DIR)/smbus.o
- 	$(CC) -shared $(LDFLAGS) -Wl,--version-script=$(LIB_DIR)/libi2c.map -Wl,-soname,$(LIB_SHSONAME) -o $@ $^ -lc
- 
--$(LIB_DIR)/$(LIB_SHSONAME):
-+$(LIB_DIR)/$(LIB_SHSONAME): $(LIB_DIR)/$(LIB_SHLIBNAME)
- 	$(RM) $@
- 	$(LN) $(LIB_SHLIBNAME) $@
- 
--$(LIB_DIR)/$(LIB_SHBASENAME):
-+$(LIB_DIR)/$(LIB_SHBASENAME): $(LIB_DIR)/$(LIB_SHLIBNAME)
- 	$(RM) $@
- 	$(LN) $(LIB_SHLIBNAME) $@
- 
--- 
-2.7.4
-
diff --git a/package/i2c-tools/0002-Makefile-Add-flag-to-disable-dynamic-library.patch b/package/i2c-tools/0002-Makefile-Add-flag-to-disable-dynamic-library.patch
deleted file mode 100644
index b5ec5471de..0000000000
--- a/package/i2c-tools/0002-Makefile-Add-flag-to-disable-dynamic-library.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 9906b2ecb6aec02d6348d6237b784135e6930d0b Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo@amarulasolutions.com>
-Date: Wed, 6 Dec 2017 10:12:07 +0100
-Subject: Makefile: Add flag to disable dynamic library
-
-In such cases where you need to disable entirely the dynamic
-library compilation, now you can use the BUILD_DYNAMIC_LIB=0
-flag.
-
-Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
----
- Makefile      | 10 +++++++++-
- lib/Module.mk |  6 +++++-
- 2 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index c85317c..1bb5572 100644
---- a/Makefile
-+++ b/Makefile
-@@ -32,12 +32,20 @@ CFLAGS		?= -O2
- CFLAGS		+= -Wall
- SOCFLAGS	:= -fpic -D_REENTRANT $(CFLAGS)
- 
--USE_STATIC_LIB ?= 0
-+BUILD_DYNAMIC_LIB ?= 1
- BUILD_STATIC_LIB ?= 1
-+USE_STATIC_LIB ?= 0
-+
- ifeq ($(USE_STATIC_LIB),1)
- BUILD_STATIC_LIB := 1
- endif
- 
-+ifeq ($(BUILD_DYNAMIC_LIB),0)
-+ifeq ($(BUILD_STATIC_LIB),0)
-+$(error BUILD_DYNAMIC_LIB and BUILD_STATIC_LIB cannot be disabled at the same time)
-+endif
-+endif
-+
- KERNELVERSION	:= $(shell uname -r)
- 
- .PHONY: all strip clean install uninstall
-diff --git a/lib/Module.mk b/lib/Module.mk
-index fd2c8c4..44fa938 100644
---- a/lib/Module.mk
-+++ b/lib/Module.mk
-@@ -27,9 +27,13 @@ LIB_SHSONAME	:= $(LIB_SHBASENAME).$(LIB_MAINVER)
- LIB_SHLIBNAME	:= $(LIB_SHBASENAME).$(LIB_VER)
- LIB_STLIBNAME	:= libi2c.a
- 
--LIB_TARGETS	:= $(LIB_SHLIBNAME)
- LIB_LINKS	:= $(LIB_SHSONAME) $(LIB_SHBASENAME)
- LIB_OBJECTS	:= smbus.o
-+
-+LIB_TARGETS	:=
-+ifeq ($(BUILD_DYNAMIC_LIB),1)
-+LIB_TARGETS	+= $(LIB_SHLIBNAME)
-+endif
- ifeq ($(BUILD_STATIC_LIB),1)
- LIB_TARGETS	+= $(LIB_STLIBNAME)
- LIB_OBJECTS	+= smbus.ao
--- 
-2.7.4
-
diff --git a/package/i2c-tools/0003-lib-Module.mk-Drop-unused-variable-LIB_OBJECTS.patch b/package/i2c-tools/0003-lib-Module.mk-Drop-unused-variable-LIB_OBJECTS.patch
deleted file mode 100644
index 43c915c200..0000000000
--- a/package/i2c-tools/0003-lib-Module.mk-Drop-unused-variable-LIB_OBJECTS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1831b618fbedf0bcf15b0465981d133d9e3c53ee Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Wed, 6 Dec 2017 10:46:56 +0100
-Subject: lib/Module.mk: Drop unused variable LIB_OBJECTS
-
-Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
----
- lib/Module.mk | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/lib/Module.mk b/lib/Module.mk
-index 44fa938..8a58f5b 100644
---- a/lib/Module.mk
-+++ b/lib/Module.mk
-@@ -28,7 +28,6 @@ LIB_SHLIBNAME	:= $(LIB_SHBASENAME).$(LIB_VER)
- LIB_STLIBNAME	:= libi2c.a
- 
- LIB_LINKS	:= $(LIB_SHSONAME) $(LIB_SHBASENAME)
--LIB_OBJECTS	:= smbus.o
- 
- LIB_TARGETS	:=
- ifeq ($(BUILD_DYNAMIC_LIB),1)
-@@ -36,7 +35,6 @@ LIB_TARGETS	+= $(LIB_SHLIBNAME)
- endif
- ifeq ($(BUILD_STATIC_LIB),1)
- LIB_TARGETS	+= $(LIB_STLIBNAME)
--LIB_OBJECTS	+= smbus.ao
- endif
- 
- #
--- 
-2.7.4
-
diff --git a/package/i2c-tools/0004-tools-Module.mk-Add-missing-dependencies.patch b/package/i2c-tools/0004-tools-Module.mk-Add-missing-dependencies.patch
deleted file mode 100644
index d18090be0b..0000000000
--- a/package/i2c-tools/0004-tools-Module.mk-Add-missing-dependencies.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 08b0d67ba7eceb862cb17f52eb1911e9579726ea Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Thu, 14 Dec 2017 08:52:26 +0100
-Subject: [PATCH] tools/Module.mk: Add missing dependencies
-
-Better build the library before building the tools which link against
-it, otherwise parallel builds could run into a race and break.
-
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
-Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
-Acked-by: Angelo Compagnucci <angelo@amarulasolutions.com>
-Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
----
- lib/Module.mk   |  7 +++++++
- tools/Module.mk | 10 +++++-----
- 2 files changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/lib/Module.mk b/lib/Module.mk
-index 8a58f5b..67afe91 100644
---- a/lib/Module.mk
-+++ b/lib/Module.mk
-@@ -37,6 +37,13 @@ ifeq ($(BUILD_STATIC_LIB),1)
- LIB_TARGETS	+= $(LIB_STLIBNAME)
- endif
- 
-+# Library file to link against (static or dynamic)
-+ifeq ($(USE_STATIC_LIB),1)
-+LIB_DEPS	:= $(LIB_DIR)/$(LIB_STLIBNAME)
-+else
-+LIB_DEPS	:= $(LIB_DIR)/$(LIB_SHBASENAME)
-+endif
-+
- #
- # Libraries
- #
-diff --git a/tools/Module.mk b/tools/Module.mk
-index 6421a23..609de7a 100644
---- a/tools/Module.mk
-+++ b/tools/Module.mk
-@@ -24,19 +24,19 @@ TOOLS_TARGETS	:= i2cdetect i2cdump i2cset i2cget i2ctransfer
- # Programs
- #
- 
--$(TOOLS_DIR)/i2cdetect: $(TOOLS_DIR)/i2cdetect.o $(TOOLS_DIR)/i2cbusses.o
-+$(TOOLS_DIR)/i2cdetect: $(TOOLS_DIR)/i2cdetect.o $(TOOLS_DIR)/i2cbusses.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
- 
--$(TOOLS_DIR)/i2cdump: $(TOOLS_DIR)/i2cdump.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
-+$(TOOLS_DIR)/i2cdump: $(TOOLS_DIR)/i2cdump.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
- 
--$(TOOLS_DIR)/i2cset: $(TOOLS_DIR)/i2cset.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
-+$(TOOLS_DIR)/i2cset: $(TOOLS_DIR)/i2cset.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
- 
--$(TOOLS_DIR)/i2cget: $(TOOLS_DIR)/i2cget.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
-+$(TOOLS_DIR)/i2cget: $(TOOLS_DIR)/i2cget.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
- 
--$(TOOLS_DIR)/i2ctransfer: $(TOOLS_DIR)/i2ctransfer.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
-+$(TOOLS_DIR)/i2ctransfer: $(TOOLS_DIR)/i2ctransfer.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
- 
- #
--- 
-2.7.4
-
diff --git a/package/i2c-tools/0005-lib-Module.mk-Fix-LIB_LINKS-dependency.patch b/package/i2c-tools/0005-lib-Module.mk-Fix-LIB_LINKS-dependency.patch
deleted file mode 100644
index 37a8ebc6fd..0000000000
--- a/package/i2c-tools/0005-lib-Module.mk-Fix-LIB_LINKS-dependency.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From de278d0933e3caea2508f95fd00e7e338bc12e8f Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo@amarulasolutions.com>
-Date: Thu, 14 Dec 2017 13:34:29 +0100
-Subject: lib/Module.mk: Fix LIB_LINKS dependency
-
-LIB_LINKS should be added as a dependency only when
-BUILD_DYNAMIC_LIB is enabled.
-
-Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
-Fixes: 9906b2ecb6ae ("Makefile: Add flag to disable dynamic library"
----
- lib/Module.mk | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/lib/Module.mk b/lib/Module.mk
-index 67afe91..2ebc70d 100644
---- a/lib/Module.mk
-+++ b/lib/Module.mk
-@@ -27,10 +27,9 @@ LIB_SHSONAME	:= $(LIB_SHBASENAME).$(LIB_MAINVER)
- LIB_SHLIBNAME	:= $(LIB_SHBASENAME).$(LIB_VER)
- LIB_STLIBNAME	:= libi2c.a
- 
--LIB_LINKS	:= $(LIB_SHSONAME) $(LIB_SHBASENAME)
--
- LIB_TARGETS	:=
- ifeq ($(BUILD_DYNAMIC_LIB),1)
-+LIB_LINKS	:= $(LIB_SHSONAME) $(LIB_SHBASENAME)
- LIB_TARGETS	+= $(LIB_SHLIBNAME)
- endif
- ifeq ($(BUILD_STATIC_LIB),1)
--- 
-2.7.4
-
diff --git a/package/i2c-tools/0006-Makefile-Allow-to-really-disable-the-dynamic-library.patch b/package/i2c-tools/0006-Makefile-Allow-to-really-disable-the-dynamic-library.patch
deleted file mode 100644
index 85438cbf01..0000000000
--- a/package/i2c-tools/0006-Makefile-Allow-to-really-disable-the-dynamic-library.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 57d2c370493f2e9e33b30e8767624c648f138ec4 Mon Sep 17 00:00:00 2001
-From: Jean Delvare <jdelvare@suse.de>
-Date: Thu, 14 Dec 2017 13:34:34 +0100
-Subject: Makefile: Allow to really disable the dynamic library
-
-If the user disables the build of the dynamic library, we have to
-link the tools with the static library. If we don't, the dependencies
-will cause the dynamic library to be built regardless of the user's
-request.
-
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
-Fixes: 9906b2ecb6ae ("Makefile: Add flag to disable dynamic library")
-Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
----
- Makefile | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 1bb5572..6bb741f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -43,6 +43,8 @@ endif
- ifeq ($(BUILD_DYNAMIC_LIB),0)
- ifeq ($(BUILD_STATIC_LIB),0)
- $(error BUILD_DYNAMIC_LIB and BUILD_STATIC_LIB cannot be disabled at the same time)
-+else
-+USE_STATIC_LIB := 1
- endif
- endif
- 
--- 
-2.7.4
-
diff --git a/package/i2c-tools/0007-eeprog-Module.mk-Add-missing-dependency.patch b/package/i2c-tools/0007-eeprog-Module.mk-Add-missing-dependency.patch
deleted file mode 100644
index 126d388569..0000000000
--- a/package/i2c-tools/0007-eeprog-Module.mk-Add-missing-dependency.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f87c97317012a3b96b67237925893b8ffd5f4f50 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@gmail.com>
-Date: Tue, 19 Dec 2017 13:46:15 +0100
-Subject: [PATCH] eeprog/Module.mk: Add missing dependency
-
-Absence of this dependency caused parallel build to run into a race
-and break.
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
----
- eeprog/Module.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/eeprog/Module.mk b/eeprog/Module.mk
-index 9d36869..d215855 100644
---- a/eeprog/Module.mk
-+++ b/eeprog/Module.mk
-@@ -20,7 +20,7 @@ EEPROG_TARGETS	:= eeprog
- # Programs
- #
- 
--$(EEPROG_DIR)/eeprog: $(EEPROG_DIR)/eeprog.o $(EEPROG_DIR)/24cXX.o
-+$(EEPROG_DIR)/eeprog: $(EEPROG_DIR)/eeprog.o $(EEPROG_DIR)/24cXX.o $(LIB_DEPS)
- 	$(CC) $(LDFLAGS) -o $@ $^ $(EEPROG_LDFLAGS)
- 
- #
--- 
-2.7.4
-
diff --git a/package/i2c-tools/0008-lib-Module.mk-don-t-install-dynamic-library-when-dis.patch b/package/i2c-tools/0008-lib-Module.mk-don-t-install-dynamic-library-when-dis.patch
deleted file mode 100644
index 69410ce544..0000000000
--- a/package/i2c-tools/0008-lib-Module.mk-don-t-install-dynamic-library-when-dis.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From ae2e0c9708aeb4a8fb301a1a4016cec7b05fc142 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 2 Jan 2018 06:55:41 +0200
-Subject: [PATCH] lib/Module.mk: don't install dynamic library when disabled
-
-Do not attempt to install the dynamic library when build of that library
-is disabled. Fixes the following installation error:
-
-install -m 755 lib/libi2c.so.0.1.0 .../target/usr/lib
-install: cannot stat 'lib/libi2c.so.0.1.0': No such file or directory
-lib/Module.mk:90: recipe for target 'install-lib' failed
-
-Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-
-Patch status: posted upstream
-https://marc.info/?l=linux-i2c&m=151486925730634&w=2
-
- lib/Module.mk | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/Module.mk b/lib/Module.mk
-index 2ebc70d76ed9..c492961e0a4a 100644
---- a/lib/Module.mk
-+++ b/lib/Module.mk
-@@ -88,9 +88,11 @@ clean-lib:
- 
- install-lib: $(addprefix $(LIB_DIR)/,$(LIB_TARGETS))
- 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
-+ifeq ($(BUILD_DYNAMIC_LIB),1)
- 	$(INSTALL_PROGRAM) $(LIB_DIR)/$(LIB_SHLIBNAME) $(DESTDIR)$(libdir)
- 	$(LN) $(LIB_SHLIBNAME) $(DESTDIR)$(libdir)/$(LIB_SHSONAME)
- 	$(LN) $(LIB_SHSONAME) $(DESTDIR)$(libdir)/$(LIB_SHBASENAME)
-+endif
- ifeq ($(BUILD_STATIC_LIB),1)
- 	$(INSTALL_DATA) $(LIB_DIR)/$(LIB_STLIBNAME) $(DESTDIR)$(libdir)
- endif
--- 
-2.15.1
-
diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index 37563074fc..280a139c00 100644
--- a/package/i2c-tools/i2c-tools.hash
+++ b/package/i2c-tools/i2c-tools.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha256 d900ca1c11c51ea20caa50b096f948008b8a7ad832311b23353e21baa7af28d6  i2c-tools-4.0.tar.xz
+sha256 57b219efd183795bd545dd5a60d9eabbe9dcb6f8fb92bc7ba2122b87f98527d5  i2c-tools-4.1.tar.xz
 
 # License files
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256 158abc6886c2c6e2dec7e9cb11b46fd41cb13a015c5057c2a587ef581f9142f8  README
+sha256 b75b04b46320dff5e2b50a9c69b8e526b7db5087083ea3ba65533f08fc11b9f0  README
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 11d0cf9808..d4d9c012fa 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = 4.0
+I2C_TOOLS_VERSION = 4.1
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (libi2c)
@@ -59,13 +59,13 @@ endef
 
 define I2C_TOOLS_INSTALL_TARGET_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(I2C_TOOLS_MAKE_OPTS) \
-		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) install
+		DESTDIR="$(TARGET_DIR)" PREFIX=/usr -C $(@D) install
 	$(I2C_TOOLS_INSTALL_PYSMBUS)
 endef
 
 define I2C_TOOLS_INSTALL_STAGING_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(I2C_TOOLS_MAKE_OPTS) \
-		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) install
+		DESTDIR="$(STAGING_DIR)" PREFIX=/usr -C $(@D) install
 endef
 
 $(eval $(generic-package))
