From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Dec 2011 00:01:43 +0100
Subject: [Buildroot] [git commit] package: add flot jQuery plugin
Message-ID: <20111218230945.E27458F960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8342a525bb2287846d1dcfd279e54b1bfc2d3db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/flot/Config.in |   59 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/flot/flot.mk   |   23 ++++++++++++++++++
 3 files changed, 83 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5520279..bfa4b40 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -323,6 +323,7 @@ endmenu
 endif
 
 menu "Javascript"
+source "package/flot/Config.in"
 source "package/jquery/Config.in"
 source "package/jquery-sparkline/Config.in"
 source "package/jquery-validation/Config.in"
diff --git a/package/flot/Config.in b/package/flot/Config.in
new file mode 100644
index 0000000..60534c1
--- /dev/null
+++ b/package/flot/Config.in
@@ -0,0 +1,59 @@
+config BR2_PACKAGE_FLOT
+	bool "flot"
+	select BR2_PACKAGE_JQUERY
+	help
+	  Flot is a pure Javascript plotting library for jQuery. It
+	  produces graphical plots of arbitrary datasets on-the-fly
+	  client-side.
+
+	  The focus is on simple usage (all settings are optional),
+	  attractive looks and interactive features like zooming and
+	  mouse tracking.
+
+	  The plugin works with Internet Explorer 6+, Firefox 2.x+,
+	  Safari 3.0+, Opera 9.5+ and Konqueror 4.x+ with the HTML
+	  canvas tag.
+
+	  https://code.google.com/p/flot/
+
+if BR2_PACKAGE_FLOT
+
+comment "flot plugins"
+
+config BR2_PACKAGE_FLOT_NAVIGATE
+	bool "navigate"
+	help
+	  Flot plugin for adding panning and zooming capabilities to a plot
+
+config BR2_PACKAGE_FLOT_PIE
+	bool "pie"
+	help
+	  Flot plugin for rendering pie charts
+
+config BR2_PACKAGE_FLOT_RESIZE
+	bool "resize"
+	help
+	  Flot plugin for automatically redrawing plots when the
+	  placeholder size changes.
+
+config BR2_PACKAGE_FLOT_SELECTION
+	bool "selection"
+	help
+	  Flot plugin for selecting regions
+
+config BR2_PACKAGE_FLOT_STACK
+	bool "stack"
+	help
+	  Flot plugin for stacking data sets
+
+config BR2_PACKAGE_FLOT_SYMBOL
+	bool "symbol"
+	help
+	  Flot plugin that adds some extra symbols for plotting points
+
+config BR2_PACKAGE_FLOT_THRESHOLD
+	bool "threshold"
+	help
+	  Flot plugin for thresholding data
+
+endif
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
new file mode 100644
index 0000000..df3f4d1
--- /dev/null
+++ b/package/flot/flot.mk
@@ -0,0 +1,23 @@
+FLOT_VERSION = 0.7
+FLOT_SITE = http://flot.googlecode.com/files
+FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
+	$(if $(BR2_PACKAGE_FLOT_NAVIGATE),navigate) \
+	$(if $(BR2_PACKAGE_FLOT_PIE),pie) \
+	$(if $(BR2_PACKAGE_FLOT_RESIZE),resize) \
+	$(if $(BR2_PACKAGE_FLOT_SELECTION),selection) \
+	$(if $(BR2_PACKAGE_FLOT_STACK),stack) \
+	$(if $(BR2_PACKAGE_FLOT_SYMBOL),symbol) \
+	$(if $(BR2_PACKAGE_FLOT_THRESHOLD),threshold) \
+	)
+
+define FLOT_INSTALL_TARGET_CMDS
+	for i in $(FLOT_FILES); do \
+		$(INSTALL) -D $(@D)/$$i.min.js $(TARGET_DIR)/var/www/$$i.js; \
+	done
+endef
+
+define FLOT_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/var/www/jquery.flot*
+endef
+
+$(eval $(call GENTARGETS))
