From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  9 Jul 2014 22:50:31 +0200
Subject: [Buildroot] [PATCH 1/3] lm-sensors: fix static-only builds
Message-ID: <1404939033-32578-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to lm-sensors to support a new variable
BUILD_SHARED_LIB that allows to conditionally enable or disable the
build (and usage) of the libsensors shared library.

It also refactors the make variables in a variable called
LM_SENSORS_MAKE_OPT.

Fixes:

  http://autobuild.buildroot.org/results/06c/06c197263e4939d6adc4877e152f602a69df751d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../lm-sensors/lm-sensors-0001-static-build.patch  | 81 ++++++++++++++++++++++
 package/lm-sensors/lm-sensors.mk                   | 18 +++--
 2 files changed, 95 insertions(+), 4 deletions(-)
 create mode 100644 package/lm-sensors/lm-sensors-0001-static-build.patch

diff --git a/package/lm-sensors/lm-sensors-0001-static-build.patch b/package/lm-sensors/lm-sensors-0001-static-build.patch
new file mode 100644
index 0000000..c914d3a
--- /dev/null
+++ b/package/lm-sensors/lm-sensors-0001-static-build.patch
@@ -0,0 +1,81 @@
+Add support for static only build
+
+This patch adds support for a BUILD_SHARED_LIB variable that allows to
+enable/disable the build of the shared library, in order to support
+static-only builds.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -85,6 +85,9 @@
+ # Build and install static library
+ BUILD_STATIC_LIB := 1
+ 
++# Build and install shared library
++BUILD_SHARED_LIB := 1
++
+ # Set these to add preprocessor or compiler flags, or use
+ # environment variables
+ # CFLAGS :=
+Index: b/lib/Module.mk
+===================================================================
+--- a/lib/Module.mk
++++ b/lib/Module.mk
+@@ -43,8 +43,14 @@
+ LIBSTLIBNAME := libsensors.a
+ LIBSHSONAME := libsensors.so.$(LIBMAINVER)
+ 
++ifeq ($(BUILD_SHARED_LIB),1)
+ LIBTARGETS := $(MODULE_DIR)/$(LIBSHLIBNAME) \
+               $(MODULE_DIR)/$(LIBSHSONAME) $(MODULE_DIR)/$(LIBSHBASENAME)
++LIBDEP     := $(LIBSHBASENAME)
++else
++LIBDEP     := $(LIBSTLIBNAME)
++endif
++
+ ifeq ($(BUILD_STATIC_LIB),1)
+ LIBTARGETS += $(MODULE_DIR)/$(LIBSTLIBNAME)
+ endif
+@@ -131,9 +137,11 @@
+ ifeq ($(BUILD_STATIC_LIB),1)
+ 	$(INSTALL) -m 644 $(LIB_DIR)/$(LIBSTLIBNAME) $(DESTDIR)$(LIBDIR)
+ endif
++ifeq ($(BUILD_SHARED_LIB),1)
+ 	$(INSTALL) -m 755 $(LIB_DIR)/$(LIBSHLIBNAME) $(DESTDIR)$(LIBDIR)
+ 	$(LN) $(LIBSHLIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBSHSONAME)
+ 	$(LN) $(LIBSHSONAME) $(DESTDIR)$(LIBDIR)/$(LIBSHBASENAME)
++endif
+ 	@if [ -z "$(DESTDIR)" -a "$(LIBDIR)" != "/usr/lib" -a "$(LIBDIR)" != "/lib" ] ; then \
+ 	   if [ -e "/usr/lib/$(LIBSHSONAME)" -o -e "/usr/lib/$(LIBSHBASENAME)" ] ; then \
+ 	     echo '******************************************************************************' ; \
+Index: b/prog/sensord/Module.mk
+===================================================================
+--- a/prog/sensord/Module.mk
++++ b/prog/sensord/Module.mk
+@@ -41,7 +41,7 @@
+ REMOVESENSORDBIN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(SBINDIR)/%,$(PROGSENSORDTARGETS))
+ REMOVESENSORDMAN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(PROGSENSORDMAN8DIR)/%,$(PROGSENSORDMAN8FILES))
+ 
+-$(PROGSENSORDTARGETS): $(PROGSENSORDSOURCES:.c=.ro) lib/$(LIBSHBASENAME)
++$(PROGSENSORDTARGETS): $(PROGSENSORDSOURCES:.c=.ro) lib/$(LIBDEP)
+ 	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORDSOURCES:.c=.ro) -Llib -lsensors -lrrd
+ 
+ all-prog-sensord: $(PROGSENSORDTARGETS)
+Index: b/prog/sensors/Module.mk
+===================================================================
+--- a/prog/sensors/Module.mk
++++ b/prog/sensors/Module.mk
+@@ -39,8 +39,8 @@
+ 
+ LIBICONV := $(shell if /sbin/ldconfig -p | grep -q '/libiconv\.so$$' ; then echo \-liconv; else echo; fi)
+ 
+-$(PROGSENSORSTARGETS): $(PROGSENSORSSOURCES:.c=.ro) lib/$(LIBSHBASENAME)
+-	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORSSOURCES:.c=.ro) $(LIBICONV) -Llib -lsensors
++$(PROGSENSORSTARGETS): $(PROGSENSORSSOURCES:.c=.ro) lib/$(LIBDEP)
++	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORSSOURCES:.c=.ro) $(LIBICONV) -Llib -lsensors -lm
+ 
+ all-prog-sensors: $(PROGSENSORSTARGETS)
+ user :: all-prog-sensors
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 03c6b54..61e1c73 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -20,18 +20,28 @@ LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_ISASET) += sbin/isaset
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_PWMCONFIG) += sbin/pwmconfig
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT) += sbin/sensors-detect
 
+LM_SENSORS_MAKE_OPT = \
+	BUILD_STATIC_LIB=1 \
+	MACHINE=$(KERNEL_ARCH) \
+	PREFIX=/usr
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LM_SENSORS_MAKE_OPT += BUILD_SHARED_LIB=0
+else
+LM_SENSORS_MAKE_OPT += BUILD_SHARED_LIB=1
+endif
+
 define LM_SENSORS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) MACHINE=$(KERNEL_ARCH) \
-		PREFIX=/usr -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LM_SENSORS_MAKE_OPT) -C $(@D)
 endef
 
 define LM_SENSORS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) install
+	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
 	rm -f $(addprefix $(STAGING_DIR)/usr/,$(LM_SENSORS_BINS_) $(LM_SENSORS_BINS_y))
 endef
 
 define LM_SENSORS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
+	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
 	rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
 endef
 
-- 
2.0.0
