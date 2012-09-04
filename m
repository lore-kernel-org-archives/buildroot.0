From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Sep 2012 14:00:52 -0300
Subject: [Buildroot] [PATCH] jimsh: new package
Message-ID: <1346778052-31923-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new jimsh package - a lightweight tclsh alternative.
Useful for a lighter footprint usb_modeswitch installation.
tclsh size is ~700kB for ARM compared to ~200kB for jimsh.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in       |    1 +
 package/jimsh/Config.in |    6 ++++++
 package/jimsh/jimsh.mk  |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 package/jimsh/Config.in
 create mode 100644 package/jimsh/jimsh.mk

diff --git a/package/Config.in b/package/Config.in
index e129522..01e29e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -249,6 +249,7 @@ endmenu
 menu "Interpreter languages and scripting"
 source "package/erlang/Config.in"
 source "package/haserl/Config.in"
+source "package/jimsh/Config.in"
 source "package/lua/Config.in"
 source "package/luajit/Config.in"
 if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
diff --git a/package/jimsh/Config.in b/package/jimsh/Config.in
new file mode 100644
index 0000000..edae414
--- /dev/null
+++ b/package/jimsh/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JIMSH
+	bool "jimsh"
+	help
+	  A small footprint implementation of the Tcl programming language.
+
+	  http://jim.tcl.tk
diff --git a/package/jimsh/jimsh.mk b/package/jimsh/jimsh.mk
new file mode 100644
index 0000000..7193036
--- /dev/null
+++ b/package/jimsh/jimsh.mk
@@ -0,0 +1,33 @@
+#############################################################
+#
+# jimsh
+#
+#############################################################
+
+JIMSH_VERSION = 0.73
+JIMSH_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/jimtcl
+JIMSH_SOURCE = jimtcl_$(JIMSH_VERSION).orig.tar.bz2
+
+ifneq ($(BR2_PACKAGE_TCL),y)
+define JIMSH_LINK_TCLSH
+	ln -sf jimsh $(TARGET_DIR)/usr/bin/tclsh
+endef
+endif
+
+define JIMSH_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure --prefix=/usr \
+	)
+endef
+
+define JIMSH_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define JIMSH_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/jimsh $(TARGET_DIR)/usr/bin/jimsh
+	$(JIMSH_LINK_TCLSH)
+endef
+
+$(eval $(generic-package))
-- 
1.7.8.6
