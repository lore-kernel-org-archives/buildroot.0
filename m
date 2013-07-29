From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 20:54:02 +0200
Subject: [Buildroot] [PATCH] kobs-ng: new package
In-Reply-To: <20130729031743.9E00A5C125@zaphod.pbhware.com>
References: <20130729031743.9E00A5C125@zaphod.pbhware.com>
Message-ID: <20130729205402.6fff1ad4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul B. Henson,

On Sun, 28 Jul 2013 20:14:14 -0700, Paul B. Henson wrote:
> Signed-off-by: Paul B. Henson <henson@acm.org>
> ---
>  package/Config.in             |    1 +
>  package/kobs-ng/Config.in     |    4 ++
>  package/kobs-ng/kobs-ng.mk    |   18 +++++++++++
>  package/kobs-ng/kobs-ng.patch |   67 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 90 insertions(+), 0 deletions(-)
>  create mode 100644 package/kobs-ng/Config.in
>  create mode 100644 package/kobs-ng/kobs-ng.mk
>  create mode 100644 package/kobs-ng/kobs-ng.patch
> 
> diff --git a/package/Config.in b/package/Config.in
> index ed373de..c16b306 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -207,6 +207,7 @@ source "package/f2fs-tools/Config.in"
>  source "package/flashbench/Config.in"
>  source "package/genext2fs/Config.in"
>  source "package/genromfs/Config.in"
> +source "package/kobs-ng/Config.in"
>  source "package/makedevs/Config.in"
>  source "package/mtd/Config.in"
>  source "package/nfs-utils/Config.in"

Not sure it should be with the filesystem tools. Maybe just Hardware
handling?

> diff --git a/package/kobs-ng/Config.in b/package/kobs-ng/Config.in
> new file mode 100644
> index 0000000..6204af4
> --- /dev/null
> +++ b/package/kobs-ng/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_KOBS_NG
> +	bool "kobs-ng"
> +	help
> +	  Build freescale kobs-ng utility for burning bootstreams to NAND

Missing upstream URL.

> diff --git a/package/kobs-ng/kobs-ng.mk b/package/kobs-ng/kobs-ng.mk
> new file mode 100644
> index 0000000..8f877ca
> --- /dev/null
> +++ b/package/kobs-ng/kobs-ng.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# kobs-ng
> +#
> +################################################################################
> +
> +# kobs-ng versions have never made much sense :(
> +KOBS_NG_VERSION = 3.0.35-4.0.0
> +KOBS_NG_SOURCE = kobs-ng-$(KOBS_NG_VERSION).tar.gz

Not needed, this is the default.

> +KOBS_NG_SITE = http://repository.timesys.com/buildsources/k/kobs-ng/kobs-ng-$(KOBS_NG_VERSION)/
> +KOBS_NG_LICENSE = GPLv2
> +KOBS_NG_LICENSE_FILES = COPYING
> +
> +define KOBS_NG_INSTALL_TARGET_CMDS
> +  install -D -m 0755 $(@D)/src/kobs-ng $(TARGET_DIR)/usr/sbin
> +endef

Isn't the default 'make install' working properly? Otherwise:
 - indentation is one tab, not two spaces
 - $(INSTALL) and not install
 - when using -D, you must pass a full path as second argument, i.e
   $(TARGET_DIR)/usr/sbin/kobs-ng

> +$(eval $(autotools-package))

I'm not sure to understand how this tool is typically used. On the
target itself? But then how do you get something on the target from the
first place if the tool is needed to flash a bootloader in NAND?

> diff --git a/package/kobs-ng/kobs-ng.patch b/package/kobs-ng/kobs-ng.patch
> new file mode 100644
> index 0000000..7e7ccb3
> --- /dev/null
> +++ b/package/kobs-ng/kobs-ng.patch

This patch lacks a header with description and Signed-off-by. Also, is
there a chance that you can submit it upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
