From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 21:11:58 +0200
Subject: [Buildroot] [git commit] boot/uboot: fix environment image
 generation on big endian systems
Message-ID: <20181014191221.E12D083744@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6fcf044a747284df4eddaf106082ebb571976b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Jeff Wittrock in bug #11396, the U-Boot environment
image checksum is invalid for big endian targets, because the test on
the BR2_ENDIAN Config.in option doesn't take into account that it is
double quoted.

The fix was provided by Jeff himself on bugzilla.

Fixes bug #11396.

Reported-by: Jeff Wittrock <jwittrock@faultrecorder.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c5abc125f3..fa92eafff5 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -267,7 +267,7 @@ define UBOOT_GENERATE_ENV_IMAGE
 		>$(@D)/buildroot-env.txt
 	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
-		$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
+		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
 		-o $(BINARIES_DIR)/uboot-env.bin \
 		$(@D)/buildroot-env.txt
 endef
