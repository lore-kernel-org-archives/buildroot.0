From: Andreas Hilse <andreas.hilse@googlemail.com>
Date: Fri, 28 May 2021 15:48:38 +0200
Subject: [Buildroot] [Bug 13586] New: grub failure with BR2_OPTIMIZE_3
In-Reply-To: <20210527203721.GA2788252@scaer>
References: <bug-13586-163@https.bugs.busybox.net/>
 <CANabuZcix3uT0SwKotJoPBAu6WvZ_SVQ99y=navBARH=GRKZ9w@mail.gmail.com>
 <20210527154435.GV3208066@scaer>
 <638b4284c5ac4639b393d2ade58994dc@AcuMS.aculab.com>
 <20210527203721.GA2788252@scaer>
Message-ID: <CANabuZfVw+ccU8rvVQ67HPnkGMKWTPFpYELbTEVcpiXv6kdhpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, David,

> Would you please send a patch with such a workaround, please?

I tried to workaround in grub2.mk setting -Os as additional flags in
the TARGET_* variables for GRUB2_CONF_ENV as that seemed the right
place according to this comment:
# Grub2 is kind of special: it considers CC, LD and so on to be the
# tools to build the host programs and uses TARGET_CC, TARGET_CFLAGS,
# TARGET_CPPFLAGS, TARGET_LDFLAGS to build the bootloader itself.
...
GRUB2_CONF_ENV = \
    CPP="$(TARGET_CC) -E" \
    TARGET_CC="$(TARGET_CC)" \
    TARGET_CFLAGS="$(TARGET_CFLAGS) -Os" \
    TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -Os -fno-stack-protector" \
    TARGET_LDFLAGS="$(TARGET_LDFLAGS) -Os" \
    TARGET_NM="$(TARGET_NM)" \
    TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
    TARGET_STRIP="$(TARGET_CROSS)strip"

But -O2 still is in the build commands in a place after -Os and thus
takes preference.
Do you have any suggestions for a different workaround or on how to
fix the above one?

Andreas
