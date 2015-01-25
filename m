From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 19:17:20 +0100
Subject: [Buildroot] [git commit] benejson: new package
Message-ID: <20150125181824.563EC8042A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5da992f20d880e11519c4aa7f712090c68f9dab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added C/C++ JSON parsing package benejson.

[Thomas:
 - Get rid of the usage of BENEJSON_SCONS_OPTS, since this variable is
   never defined.
 - Remove BENEJSON_SCONS_ENV, and pass the options directly in the
   definition of <pkg>_BUILD_CMDS.
 - Fix indentation of BENEJSON_BUILD_CMDS.]

Signed-off-by: Dave Bender <bender@benegon.com>
Signed-off-by: David Bender <codehero@gmail.com>
[yann.morin.1998 at free.fr: fix static/shared install; enhance help entry;
 fix extra space; add hash]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/benejson/Config.in     |   11 +++++++++
 package/benejson/benejson.hash |    2 +
 package/benejson/benejson.mk   |   48 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5f6ebc2..0f6addc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -763,6 +763,7 @@ menu "Javascript"
 endmenu
 
 menu "JSON/XML"
+	source "package/benejson/Config.in"
 	source "package/cjson/Config.in"
 	source "package/expat/Config.in"
 	source "package/ezxml/Config.in"
diff --git a/package/benejson/Config.in b/package/benejson/Config.in
new file mode 100644
index 0000000..4e8ee2c
--- /dev/null
+++ b/package/benejson/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BENEJSON
+	bool "benejson"
+	help
+	  benejson is a buffering SAX-style JSON parser library.
+	  The library package contains 3 major components:
+
+	  - benejson.js: SAX-style parser written in Javascript
+	  - PullParser: A C++ class for JSON pull parsing
+	  - Core: The parsing core with minimal dependencies
+
+	  https://codehero.github.io/benejson/
diff --git a/package/benejson/benejson.hash b/package/benejson/benejson.hash
new file mode 100644
index 0000000..1dfda90
--- /dev/null
+++ b/package/benejson/benejson.hash
@@ -0,0 +1,2 @@
+# Localy computed
+sha256  2ce5f3c2323500bdf651e7fcaecbd1011997141e6067567b8d2caa4cf7182f4a  benejson-0.9.7.tar.gz
diff --git a/package/benejson/benejson.mk b/package/benejson/benejson.mk
new file mode 100644
index 0000000..75753d2
--- /dev/null
+++ b/package/benejson/benejson.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# benejson
+#
+################################################################################
+
+BENEJSON_VERSION = 0.9.7
+BENEJSON_SITE = $(call github,codehero,benejson,$(BENEJSON_VERSION))
+BENEJSON_LICENSE = MIT
+BENEJSON_LICENSE_FILES = LICENSE
+BENEJSON_INSTALL_STAGING = YES
+
+BENEJSON_DEPENDENCIES = host-scons
+
+define BENEJSON_BUILD_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
+		$(SCONS))
+endef
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+define BENEJSON_INSTALL_STATIC_LIB
+	$(INSTALL) -D -m 0644 $(@D)/lib/libbenejson.a \
+		$(1)/usr/lib/libbenejson.a
+endef
+endif # Static enabled
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+define BENEJSON_INSTALL_SHARED_LIB
+	$(INSTALL) -D -m 0644 $(@D)/lib/libbenejson.so \
+		$(1)/usr/lib/libbenejson.so
+endef
+endif # Shared enabled
+
+define BENEJSON_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/include/benejson/benejson.h \
+		$(STAGING_DIR)/usr/include/benejson/benejson.h; \
+	$(INSTALL) -D -m 0644 $(@D)/include/benejson/pull.hh \
+		$(STAGING_DIR)/usr/include/benejson/pull.hh
+	$(call BENEJSON_INSTALL_STATIC_LIB,$(STAGING_DIR))
+	$(call BENEJSON_INSTALL_SHARED_LIB,$(STAGING_DIR))
+endef
+
+define BENEJSON_INSTALL_TARGET_CMDS
+	$(call BENEJSON_INSTALL_SHARED_LIB,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
