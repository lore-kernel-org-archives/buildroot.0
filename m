From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 21:28:41 +0100
Subject: [Buildroot] [git commit] package/uboot-tools: needs make >= 4.0
Message-ID: <20200203202048.D620888EE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9f4d7376ef57815028aeaa46efa6bdf01caa7e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with 2020.01, uboot started using the 'undefine' make
directive, which was only introduced with make 4.0.

So, use the existing $(BR2_MAKE_HOST_DEPENDENCY) and $(BR2_MAKE),
both of each will ensure that we do use a make that is at least 4.0.

Fixes:
    http://autobuild.buildroot.org/results/c97/c976ed5eb7760cba192d22b3f1e7460596fd82dd/

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/uboot-tools.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 1f0bac5bf7..8cafc084e1 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -11,6 +11,10 @@ UBOOT_TOOLS_LICENSE = GPL-2.0+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 UBOOT_TOOLS_INSTALL_STAGING = YES
 
+# u-boot 2020.01+ needs make 4.0+
+UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+HOST_UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+
 define UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
 	touch $(@D)/include/config/auto.conf
@@ -39,9 +43,9 @@ endef
 endif
 
 define UBOOT_TOOLS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_TOOLS_MAKE_OPTS) \
+	$(TARGET_MAKE_ENV) $(BR2_MAKE) -C $(@D) $(UBOOT_TOOLS_MAKE_OPTS) \
 		CROSS_BUILD_TOOLS=y tools-only
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(UBOOT_TOOLS_MAKE_OPTS) \
+	$(TARGET_MAKE_ENV) $(BR2_MAKE) -C $(@D) $(UBOOT_TOOLS_MAKE_OPTS) \
 		envtools no-dot-config-targets=envtools
 endef
 
@@ -103,7 +107,7 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
 endif
 
 define HOST_UBOOT_TOOLS_BUILD_CMDS
-	$(MAKE1) -C $(@D) $(HOST_UBOOT_TOOLS_MAKE_OPTS) tools-only
+	$(BR2_MAKE1) -C $(@D) $(HOST_UBOOT_TOOLS_MAKE_OPTS) tools-only
 endef
 
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
