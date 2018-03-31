From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 31 Mar 2018 12:09:01 +0200
Subject: [Buildroot] bacnet-stack: new package
In-Reply-To: <ac72cf65-4a1e-260b-4b0c-ca773e528594@visionsystems.de>
References: <ac72cf65-4a1e-260b-4b0c-ca773e528594@visionsystems.de>
Message-ID: <7955a7c7-2968-c5e4-99df-9479a9d14996@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

This patch seems corrupted by your email client.
It doesn't apply correctly, can you send an updated version?

Best regards,
Romain


Le 29/09/2017 ? 08:38, Yegor Yefremov a ?crit?:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> ?DEVELOPERS???????????????????????????? |? 1 +
> ?package/Config.in????????????????????? |? 1 +
> ?package/bacnet-stack/Config.in???????? |? 8 ++++++++
> ?package/bacnet-stack/bacnet-stack.hash |? 3 +++
> ?package/bacnet-stack/bacnet-stack.mk?? | 28 ++++++++++++++++++++++++++++
> ?5 files changed, 41 insertions(+)
> ?create mode 100644 package/bacnet-stack/Config.in
> ?create mode 100644 package/bacnet-stack/bacnet-stack.hash
> ?create mode 100644 package/bacnet-stack/bacnet-stack.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e34802f..594fc88 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1844,6 +1844,7 @@ N:??????? Yegor Yefremov <yegorslists@googlemail.com>
> ?F:???? package/acl/
> ?F:???? package/attr/
> ?F:???? package/bluez_utils/
> +F:???? package/bacnet-stack/
> ?F:???? package/boost/
> ?F:???? package/bootstrap/
> ?F:???? package/cannelloni/
> diff --git a/package/Config.in b/package/Config.in
> index 6acd0c4..3c5647f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1305,6 +1305,7 @@ menu "Networking"
> ??????? source "package/alljoyn-tcl-base/Config.in"
> ??????? source "package/azmq/Config.in"
> ??????? source "package/azure-iot-sdk-c/Config.in"
> +?????? source "package/bacnet-stack/Config.in"
> ??????? source "package/batman-adv/Config.in"
> ??????? source "package/c-ares/Config.in"
> ??????? source "package/canfestival/Config.in"
> diff --git a/package/bacnet-stack/Config.in b/package/bacnet-stack/Config.in
> new file mode 100644
> index 0000000..bbbbc2d
> --- /dev/null
> +++ b/package/bacnet-stack/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_BACNET_STACK
> +?????? bool "bacnet-stack"
> +?????? help
> +???????? This BACnet library provides an application layer, network
> +???????? layer and MAC layer communications services for Win32, Linux,
> +???????? RTOS, or microcontroller.
> +
> +???????? http://bacnet.sourceforge.net/
> diff --git a/package/bacnet-stack/bacnet-stack.hash b/package/bacnet-stack/bacnet-stack.hash
> new file mode 100644
> index 0000000..824e5db
> --- /dev/null
> +++ b/package/bacnet-stack/bacnet-stack.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256? 4b80e2909162082e6b0025319ff8b360472a0eee41593ef4fb40fbe27a098217? bacnet-stack-0.8.5.tgz
> +sha256? f123d969f4e4f9d235116fc943d931e33ea80c58e96b8de886f4d1259c2fb836? license/gpl-2.txt
> diff --git a/package/bacnet-stack/bacnet-stack.mk b/package/bacnet-stack/bacnet-stack.mk
> new file mode 100644
> index 0000000..6ff5330
> --- /dev/null
> +++ b/package/bacnet-stack/bacnet-stack.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# bacnet-stack
> +#
> +################################################################################
> +
> +BACNET_STACK_VERSION = 0.8.5
> +BACNET_STACK_SITE = https://sourceforge.net/projects/bacnet/files/bacnet-stack/bacnet-stack-$(BACNET_STACK_VERSION)
> +BACNET_STACK_SOURCE = bacnet-stack-$(BACNET_STACK_VERSION).tgz
> +BACNET_STACK_LICENSE = GPL-2.0+ with exception
> +BACNET_STACK_LICENSE_FILES = license/gpl-2.txt
> +BACNET_STACK_INSTALL_STAGING = YES
> +# bacnet-stack produced only a static library,
> +# so don't install no target installation is
> +# necessary
> +BACNET_STACK_INSTALL_TARGET = NO
> +
> +define BACNET_STACK_BUILD_CMDS
> +?????? $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
> +?????????????? -C $(@D) all
> +endef
> +
> +define BACNET_STACK_INSTALL_STAGING_CMDS
> +?????? $(INSTALL) -m 0644 $(@D)/lib/libbacnet.a \
> +?????????????? $(STAGING_DIR)/usr/lib/

You don't need to deploy any header file ?

> +endef
> +
> +$(eval $(generic-package))
> --
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
