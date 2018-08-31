From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 31 Aug 2018 15:32:28 +0200
Subject: [Buildroot] [PATCH 2/2] minicom: bump version
In-Reply-To: <20180831141332.2ceca29c@windsurf>
References: <20180831105600.70955-1-giulio.benetti@micronovasrl.com>
 <20180831105600.70955-2-giulio.benetti@micronovasrl.com>
 <20180831141332.2ceca29c@windsurf>
Message-ID: <087110fd-7939-60c2-b29c-a8987a68dc23@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 31/08/2018 14:13, Thomas Petazzoni ha scritto:
> Hello Giulio,
> 
> On Fri, 31 Aug 2018 12:56:00 +0200, Giulio Benetti wrote:
> 
>> diff --git a/package/minicom/0001-sysdep.h-define-TIOCGRS485-and-TIOCSRS485-if-not-def.patch b/package/minicom/0001-sysdep.h-define-TIOCGRS485-and-TIOCSRS485-if-not-def.patch
>> new file mode 100644
>> index 0000000000..c4d881a8b5
>> --- /dev/null
>> +++ b/package/minicom/0001-sysdep.h-define-TIOCGRS485-and-TIOCSRS485-if-not-def.patch
>> @@ -0,0 +1,39 @@
>> +From b9d9a7c3bba81853f77c6789ab5b65925f9de067 Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> +Date: Sun, 26 Aug 2018 11:26:11 +0200
>> +Subject: [PATCH] sysdep.h: define TIOCGRS485 and TIOCSRS485 if not defined
>> +
>> +Depending on toolchain sometimes SER_RS485_ENABLED is defined but
>> +TIOCGRS485 and TIOCSRS485 are not always found in included files.
>> +They are contained in <asm-generic/ioctls.h> that should be included in
>> +<asm/ioctls.h> then in <termios.h>, but this doesn't always happen.
>> +This leads to build failure because TIOCGRS485 and TIOCSRS485 have not
>> +been found.
>> +
>> +Define if not defined TIOCGRS485 and TIOCSRS485.
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> +---
>> + src/sysdep.h | 6 ++++++
>> + 1 file changed, 6 insertions(+)
>> +
>> +diff --git a/src/sysdep.h b/src/sysdep.h
>> +index a99c5ee..7b9665d 100644
>> +--- a/src/sysdep.h
>> ++++ b/src/sysdep.h
>> +@@ -124,6 +124,12 @@
>> + #ifndef CRTSCTS
>> + #  define CRTSCTS 0
>> + #endif
>> ++#ifndef TIOCGRS485
>> ++#  define TIOCGRS485 0x542E
>> ++#endif
>> ++#ifndef TIOCSRS485
>> ++#  define TIOCSRS485 0x542F
>> ++#endif
> 
> Are you sure they always have the same value on all architectures ? I'm
> not so sure:
> 
> arch/alpha/include/uapi/asm/ioctls.h:#define TIOCGRS485 _IOR('T', 0x2E, struct serial_rs485)
> arch/mips/include/uapi/asm/ioctls.h:#define TIOCGRS485  _IOR('T', 0x2E, struct serial_rs485)
> arch/parisc/include/uapi/asm/ioctls.h:#define TIOCGRS485        _IOR('T', 0x2E, struct serial_rs485)
> arch/powerpc/include/uapi/asm/ioctls.h:#define TIOCGRS485       0x542e
> arch/sh/include/uapi/asm/ioctls.h:#define TIOCGRS485    _IOR('T', 46, struct serial_rs485)
> arch/sparc/include/uapi/asm/ioctls.h:#define TIOCGRS485 _IOR('T', 0x41, struct serial_rs485)
> arch/xtensa/include/uapi/asm/ioctls.h:#define TIOCGRS485        _IOR('T', 46, struct serial_rs485)
> drivers/tty/serial/serial_core.c:       case TIOCGRS485:
> fs/compat_ioctl.c:#ifdef TIOCGRS485
> fs/compat_ioctl.c:COMPATIBLE_IOCTL(TIOCGRS485)
> include/uapi/asm-generic/ioctls.h:#define TIOCGRS485    0x542E
> include/uapi/linux/serial.h: * support. Set with TIOCSRS485 and get with TIOCGRS485 if supported by your
> tools/include/uapi/asm-generic/ioctls.h:#define TIOCGRS485      0x542E
> 
> See how the definitions on SuperH, Sparc and PARisc are different than
> the others ?

Oops, I didn't know this.

> 
> I believe it would be safer to disable RS485 support in minicom if
> those definitions are not provided by the kernel headers.

I haven't thought about that, actually many kernels don't support RS485.
During test-pkg instead I've found a case where those macros were 
defined but not included.
Anyway it's safer as you've told.

> 
>> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
>> +MINICOM_CONF_OPTS += --disable-nls
>> +endif
> 
> This is not needed, the autotools-package infrastructure is already
> passing --disable-nls. See package/pkg-autotools.mk and its use of the
> NLS_OPTS variable.

Ah, just checked package/Makefile.in where it's handled according to 
BR2_SYSTEM_ENABLE_NLS.

Thank you very much.

I'm going to send v2.

Best regards
Giulio Benetti
