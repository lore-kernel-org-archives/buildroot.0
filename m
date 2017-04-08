From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:29:01 +0200
Subject: [Buildroot] [git commit] uboot: qstrip
	BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
Message-ID: <20170408132941.7CDD58043F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61038e36b65696c2f29107d5dbc031c66526ea0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to avoid failing of copy of custom dts using cp -f <>
command. So, just qstrip the variable as is done for other
configuration options.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Tested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1d464d9..91f8ec4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -194,9 +194,11 @@ define UBOOT_HELP_CMDS
 endef
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
+UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
+
 define UBOOT_BUILD_CMDS
-	$(if $(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH),
-		cp -f $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH)) $(@D)/arch/$(UBOOT_ARCH)/dts/
+	$(if $(UBOOT_CUSTOM_DTS_PATH),
+		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
 	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
