From: Andreas Hilse <andreas.hilse@googlemail.com>
Date: Mon, 31 May 2021 12:22:28 +0200
Subject: [Buildroot] [Bug 13586] New: grub failure with BR2_OPTIMIZE_3
In-Reply-To: <20210528214255.GK2788252@scaer>
References: <bug-13586-163@https.bugs.busybox.net/>
 <CANabuZcix3uT0SwKotJoPBAu6WvZ_SVQ99y=navBARH=GRKZ9w@mail.gmail.com>
 <20210527154435.GV3208066@scaer>
 <638b4284c5ac4639b393d2ade58994dc@AcuMS.aculab.com>
 <20210527203721.GA2788252@scaer>
 <CANabuZfVw+ccU8rvVQ67HPnkGMKWTPFpYELbTEVcpiXv6kdhpQ@mail.gmail.com>
 <20210528214255.GK2788252@scaer>
Message-ID: <CANabuZdQQTsX5Qfz24ukPUfufw-jPVipLuOJD-QJF+K6ywV7+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> So, maybe things have changed from way back when we wrote that comment
> (back in 2014, seven years ago!), or maybe we did not undestand all of
> it, or maybe we did not explain it properly, or a bit of all of that...
>
> In any case, we might want to also override CFLAGS and CPPFLAGS in the
> same vein as the above patch does for TARGET_CFLAGS et al.
>
> Care to have a look at that, see if it fixes the issue, and you can get
> a bootable grub2, please?

Additionally overriding CFLAGS and CPPFLAGS results in a bootable grub2.

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index af16ee91e1..52e9199ae9 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -118,9 +118,11 @@ HOST_GRUB2_CONF_ENV = \
 GRUB2_CONF_ENV = \
        CPP="$(TARGET_CC) -E" \
        TARGET_CC="$(TARGET_CC)" \
-       TARGET_CFLAGS="$(TARGET_CFLAGS)" \
-       TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -fno-stack-protector" \
-       TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
+       CFLAGS="$(TARGET_CFLAGS) -Os" \
+       TARGET_CFLAGS="$(TARGET_CFLAGS) -Os" \
+       CPPFLAGS="$(TARGET_CPPFLAGS) -Os -fno-stack-protector" \
+       TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -Os -fno-stack-protector" \
+       TARGET_LDFLAGS="$(TARGET_LDFLAGS) -Os" \
        TARGET_NM="$(TARGET_NM)" \
        TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
        TARGET_STRIP="$(TARGET_CROSS)strip"

Best regards
Andreas
