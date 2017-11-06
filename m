From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Nov 2017 21:46:12 +0100
Subject: [Buildroot] [PATCH] vboot-utils: fix ARCH detection
In-Reply-To: <20171106190611.GA31849@latitude.localdomain>
References: <20171106190611.GA31849@latitude.localdomain>
Message-ID: <20171106214612.59de6b7c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for coming up with a fix for this. See below for some comments.

On Mon, 6 Nov 2017 21:06:11 +0200, Alex Suykov wrote:
> The package includes some target-specific code that is irrelevant
> in a host package but gets built anyway. The target for this code
> must be one of the supported ChromeOS targets.
> 
> Supplied Makefile apparently relies on the environment to provide
> a valid target, with a simple fallback to host arch. This breaks
> the build if no value is provided and the host arch is not among
> the supported ones.
> 
> Should fix
> http://autobuild.buildroot.net/results/d118a83b6c4f7f910d0d44c279f36251d7ba29e8/
> and similar failures.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/vboot-utils/Config.in.host | 1 +
>  package/vboot-utils/vboot-utils.mk | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/vboot-utils/Config.in.host b/package/vboot-utils/Config.in.host
> index aa0caef2e2..1b23e1c644 100644
> --- a/package/vboot-utils/Config.in.host
> +++ b/package/vboot-utils/Config.in.host
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOST_VBOOT_UTILS
>  	bool "host vboot utils"
>  	select BR2_PACKAGE_HOST_UTIL_LINUX
> +	depends on BR2_arm || BR2_x86_64 || BR2_i386

A comment on top of this dependency would be nice, because it is very,
very weird to have target architecture dependencies on a host package.

> diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
> index a6a67ad317..bfbd6d204a 100644
> --- a/package/vboot-utils/vboot-utils.mk
> +++ b/package/vboot-utils/vboot-utils.mk
> @@ -27,6 +27,7 @@ define HOST_VBOOT_UTILS_BUILD_CMDS
>  		CC="$(HOSTCC)" \
>  		CFLAGS="$(HOST_CFLAGS) -D_LARGEFILE64_SOURCE -D_GNU_SOURCE" \
>  		LDFLAGS="$(HOST_LDFLAGS)" \
> +		ARCH=$(BR2_ARCH) \

The Makefile only understands i386, but BR2_ARCH will be potentially
equal to i486, i586 or i686. So we need 

Also, as I told you in my e-mail, it seems that if HOST_ARCH != ARCH,
vboot-utils will try to use Qemu. Did you try to build with ARM as a
target architecture, on a x86_64 machine for example ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
