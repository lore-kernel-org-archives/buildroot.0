From: Andreas Naumann <anaumann@ultratronik.de>
Date: Tue, 13 Nov 2018 16:50:16 +0100
Subject: [Buildroot] [PATCH v2 1/1] linux: Make dtc install step more
 reliable
Message-ID: <20181113155016.24022-1-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2: 
  - simplified by direct usage of make conditional almost as suggested by
    Arnout (test revealed that an additinal comma was needed for correct logic)
---
 linux/linux.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index f2bca17328..66e11d2ab4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -465,9 +465,7 @@ define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
 	if grep -q "CONFIG_DTC=y" $(@D)/.config; then \
 		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/bin/linux-dtc ; \
-		if [ ! -e $(HOST_DIR)/bin/dtc ]; then \
-			ln -sf linux-dtc $(HOST_DIR)/bin/dtc ; \
-		fi \
+		$(if $(BR2_PACKAGE_HOST_DTC),,ln -sf linux-dtc $(HOST_DIR)/bin/dtc;) \
 	fi
 endef
 
-- 
2.19.1
