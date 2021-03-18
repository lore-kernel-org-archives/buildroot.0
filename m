From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 18 Mar 2021 23:11:53 +0100
Subject: [Buildroot] [PATCH v3 3/3] package/rpi-firmware: convert dtb
 overlay install loop to make-level foreach loop
In-Reply-To: <20210318221153.13618-1-ps.report@gmx.net>
References: <20210318221153.13618-1-ps.report@gmx.net>
Message-ID: <20210318221153.13618-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - new patch
---
 package/rpi-firmware/rpi-firmware.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 0c06f2c80d..2e9750931b 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -43,9 +43,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS),y)
 define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
-	for ovldtb in  $(@D)/boot/overlays/*.dtbo; do \
-		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
-	done
+	$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \
+		$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
+	)
 endef
 else
 # Still create the directory, so a genimage.cfg can include it independently of
-- 
2.30.2
