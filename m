From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 May 2015 08:22:12 +0200
Subject: [Buildroot] [PATCH v5 09/24] busybox: selinux support
In-Reply-To: <1431553177-7280-10-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-10-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <CAHXCMM+9VKZ=i_=QZtLGjA3P=kuFbJDQhBiom10_80ahKjk1ZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Clayton,

On Wed, May 13, 2015 at 11:39 PM, Clayton Shotwell
<clayton.shotwell@rockwellcollins.com> wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
>
> Add a configure option to enable the SELinux support in the
> busybox configuration from the Buildroot menuconfig.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
[...]
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index 275e317..a60c54b 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -35,6 +35,12 @@ comment "Busybox individual binaries depends on dynamic libraries"
>         depends on BR2_STATIC_LIBS
>         depends on BR2_bfin
>
> +config BR2_PACKAGE_BUSYBOX_SELINUX
> +       select BR2_PACKAGE_LIBSELINUX
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_STATIC_LIBS
> +       bool "Enable SELinux support"
Does not this option also need to select
BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES?

> +
>  config BR2_PACKAGE_BUSYBOX_WATCHDOG
>         bool "Install the watchdog daemon startup script"
>         help
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index dbee100..f60e3f2 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -171,6 +171,14 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
>  endef
>  endif
>
> +ifeq ($(BR2_PACKAGE_BUSYBOX_SELINUX),y)
> +BUSYBOX_DEPENDENCIES += host-pkgconf libselinux libsepol
> +define BUSYBOX_SET_SELINUX
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_SELINUX,$(BUSYBOX_BUILD_CONFIG))
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_SELINUXENABLED,$(BUSYBOX_BUILD_CONFIG))
> +endef
> +endif
> +
>  define BUSYBOX_INSTALL_LOGGING_SCRIPT
>         if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
>                 $(INSTALL) -m 0755 -D package/busybox/S01logging \
> @@ -207,6 +215,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
>         $(BUSYBOX_SET_INIT)
>         $(BUSYBOX_SET_WATCHDOG)
>         $(BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES)
> +       $(BUSYBOX_SET_SELINUX)
>  endef
>
>  define BUSYBOX_CONFIGURE_CMDS
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
