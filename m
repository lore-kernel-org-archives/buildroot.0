From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 11:33:57 +0200
Subject: [Buildroot] [PATCH 2/2] uclibc: remove Xtensa specific version
In-Reply-To: <1434216106-27618-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434216106-27618-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1434216106-27618-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614093357.GB3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-13 19:21 +0200, Thomas Petazzoni spake thusly:
> Since we now have uClibc-ng, and it is used as the default uClibc
> version, there is no real need to keep the Xtensa version: this
> version is just a specific Git revision of uClibc master branch, and
> uClibc-ng is also based on uClibc master branch.
> 
> In addition, since in the choice of uClibc versions, uClibc-ng is
> already *before* the Xtensa specific version, uClibc-ng has in fact
> already been the default uClibc version for Xtensa since uClibc-ng
> support was introduced.
> 
> See for example:
> 
>   http://autobuild.buildroot.org/results/c85/c854fae31d82e0f11d5a8b5bfc196c29bd7e21db/config
> 
> for a build on Xtensa with the internal toolchain, where in fact
> uClibc-ng is used instead of the Xtensa specific version.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/uclibc/Config.in | 7 -------
>  package/uclibc/uclibc.mk | 3 ---
>  2 files changed, 10 deletions(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 9b29ae5..f69cc25 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -43,11 +43,6 @@ choice
>  		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
>  		       if !BR2_arc && !BR2_m68k && !BR2_x86_i386
>  
> -	config BR2_UCLIBC_VERSION_XTENSA_GIT
> -		bool "uClibc Git Xtensa"
> -		depends on BR2_xtensa
> -		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
> -
>  	config BR2_UCLIBC_VERSION_SNAPSHOT
>  		bool "daily snapshot"
>  		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS if !BR2_xtensa
> @@ -70,7 +65,6 @@ config BR2_UCLIBC_VERSION_STRING
>  	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
>  	default "arc-2014.12" if BR2_UCLIBC_VERSION_ARC_GIT
>  	default "1.0.2"		if BR2_UCLIBC_VERSION_NG
> -	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
>  	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
>  
>  config BR2_UCLIBC_CONFIG
> @@ -79,7 +73,6 @@ config BR2_UCLIBC_CONFIG
>  	default "package/uclibc/uClibc-ng.config" if BR2_UCLIBC_VERSION_NG
>  	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_ARC_GIT
>  	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
> -	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_XTENSA_GIT
>  	help
>  	  Some people may wish to use their own modified uClibc configuration
>  	  file and will specify their config file location with this option.
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index b9dce7e..ecbfa11 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -18,9 +18,6 @@ UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
>  else ifeq ($(BR2_UCLIBC_VERSION_ARC_GIT),y)
>  UCLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,uClibc,$(UCLIBC_VERSION))
>  UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
> -else ifeq ($(BR2_UCLIBC_VERSION_XTENSA_GIT),y)
> -UCLIBC_SITE = git://git.busybox.net/uClibc
> -UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
>  else
>  UCLIBC_SITE = http://www.uclibc.org/downloads
>  UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.xz
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
