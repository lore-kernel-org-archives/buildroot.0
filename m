From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:46:38 +0200
Subject: [Buildroot] [git commit] package/scons: remove python from SCONS
Message-ID: <20190401204253.44CA98A529@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f72be49830404fb69480a9e5db4381dfcc6dc8ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove $(HOST_DIR)/bin/python from SCONS variable to allow each scons
package to select their python interpreter. Indeed, most of the scons
packages (alljoyn, benejson, gpsd) only supports python2

Fixes:
 - http://autobuild.buildroot.org/results/b45f9fb69615b80758adeff4571e170c3bd9356b
 - http://autobuild.buildroot.org/results/13144a7ebd64ef7889312053f06a14047eea232d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alljoyn-base/alljoyn-base.mk         |  4 ++--
 package/alljoyn-tcl-base/alljoyn-tcl-base.mk |  4 ++--
 package/alljoyn-tcl/alljoyn-tcl.mk           |  4 ++--
 package/alljoyn/alljoyn.mk                   |  4 ++--
 package/benejson/benejson.mk                 |  4 ++--
 package/gpsd/gpsd.mk                         | 10 +++++-----
 package/mongodb/mongodb.mk                   |  4 ++--
 package/scons/scons.mk                       |  2 +-
 8 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/alljoyn-base/alljoyn-base.mk b/package/alljoyn-base/alljoyn-base.mk
index ad19802823..64ba647ab0 100644
--- a/package/alljoyn-base/alljoyn-base.mk
+++ b/package/alljoyn-base/alljoyn-base.mk
@@ -11,7 +11,7 @@ ALLJOYN_BASE_SITE = \
 # See https://allseenalliance.org/alliance/ip-policy
 ALLJOYN_BASE_LICENSE = ISC
 
-ALLJOYN_BASE_DEPENDENCIES = host-scons alljoyn openssl
+ALLJOYN_BASE_DEPENDENCIES = host-python host-scons alljoyn openssl
 ALLJOYN_BASE_INSTALL_STAGING = YES
 
 ALLJOYN_BASE_CRYPTO = openssl
@@ -68,7 +68,7 @@ endif
 
 define ALLJOYN_BASE_BUILD_CMDS
 	$(foreach target,$(ALLJOYN_BASE_TARGETS),\
-		cd $(@D)/$(target); $(SCONS) $(ALLJOYN_BASE_SCONS_OPTS)
+		cd $(@D)/$(target); $(HOST_DIR)/bin/python2 $(SCONS) $(ALLJOYN_BASE_SCONS_OPTS)
 	)
 endef
 
diff --git a/package/alljoyn-tcl-base/alljoyn-tcl-base.mk b/package/alljoyn-tcl-base/alljoyn-tcl-base.mk
index 461cd097d6..f8ef5a3e10 100644
--- a/package/alljoyn-tcl-base/alljoyn-tcl-base.mk
+++ b/package/alljoyn-tcl-base/alljoyn-tcl-base.mk
@@ -12,7 +12,7 @@ ALLJOYN_TCL_BASE_SITE = \
 # See https://allseenalliance.org/alliance/ip-policy
 ALLJOYN_TCL_BASE_LICENSE = ISC
 
-ALLJOYN_TCL_BASE_DEPENDENCIES = host-scons alljoyn-tcl
+ALLJOYN_TCL_BASE_DEPENDENCIES = host-python host-scons alljoyn-tcl
 ALLJOYN_TCL_BASE_INSTALL_STAGING = YES
 
 # AllJoyn Base Thin Core can be compiled in debug or release mode. By default,
@@ -29,7 +29,7 @@ ALLJOYN_TCL_BASE_SCONS_OPTS = \
 	WS=off
 
 define ALLJOYN_TCL_BASE_BUILD_CMDS
-	cd $(@D); $(SCONS) $(ALLJOYN_TCL_BASE_SCONS_OPTS)
+	cd $(@D); $(HOST_DIR)/bin/python2 $(SCONS) $(ALLJOYN_TCL_BASE_SCONS_OPTS)
 endef
 
 define ALLJOYN_TCL_BASE_INSTALL_STAGING_CMDS
diff --git a/package/alljoyn-tcl/alljoyn-tcl.mk b/package/alljoyn-tcl/alljoyn-tcl.mk
index cabdf8992a..8981ead378 100644
--- a/package/alljoyn-tcl/alljoyn-tcl.mk
+++ b/package/alljoyn-tcl/alljoyn-tcl.mk
@@ -12,7 +12,7 @@ ALLJOYN_TCL_SITE = \
 # See https://allseenalliance.org/alliance/ip-policy
 ALLJOYN_TCL_LICENSE = ISC
 
-ALLJOYN_TCL_DEPENDENCIES = host-scons
+ALLJOYN_TCL_DEPENDENCIES = host-python host-scons
 ALLJOYN_TCL_INSTALL_STAGING = YES
 
 # AllJoyn Thin Core can be compiled in debug or release mode. By default,
@@ -27,7 +27,7 @@ ALLJOYN_TCL_SCONS_OPTS = \
 	CXX="$(TARGET_CXX)"
 
 define ALLJOYN_TCL_BUILD_CMDS
