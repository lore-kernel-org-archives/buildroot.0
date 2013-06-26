From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 26 Jun 2013 10:09:37 -0300
Subject: [Buildroot] [PATCH] jimtcl: new package
Message-ID: <1372252177-3592-1-git-send-email-elezegarcia@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo@zacarias.com.ar>

Add new jimtcl package - a lightweight tclsh alternative.
Useful for a lighter footprint usb_modeswitch installation.
tclsh size is ~700kB for ARM compared to ~200kB for jimtcl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 package/Config.in        |  1 +
 package/jimtcl/Config.in |  9 +++++++++
 package/jimtcl/jimtcl.mk | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 package/jimtcl/Config.in
 create mode 100644 package/jimtcl/jimtcl.mk

diff --git a/package/Config.in b/package/Config.in
index 0eb6a9c..b62f90a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -307,6 +307,7 @@ source "package/erlang/Config.in"
 source "package/enscript/Config.in"
 source "package/haserl/Config.in"
 source "package/jamvm/Config.in"
+source "package/jimtcl/Config.in"
 source "package/lua/Config.in"
 source "package/luajit/Config.in"
 if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
diff --git a/package/jimtcl/Config.in b/package/jimtcl/Config.in
new file mode 100644
index 0000000..c7a12f2
--- /dev/null
+++ b/package/jimtcl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_JIMTCL
+	bool "jimtcl"
+	help
+	  Jim Tcl is a small footprint reimplementation of the Tcl scripting language.
+	  The core language engine is compatible with Tcl 8.5+, while implementing
+	  a significant subset of the Tcl 8.6 command set, plus additional features
+	  available only in Jim Tcl.
+
+	  http://jim.tcl.tk
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
new file mode 100644
index 0000000..684867d
--- /dev/null
+++ b/package/jimtcl/jimtcl.mk
@@ -0,0 +1,49 @@
+#############################################################
+#
+# jimtcl
+#
+#############################################################
+
+JIMTCL_VERSION = 0.73
+JIMTCL_SITE = git://repo.or.cz/jimtcl.git
+JIMTCL_SITE_METHOD = git
+JIMTCL_INSTALL_STAGING = YES
+
+JIMTCL_HEADERS_TO_INSTALL = \
+	jim.h \
+	jim-eventloop.h \
+	jim-signal.h \
+	jim-subcmd.h \
+	jim-win32compat.h \
+	jim-config.h \
+
+ifneq ($(BR2_PACKAGE_TCL),y)
+define JIMTCL_LINK_TCLSH
+	ln -sf jimsh $(TARGET_DIR)/usr/bin/tclsh
+endef
+endif
+
+define JIMTCL_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure --prefix=/usr \
+	)
+endef
+
+define JIMTCL_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define JIMTCL_INSTALL_STAGING_CMDS
+	for i in $(JIMTCL_HEADERS_TO_INSTALL); do \
+		cp -a $(@D)/$$i $(STAGING_DIR)/usr/include/ ; \
+	done; \
+	$(INSTALL) -D $(@D)/libjim.a $(STAGING_DIR)/usr/lib/libjim.a
+endef
+
+define JIMTCL_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/jimsh $(TARGET_DIR)/usr/bin/jimsh
+	$(JIMTCL_LINK_TCLSH)
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.5
