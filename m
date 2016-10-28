From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 15:24:19 +0200
Subject: [Buildroot] [PATCH v2] pppd: Provide error() implementation in
 pppoe-discovery
In-Reply-To: <1477248598-6052-1-git-send-email-Stefan.Nickl@gmail.com>
References: <1477248598-6052-1-git-send-email-Stefan.Nickl@gmail.com>
Message-ID: <20161028152419.6ffba279@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Oct 2016 20:49:58 +0200, stefan.nickl at gmail.com wrote:
> From: Stefan Nickl <Stefan.Nickl@gmail.com>
> 
> The pppoe-discovery program calls error() from the CHECK_ROOM macro
> defined in pppoe.h. Since pppoe-discovery is a standalone program not
> linked with the rest of pppd, the only way this could build is by
> linking to glibc's proprietary error(3) function instead of the function
> of the same name (but with different arguments) defined in pppd/utils.c.
> 
> So with glibc and uClibc this builds, but will probably crash when the
> assertion is triggered. As the assertion is unlikely to fail, nobody has
> noticed. The build however fails with musl libc since it doesn't
> provide the doppelganger.

What do you mean by doppelganger?

> diff --git a/package/pppd/0002-rp-pppoe-error.patch b/package/pppd/0002-rp-pppoe-error.patch
> new file mode 100644
> index 0000000..f103f4d
> --- /dev/null
> +++ b/package/pppd/0002-rp-pppoe-error.patch
> @@ -0,0 +1,27 @@
> +diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
> +index 3d3bf4e..55037df 100644
> +--- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
> ++++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c

The patch lacks a description + Signed-off-by.

> +@@ -9,6 +9,7 @@
> +  *
> +  */
> + 
> ++#include <stdarg.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <unistd.h>
> +@@ -55,6 +56,14 @@ void die(int status)
> + 	exit(status);
> + }
> + 
> ++void error(char *fmt, ...)
> ++{
> ++    va_list pvar;
> ++    va_start(pvar, fmt);
> ++    vfprintf(stderr, fmt, pvar);
> ++    va_end(pvar);
> ++}

This really doesn't seem like the right approach, for several reasons:

 - There is already a function with the same name provided in the C
   library, which means static linking scenarios will no longer work,
   as you'll have clashing symbols.

 - The rest of the pppoe-discovery code is using perror(), which is
   provided by the C library. So I believe the better fix is to change
   the CHECK_ROOM() macro to use the perror() function instead.

Could you rework your patch accordingly?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
