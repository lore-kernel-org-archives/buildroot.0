From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Mar 2015 18:39:28 +0100
Subject: [Buildroot] [PATCH 1/3] uclibc: adapt thread implementation
 selection to uClibc-ng
In-Reply-To: <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150307173928.GH4186@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-07 14:39 +0100, Thomas Petazzoni spake thusly:
> uClibc-ng does not support linuxthreads or linuxthreads.old on
> architectures that have NPTL support. This creates another complicated
> dependency: dependeing on the uClibc version being used, not the same
> thread implementations are available.
> 
> In order to handle this situation, this patch introduces three hidden
> booleans:
> 
>  - BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
>  - BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
>  - BR2_UCLIBC_VERSION_SUPPORTS_NPTL
> 
> They are selected by the different uClibc versions, depending on which
> thread implementation they support on the different architectures.
> 
> Then, the choice of the thread implementation can rely on those
> booleans to know if a given thread implementation is available in the
> current architecture / uClibc version selection.
> 
> This makes sure that unusable thread implementation do not get
> selected, therefore fixing build issues such as:
> 
>   http://autobuild.buildroot.org/results/89e/89e423bee040cbce3e82cd89f1191efaac490c0d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Here's a further review, since you asked for it... ;-)

>  	config BR2_UCLIBC_VERSION_0_9_33
>  		bool "uClibc 0.9.33.x"
> +		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
> +		       if !BR2_bfin
> +		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
> +		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
> +		       if !BR2_bfin && !BR2_x86_i386
>  		depends on !(BR2_arc || BR2_xtensa)
>  
>  	config BR2_UCLIBC_VERSION_ARC_GIT
>  		bool "uClibc Git ARC"
> +		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
> +		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
>  		depends on BR2_arc
>  
>  	config BR2_UCLIBC_NG_VERSION_1_0_0
>  		bool "uClibc-ng 1.0.0"
> +		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
> +		       if BR2_arc || BR2_m68k
> +		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
> +		       if BR2_arc || BR2_bfin || BR2_m68k
> +		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
> +		       if !BR2_arc && !BR2_bfin && !BR2_x86_i386

From what I can see, uclibc-ng on branch 1.0 :

                LT.old  LT      NPTL    Notes
    arc         -       -       Y
    arm         Y       -       Y
    bfin        Y       Y       -
    i386        -       -       -
    i?86        -       -       Y       except i386
    m68k        Y       Y       -
    microblaze  Y       Y       -       not used in BR
    mips        -       -       Y
    nios2       Y       Y       -       not used in BR
    powerpc     -       -       Y
    sh          -       -       Y
    sparc       -       -       Y
    x86_64      -       -       Y
    xtensa      -       -       Y
    

So, I guess your selection is incorrect, and you should have:

    select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
        if BR2_bfin || BR2_m68k
    select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
        if BR2_bfin || BR2_m68k || BR2_arm || BR2_armeb
    select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
        if !BR2_bfin && !BR2_m68k && !BR2_x86_i386

Regards,
Yann E. MORIN.

>  	config BR2_UCLIBC_VERSION_XTENSA_GIT
>  		bool "uClibc Git Xtensa"
>  		depends on BR2_xtensa
> +		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS_OLD
>  
>  	config BR2_UCLIBC_VERSION_SNAPSHOT
>  		bool "daily snapshot"
> +		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS if !BR2_bfin && !BR2_xtensa
> +		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS_OLD
> +		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
> +		       if !BR2_bfin && !BR2_x86_i386 && !BR2_xtensa
>  		depends on !(BR2_arc)
>  
>  endchoice
> @@ -101,8 +128,9 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
>  
>  choice
>  	prompt "Thread library implementation"
> -	default BR2_PTHREADS_NATIVE if !BR2_xtensa
> -	default BR2_PTHREADS_OLD
> +	default BR2_PTHREADS_NATIVE if BR2_UCLIBC_VERSION_SUPPORTS_NPTL
> +	default BR2_PTHREADS_OLD if BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
> +	default BR2_PTHREADS if BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
>  	help
>  	  Use this option to select the thread library implementation
>  	  that should be used in your toolchain. Not all thread
> @@ -115,24 +143,19 @@ choice
>  
>  	config BR2_PTHREADS
>  		bool "linuxthreads"
> -		depends on !BR2_bfin
> -		depends on !BR2_xtensa
>  		select BR2_TOOLCHAIN_HAS_THREADS
> +		depends on BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
>  
>  	config BR2_PTHREADS_OLD
>  		bool "linuxthreads (stable/old)"
>  		select BR2_TOOLCHAIN_HAS_THREADS
> +		depends on BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
>  
>  	config BR2_PTHREADS_NATIVE
>  		bool "Native POSIX Threading (NPTL)"
>  		select BR2_TOOLCHAIN_HAS_THREADS
>  		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> -		depends on !BR2_arc
> -		depends on !BR2_bfin
> -		# There is NPTL support for Xtensa in uClibc-ng, but
> -		# not in the main uClibc repository.
> -		depends on !BR2_xtensa || !BR2_UCLIBC_VERSION_XTENSA_GIT
> -		depends on !BR2_x86_i386
> +		depends on BR2_UCLIBC_VERSION_SUPPORTS_NPTL
>  endchoice
>  
>  config BR2_PTHREAD_DEBUG
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
