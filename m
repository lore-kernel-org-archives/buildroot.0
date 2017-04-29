From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 10:37:26 +0200
Subject: [Buildroot] [PATCH v7 06/31] package/kodi-jsonschemabuilder: new
	host package
In-Reply-To: <20170429083751.19625-1-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
Message-ID: <20170429083751.19625-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming kodi version bump to 17.1-Krypton which will also
switch the kodi build system to CMake.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-jsonschemabuilder.hash                    |  1 +
 .../kodi-jsonschemabuilder.mk                      | 25 ++++++++++++++++++++++
 .../0001-texturepacker.patch}                      |  0
 package/kodi/kodi.hash                             |  1 +
 4 files changed, 27 insertions(+)
 create mode 120000 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
 create mode 100644 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
 rename package/{kodi/0002-texturepacker.patch => kodi-texturepacker/0001-texturepacker.patch} (100%)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
new file mode 120000
index 0000000000..a575750997
--- /dev/null
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
@@ -0,0 +1 @@
+../kodi/kodi.hash
\ No newline at end of file
diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
new file mode 100644
index 0000000000..b3cbe9886e
--- /dev/null
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# kodi-jsonschemabuilder
+#
+################################################################################
+
+# Not possible to directly refer to kodi variables, because of
+# first/second expansion trickery...
+KODI_JSONSCHEMABUILDER_VERSION = 17.1-Krypton
+KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
+KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
+KODI_JSONSCHEMABUILDER_LICENSE = GPLv2
+KODI_JSONSCHEMABUILDER_LICENSE_FILES = LICENSE.GPL
+HOST_KODI_JSONSCHEMABUILDER_SUBDIR = tools/depends/native/JsonSchemaBuilder
+
+HOST_KODI_JSONSCHEMABUILDER_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(@D)/project/cmake/modules
+
+define HOST_KODI_JSONSCHEMABUILDER_INSTALL_CMDS
+	$(INSTALL) -m 755 -D \
+		$(@D)/tools/depends/native/JsonSchemaBuilder/JsonSchemaBuilder \
+		$(HOST_DIR)/usr/bin/JsonSchemaBuilder
+endef
+
+$(eval $(host-cmake-package))
diff --git a/package/kodi/0002-texturepacker.patch b/package/kodi-texturepacker/0001-texturepacker.patch
similarity index 100%
rename from package/kodi/0002-texturepacker.patch
rename to package/kodi-texturepacker/0001-texturepacker.patch
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 5aa580ec7a..6f1ab40430 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256	7d82c8aff2715c83deecdf10c566e26105bec0473af530a1356d4c747ebdfd10	kodi-16.1-Jarvis.tar.gz
+sha256 303f3903cbb57ccc2961f09cf3746505542bcb129a464f0687d7ca8601cebbee  kodi-17.1-Krypton.tar.gz
-- 
2.11.0
