From: heiko at zuerker.org <heiko@zuerker.org>
Date: Mon,  6 Dec 2010 15:07:33 -0600
Subject: [Buildroot] [PATCH] add insserv to use LSB compliant init scripts
	and dynamically configure init order (revised patch)
Message-ID: <cc88169fbc81e75bb4504a6028016b2cff345189.1291669532.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in          |    1 +
 package/insserv/Config.in  |   11 +++++++++++
 package/insserv/insserv.mk |   44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 package/insserv/Config.in
 create mode 100644 package/insserv/insserv.mk

diff --git a/package/Config.in b/package/Config.in
index 03e580a..5ed9158 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -468,6 +468,7 @@ endmenu
 menu "System tools"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
+source "package/insserv/Config.in"
 source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
diff --git a/package/insserv/Config.in b/package/insserv/Config.in
new file mode 100644
index 0000000..0541d54
--- /dev/null
+++ b/package/insserv/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_INSSERV
+	bool "insserv"
+	depends on BR2_PACKAGE_SYSVINIT
+	help
+	  This small package provides a tool for process controlling
+	  in System V boot scripts.
+	  It works for LSB compliant init scripts.
+	  http://wiki.debian.org/LSBInitScripts
+
+comment "insserv requires sysvinit to be built"
+        depends on !BR2_PACKAGE_SYSVINIT
diff --git a/package/insserv/insserv.mk b/package/insserv/insserv.mk
new file mode 100644
index 0000000..1ad791f
--- /dev/null
+++ b/package/insserv/insserv.mk
@@ -0,0 +1,44 @@
+#############################################################
+#
+# insserv
+#
+#############################################################
+INSSERV_VERSION = 1.14.0
+INSSERV_SOURCE = insserv-$(INSSERV_VERSION).tar.bz2
+INSSERV_SITE = ftp://ftp.suse.com/pub/projects/init/
+
+INSSERV_INSTALL_TARGET_OPT = INSTALLROOT=$(TARGET_DIR)
+INSSERV_INSTALL_HOST_OPT = INSTALLROOT=$(HOST_DIR)
+
+# disable the test which is run during the install
+# it'll fail since it doesn't support our build environment
+define INSSERV_CONFIGURE_CMDS
+	echo "#!/bin/sh" > $(@D)/tests/common
+	echo "exit 0" >> $(@D)/tests/common
+	chmod +x $(@D)/tests/common
+endef
+
+define HOST_INSSERV_CONFIGURE_CMDS
+	echo "#!/bin/sh" > $(@D)/tests/common
+	echo "exit 0" >> $(@D)/tests/common
+	chmod +x $(@D)/tests/common
+endef
+
+define INSSERV_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" RPM_OPT_FLAGS=-O2 -C $(@D) all
+endef
+
+define HOST_INSSERV_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define INSSERV_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install 
+endef
+
+define HOST_INSSERV_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install 
+endef
+
+$(eval $(call GENTARGETS,package,insserv))
+$(eval $(call GENTARGETS,package,insserv,host))
-- 
1.7.3.2
