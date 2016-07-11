From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2016 11:54:41 +0200
Subject: [Buildroot] [PATCH] toolchain: add hidden symbol for PIE support
In-Reply-To: <20160709112030.GA25741@waldemar-brodkorb.de>
References: <20160709112030.GA25741@waldemar-brodkorb.de>
Message-ID: <20160711115441.07e4dc14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 9 Jul 2016 13:20:30 +0200, Waldemar Brodkorb wrote:

> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index b49588f..35db809 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -15,9 +15,11 @@ config BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
> +	select BR2_TOOLCHAIN_SUPPORTS_PIE
>  
>  config BR2_TOOLCHAIN_USES_UCLIBC
>  	bool
> +	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_arc && !BR2_m68k && !BR2_STATIC_LIBS
>  
>  config BR2_TOOLCHAIN_USES_MUSL
>  	bool
> @@ -26,6 +28,7 @@ config BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
>  	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	select BR2_TOOLCHAIN_SUPPORTS_PIE

Sorry, I missed those selects! Indeed, they are good.

> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 65df31b..417eee3 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -39,6 +39,10 @@ config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
>  config BR2_TOOLCHAIN_HAS_SSP
>  	bool
>  
> +config BR2_TOOLCHAIN_SUPPORTS_PIE
> +	bool
> +	depends on !BR2_STATIC_LIBS && !BR2_arc && !BR2_m68k

But then this "depends on" is useless, and in fact wrong.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
