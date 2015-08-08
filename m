From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:41 -0000
Subject: [Buildroot] [git commit branch/next] boot/barebox: check for config
	file before calling kconfig-package
Message-ID: <20150808105632.2EDB181904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06d126fdc1813dad84c95c2500f400f45853ffae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If we check that the user provides a config file after we call to the
kconfig-package infra, the error message we get is the one for the
kconfig-package infra, not the custom error message we want to show to
the user.

So, only call kconfig-package after we do the check.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
