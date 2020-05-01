From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:29 +0200
Subject: [Buildroot] [git commit] package/libapparmor: bear the kernel
 options munging
Message-ID: <20200501133531.5AFAA90D13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7292a5a0723a2dee8ccda0084f5af8100a5760a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk                     | 5 -----
 package/libapparmor/libapparmor.mk | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index ad2efd948a..69bbad99e1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -363,11 +363,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FB)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
-	$(if $(BR2_PACKAGE_LIBAPPARMOR),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_APPARMOR)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_APPARMOR))
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 endef
 
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index db5839b07c..9562cd105f 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -38,4 +38,11 @@ else
 LIBAPPARMOR_CONF_OPTS += --without-python
 endif
 
+define LIBAPPARMOR_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_APPARMOR)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_APPARMOR)
+endef
+
 $(eval $(autotools-package))
