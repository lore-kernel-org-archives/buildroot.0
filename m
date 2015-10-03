From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 3 Oct 2015 17:17:03 +0000
Subject: [Buildroot] [PATCH] wiringpi: New package
In-Reply-To: <56100A33.10209@imgtec.com>
References: <1440708202-19616-1-git-send-email-root@renaud.io>,
 <56100A33.10209@imgtec.com>
Message-ID: <38121FAB319C3344930C920E7B5183136A3DD975@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So upstream accepted my request an now there is a tag for the 2.9 release.

Regards,

Vincent.
________________________________________
From: buildroot [buildroot-bounces at busybox.net] on behalf of Vincent Olivert Riera
Sent: 03 October 2015 18:02
To: Renaud AUBIN
Cc: buildroot
Subject: Re: [Buildroot] [PATCH] wiringpi: New package

Dear Renaud AUBIN,

first of all, thanks for your contribution. I have written some comments
below; please keep reading.

On 27/08/15 21:43, Renaud AUBIN wrote:
> Enable Raspberry Pi GPIO access through the WiringPi library.
>
> Git http backend is not enabled on the official repo. There is no
> official release tarball. As a consequence, this packaging uses an
> unofficial repo hosted on github.

Your Signed-of-by tag is missing here.

> ---
>   package/Config.in            |  4 ++++
>   package/wiringpi/Config.in   | 11 +++++++++++
>   package/wiringpi/wiringpi.mk | 40 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 55 insertions(+)
>   create mode 100644 package/wiringpi/Config.in
>   create mode 100644 package/wiringpi/wiringpi.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 783fbb4..0c08fc2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1502,4 +1502,8 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>   endif
>   endmenu
>
> +menu "Raspberry Pi"
> +     source "package/wiringpi/Config.in"
> +endmenu
> +

You are creating a new menu for Raspberry Pi. I think this is not
correct. This package should be placed under "Libraries -> Hardware
handling" instead.

>   endmenu
> diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
> new file mode 100644
> index 0000000..46141d4
> --- /dev/null
> +++ b/package/wiringpi/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_WIRINGPI
> +        bool "wiringpi"
> +        help
> +          WiringPi is a GPIO access library written in C for the
> +          BCM2835 used in the Raspberry Pi. It?s released under the
> +          GNU LGPLv3 license and is usable from C and C++ and many
> +          other languages with suitable wrappers (See below) It?s
> +          designed to be familiar to people who have used the
> +          Arduino ?wiring? system
> +
> +          http://wiringpi.com/

Please do not use spaces for indentation, use tabs instead. Remember
that text in the help section should be wrapped at 72 characters.

> diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
> new file mode 100644
> index 0000000..4340a4f
> --- /dev/null
> +++ b/package/wiringpi/wiringpi.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# wiringpi
> +#
> +################################################################################
> +
> +WIRINGPI_VERSION = 2.25

Upstream released a 2.29 version. Maybe is worth to use that one instead.

> +WIRINGPI_SITE = $(call github,nibua-r,unofficial-wiringpi,v$(WIRINGPI_VERSION))

I'm not a fan of using unofficial repositories. I know that upstream not
even adds tags when they release a new version, but anyway, I would
prefer to just use the official git repository and the commit ID as a
version.

By the way, I have sent an email upstream to request tags.

> +WIRINGPI_INSTALL_STAGING = YES
> +WIRINGPI_LICENSE = LGPLv3
> +WIRINGPI_LICENSE_FILES = COPYING.LESSER
> +
> +define WIRINGPI_BUILD_CMDS
> +    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/wiringPi
> +    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/wiringPi static
> +    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/devLib
> +    $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/devLib static
> +    $(MAKE) LDFLAGS="-L$(@D)/devLib -L$(@D)/wiringPi" INCLUDE="-I$(@D)/devLib -I$(@D)/wiringPi" CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D)/gpio all
> +endef

Again, don't use spaces for indentation, use tabs instead.

Please add $(TARGET_MAKE_ENV) before $(MAKE) every time you use it.

$(TARGET_CONFIGURE_OPTS) already defines CC=$(TARGET_CC) and
LD=$(TARGET_LD) among other things. Have you tried to use it?

> +define WIRINGPI_INSTALL_STAGING_CMDS
> +    $(INSTALL) -D -m 0755 $(@D)/wiringPi/libwiringPi.so.$(WIRINGPI_VERSION) $(STAGING_DIR)/usr/lib
> +    $(INSTALL) -D -m 0644 $(@D)/wiringPi/*.h $(STAGING_DIR)/usr/include/
> +    $(INSTALL) -D -m 0755 $(@D)/wiringPi/libwiringPi.a $(STAGING_DIR)/usr/lib
> +    cd $(STAGING_DIR)/usr/lib; ln -sf libwiringPi.so.$(WIRINGPI_VERSION) libwiringPi.so
> +    $(INSTALL) -D -m 0755 $(@D)/devLib/libwiringPiDev.so.$(WIRINGPI_VERSION) $(STAGING_DIR)/usr/lib
> +    $(INSTALL) -D -m 0644 $(@D)/devLib/*.h $(STAGING_DIR)/usr/include/
> +    $(INSTALL) -D -m 0755 $(@D)/devLib/libwiringPiDev.a $(STAGING_DIR)/usr/lib
> +    cd $(STAGING_DIR)/usr/lib; ln -sf libwiringPiDev.so.$(WIRINGPI_VERSION) libwiringPiDev.so
> +endef
> +
> +define WIRINGPI_INSTALL_TARGET_CMDS
> +    $(INSTALL) -D -m 0755 $(@D)/wiringPi/libwiringPi.so.$(WIRINGPI_VERSION) $(TARGET_DIR)/usr/lib
> +    cd $(TARGET_DIR)/usr/lib; ln -sf libwiringPi.so.$(WIRINGPI_VERSION) libwiringPi.so
> +    $(INSTALL) -D -m 0755 $(@D)/devLib/libwiringPiDev.so.$(WIRINGPI_VERSION) $(TARGET_DIR)/usr/lib
> +    cd $(TARGET_DIR)/usr/lib; ln -sf libwiringPiDev.so.$(WIRINGPI_VERSION) libwiringPiDev.so
> +    $(INSTALL) -D -m 0755 $(@D)/gpio/gpio $(TARGET_DIR)/usr/bin
> +endef

No spaces for indentation. Use tabs.

Regards,

Vincent.

> +$(eval $(generic-package))
>
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
