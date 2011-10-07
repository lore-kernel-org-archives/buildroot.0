From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Oct 2011 17:29:02 -0300
Subject: [Buildroot] [PATCH 2/2] jimsh: new package
In-Reply-To: <1318019342-32624-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318019342-32624-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318019342-32624-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new jimsh package - a lightweight tclsh alternative.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in       |    1 +
 package/jimsh/Config.in |    6 ++++++
 package/jimsh/jimsh.mk  |   29 +++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/jimsh/Config.in
 create mode 100644 package/jimsh/jimsh.mk

diff --git a/package/Config.in b/package/Config.in
index 904ebb6..757a4cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -222,6 +222,7 @@ endmenu
 menu "Interpreter languages and scripting"
 source "package/haserl/Config.in"
 source "package/java/jamvm/Config.in"
+source "package/jimsh/Config.in"
 source "package/lua/Config.in"
 if BR2_PACKAGE_LUA
 menu "LUA libraries/modules"
diff --git a/package/jimsh/Config.in b/package/jimsh/Config.in
new file mode 100644
index 0000000..82d8aea
--- /dev/null
+++ b/package/jimsh/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JIMSH
+	bool "jimsh"
+	help
+	  A small footprint implementation of the Tcl programming language.
+
+	  http://jim.berlios.de
diff --git a/package/jimsh/jimsh.mk b/package/jimsh/jimsh.mk
new file mode 100644
index 0000000..b1cf5ac
--- /dev/null
+++ b/package/jimsh/jimsh.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# jimsh
+#
+#############################################################
+
+JIMSH_VERSION = fbbc8e0b402adb4b0c8d3976015fe4a82c94560f
+JIMSH_SITE = git://repo.or.cz/jimtcl.git
+
+ifneq ($(BR2_PACKAGE_TCL),y)
+define JIMSH_LINK_TCLSH
+	ln -sf jimsh $(TARGET_DIR)/usr/bin/tclsh
+endef
+define JIMSH_UNLINK_TCLSH
+	rm -f $(TARGET_DIR)/usr/bin/tclsh
+endef
+endif
+
+define JIMSH_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/jimsh $(TARGET_DIR)/usr/bin/jimsh
+	$(JIMSH_LINK_TCLSH)
+endef
+
+define JIMSH_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/usr/bin/jimsh
+	$(JIMSH_UNLINK_TCLSH)
+endef
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.3.4
