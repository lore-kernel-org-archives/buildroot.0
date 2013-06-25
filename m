From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Jun 2013 17:41:07 -0300
Subject: [Buildroot] [PATCHv2] pax-utils: new package
Message-ID: <1372192867-3403-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in              |  1 +
 package/pax-utils/Config.in    |  7 ++++++
 package/pax-utils/pax-utils.mk | 55 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 package/pax-utils/Config.in
 create mode 100644 package/pax-utils/pax-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 2a05bfb..21f070b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -38,6 +38,7 @@ source "package/ltrace/Config.in"
 source "package/memstat/Config.in"
 source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
+source "package/pax-utils/Config.in"
 source "package/perf/Config.in"
 source "package/ramspeed/Config.in"
 source "package/rt-tests/Config.in"
diff --git a/package/pax-utils/Config.in b/package/pax-utils/Config.in
new file mode 100644
index 0000000..58100e4
--- /dev/null
+++ b/package/pax-utils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PAX_UTILS
+	bool "pax-utils"
+	help
+	  ELF related utils for ELF 32/64 binaries that can check files
+	  for security relevant properties.
+
+	  http://www.gentoo.org/proj/en/hardened/pax-utils.xml
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
new file mode 100644
index 0000000..69198c2
--- /dev/null
+++ b/package/pax-utils/pax-utils.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# pax-utils
+#
+################################################################################
+
+PAX_UTILS_VERSION = 0.7
+PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
+PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
+PAX_UTILS_LICENSE = GPLv2
+PAX_UTILS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+PAX_UTILS_DEPENDENCIES += libcap
+PAX_UTILS_USE_CAP = USE_CAP=yes
+endif
+
+# libcap is only useful for pspax (a running system)
+HOST_PAX_UTILS_DEPENDENCIES =
+
+# lddtree and symtree need bash
+ifeq ($(BR2_PACKAGE_BASH),)
+define PAX_UTILS_REMOVE_BASH_TOOLS
+	rm -f $(TARGET_DIR)/usr/bin/{lddtree,symtree}
+endef
+endif
+PAX_UTILS_POST_INSTALL_TARGET_HOOKS += PAX_UTILS_REMOVE_BASH_TOOLS
+
+define HOST_PAX_UTILS_BUILD_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define PAX_UTILS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(PAX_UTILS_USE_CAP) -C $(@D)
+endef
+
+define HOST_PAX_UTILS_CLEAN_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) clean
+endef
+
+define PAX_UTILS_CLEAN_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
+endef
+
+define HOST_PAX_UTILS_INSTALL_CMDS
+	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) DESTDIR="$(HOST_DIR)" install
+endef
+
+define PAX_UTILS_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.8.1.5
