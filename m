From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:56:27 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] boot/uboot: fix
 environment image generation on big endian systems
Message-ID: <20181024115446.5B636888CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a37a50e0b8e92e8ae95b6c6389504bb3bc4d8db6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

As reported by Jeff Wittrock in bug #11396, the U-Boot environment
image checksum is invalid for big endian targets, because the test on
the BR2_ENDIAN Config.in option doesn't take into account that it is
double quoted.

The fix was provided by Jeff himself on bugzilla.

Fixes bug #11396.

Reported-by: Jeff Wittrock <jwittrock@faultrecorder.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d6fcf044a747284df4eddaf106082ebb571976b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 27946d99fe..14fe3702ba 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -262,7 +262,7 @@ define UBOOT_GENERATE_ENV_IMAGE
 		>$(@D)/buildroot-env.txt
 	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
-		$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
+		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
 		-o $(BINARIES_DIR)/uboot-env.bin \
 		$(@D)/buildroot-env.txt
 endef
