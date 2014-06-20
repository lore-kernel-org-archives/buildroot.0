From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jun 2014 00:02:16 +0200
Subject: [Buildroot] [PATCH 1/2] Add pifmrds package
In-Reply-To: <1403215223-10871-1-git-send-email-limpens@gmail.com>
References: <1403215223-10871-1-git-send-email-limpens@gmail.com>
Message-ID: <53A4AF68.6080906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Eric,

 Thank you for your contribution. There are a few things that Yann missed in his
earlier review...


On 20/06/14 00:00, Eric Limpens wrote:
> Signed-off-by: Eric Limpens <limpens@gmail.com>
> ---
>  package/Config.in          |  1 +
>  package/pifmrds/Config.in  |  9 +++++++++
>  package/pifmrds/pifmrds.mk | 19 +++++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 package/pifmrds/Config.in
>  create mode 100644 package/pifmrds/pifmrds.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f43e985..0cefbc0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -336,6 +336,7 @@ endif
>  	source "package/owl-linux/Config.in"
>  	source "package/parted/Config.in"
>  	source "package/pciutils/Config.in"
> +	source "package/pifmrds/Config.in"
>  	source "package/picocom/Config.in"

 We keep the Config.in entries alphabetical, so pifmrds should come after picocom.

>  	source "package/read-edid/Config.in"
>  	source "package/rng-tools/Config.in"
> diff --git a/package/pifmrds/Config.in b/package/pifmrds/Config.in
> new file mode 100644
> index 0000000..1269d64
> --- /dev/null
> +++ b/package/pifmrds/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PIFMRDS
> +	bool "pifmrds"
> +	depends on BR2_arm
> +	depends on BR2_LARGEFILE #libsndfile
> +	select BR2_PACKAGE_LIBSNDFILE
> +	help
> +	  pifmrds, FM-RDS transmitter using the Raspberry Pi's PWM
> +
> +	  https://github.com/ChristopheJacquet/PiFmRds

 When there is a toolchain dependency, there should also be a comment when the
dependency is not met:

comment "pifmrds needs a toolchain w/ largefile"
	depends on !BR2_LARGEFILE

(cfr. http://buildroot.org/downloads/manual/manual.html#depends-on-vs-select )


> diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
> new file mode 100644
> index 0000000..9365424
> --- /dev/null
> +++ b/package/pifmrds/pifmrds.mk
> @@ -0,0 +1,19 @@
> +PIFMRDS_VERSION = c67306ea9b8d827f45e0d90279d367e97119bcb1
> +PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
> +PIFMRDS_INSTALL_TARGET = YES

 This is the default so not necessary.

> +PIFMRDS_AUTORECONF = YES

 Since it's a generic package, not an autotools package, this is pointless.

> +PIFMRDS_DEPENDENCIES += libsndfile

 Minor: we usually don't use += here.

> +PIFMRDS_LICENSE = GPLv3+
> +PIFMRDS_LICENSE_FILES = LICENSE
> +
> +define PIFMRDS_BUILD_CMDS
> +	$(MAKE) -C $(@D)/src CC=$(TARGET_CC) LDFLAGS="$(TARGET_LDFLAGS)" CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -c"

 There should be quotes around $(TARGET_CC) because it may contain ccache.

 The line is a bit too long, better split it.


> +endef
> + 
> +define PIFMRDS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/src/pi_fm_rds $(TARGET_DIR)/usr/bin/pi_fm_rds
> +	$(INSTALL) -D -m 0755 $(@D)/src/rds_wav $(TARGET_DIR)/usr/bin/rds_wav
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/pifmrds/

 If you're not copying anything into that directory, why do you create it?


 Regards,
 Arnout

> +endef
> + 
> +$(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
