From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2013 18:40:50 +0100
Subject: [Buildroot] [PATCH] evemu: New package. Also adds libevdev.
In-Reply-To: <1387375269-25387-1-git-send-email-anaumann@ultratronik.de>
References: <1387375269-25387-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <20131218174050.GA3321@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2013-12-18 15:01 +0100, Andreas Naumann spake thusly:
> ---
> 
> evemu is also available in version v1.2.0, but crosscompile for arm didnt work.
> Using v1.0.10 which does compile and work (and is the current Ubuntu version).

Please, provide two patches: one for libevdev, and a second one for
evemu.

>  package/Config.in            |  2 ++
>  package/evemu/Config.in      |  7 +++++++
>  package/evemu/evemu.mk       | 15 +++++++++++++++
>  package/libevdev/Config.in   |  6 ++++++
>  package/libevdev/libevdev.mk | 15 +++++++++++++++
>  5 files changed, 45 insertions(+)
>  create mode 100644 package/evemu/Config.in
>  create mode 100644 package/evemu/evemu.mk
>  create mode 100644 package/libevdev/Config.in
>  create mode 100644 package/libevdev/libevdev.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 3429c0e..87fda51 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -240,6 +240,7 @@ source "package/dvb-apps/Config.in"
>  source "package/dvbsnoop/Config.in"
>  source "package/eeprog/Config.in"
>  source "package/evtest/Config.in"
> +source "package/evemu/Config.in"o

Alphabetical order, please: evemu should come before evtest.

[--SNIP--]
> diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
> new file mode 100644
> index 0000000..923d205
> --- /dev/null
> +++ b/package/evemu/evemu.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# evemu
> +#
> +################################################################################
> +
> +EVEMU_VERSION = 1.0.10
> +EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.gz

This _SOURCE is not needed, that's the default.

> +EVEMU_SITE = http://cgit.freedesktop.org/evemu/snapshot
> +
> +EVEMU_AUTORECONF = YES

Can you add a comment on why _AUTORECONF is required?

> +EVEMU_INSTALL_STAGING = YES

Why do we need to install it to staging? It's does not look like a
library, so it should not be needed in staging. Otherwise, please add a
comment on why this is needed, since it is not obvious.

> +$(eval $(autotools-package))
> +

Trailing empty line.

[--SNIP--]
> diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
> new file mode 100644
> index 0000000..12b6b11
> --- /dev/null
> +++ b/package/libevdev/libevdev.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libevdev
> +#
> +################################################################################
> +
> +LIBEVDEV_VERSION = 0.5
> +LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.gz

Ditto, this _SOURCE is not needed, since it's the default.

> +LIBEVDEV_SITE = http://cgit.freedesktop.org/libevdev/snapshot
> +
> +LIBEVDEV_AUTORECONF = YES

Ditto: explain why _AUTORECONF is needed.

> +LIBEVDEV_INSTALL_STAGING = YES

That one looks logicial sicne it's a library, so needs no explanations.
;-)

> +$(eval $(autotools-package))
> +

Trailing empty line.

Except for those minor nitpicks, it all Looks Good To Me (TM).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
