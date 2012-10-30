From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Oct 2012 23:42:54 +0100
Subject: [Buildroot] [PATCH 5/6] Add init script files for snowball board
In-Reply-To: <1351500073-4351-6-git-send-email-gregory.hermant@calao-systems.com>
References: <1351500073-4351-1-git-send-email-gregory.hermant@calao-systems.com>
 <1351500073-4351-6-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <509057EE.3010208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/29/12 09:41, Gregory Hermant wrote:
[snip]
> diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
> new file mode 100644
> index 0000000..f3cefbd
> --- /dev/null
> +++ b/package/snowball-init/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_SNOWBALL_INIT
> +	bool "snowball-init"

  Since the init script uses hciattach, you should probably add
	select BR2_PACKAGE_BLUEZ_UTILS

  And I guess the cw1200_wlan also requires
	select BR2_PACKAGE_UX500_FIRMWARE

  Also add a comment that these are run-time dependencies only.

> +	help
> +	  Snowball init scripts
> +
> +	  http://www.igloocommunity.org/gitweb/?p=bsp/snowball-init.git

  Generic igloo URL is good enough.

> +
> diff --git a/package/snowball-init/snowball-init.mk b/package/snowball-init/snowball-init.mk
> new file mode 100644
> index 0000000..03c1cf5
> --- /dev/null
> +++ b/package/snowball-init/snowball-init.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# snowball-init
> +#
> +#############################################################
> +SNOWBALL_INIT_VERSION = b064be21de25729039e5e54037bbdd2e25cfd5b7
> +SNOWBALL_INIT_SITE = git://igloocommunity.org/git/bsp/snowball-init.git
> +
> +define SNOWBALL_INIT_INSTALL_TARGET_CMDS
> +	cp $(@D)/snowball $(TARGET_DIR)/etc/init.d/S50snowball

  We prefer "install -D -m 0755 ..."


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
