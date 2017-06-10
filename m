From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Jun 2017 09:26:14 +0200
Subject: [Buildroot] [PATCH 3/3] package/rpi-firmware: updated to
	4.9.31	firmware (ca9116f)
In-Reply-To: <20170610070050.20782-1-mail@jens-maus.de>
References: <20170610070050.20782-1-mail@jens-maus.de>
Message-ID: <8E8EFCD7-3A29-410A-A992-9D62BE9C604F@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On June 10, 2017 9:00:50 AM GMT+02:00, Jens Maus <mail@jens-maus.de> wrote:
>This commit updates the rpi-firmware package to the latest 4.9.31
>compatible commit (ca9116ffd0cea06fdeb876ac7d19790bf2631d8c) and
>uses a for() to install DTS files in case
>BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
>is used.

Please separate the patch in two:
  - one to bump version
  - one to change install code (but see below)

>Signed-off-by: Jens Maus <mail@jens-maus.de>
[snip]
>diff --git a/package/rpi-firmware/rpi-firmware.mk
>b/package/rpi-firmware/rpi-firmware.mk
>index 134fcebb5..4c3d37375 100644
>--- a/package/rpi-firmware/rpi-firmware.mk
>+++ b/package/rpi-firmware/rpi-firmware.mk
[snip]
>@@ -12,10 +12,9 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
> 
> ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
> define RPI_FIRMWARE_INSTALL_DTB
>-	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb
>$(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
>-	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb
>$(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
>-	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2709-rpi-2-b.dtb
>$(BINARIES_DIR)/rpi-firmware/bcm2709-rpi-2-b.dtb
>-	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2710-rpi-3-b.dtb
>$(BINARIES_DIR)/rpi-firmware/bcm2710-rpi-3-b.dtb
>+	for dtb in $(@D)/boot/*.dtb; do \
>+		$(INSTALL) -D -m 0644 $${dtb}
>$(BINARIES_DIR)/rpi-firmware/$${dtb##*/} || exit 1; \
>+	done

What is the reason you are doing so?

Regards,
Yann E. MORIN.

> endef
> endif
> 

Jens, All,
-- 
Sent from my phone. Please excuse my brevity.
