From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Dec 2011 23:28:37 +0100
Subject: [Buildroot] [git commit] package: add Javascript menu and jQuery
	package
Message-ID: <20111218230945.AF9D38F960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e20e8fe00b7125e2fe4538c69c6560f5bb75121
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A lot of open source Javascript libraries can be interesting to use on
embedded systems, so add a specific Javascript menu and the probably most
well known library of them all, jQuery.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    4 ++++
 package/jquery/Config.in |    8 ++++++++
 package/jquery/jquery.mk |   17 +++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eb93b1c..b8eb066 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -322,6 +322,10 @@ source "package/java/concierge/Config.in"
 endmenu
 endif
 
+menu "Javascript"
+source "package/jquery/Config.in"
+endmenu
+
 menu "Networking"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
diff --git a/package/jquery/Config.in b/package/jquery/Config.in
new file mode 100644
index 0000000..92f5604
--- /dev/null
+++ b/package/jquery/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_JQUERY
+	bool "jQuery"
+	help
+	  jQuery is a fast and concise JavaScript Library that
+	  simplifies HTML document traversing, event handling,
+	  animating, and Ajax interactions for rapid web development.
+
+	  http://jquery.com
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
new file mode 100644
index 0000000..aba6301
--- /dev/null
+++ b/package/jquery/jquery.mk
@@ -0,0 +1,17 @@
+JQUERY_VERSION = 1.7.1
+JQUERY_SITE = http://code.jquery.com
+JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
+
+define JQUERY_EXTRACT_CMDS
+	cp $(DL_DIR)/$(JQUERY_SOURCE) $(@D)
+endef
+
+define JQUERY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/$(JQUERY_SOURCE) $(TARGET_DIR)/var/www/jquery.js
+endef
+
+define JQUERY_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/var/www/jquery.js
+endef
+
+$(eval $(call GENTARGETS))
