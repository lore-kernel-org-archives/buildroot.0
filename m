From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Dec 2011 00:07:46 +0100
Subject: [Buildroot] [git commit] package: add explorercanvas
Message-ID: <20111218230946.008D48F960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1886506b6b9e45f678f98e3d8e50bbcde1acad95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explorercanvas is a HTML5 canvas tag emulation library for IE<9.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                        |    1 +
 package/explorercanvas/Config.in         |   10 ++++++++++
 package/explorercanvas/explorercanvas.mk |   18 ++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bfa4b40..1c62ea3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -323,6 +323,7 @@ endmenu
 endif
 
 menu "Javascript"
+source "package/explorercanvas/Config.in"
 source "package/flot/Config.in"
 source "package/jquery/Config.in"
 source "package/jquery-sparkline/Config.in"
diff --git a/package/explorercanvas/Config.in b/package/explorercanvas/Config.in
new file mode 100644
index 0000000..9714a58
--- /dev/null
+++ b/package/explorercanvas/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_EXPLORERCANVAS
+	bool "explorercanvas"
+	help
+	  Modern browsers like Firefox, Safari, Chrome and Opera
+	  support the HTML5 canvas tag to allow 2D command-based
+	  drawing. ExplorerCanvas brings the same functionality to
+	  Internet Explorer (<v9). To use, web developers only need to
+	  include a single script tag in their existing web pages.
+
+	  http://excanvas.sf.net/
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
new file mode 100644
index 0000000..93dcb1f
--- /dev/null
+++ b/package/explorercanvas/explorercanvas.mk
@@ -0,0 +1,18 @@
+EXPLORERCANVAS_VERSION = r3
+EXPLORERCANVAS_SITE = http://explorercanvas.googlecode.com/files/
+EXPLORERCANVAS_SOURCE = excanvas_$(EXPLORERCANVAS_VERSION).zip
+
+define EXPLORERCANVAS_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(EXPLORERCANVAS_SOURCE)
+endef
+
+define EXPLORERCANVAS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/excanvas.compiled.js \
+		$(TARGET_DIR)/var/www/excanvas.js
+endef
+
+define EXPLORERCANVAS_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/var/www/excanvas.js
+endef
+
+$(eval $(call GENTARGETS))
