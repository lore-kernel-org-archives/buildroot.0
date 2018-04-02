From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 14:05:49 +0200
Subject: [Buildroot] [PATCH 1/4] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_BISON & BR2_LINUX_KERNEL_NEEDS_HOST_FLEX
In-Reply-To: <20180402093907.23274-1-bernd.kuhls@t-online.de>
References: <20180402093907.23274-1-bernd.kuhls@t-online.de>
Message-ID: <20180402140549.5a4c9c98@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Apr 2018 11:39:04 +0200, Bernd Kuhls wrote:
> Upstream removed pre-generated files and switched over to build-time
> generation, for details see
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=033dba2ec06c47a9fe1b190bc3281058fb20738d
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=29c833061c1d8c2d1d23a62e7061561eadd76cdb
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  linux/Config.in | 14 ++++++++++++++
>  linux/linux.mk  |  8 ++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index d9c5b62863..487863875f 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -420,6 +420,20 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
>  	  CONFIG_UNWINDER_ORC=y, please install libelf-dev,
>  	  libelf-devel or elfutils-libelf-devel".
>  
> +config BR2_LINUX_KERNEL_NEEDS_HOST_BISON
> +	bool "Needs host bison"
> +	help
> +	  Linux kernel versions >= 4.16 need host-bison.
> +
> +	  Enable this option if you want to build a Linux kernel >= 4.16
> +
> +config BR2_LINUX_KERNEL_NEEDS_HOST_FLEX
> +	bool "Needs host flex"
> +	help
> +	  Linux kernel versions >= 4.16 need host-flex.
> +
> +	  Enable this option if you want to build a Linux kernel >= 4.16

I think we should just add host-bison and host-flex as mandatory
dependencies of Linux. Trust me, I don't like adding mandatory
dependencies, but moving forward everybody will need those
dependencies, since just to do the kernel configuration they will be
needed.

The OpenSSL and libelf dependencies that I recently added are IMO a bit
different, because they are only needed when some very specific Linux
kernel configuration options are enabled.

For bison/flex, it's all Linux kernel versions >= 4.16 that will need
them.

It is very annoying that host-flex currently needs
autoreconf+gettextize, but hopefully with the next release of flex, we
can remove the patches, and drop autoreconf+gettextize.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
