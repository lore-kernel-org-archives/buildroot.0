From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Nov 2019 10:26:52 +0100
Subject: [Buildroot] [PATCH] package/dtc: do not install headers for the
 target version
In-Reply-To: <20191102123003.8394-1-unixmania@gmail.com>
References: <20191102123003.8394-1-unixmania@gmail.com>
Message-ID: <20191103092652.GD2710@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-11-02 09:30 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> They are not required on the targeti

Which is why we have them already trashed away as part of the generic
target-finalize step.:

    Makefile:
    741     rm -rf $(TARGET_DIR)/usr/include [...]

> and installing them is just a waste
> of time.

Before the patch, dtc takes 1.5s. After the patch, it takes 1.5s. I
haven't noticed any meaningful improvement.

The only interesting reason to go that route would have been something
along the lines of:

    DTC_INSTALL_GOAL = install-lib

    ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
    DTC_INSTALL_GOAL += install-bin
    [...]
    endif

But even then, I don't see the point (even since check-package does not
report the variable as being assigned twice, as it is in a conditional).

Regards,
Yann E. MORIN.

> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/dtc/dtc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index 35ac0b332b..1e5ab992a6 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -37,7 +37,7 @@ endef
>  ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
>  
>  DTC_LICENSE += , GPL-2.0+ (programs)
> -DTC_INSTALL_GOAL = install
> +DTC_INSTALL_GOAL = install-bin install-lib
>  ifeq ($(BR2_PACKAGE_BASH),)
>  DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
>  endif
> -- 
> 2.18.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
