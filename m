From: Jeroen Roovers <jer@airfi.aero>
Date: Wed, 10 Feb 2016 16:03:23 +0100
Subject: [Buildroot] Fwd: [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
In-Reply-To: <1455102927-28502-1-git-send-email-jer@airfi.aero>
References: <1455102927-28502-1-git-send-email-jer@airfi.aero>
Message-ID: <CANCHnQppW3mmP=6WGBChD06+7ns0u1D5R6MQb=pxCmV6nQ7=Mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ----------
From: Jeroen Roovers <jer@airfi.aero>
Date: 10 February 2016 at 12:15
Subject: [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
To: buildroot at buildroot.org
Cc: Jeroen Roovers <jer@airfi.aero>


    If we want to set proper LDFLAGS, then we need to mangle that in the
    uboot build system as it calls ld(1) (in fact ld.bfd) directly,
    where the "-Wl," prefix should only be used when the linker is
    called indirectly through gcc(1).

Signed-off-by: Jeroen Roovers <jer@airfi.aero>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d539b31..9996aca 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -83,6 +83,7 @@ endif

 UBOOT_MAKE_OPTS += \
        CROSS_COMPILE="$(TARGET_CROSS)" \
+       LDFLAGS="$(TARGET_LDFLAGS:-Wl,%=%)" \
        ARCH=$(UBOOT_ARCH)

 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
--
2.4.10
