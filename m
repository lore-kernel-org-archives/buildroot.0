From: Stewart Smith <stewart@linux.vnet.ibm.com>
Date: Tue, 12 Jan 2016 12:09:27 +1100
Subject: [Buildroot] [PATCH] This patch is to add NVME tool support in
	petitboot
In-Reply-To: <20160111083231.8836.248.stgit@localhost.localdomain>
References: <20160111083231.8836.248.stgit@localhost.localdomain>
Message-ID: <87ziwbeh88.fsf@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(background for others: petitboot is the bootloader on OpenPower
machines - it's a linux+initramfs in flash from buildroot on top of OPAL
firmware. You can exit from the petitboot UI into a shell, where a
variety of utilities are available to help rescue a system)

Mamatha <mamatha4@linux.vnet.ibm.com> writes:
> Enable NVME block device and nvme tool support in petitboot
> After enabling NVME device and tool in op-build this will increase the size
> of rootfs.tar by 92KB and zImage.epapr by 41KB.

I think this should read more like:

"Add support for building NVME utility - a utility for interacting with
standard NVM Express (optimized PCI Express SSD interface) devices."

>
> Signed-off-by: Mamatha <mamatha4@linux.vnet.ibm.com>
> ---
>  package/Config.in      |    1 +
>  package/nvme/Config.in |    6 ++++++
>  package/nvme/nvme.mk   |   23 +++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100755 package/nvme/Config.in
>  create mode 100755 package/nvme/nvme.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e0c2e2a..014debd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1399,6 +1399,7 @@ endif
>  	source "package/openvmtools/Config.in"
>  	source "package/polkit/Config.in"
>  	source "package/powerpc-utils/Config.in"
> +	source "package/nvme/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/procps-ng/Config.in"
>  	source "package/psmisc/Config.in"
> diff --git a/package/nvme/Config.in b/package/nvme/Config.in
> new file mode 100755
> index 0000000..8b5d37d
> --- /dev/null
> +++ b/package/nvme/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_NVME
> +	bool "nvme"
> +	help
> +	  System utilities for IBM Power NVME devices
> +
> +	  https://github.com/linux-nvme/nvme-cli

Is it POWER specific? It doesn't look like it...

> diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
> new file mode 100755
> index 0000000..214e879
> --- /dev/null
> +++ b/package/nvme/nvme.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# nvme
> +#
> +################################################################################
> +
> +NVME_VERSION = 798812627467a9999682176ade631ee5b6ea4785

Is this the 0.2 tag? If not, why not? It would seem sensible to include
the most recent released version, or get them to release one with the
support we need.

Also,

> +NVME_SITE = https://github.com/linux-nvme/nvme-cli.git

I wonder why this utility isn't mentioned on
http://nvmexpress.org/resources/linux-driver-information/ ?

-- 
Stewart Smith
OPAL Architect, IBM.
