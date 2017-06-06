From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 22:09:44 +0200
Subject: [Buildroot] [PATCH] package/socat: Fix TABDLY,
 CSIZE and CRDLY shifts for PowerPC
In-Reply-To: <20170605204151.1563-1-andrew.smirnov@gmail.com>
References: <20170605204151.1563-1-andrew.smirnov@gmail.com>
Message-ID: <20170606220944.54cab0a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 13:41:51 -0700, Andrey Smirnov wrote:
> As can be seen in linux/arch/powerpc/include/uapi/asm/termbits.h those
> constants are defined as (note that those are octal numbers):
> 
> \#define TABDLY	00006000
> \#define CSIZE	00001400
> \#define CRDLY	00030000
> 
> which gives shifts of 10, 8 and 12. Adjust socat.mk accordingly to
> reflect that difference.
> 
> Signed-off-by: Mark Hinds <zoronic@gmail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Thanks for this patch. I don't really understand why they are using an
AC_TRY_RUN() test for this. I'm pretty we can call the preprocessor to
get the value, and then use shell to determine the shift. This would
make the test cross-compilation compliant. Demo:

$ cat test.c 
#include <termios.h>
#include <unistd.h>
TABDLY
CRDLY
CSIZE
$ ./output/host/usr/bin/powerpc64le-linux-gcc -E -o - test.c | tail -3
00006000
00030000
00001400

So, no need to be on PowerPC64 to get those values.

That being said, it's probably a bit a lot more work to do. So, some
comments on the implementation.

> +ifeq ($(ARCH),powerpc)

This will only match PowerPC and not PowerPC64 and PowerPC64le, which I
believe are in the same situation, so you should use:

ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)

> +SOCAT_CONF_ENV = \
> +	sc_cv_termios_ispeed=no \

Please move this one outside the if, since it's the same in both cases.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
