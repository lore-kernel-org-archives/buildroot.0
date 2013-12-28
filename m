From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 15:56:38 +0100
Subject: [Buildroot] [PATCH 7/9] grub: really disable splash screen support
In-Reply-To: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1388242600-2580-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_TARGET_GRUB_SPLASH is enabled, we were passing
--enable-graphics, but when it was disabled, we were not doing
anything. However, in Grub, graphics support is enabled by default,
and you have to pass --disable-graphics to disable it.

Fix this by passing --enable-graphics or --disable-graphics as
appropriate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 43121ff..3be4a74 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -22,7 +22,8 @@ GRUB_CFLAGS = \
 	-O0 -Wl,--build-id=none \
 	-fno-stack-protector
 
-GRUB_CONFIG-$(BR2_TARGET_GRUB_SPLASH) += --enable-graphics
+GRUB_CONFIG-y += $(if $(BR2_TARGET_GRUB_SPLASH),--enable-graphics,--disable-graphics)
+
 GRUB_CONFIG-$(BR2_TARGET_GRUB_DISKLESS) += --enable-diskless
 GRUB_CONFIG-$(BR2_TARGET_GRUB_3c595) += --enable-3c595
 GRUB_CONFIG-$(BR2_TARGET_GRUB_3c90x) += --enable-3c90x
-- 
1.8.3.2
