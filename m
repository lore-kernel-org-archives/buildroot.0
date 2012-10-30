From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Oct 2012 23:34:01 +0100
Subject: [Buildroot] [PATCH 3/6] Add firmware for the AW-NH580
 connectivity module of the snowball
In-Reply-To: <1351500073-4351-4-git-send-email-gregory.hermant@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-4-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <509055D9.3040805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Subject line should be <pkg>: new package

On 10/29/12 09:41, Gregory Hermant wrote:
>
> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
> ---
>   package/Config.in                              |    1 +
>   package/snowball-firmware/Config.in            |    8 ++++++++
>   package/snowball-firmware/snowball-firmware.mk |   17 +++++++++++++++++
>   3 files changed, 26 insertions(+)
>   create mode 100644 package/snowball-firmware/Config.in
>   create mode 100644 package/snowball-firmware/snowball-firmware.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 097a94d..fd5281f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -532,6 +532,7 @@ source "package/googlefontdirectory/Config.in"
>   source "package/hdmiservice/Config.in"
>   source "package/mobile-broadband-provider-info/Config.in"
>   source "package/shared-mime-info/Config.in"
> +source "package/snowball-firmware/Config.in"

  Again, Hardware handling is a more appropriate menu.
It's where linux-firmware resides...

>   source "package/sound-theme-borealis/Config.in"
>   source "package/sound-theme-freedesktop/Config.in"
>   endmenu
> diff --git a/package/snowball-firmware/Config.in b/package/snowball-firmware/Config.in
> new file mode 100644
> index 0000000..1d0789d
> --- /dev/null
> +++ b/package/snowball-firmware/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_SNOWBALL_FIRMWARE
> +	bool "snowball-firmware"
> +	help
> +	  This package provides various binary firmware files (closed binary blobs)
> +	  for the Azurewave AW-NH580 combo module (wifi, bt, gps).
> +
> +	  https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git

  Funny URL...

> +
> diff --git a/package/snowball-firmware/snowball-firmware.mk b/package/snowball-firmware/snowball-firmware.mk
> new file mode 100644
> index 0000000..05326e2
> --- /dev/null
> +++ b/package/snowball-firmware/snowball-firmware.mk
> @@ -0,0 +1,17 @@
> +#############################################################
> +#
> +# snowball-firmware
> +#
> +#############################################################
> +SNOWBALL_FIRMWARE_VERSION = 1.1.3-5
> +SNOWBALL_FIRMWARE_SOURCE = ux500-firmware_$(SNOWBALL_FIRMWARE_VERSION).tar.gz
> +SNOWBALL_FIRMWARE_SITE = https://launchpad.net/~linaro-maintainers/+archive/overlay/+files/
> +SNOWBALL_FIRMWARE_LICENSE = PROPRIETARY

  Again not a very accurate license.  "Snowball click-wrap license" is more
appropriate.  It does come pretty close to proprietary, however.  I wonder
if the linaro maintainers have permission to redistribute it via launchpad...

  The license file is license.txt.

> +
> +define SNOWBALL_FIRMWARE_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/lib/firmware
> +	cp -r $(@D)/* $(TARGET_DIR)/lib/firmware/

  I'd prefer 'make install' here.

> +	rename 's/CG2900/CG29XX/' $(TARGET_DIR)/lib/firmware/*.fw

  We try to avoid relying on non-Posix shell utilities like rename.


  Regards,
  Arnout

> +endef
> +
> +$(eval $(generic-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
