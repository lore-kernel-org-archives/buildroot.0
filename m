From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 6 Apr 2020 07:08:36 -0500
Subject: [Buildroot] [PATCH 21/22] package/libselinux: bear the kernel
 options munging
In-Reply-To: <2e26e65ead8f1fa43ada0c792b54b04d67606f18.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
 <2e26e65ead8f1fa43ada0c792b54b04d67606f18.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpbDROdWVy7kXj+fLAGtJaoZLGiJirH2odftbWOXqBK8og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,


On Sat, Apr 4, 2020 at 7:13 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

Thanks Yann, this is a nice cleanup!

> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  linux/linux.mk                   |  8 --------
>  package/libselinux/libselinux.mk | 10 ++++++++++
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index b9e2058e29..3762e718c6 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -363,14 +363,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_FB)
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
> -       $(if $(BR2_PACKAGE_LIBSELINUX),
> -               $(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT)
> -               $(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_SELINUX)
> -               $(call KCONFIG_ENABLE_OPT,CONFIG_INET)
> -               $(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> -               $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
> -               $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
> -               $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SELINUX))
>         $(PACKAGES_LINUX_CONFIG_FIXUPS)
>  endef
>
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index 1461e34539..5f07236791 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -116,5 +116,15 @@ define HOST_LIBSELINUX_INSTALL_CMDS
>                 $(HOST_LIBSELINUX_MAKE_OPTS) install-pywrap
>  endef
>
> +define LIBSELINUX_LINUX_CONFIG_FIXUPS
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_SELINUX)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_INET)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SELINUX)
> +endef
> +
>  $(eval $(generic-package))
>  $(eval $(host-generic-package))
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.


ALPHA BRAVO COLLINS | Aerospace Redefined

         __ l __

 \- - - -o-(_)-o- - - -/
