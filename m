From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Nov 2018 19:11:36 +0100
Subject: [Buildroot] [PATCH next v6 08/10] Makefile: allow top-level
 parallel build with BR2_PER_PACKAGE_DIRECTORIES=y
In-Reply-To: <20181123145815.13008-9-thomas.petazzoni@bootlin.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-9-thomas.petazzoni@bootlin.com>
Message-ID: <20181123181136.GD14050@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-23 15:58 +0100, Thomas Petazzoni spake thusly:
> With per-package folder support, top-level parallel build becomes
> safe, so we can enclose the .NOTPARALLEL statement in a
> !BR2_PER_PACKAGE_DIRECTORIES condition.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 35fe1b3644..7bd7291cfd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -231,6 +231,7 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
>  -include $(BR2_CONFIG)
>  endif
>  
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),)
>  # Parallel execution of this Makefile is disabled because it changes
>  # the packages building order, that can be a problem for two reasons:
>  # - If a package has an unspecified optional dependency and that
> @@ -246,6 +247,7 @@ endif
>  # use the -j<jobs> option when building, e.g:
>  #      make -j$((`getconf _NPROCESSORS_ONLN`+1))

The biggish comment is now completely wrong. The correct solution is not
to remove the line, but to enable the BR2_PER_PACKAGE_DIRECTORIES option.

Regards,
Yann E. MORIN.

>  .NOTPARALLEL:
> +endif
>  
>  ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>  TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/target,$(BASE_TARGET_DIR)))
> -- 
> 2.19.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
