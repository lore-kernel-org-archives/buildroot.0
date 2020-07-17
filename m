From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 17 Jul 2020 12:18:36 +0200
Subject: [Buildroot] [PATCH] package/busybox: Enable flags for use as
 systemd pager
Message-ID: <20200717101837.346354-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the less package is not enable and systemd is enabled,
then configure the less applet to fully work with systemd.

systemd sets the flags for less in an environment variable
and requires a few options for correct display.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/busybox/busybox.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7344e8a9ce..4f6ba9729e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -236,6 +236,16 @@ define BUSYBOX_SET_SELINUX
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD)X$(BR2_PACKAGE_LESS),yX)
+define BUSYBOX_SET_LESS_FLAGS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_LESS_DASHCMD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_LESS_RAW)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_LESS_TRUNCATE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_LESS_FLAGS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_LESS_ENV)
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
 define BUSYBOX_SET_INDIVIDUAL_BINARIES
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BUILD_LIBBUSYBOX)
@@ -337,6 +347,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
+	$(BUSYBOX_SET_LESS_FLAGS)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
 endef
 
-- 
2.27.0
