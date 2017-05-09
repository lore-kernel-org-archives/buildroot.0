From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 May 2017 23:21:47 +0200
Subject: [Buildroot] [PATCH v3 3/3] package/ltp-testsuite: add
 dependency on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20170509205929.8394-3-romain.naour@gmail.com>
References: <20170509205929.8394-1-romain.naour@gmail.com>
 <20170509205929.8394-3-romain.naour@gmail.com>
Message-ID: <20170509232147.19f21c5d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 May 2017 22:59:29 +0200, Romain Naour wrote:

>  config BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
>  	bool
>  	# does not build on nios2, cachectl.h issue
> -	default y if !BR2_nios2
> +	# Needs __sync*() built-ins for 4-byte data, except on a few
> +	# architectures for which a specific implementation is provided
> +	# in ltp-testsuite
> +	default y if !BR2_nios2 || (BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_arc \
> +		|| BR2_i386 || BR2_powerpc || BR2_powerpc64 \
> +		|| BR2_powerpc64le || BR2_x86_64)

This is very convoluted. What about:

	depends on !BR2_nios2
	default y if BR2_TOOLCHAIN_HAS_SYNC_4
	default y if BR2_arc
	default y if BR2_i386
	default y if BR2_powerpc
	default y if BR2_powepc64
	default y if BR2_powerpc64le
	default y if BR2_x86_64

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
