From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 21:37:27 +0100
Subject: [Buildroot] [git commit] angular-websocket: new package
Message-ID: <20161210203800.3047881732@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9de6da214fe32d7c8ad114ddf37d28a5ac342778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas:
 - Move to a submenu "External AngularJS plugins", much like we have an
   "External JQuery plugins" menu. Therefore, remove the "select
   BR2_PACKAGE_ANGULARJS" from the package, since
   angular-websocket/Config.in is now included only if
   BR2_PACKAGE_ANGULARJS is defined.
 - Add hash file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |  5 +++++
 package/angular-websocket/Config.in              |  7 +++++++
 package/angular-websocket/angular-websocket.hash |  2 ++
 package/angular-websocket/angular-websocket.mk   | 18 ++++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a58147a..5574d01 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,11 @@ endmenu
 
 menu "Javascript"
 	source "package/angularjs/Config.in"
+if BR2_PACKAGE_ANGULARJS
+menu "External AngularJS plugins"
+	source "package/angular-websocket/Config.in"
+endmenu
+endif
 	source "package/bootstrap/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/angular-websocket/Config.in b/package/angular-websocket/Config.in
new file mode 100644
index 0000000..0981bd0
--- /dev/null
+++ b/package/angular-websocket/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ANGULAR_WEBSOCKET
+	bool "angular-websocket"
+	help
+	  An AngularJS WebSocket service for connecting client
+	  applications to servers.
+
+	  https://github.com/AngularClass/angular-websocket
diff --git a/package/angular-websocket/angular-websocket.hash b/package/angular-websocket/angular-websocket.hash
new file mode 100644
index 0000000..3670068
--- /dev/null
+++ b/package/angular-websocket/angular-websocket.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 69d752896bc17c08750a2fda24b5eb3c6d653afc6f406dd90a6b7c920b22a14a  angular-websocket-v2.0.0.tar.gz
diff --git a/package/angular-websocket/angular-websocket.mk b/package/angular-websocket/angular-websocket.mk
new file mode 100644
index 0000000..b422847
--- /dev/null
+++ b/package/angular-websocket/angular-websocket.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# angular-websocket
+#
+################################################################################
+
+ANGULAR_WEBSOCKET_VERSION = v2.0.0
+ANGULAR_WEBSOCKET_SITE = $(call github,AngularClass,angular-websocket,$(ANGULAR_WEBSOCKET_VERSION))
+ANGULAR_WEBSOCKET_LICENSE = MIT
+ANGULAR_WEBSOCKET_LICENSE_FILES = LICENSE
+
+# install .min.js as .js
+define ANGULAR_WEBSOCKET_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/dist/angular-websocket.min.js \
+		$(TARGET_DIR)/var/www/angular-websocket.js
+endef
+
+$(eval $(generic-package))
