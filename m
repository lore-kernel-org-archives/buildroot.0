From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 12:32:02 +0200
Subject: [Buildroot] [PATCH 5/7 v2] boot/barebox: check for config file
	before calling kconfig-package
In-Reply-To: <cover.1436783490.git.yann.morin.1998@free.fr>
References: <cover.1436783490.git.yann.morin.1998@free.fr>
Message-ID: <fd6209a0c16ec96ed62abcc7d532784efb1205b0.1436783490.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we check that the user provides a config file after we call to the
kconfig-package infra, the error message we get is the one for the
kconfig-package infra, not the custom error message we want to show to
the user.

So, only call kconfig-package after we do the check.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/barebox/barebox.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 7e53037..e45976d 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -109,10 +109,12 @@ define BAREBOX_INSTALL_TARGET_CMDS
 endef
 endif
 
-$(eval $(kconfig-package))
-
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
 ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
 ifeq ($(BAREBOX_SOURCE_CONFIG),)
 $(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
 endif
 endif
+
+$(eval $(kconfig-package))
-- 
1.9.1
