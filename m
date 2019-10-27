From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Oct 2019 00:10:19 +0100
Subject: [Buildroot] [PATCH 1/1] Config.in: disable PIC/PIE if the
 toolchain does not support PIE
In-Reply-To: <20191027220334.23505-1-fontaine.fabrice@gmail.com>
References: <20191027220334.23505-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027231019.GA2612@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-10-27 23:03 +0100, Fabrice Fontaine spake thusly:
> m68k does not seem to really support PIE as it raises the following
> build failure with aer-inject:
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/7.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
> (.text+0x4): undefined reference to `__shared_flat_add_library'
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/7.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: final link failed: bad value
> 
> We also have another build failure with uclibc on microblazeel:
> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/8.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: final link failed: bad value
> collect2: error: ld returned 1 exit status
> Makefile.in:114: recipe for target '../utils/getconf' failed
> 
> So add a BR2_TOOLCHAIN_SUPPORTS_PIE dependency on BR2_PIC_PIE
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/4cdd6f0368cc9d3c6e88f01b1a8929eb0839b638
>  - http://autobuild.buildroot.net/results/a82a484409149d7f9aff6140ddcb89f627f508c7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Config.in | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index ebbb6b41f4..010b0774e3 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -697,10 +697,15 @@ comment "Security Hardening Options"
>  config BR2_PIC_PIE
>  	bool "Build code with PIC/PIE"
>  	depends on BR2_SHARED_LIBS
> +	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
>  	help
>  	  Generate Position-Independent Code (PIC) and link
>  	  Position-Independent Executables (PIE).
>  
> +comment "PIC/PIE needs a toolchain w/ PIE"
> +	depends on BR2_SHARED_LIBS
> +	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
> +
>  choice
>  	bool "Stack Smashing Protection"
>  	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
> @@ -783,12 +788,16 @@ config BR2_RELRO_PARTIAL
>  
>  config BR2_RELRO_FULL
>  	bool "Full"
> +	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
>  	select BR2_PIC_PIE
>  	help
>  	  This option includes the partial configuration, but also marks
>  	  the GOT as read-only at the cost of initialization time during
>  	  program loading, i.e every time an executable is started.
>  
> +comment "RELRO Full needs a toolchain w/ PIE"
> +	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
> +
>  endchoice
>  
>  comment "RELocation Read Only (RELRO) needs shared libraries"
> -- 
> 2.23.0
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
