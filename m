From: Stefan Becker <chemobejk@gmail.com>
Date: Fri,  1 Jun 2018 16:30:51 +0300
Subject: [Buildroot] [PATCHv2 proposal/next 1/3] package/busybox: add host
 variant
In-Reply-To: <20180601133053.27552-1-chemobejk@gmail.com>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
Message-ID: <20180601133053.27552-2-chemobejk@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build stripped down version of busybox for the build host to provide
"mkpasswd" for the build.

This is a replacement for host-mkpasswd.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
---
 package/busybox/Config.in.host |  2 ++
 package/busybox/busybox.mk     | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/busybox/Config.in.host

diff --git a/package/busybox/Config.in.host b/package/busybox/Config.in.host
new file mode 100644
index 0000000000..93774bdf60
--- /dev/null
+++ b/package/busybox/Config.in.host
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_HOST_MKPASSWD
+	bool "host mkpasswd"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 75fe7e137b..aa89f1cc33 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -302,4 +302,32 @@ $(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_
 endif
 endif
 
+#
+# Host version of busybox to provide "mkpasswd" for the build
+#
+HOST_BUSYBOX_BUILD_CONFIG = $(HOST_BUSYBOX_DIR)/.config
+define HOST_BUSYBOX_CONFIGURE_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) allnoconfig
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MKPASSWD,$(HOST_BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BB_CRYPT,$(HOST_BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USE_BR_CRYPT_SHA,$(HOST_BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BUILD_LIBBUSYBOX,$(HOST_BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_INDIVIDUAL,$(HOST_BUSYBOX_BUILD_CONFIG))
+endef
+
+define HOST_BUSYBOX_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) busybox
+endef
+
+define HOST_BUSYBOX_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) \
+		CONFIG_PREFIX="$(HOST_DIR)" \
+		EXTRA_LDFLAGS="-Wl,-rpath,$(HOST_DIR)/lib" \
+		-C $(@D) install
+	rm -f $(HOST_DIR)/bin/sh $(HOST_DIR)/bin/busybox
+endef
+
 $(eval $(kconfig-package))
+$(eval $(host-generic-package))
+
+MKPASSWD = $(HOST_DIR)/bin/mkpasswd
-- 
2.17.0
