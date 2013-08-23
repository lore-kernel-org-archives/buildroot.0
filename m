From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 21:09:31 +0200
Subject: [Buildroot] [PATCH] eglibc: defaults to SSP
In-Reply-To: <1374935524-5259-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374935524-5259-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130823210931.4f2323fc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 27 Jul 2013 11:32:04 -0300, Gustavo Zacarias wrote:
> And it doesn't seem to do anything when disabling it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  toolchain/toolchain-buildroot/Config.in.2 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
> index bf27e6b..f42d776 100644
> --- a/toolchain/toolchain-buildroot/Config.in.2
> +++ b/toolchain/toolchain-buildroot/Config.in.2
> @@ -19,6 +19,7 @@ comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
>  
>  config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
>  	bool "Enable stack protection support"
> +	depends on !BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>  	help
>  	  Enable stack smashing protection support using GCCs
>  	  -fstack-protector-all option.

I'm jumping on this as I was looking in a bit more details at the SSP
support. It seems that GCC itself has a libssp library, and some
external toolchains (such as the Linaro one) has a libssp.so that is
apparently provided by GCC, while usually the SSP symbols
(__stack_chk_fail and al.) are provided by the C library.

Currently BR2_TOOLCHAIN_BUILDROOT_USE_SSP is a toolchain option of the
Buildroot internal backend. But what if I want to use SSP support with
an external toolchain? You made this symbol depend
on !BR2_TOOLCHAIN_BUILDROOT_EGLIBC, but BR2_TOOLCHAIN_BUILDROOT_USE_SSP
is also used to add the -fstack-protector-all to the CFLAGS when
compiling all packages, which is also useful when eglibc is used, no?

Thanks for your insights,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
