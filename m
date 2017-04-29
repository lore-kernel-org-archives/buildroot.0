From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:32:48 +0200
Subject: [Buildroot] [git commit] package/kodi-jsonschemabuilder: new host
	package
Message-ID: <20170429101426.30BF1827D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dd318805e500dde7c556dea0d1009d58cde1de1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for upcoming kodi version bump to 17.1-Krypton which will also
switch the kodi build system to CMake.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: do not add texturepacker patch in this commit, use SPDX license
code.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-jsonschemabuilder.hash                    |  1 +
 .../kodi-jsonschemabuilder.mk                      | 25 ++++++++++++++++++++++
 package/kodi/kodi.hash                             |  1 +
 3 files changed, 27 insertions(+)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
new file mode 120000
index 0000000..a575750
--- /dev/null
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.hash
@@ -0,0 +1 @@
+../kodi/kodi.hash
\ No newline at end of file
diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
new file mode 100644
index 0000000..5f1a55d
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
+KODI_JSONSCHEMABUILDER_LICENSE = GPL-2.0
+KODI_JSONSCHEMABUILDER_LICENSE_FILES = LICENSE.GPL
+HOST_KODI_JSONSCHEMABUILDER_SUBDIR = tools/depends/native/JsonSchemaBuilder
+
+HOST_KODI_JSONSCHEMABUILDER_CONF_OPTS = \
+	-DCMAKE_MODULE_PATH=$(@D)/project/cmake/modules
+
+define HOST_KODI_JSONSCHEMABUILDER_INSTALL_CMDS
+	$(INSTALL) -m 755 -D \
+		$(@D)/tools/depends/native/JsonSchemaBuilder/JsonSchemaBuilder \
+		$(HOST_DIR)/usr/bin/JsonSchemaBuilder
+endef
+
+$(eval $(host-cmake-package))
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 5aa580e..6f1ab40 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256	7d82c8aff2715c83deecdf10c566e26105bec0473af530a1356d4c747ebdfd10	kodi-16.1-Jarvis.tar.gz
+sha256 303f3903cbb57ccc2961f09cf3746505542bcb129a464f0687d7ca8601cebbee  kodi-17.1-Krypton.tar.gz
