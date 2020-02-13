From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Thu, 13 Feb 2020 16:14:42 +0530
Subject: [Buildroot] [PATCH v2 1/4] boot/arm-trusted-firmware: Disable bin
 copy for rk3399
In-Reply-To: <1581590685-31680-1-git-send-email-sunil@amarulasolutions.com>
References: <1581590685-31680-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <1581590685-31680-2-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Unlike other SoC platforms, rockchip platforms doesn't require a binary
generation on TF-A project.

This is due to rockchip platforms have non-continuous memory areas in
the linker script with a huge gap between them, so generating the binary
would require addition padding which indeed increases the size of the binary.

Interestingly this binary generation is disabled in v2.2 of TF-A on below
commit:
 commit <33218d2a8143> "rockchip: Disable binary generation for all SoCs."

So, select default binary boot images as *.bin only if it's not rk3399.

This fixes the atf build on rk3399 with v2.2.

Note: the same can be applied to rest of rockchip platforms if
they use v2.2 TF-A.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Cc: linux-amarula at amarulasolutions.com
Tested-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
Changes for v2:
- added Cc tag.
---
 boot/arm-trusted-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 373591d..0006931 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -155,7 +155,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES
 	string "Binary boot images"
-	default "*.bin"
+	default "*.bin" if BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM!=rk3399
 	help
 	  Names of generated image files that are installed in the
 	  output images/ directory.
-- 
2.7.4
