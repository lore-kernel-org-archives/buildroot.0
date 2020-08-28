From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 16:47:31 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/busybox: enable
 flags for use as systemd pager
Message-ID: <20200828155321.A6A0D7FFA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75ff88093d3a7dd4cfb8e19e093772cd88f8ff97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

If the less package is not enable and systemd is enabled,
then configure the less applet to fully work with systemd.

systemd sets the flags for less in an environment variable
and requires a few options for correct display.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c2caf816e9296c4812f83f0a5d16e0e33a264b72)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 24f3ba3b19..7a1a506963 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -236,6 +236,18 @@ define BUSYBOX_SET_SELINUX
 endef
 endif
 
+# enable relevant options to allow the Busybox less applet to be used
+# as a systemd pager
+ifeq ($(BR2_PACKAGE_SYSTEMD):$(BR2_PACKAGE_LESS),y:)
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
@@ -337,6 +349,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
+	$(BUSYBOX_SET_LESS_FLAGS)
 	$(BUSYBOX_SET_INDIVIDUAL_BINARIES)
 endef
 
