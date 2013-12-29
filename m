From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 12:18:30 +0100
Subject: [Buildroot] [git commit] grub: really disable splash screen support
Message-ID: <20131229111948.8841F9C20D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d65d8ba13dd75e6f774bc81b415889d8127ea40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_TARGET_GRUB_SPLASH is enabled, we were passing
--enable-graphics, but when it was disabled, we were not doing
anything. However, in Grub, graphics support is enabled by default,
and you have to pass --disable-graphics to disable it.

Fix this by passing --enable-graphics or --disable-graphics as
appropriate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/grub/grub.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
