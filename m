From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 05:29:22 -0500
Subject: [Buildroot] [PATCH] pax-utils: new package
Message-ID: <1290248962-16083-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/Config.in              |    1 +
 package/pax-utils/Config.in    |    6 +++++
 package/pax-utils/pax-utils.mk |   42 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/pax-utils/Config.in
 create mode 100644 package/pax-utils/pax-utils.mk

diff --git a/package/Config.in b/package/Config.in
index f445f69..dc6ddb4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -27,6 +27,7 @@ source "package/ltrace/Config.in"
 source "package/memstat/Config.in"
 source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
+source "package/pax-utils/Config.in"
 source "package/strace/Config.in"
 source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
diff --git a/package/pax-utils/Config.in b/package/pax-utils/Config.in
new file mode 100644
index 0000000..76eab6f
--- /dev/null
+++ b/package/pax-utils/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PAX_UTILS
+	bool "pax-utils"
+	help
+	  ELF related utils to make scripting of ELFs easier
+
+	  http://hardened.gentoo.org/pax-utils.xml
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
new file mode 100644
index 0000000..043dbd1
--- /dev/null
+++ b/package/pax-utils/pax-utils.mk
@@ -0,0 +1,42 @@
+#############################################################
+#
+# pax-utils
+#
+#############################################################
+
+PAX_UTILS_VERSION = 0.2.1
+PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.bz2
+PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
+
+define PAX_UTILS_BUILD_CMDS
+	CFLAGS="$(TARGET_CFLAGS)" \
+	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define HOST_PAX_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define PAX_UTILS_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+HOST_PAX_UTILS_CLEAN_CMDS = $(PAX_UTILS_CLEAN_CMDS)
+
+define _PAX_UTILS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install DESTDIR=$(1)
+endef
+PAX_UTILS_INSTALL_TARGET_CMDS = $(call _PAX_UTILS_INSTALL_TARGET_CMDS,$(TARGET_DIR))
+HOST_PAX_UTILS_INSTALL_CMDS = $(call _PAX_UTILS_INSTALL_TARGET_CMDS,$(HOST_DIR))
+
+define _PAX_UTILS_UNINSTALL_TARGET_CMDS
+	rm -rf \
+		$(addprefix $(1)/usr/bin/,scanelf dumpelf pspax scanmacho symtree lddtree) \
+		$(addprefix $(1)/usr/share/man/man1/, \
+			$(addsuffix .1,scanelf dumpelf pspax scanmacho)) \
+		$(1)/usr/share/doc/pax-utils
+endef
+PAX_UTILS_UNINSTALL_TARGET_CMDS = $(call _PAX_UTILS_UNINSTALL_TARGET_CMDS,$(TARGET_DIR))
+HOST_PAX_UTILS_UNINSTALL_TARGET_CMDS = $(call _PAX_UTILS_UNINSTALL_TARGET_CMDS,$(HOST_DIR))
+
+$(eval $(call GENTARGETS,package,pax-utils))
+$(eval $(call GENTARGETS,package,pax-utils,host))
-- 
1.7.3.2
