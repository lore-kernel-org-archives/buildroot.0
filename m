From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Nov 2017 18:02:14 +0100
Subject: [Buildroot] [PATCH] python-numpy: disable for ARCompact
In-Reply-To: <20171108164114.1041-1-didin@synopsys.com>
References: <20171108164114.1041-1-didin@synopsys.com>
Message-ID: <20171108180214.03abd04b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> The same issue appears building "trousers" package for ARCompact.

But trousers is not using python-numpy. Are you going to send a similar
patch for trousers ?

On Wed,  8 Nov 2017 19:41:14 +0300, Evgeniy Didin wrote:

> diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
> index 859542f584..403b466417 100644
> --- a/package/python-numpy/Config.in
> +++ b/package/python-numpy/Config.in
> @@ -1,13 +1,15 @@
>  config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	bool
>  	# Numpy has some CPU specific code
> -	default y if BR2_arc || BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
> -		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
> -		|| BR2_sh || BR2_x86_64
> +	default y if (BR2_arc && !(BR2_arc770d && BR2_arc750d)) || BR2_aarch64 \
> +		|| BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
> +		|| BR2_powerpc || BR2_powerpc64 || BR2_sh || BR2_x86_64

This is getting ugly. It would be nice to have a first patch (separate
from your addition) that reformats to:

	default y if BR2_arc
	default y if BR2_aarch64
	default y if BR2_arm
	default y if BR2_armeb
	...

And then your patch would be:

-	default y if BR2_arc
+	default y if BR2_arc && !BR2_arc770d && !BR2_arc750d

>  
>  config BR2_PACKAGE_PYTHON_NUMPY
>  	bool "python-numpy"
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	#ARC toolchain issues for ARCompact
> +	depends on !BR2_arc770d && !BR2_arc750d

Why are you duplicating this here? You've already excluded the
problematic ARC architectures from
BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS (which is the right thing to
do), and BR2_PACKAGE_PYTHON_NUMPY depends on
BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS.

Could you rework your patch accordingly?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
