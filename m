From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 18:26:23 +0100
Subject: [Buildroot] [PATCH/next v2 3/4] package/openrc: add libselinux
 support
In-Reply-To: <20200301151747.25723-4-unixmania@gmail.com>
References: <20200301151747.25723-1-unixmania@gmail.com>
 <20200301151747.25723-4-unixmania@gmail.com>
Message-ID: <20200311172623.GN5357@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-03-01 12:17 -0300, unixmania at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> If the libselinux package is selected, add the package to the dependency list
> and explicitly set OPENRC_MAKE_OPTS += MKSELINUX=yes

This SELinux stuff has always been a bit boo-I-dont-want-too-touch for
me, because it looks overly complex, so just adding the dependency
without explanations on how openrc uses/fits with SELinux is a bit too
much for me to handle, so I defer to a SELinux-knowledgeable maintainer
to look a it...

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/openrc/openrc.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> index 6057451bfe..97536dad37 100644
> --- a/package/openrc/openrc.mk
> +++ b/package/openrc/openrc.mk
> @@ -18,7 +18,6 @@ OPENRC_MAKE_OPTS = \
>  	LIBNAME=lib \
>  	LIBEXECDIR=/usr/libexec/rc \
>  	MKPKGCONFIG=no \
> -	MKSELINUX=no \
>  	MKSYSVINIT=yes \
>  	BRANDING="Buildroot $(BR2_VERSION_FULL)" \
>  	CC=$(TARGET_CC)
> @@ -29,6 +28,13 @@ else
>  OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +OPENRC_MAKE_OPTS += MKSELINUX=yes
> +OPENRC_DEPENDENCIES += libselinux
> +else
> +OPENRC_MAKE_OPTS += MKSELINUX=no
> +endif
> +
>  define OPENRC_BUILD_CMDS
>  	$(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D)
>  endef
> -- 
> 2.18.2
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
