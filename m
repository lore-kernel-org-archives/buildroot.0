From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:18:57 +0100
Subject: [Buildroot] [git commit] linux: Make dtc install step more reliable
Message-ID: <20181123212512.1457187FCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=860906ee05fad3fe503786ec7c656ea0f25851fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Checking for the existence of the dtc binary built by the
non-dependent dtc package may cause instable behaviour when giving more
freedom on the order of how the packages are built (parallelization).

In addidion, when moving to per-package host/target method, the check
would always trigger in the isolated host, leading to linux-dtc always
being installed as dtc.
This in turn may lead to undesired overwriting of the real host-dtc binary
when finally assembling the global host dir.

Thus rework the linux-dtc install condition to be defined by configuration
rather than compile time order.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 476ff16329..864fa772bb 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -461,9 +461,7 @@ define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
 	if grep -q "CONFIG_DTC=y" $(@D)/.config; then \
 		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/bin/linux-dtc ; \
-		if [ ! -e $(HOST_DIR)/bin/dtc ]; then \
-			ln -sf linux-dtc $(HOST_DIR)/bin/dtc ; \
-		fi \
+		$(if $(BR2_PACKAGE_HOST_DTC),,ln -sf linux-dtc $(HOST_DIR)/bin/dtc;) \
 	fi
 endef
 
