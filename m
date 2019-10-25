From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 23:17:04 +0200
Subject: [Buildroot] [PATCH 1/1] libffi: prevent unsupported
 architectures
In-Reply-To: <20191025202714.24737-1-vincent.stehle@laposte.net>
References: <20191025202714.24737-1-vincent.stehle@laposte.net>
Message-ID: <20191025231704.1682a2f8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello VIncent,

On Fri, 25 Oct 2019 22:27:14 +0200
Vincent Stehl? <vincent.stehle@laposte.net> wrote:

> Disable architectures unsupported by libffi: Andes nds32 and thumb-only Arm
> (e.g. Cortex-M).
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

The problem is that it's not that simple: you would need to propagate
those depends on too all packages that select BR2_PACKAGE_LIBFII, and
then all reverse dependencies of those packages.

And since libffi is used by libglib2, that's a *HUGE* number of
packages, and that's why we never did it.

We work around this problem currently in utils/genrandconfig to make
sure that configurations that have libffi enabled, on the unsupported
architectures are never tested. But that is obviously not ideal.

If you want to take a try at propagating the libffi dependencies to all
reverse dependencies, it might be useful to see how it goes. Of course,
you will have to introduce a BR2_PACKAGE_LIBFFI_ARCH_SUPPORTS in the
first place.

> diff --git a/package/libffi/Config.in b/package/libffi/Config.in
> index 6edf570baf..6875947a6a 100644
> --- a/package/libffi/Config.in
> +++ b/package/libffi/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_PACKAGE_LIBFFI
>  	bool "libffi"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_nds32
> +	depends on (!BR2_arm && !BR2_armeb) || BR2_ARM_CPU_HAS_ARM

In utils/genrandconfig, we simply exclude BR2_ARM_CPU_ARMV7M=y configuration.

We also exclude BR2_sh2a=y configurations.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
