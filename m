From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 21:05:00 +0200
Subject: [Buildroot] [git commit] pax-utils: new package
Message-ID: <20130627190852.1D0009B25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=241a6c9bcf75753338cb017fcac4e2d8bc9d90d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/pax-utils/Config.in    |    7 +++++
 package/pax-utils/pax-utils.mk |   55 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eefa2ad..5ab85a3 100644
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
