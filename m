From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 23:44:29 +0200
Subject: [Buildroot] [PATCH v4 01/12] arch: add the basic IBM s390x and
 Z arch support
In-Reply-To: <20200917040802.846896-2-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
 <20200917040802.846896-2-egorenar@linux.ibm.com>
Message-ID: <20200924214429.GB11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2020-09-17 06:07 +0200, Alexander Egorenkov spake thusly:
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
[--SNIP--]
> index 0707c076e2..eb9b6007c9 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
[--SNIP--]
> @@ -457,6 +467,10 @@ if BR2_riscv
>  source "arch/Config.in.riscv"
>  endif
>  
> +if BR2_s390x
> +source "arch/Config.in.s390x"
> +endif

Here, we already have a dependency on s390x, by way of the if-block
condition, so...

> diff --git a/arch/Config.in.s390x b/arch/Config.in.s390x
> new file mode 100644
> index 0000000000..39d2f58aa9
> --- /dev/null
> +++ b/arch/Config.in.s390x
> @@ -0,0 +1,34 @@
> +
> +choice
> +	prompt "Target Architecture Variant"
> +	depends on BR2_s390x

...here we do not need the dependency on s390x, so I dropped it and
applied to master. Thanks!

Regards,
Yann E. MORIN.

> +	help
> +	  Specific CPU variant to use
> +
> +config BR2_s390x_z13
> +	bool "z13"
> +	depends on BR2_s390x
> +
> +config BR2_s390x_z14
> +	bool "z14"
> +	depends on BR2_s390x
> +
> +config BR2_s390x_z15
> +	bool "z15"
> +	depends on BR2_s390x
> +
> +endchoice
> +
> +config BR2_ARCH
> +	default "s390x"	if BR2_s390x
> +
> +config BR2_ENDIAN
> +	default "BIG"
> +
> +config BR2_GCC_TARGET_ARCH
> +	default "arch11" if BR2_s390x_z13
> +	default "arch12" if BR2_s390x_z14
> +	default "arch13" if BR2_s390x_z15
> +
> +config BR2_READELF_ARCH_NAME
> +	default "IBM S/390"	if BR2_s390x
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
