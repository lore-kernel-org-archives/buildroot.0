From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Mar 2014 22:06:41 +0100
Subject: [Buildroot] [PATCH v3 2/2] canfestival: new package
In-Reply-To: <1388673820-5710-3-git-send-email-s.martin49@gmail.com>
References: <1388673820-5710-1-git-send-email-s.martin49@gmail.com>
 <1388673820-5710-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140304210641.GF11474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-01-02 15:43 +0100, Samuel Martin spake thusly:
> Cc: Eric Jarrige <eric.jarrige@armadeus.org>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[--SNIP--]
> diff --git a/package/canfestival/canfestival-0001-now-honor-DESTDIR.patch b/package/canfestival/canfestival-0001-now-honor-DESTDIR.patch
> new file mode 100644
> index 0000000..7448bd6
> --- /dev/null
> +++ b/package/canfestival/canfestival-0001-now-honor-DESTDIR.patch
> @@ -0,0 +1,787 @@
> +From 9b76c8c97344472bc58e38cc28f734687d1a2aab Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Fri, 27 Dec 2013 19:01:02 +0100
> +Subject: [PATCH] now honor DESTDIR
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Did you try to send this upstream?

[--SNIP--]
> diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
> new file mode 100644
> index 0000000..6cb9ce8
> --- /dev/null
> +++ b/package/canfestival/canfestival.mk
> @@ -0,0 +1,44 @@
> +################################################################################
> +#
> +# canfestival
> +#
> +################################################################################
> +
> +# Revision 789:
> +CANFESTIVAL_VERSION = a82d867e7850
> +CANFESTIVAL_SOURCE = $(CANFESTIVAL_VERSION).tar.bz2
> +CANFESTIVAL_SITE = http://dev.automforge.net/CanFestival-3/archive
> +# Runtime code is licensed LGPLv2, whereas accompanying developer tools and few
> +# drivers (virtual_kernel, lincan and copcican_linux) are licensed GPLv2.
> +CANFESTIVAL_LICENSE = LGPLv2.1, GPLv2
> +CANFESTIVAL_LICENSE_FILES = COPYING, LICENCE
> +CANFESTIVAL_INSTALL_STAGING = YES
> +CANFESTIVAL_TO_BE_INSTALLED = src drivers \
> +	$(if $(BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES),examples)

Although in your case it does not really improve the code, it seems we
are currently seeing a trend toward this constructs:

CANFESTIVAL_TO_BE_INSTALLED-y = src drivers
CANFESTIVAL_TO_BE_INSTALLED-$(BR2_PACKAGE_CANFESTIVAL_INSTALL_EXAMPLES) += examples

But this is not a rulle set in stone^Wthe manual. ;-)

> +define CANFESTIVAL_CONFIGURE_CMDS
> +	cd $(@D) && \
> +		$(TARGET_CONFIGURE_OPTS) ./configure \
> +		--binutils=$(TARGET_CROSS) --cc="$(TARGET_CC)" \
> +		--cxx="$(TARGET_CC)" --ld="$(TARGET_CC)" \
> +		--can=$(BR2_PACKAGE_CANFESTIVAL_DRIVER) \
> +		--MAX_CAN_BUS_ID=$(BR2_PACKAGE_CANFESTIVAL_NBMMAXCAN)

It looks like configure has a --kerneldir= to specify the path to the
kernel. Is it need when BR2_PACKAGE_CANFESTIVAL_DRIVER is one of the
kernel drivers?

Also, there is --target to speicify the target system: unix, win32 or
hcs12. The configure script uses 'uname' to detect that. Granted, we
only really support building on Linux, but I think it would be better to
force it to 'unix'.

Then, there is --arch to specify the architecture. Again, configure uses
'uname', which is broken for cross-compilation. And configure only
supports thos archs: x86, x86_64, powerpc, powerpc64, and arm. Maybe we
want canfestival to have the proper "depends on"?

Then, there's --timers to specify the types of timers to use: unix,
xeno, rtai, kernel, kernel_xeno, win32 or none. Maybe it would be nice
to set the timers to use depending on the kernel extensions that are
enabled? Or force unix or none to be safe, at least.

Otherwise: any reason to provide an config option for MAX_CAN_BUS_ID but
not for the other knobs (SDO_MAX_LENGTH_TRANSFER, SDO_BLOCK_SIZE and so
on)?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
