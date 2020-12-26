From: David Barbion <davidb@230ruedubac.fr>
Date: Sat, 26 Dec 2020 23:08:47 +0100
Subject: [Buildroot] [grub2] possible bug in grub2.mk
Message-ID: <63684684-a9d4-cf3e-1e2a-f09cf8f6519a@230ruedubac.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm facing a rather strange behaviour of grub after having 
(successfully) compiled an complete image. For my need, I use grub2 as 
bootloader.

I decided to set optimization level to 3 (-O3) for gcc.

Grub2 compiles finely but when I try to boot on a legacy BIOS, it 
displays "GRUB loading..." and then reboot infinitely...

After 2 days of tests and tries, I figured out that -O3 cause something 
not nice for grub. Indeed, compiling with -O2 solves the issue.

Regarding buildroot, I tried to force -O2 only for grub and the mk is 
done like:

[...]
GRUB2_CONF_ENV = \
 ??? CPP="$(TARGET_CC) -E" \
 ??? TARGET_CC="$(TARGET_CC)" \
 ??? TARGET_CFLAGS="$(TARGET_CFLAGS)" \
 ??? TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -fno-stack-protector" \
 ??? TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
 ??? TARGET_NM="$(TARGET_NM)" \
 ??? TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
 ??? TARGET_STRIP="$(TARGET_CROSS)strip"
[...]

In fact, envvars are passed to configure script, but instead of the 
standard CC, CFLAGS, CPPFLAGS and LDFLAGS, there are prefixed with TARGET_.
I replaced TARGET_CFLAGS and co without the TARGET_ prefix, then added 
the -O2 flag and grub2 now works, as:

[...]
GRUB2_CONF_ENV = \
 ??? CPP="$(TARGET_CC) -E" \
 ??? TARGET_CC="$(TARGET_CC)" \
 ??? CFLAGS="$(TARGET_CFLAGS) -O2" \
 ??? CPPFLAGS="$(TARGET_CPPFLAGS) -O2 -fno-stack-protector" \
 ??? LDFLAGS="$(TARGET_LDFLAGS) -O2" \
 ??? TARGET_NM="$(TARGET_NM)" \
 ??? TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
 ??? TARGET_STRIP="$(TARGET_CROSS)strip"
[...]

David.
