From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:44 -0500
Subject: [Buildroot] [PATCH 05/17] checkpolicy: new package
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-6-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in                  |    1 +
 package/checkpolicy/Config.in      |   11 ++++++
 package/checkpolicy/checkpolicy.mk |   71 ++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 package/checkpolicy/Config.in
 create mode 100644 package/checkpolicy/checkpolicy.mk

diff --git a/package/Config.in b/package/Config.in
index b6b3cec..5c4adb9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -898,6 +898,7 @@ source "package/xmlstarlet/Config.in"
 endmenu
 
 menu "Security"
+source "package/checkpolicy/Config.in"
 source "package/libsepol/Config.in"
 source "package/libselinux/Config.in"
 source "package/libsemanage/Config.in"
diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
new file mode 100644
index 0000000..2c4819f
--- /dev/null
+++ b/package/checkpolicy/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_CHECKPOLICY
+	bool "checkpolicy"
+	select BR2_PACKAGE_FLEX
+	help
+	  checkpolicy is the policy compiler. It uses libsepol to 
+	  generate the binary policy. checkpolicy uses the static 
+	  libsepol since it deals with low level details of the policy 
+	  that have not been encapsulated/abstracted by a proper 
+	  shared library interface. 
+	  
+	  http://selinuxproject.org/page/Main_Page
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
new file mode 100644
index 0000000..e61e053
--- /dev/null
+++ b/package/checkpolicy/checkpolicy.mk
@@ -0,0 +1,71 @@
+#############################################################
+#
+# checkpolicy
+#
+#############################################################
+CHECKPOLICY_VERSION = 2.1.12
+CHECKPOLICY_SOURCE = checkpolicy-$(CHECKPOLICY_VERSION).tar.gz
+CHECKPOLICY_SITE = http://userspace.selinuxproject.org/releases/20130423/
+CHECKPOLICY_LICENSE = GPLv2
+CHECKPOLICY_LICENSE_FILES = COPYING
+
+##############################
+# Target Section
+##############################
+CHECKPOLICY_DEPENDENCIES = host-flex host-bison libselinux flex
+
+CHECKPOLICY_INSTALL_STAGING = YES
+CHECKPOLICY_INSTALL_TARGET = YES
+
+CHECKPOLICY_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) \
+	LEX="$(HOST_DIR)/usr/bin/flex" \
+	YACC="$(HOST_DIR)/usr/bin/bison -y"
+
+define CHECKPOLICY_BUILD_CMDS
+	$(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define CHECKPOLICY_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install $(CHECKPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define CHECKPOLICY_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(CHECKPOLICY_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+endef
+
+define CHECKPOLICY_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define CHECKPOLICY_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/bin/checkpolicy
+	rm -f $(addprefix $(STAGING_DIR)/usr/man/man8/,$(notdir $(wildcard $(@D)/*.8)))
+endef
+
+define CHECKPOLICY_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/checkpolicy
+endef
+
+##############################
+# Host Section
+##############################
+HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
+
+HOST_CHECKPOLICY_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
+	LEX="$(HOST_DIR)/usr/bin/flex" \
+	YACC="$(HOST_DIR)/usr/bin/bison -y"
+
+define HOST_CHECKPOLICY_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_CHECKPOLICY_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_CHECKPOLICY_INSTALL_CMDS
+	$(MAKE) -C $(@D) install $(CHOST_HECKPOLICY_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_CHECKPOLICY_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.1
