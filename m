From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Dec 2011 11:23:53 +0100
Subject: [Buildroot] [git commit] package: add jsmin (javascript minimizer)
Message-ID: <20111220110103.B96FB8FB06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4565a1d75f7576c4b654152e1e5162f8b932f1ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/jsmin/Config.in |   11 +++++++++++
 package/jsmin/jsmin.mk  |   25 +++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1c62ea3..adebd4b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -328,6 +328,7 @@ source "package/flot/Config.in"
 source "package/jquery/Config.in"
 source "package/jquery-sparkline/Config.in"
 source "package/jquery-validation/Config.in"
+source "package/jsmin/Config.in"
 endmenu
 
 menu "Networking"
diff --git a/package/jsmin/Config.in b/package/jsmin/Config.in
new file mode 100644
index 0000000..d0948b8
--- /dev/null
+++ b/package/jsmin/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_JSMIN
+	bool "jsmin"
+	help
+	  JSMin is a filter which removes comments and unnecessary
+	  whitespace from JavaScript files. It typically reduces
+	  filesize by half, resulting in faster downloads. It also
+	  encourages a more expressive programming style because it
+	  eliminates the download cost of clean, literate
+	  self-documentation.
+
+	  http://www.crockford.com/javascript/jsmin.html
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
new file mode 100644
index 0000000..1c414ff
--- /dev/null
+++ b/package/jsmin/jsmin.mk
@@ -0,0 +1,25 @@
+JSMIN_VERSION = a9b47554d5684a55301a2eb7ca8480b7ee7630d4
+JSMIN_SITE = git://github.com/douglascrockford/JSMin.git
+
+define JSMIN_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
+endef
+
+define JSMIN_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/jsmin $(TARGET_DIR)/usr/bin/jsmin
+endef
+
+define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/jsmin
+endef
+
+define HOST_JSMIN_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
+endef
+
+define HOST_JSMIN_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/jsmin $(HOST_DIR)/usr/bin/jsmin
+endef
+
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
