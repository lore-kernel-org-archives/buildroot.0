From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 22:52:57 +0200
Subject: [Buildroot] [PATCHv3 17/18] packages: refactor checks using
	BR_BUILDING
In-Reply-To: <1429972982-25495-18-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-18-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150425205257.GT4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-25 16:43 +0200, Thomas Petazzoni spake thusly:
> Instead of manually testing MAKECMDGOALS, use the newly introduced
> BR_BUILDING variable to know if we're building or not.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[--SNIP--]
> diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
> index 802e85e..f655058 100644
> --- a/boot/at91bootstrap/at91bootstrap.mk
> +++ b/boot/at91bootstrap/at91bootstrap.mk
> @@ -40,11 +40,8 @@ endef
>  
>  $(eval $(generic-package))
>  
> -ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
> -# we NEED a board name unless we're at make source
> -ifeq ($(filter source,$(MAKECMDGOALS)),)
> +ifeq ($(BR2_TARGET_AT91BOOTSTRAP)$(BR_BUILDING),yy)
>  ifeq ($(AT91BOOTSTRAP_BOARD),)
>  $(error No AT91Bootstrap board name set. Check your BR2_TARGET_AT91BOOTSTRAP_BOARD setting)
>  endif
>  endif
> -endif
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index 3e3b78e..ff49e14 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -43,7 +43,7 @@ AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
>  $(eval $(kconfig-package))
>  
>  # Checks to give errors that the user can understand
> -ifeq ($(filter source,$(MAKECMDGOALS)),)
> +ifeq ($(BR_BUILDING),y)
>  ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)

I think it would be good to have a single way we do those checks.

For example, compare at91bootstrap above and at91bootstrap3 here.
The former is doing the BR2_BUILDING check and package-enabled check
in a single ifeq, while the latter does it with two ifeq.

I don't really care which we use, but we should use the same everywhere.
Maybe we could favour doing it with feq, for those packages that want to
do multiple checks.

Applicable to the other packages, of course.

[--SNIP--]
> diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
> index 90d5fa2..a07a190 100644
> --- a/boot/xloader/xloader.mk
> +++ b/boot/xloader/xloader.mk
> @@ -25,12 +25,8 @@ endef
>  
>  $(eval $(generic-package))
>  
> -ifeq ($(BR2_TARGET_XLOADER),y)
> -# we NEED a board name unless we're at make source
> -ifeq ($(filter source,$(MAKECMDGOALS)),)
> +ifeq ($(BR2_TARGET_XLOADER)$(BR_BUILDING),y)

This is broken: it should be compared to 'yy', not a single 'y'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
