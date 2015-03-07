From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Mar 2015 15:34:11 +0100
Subject: [Buildroot] [PATCH 1/3] uclibc: adapt thread implementation
 selection to uClibc-ng
In-Reply-To: <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150307143411.GC4186@free.fr>
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

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, a small comment, see below...

> ---
>  package/uclibc/Config.in | 43 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 3a65752..c66373d 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -7,6 +7,15 @@ config BR2_PACKAGE_UCLIBC
>  
>  comment "uClibc Options"
>  
> +config BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
> +       bool
> +
> +config BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
> +       bool
> +
> +config BR2_UCLIBC_VERSION_SUPPORTS_NPTL
> +       bool
> +
>  choice
>  	prompt "uClibc C library Version"
>  	default BR2_UCLIBC_VERSION_0_9_33
> @@ -15,21 +24,39 @@ choice
>  
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

I will trust you on these combinations. ;-)

>  	config BR2_UCLIBC_VERSION_XTENSA_GIT
>  		bool "uClibc Git Xtensa"
>  		depends on BR2_xtensa
> +		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS_OLD

Please be consistent: either put the 'select' before or after the
'depends' as you prefer, but do it consistently across all options. ;-)

I tend to prefer depends before select, as it seems more logical to me,
but I don't mind either, as long as it is consistent.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