-	cd $(@D); $(SCONS) $(ALLJOYN_TCL_SCONS_OPTS)
+	cd $(@D); $(HOST_DIR)/bin/python2 $(SCONS) $(ALLJOYN_TCL_SCONS_OPTS)
 endef
 
 define ALLJOYN_TCL_INSTALL_STAGING_CMDS
diff --git a/package/alljoyn/alljoyn.mk b/package/alljoyn/alljoyn.mk
index 1281674e38..d05705c429 100644
--- a/package/alljoyn/alljoyn.mk
+++ b/package/alljoyn/alljoyn.mk
@@ -11,7 +11,7 @@ ALLJOYN_SITE = https://mirrors.kernel.org/allseenalliance/alljoyn/$(ALLJOYN_REV)
 # See https://allseenalliance.org/alliance/ip-policy
 ALLJOYN_LICENSE = ISC
 
-ALLJOYN_DEPENDENCIES = host-scons libcap
+ALLJOYN_DEPENDENCIES = host-python host-scons libcap
 ALLJOYN_INSTALL_STAGING = YES
 
 # AllJoyn can be compiled in debug or release mode. By default, AllJoyn is built
@@ -51,7 +51,7 @@ ALLJOYN_SCONS_OPTS = \
 	TARGET_PATH="$(BR_PATH)"
 
 define ALLJOYN_BUILD_CMDS
-	cd $(@D); $(SCONS) $(ALLJOYN_SCONS_OPTS)
+	cd $(@D); $(HOST_DIR)/bin/python2 $(SCONS) $(ALLJOYN_SCONS_OPTS)
 endef
 
 define ALLJOYN_INSTALL_STAGING_CMDS
diff --git a/package/benejson/benejson.mk b/package/benejson/benejson.mk
index 680e5b5bda..0faf5f1cc4 100644
--- a/package/benejson/benejson.mk
+++ b/package/benejson/benejson.mk
@@ -9,7 +9,7 @@ BENEJSON_SITE = $(call github,codehero,benejson,$(BENEJSON_VERSION))
 BENEJSON_LICENSE = MIT
 BENEJSON_LICENSE_FILES = LICENSE
 BENEJSON_INSTALL_STAGING = YES
-BENEJSON_DEPENDENCIES = host-scons
+BENEJSON_DEPENDENCIES = host-python host-scons
 
 # wchar support needs to be manually disabled
 ifeq ($(BR2_USE_WCHAR),)
@@ -41,7 +41,7 @@ endif # Shared enabled
 define BENEJSON_BUILD_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
-		$(SCONS) $(BENEJSON_SCONS_TARGETS))
+		$(HOST_DIR)/bin/python2 $(SCONS) $(BENEJSON_SCONS_TARGETS))
 endef
 
 define BENEJSON_INSTALL_STAGING_CMDS
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 48d21348b9..0a17ddc93e 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -10,7 +10,7 @@ GPSD_LICENSE = BSD-3-Clause
 GPSD_LICENSE_FILES = COPYING
 GPSD_INSTALL_STAGING = YES
 
-GPSD_DEPENDENCIES = host-scons host-pkgconf
+GPSD_DEPENDENCIES = host-python host-scons host-pkgconf
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 GPSD_CFLAGS = $(TARGET_CFLAGS)
@@ -206,7 +206,7 @@ GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)" CFLAGS="$(GPSD_CFLAGS)"
 define GPSD_BUILD_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
-		$(SCONS) \
+		$(HOST_DIR)/bin/python2 $(SCONS) \
 		$(GPSD_SCONS_OPTS))
 endef
 
@@ -214,7 +214,7 @@ define GPSD_INSTALL_TARGET_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
 		DESTDIR=$(TARGET_DIR) \
-		$(SCONS) \
+		$(HOST_DIR)/bin/python2 $(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		install)
 endef
@@ -228,7 +228,7 @@ define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
 		DESTDIR=$(STAGING_DIR) \
-		$(SCONS) \
+		$(HOST_DIR)/bin/python2 $(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		install)
 endef
@@ -240,7 +240,7 @@ define GPSD_INSTALL_UDEV_RULES
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
 		DESTDIR=$(TARGET_DIR) \
-		$(SCONS) \
+		$(HOST_DIR)/bin/python2 $(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		udev-install)
 	chmod u+w $(TARGET_DIR)/lib/udev/rules.d/25-gpsd.rules
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index e420ecb41d..53e1ce9963 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -74,7 +74,7 @@ endif
 
 define MONGODB_BUILD_CMDS
 	(cd $(@D); \
-		$(SCONS) \
+		$(HOST_DIR)/bin/python $(SCONS) \
 		$(MONGODB_SCONS_ENV) \
 		$(MONGODB_SCONS_OPTS) \
 		$(MONGODB_SCONS_TARGETS))
@@ -82,7 +82,7 @@ endef
 
 define MONGODB_INSTALL_TARGET_CMDS
 	(cd $(@D); \
-		$(SCONS) \
+		$(HOST_DIR)/bin/python $(SCONS) \
 		$(MONGODB_SCONS_ENV) \
 		$(MONGODB_SCONS_OPTS) \
 		--prefix=$(TARGET_DIR)/usr \
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index f146fde904..6533811db7 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -16,4 +16,4 @@ HOST_SCONS_INSTALL_OPTS = \
 $(eval $(host-python-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/bin/python $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
+SCONS = $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
