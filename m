From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 14:36:07 +0200
Subject: [Buildroot] [PATCH 1/3] buildroot: target: Add Blackfin
 architecture support in configuration.
In-Reply-To: <1344251847-7709-1-git-send-email-sonic.adi@gmail.com>
References: <1344251847-7709-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <20120806143607.7dca918a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 6 Aug 2012 19:17:25 +0800,
Sonic Zhang <sonic.adi@gmail.com> a ?crit :

> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  target/Config.in.arch |   19 +++++++++++++++++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
> 
> diff --git a/target/Config.in.arch b/target/Config.in.arch
> index 6eaa951..001faf0 100644
> --- a/target/Config.in.arch
> +++ b/target/Config.in.arch
> @@ -131,6 +131,15 @@ config BR2_xtensa
>  	  http://www.tensilica.com/
>  endchoice
>  
> +config BR2_ABI_FLAT
> +	bool
> +	default n
> +
> +config BR2_ABI_ELF
> +	bool
> +	default y
> +	depends on !BR2_ABI_FLAT

Could you expand a bit on why this is needed, and where it will be
used? I have seen those used in various places in some of your packages
in your Git repository, but I am not sure the use cases were actually
valid.

>  config BR2_microblaze
>  	bool
>  	default y if BR2_microblazeel || BR2_microblazebe
> @@ -231,8 +240,18 @@ choice
>  	default BR2_BFIN_FDPIC
>  config BR2_BFIN_FDPIC
>  	bool "FDPIC"
> +	select BR2_ABI_ELF
>  config BR2_BFIN_FLAT
>  	bool "FLAT"
> +	select BR2_ABI_FLAT
> +	select BR2_PREFER_STATIC_LIB
> +config BR2_BFIN_FLAT_SEP_DATA
> +	bool "FLAT (Separate data)"
> +	select BR2_ABI_FLAT
> +	select BR2_PREFER_STATIC_LIB
> +config BR2_BFIN_SHARED_FLAT
> +	bool "Shared FLAT"
> +	select BR2_ABI_FLAT
>  	select BR2_PREFER_STATIC_LIB
>  endchoice

Are these "FLAT (Separate data)" and "Shared FLAT" use cases actually
used in practice by people? I'm not a Blackfin expert, so I don't know
what's used in the field.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
