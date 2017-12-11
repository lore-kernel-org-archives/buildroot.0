From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 11 Dec 2017 20:10:42 -0200
Subject: [Buildroot] [PATCH v2] pimd: new package
In-Reply-To: <1512992158-20572-1-git-send-email-sergio.prado@e-labworks.com>
References: <1512992158-20572-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <CANu7NGvQvSbpcO1bgZUMK9oueQSNmL5wAkX_GPKWiohPxd54Jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please ignore this patch. I've just noticed I put it the wrong menu option.
I'll fix it and send V3.

Best regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2017-12-11 9:35 GMT-02:00 Sergio Prado <sergio.prado@e-labworks.com>:

> pimd is a lightweight stand-alone PIM-SM v2 multicast routing daemon.
>
> Tested on Beaglebone Black.
>
> Build-tested with test-pkg script.
>
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>
> Changes v1->v2
> - added LICENSE.mrouted as a license file.
> - changed to generic package, since it is not a real autotools based
>   package.
>
> ---
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/pimd/Config.in |  8 ++++++++
>  package/pimd/pimd.hash |  6 ++++++
>  package/pimd/pimd.mk   | 38 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 54 insertions(+)
>  create mode 100644 package/pimd/Config.in
>  create mode 100644 package/pimd/pimd.hash
>  create mode 100644 package/pimd/pimd.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 27b22f4f0fed..1a998f3dfc12 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1518,6 +1518,7 @@ F:        configs/linksprite_pcduino_defconfig
>  N:     Sergio Prado <sergio.prado@e-labworks.com>
>  F:     package/libgdiplus/
>  F:     package/mongodb/
> +F:     package/pimd/
>  F:     package/stella/
>  F:     package/tunctl/
>  F:     package/ubus/
> diff --git a/package/Config.in b/package/Config.in
> index aa111e48e6fb..104859fcd1c1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1410,6 +1410,7 @@ menu "Networking"
>         source "package/openzwave/Config.in"
>         source "package/ortp/Config.in"
>         source "package/paho-mqtt-c/Config.in"
> +       source "package/pimd/Config.in"
>         source "package/qdecoder/Config.in"
>         source "package/qpid-proton/Config.in"
>         source "package/rabbitmq-c/Config.in"
> diff --git a/package/pimd/Config.in b/package/pimd/Config.in
> new file mode 100644
> index 000000000000..d6a579bda258
> --- /dev/null
> +++ b/package/pimd/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PIMD
> +       bool "pimd"
> +       depends on BR2_USE_MMU # fork()
> +       help
> +         pimd is a lightweight stand-alone PIM-SM v2 multicast routing
> +         daemon.
> +
> +         http://troglobit.com/project/pimd/
> diff --git a/package/pimd/pimd.hash b/package/pimd/pimd.hash
> new file mode 100644
> index 000000000000..98c717d2e8af
> --- /dev/null
> +++ b/package/pimd/pimd.hash
> @@ -0,0 +1,6 @@
> +# Locally computed:
> +sha256 c77a9812751f114490a28a6839b16aac8b020c8d9fd6aa22bf3880c054e19f1d
> pimd-2.3.2.tar.gz
> +
> +# Hash for license files:
> +sha256 3379436c16caccdef9b40a49fbdfdbb45aad8ecb05870834490b8fb080126009
> LICENSE
> +sha256 4328a21f0822caa9976356623118bcdcc9970c7a0f9a3deeba23c779b7cfb5d1
> LICENSE.mrouted
> diff --git a/package/pimd/pimd.mk b/package/pimd/pimd.mk
> new file mode 100644
> index 000000000000..3730bb496e95
> --- /dev/null
> +++ b/package/pimd/pimd.mk
> @@ -0,0 +1,38 @@
> +###########################################################
> #####################
> +#
> +# pimd
> +#
> +###########################################################
> #####################
> +
> +PIMD_VERSION = 2.3.2
> +PIMD_SOURCE = pimd-$(PIMD_VERSION).tar.gz
> +PIMD_SITE = https://github.com/troglobit/pimd/releases/download/$(PIMD_
> VERSION)
> +
> +PIMD_LICENSE = BSD-3-Clause
> +PIMD_LICENSE_FILES = LICENSE LICENSE.mrouted
> +
> +PIMD_MAKE_OPTS = CROSS=$(TARGET_CROSS) CC=$(TARGET_CC)
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),y)
> +PIMD_CONF_OPTS = --embedded-libc
> +endif
> +
> +# The configure script is not autoconf based, so we use the
> +# generic-package infrastructure
> +define PIMD_CONFIGURE_CMDS
> +       (cd $(@D); \
> +               $(TARGET_CONFIGURE_OPTS) \
> +               $(TARGET_CONFIGURE_ARGS) \
> +               ./configure $(PIMD_CONF_OPTS) \
> +       )
> +endef
> +
> +define PIMD_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) $(PIMD_MAKE_OPTS) -C $(@D)
> +endef
> +
> +define PIMD_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> --
> 1.9.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171211/bda78570/attachment.html>
