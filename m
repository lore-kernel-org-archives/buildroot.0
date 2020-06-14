From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 21:58:09 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/icu: needs gcc >= 4.9 and host gcc >= 4.9
In-Reply-To: <20200614191948.413010-1-fontaine.fabrice@gmail.com>
References: <20200614191948.413010-1-fontaine.fabrice@gmail.com>
Message-ID: <20200614195809.GJ2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-14 21:19 +0200, Fabrice Fontaine spake thusly:
> icu uses std::max_align_t since version 67-1 and
> https://github.com/unicode-org/icu/commit/a3078fb8c89b61c35ccebb04cf6b189bc81093b3
> 
> This raises the following build failure with gcc 4.8:
> 
> utext.cpp:572:5: error: 'max_align_t' in namespace 'std' does not name a type
>      std::max_align_t    extension;
>      ^
> 
> This build failure is due to GCC bug 56019:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56019
> 
> Instead of adding BR2_TOOLCHAIN_HAS_GCC_BUG_56019, just bumps gcc
> dependency from 4.8 to 4.9
> 
> As this issue also affects host-icu, add Config.in.host with a
> host gcc >= 4.9 dependency

You don;t need to add this hos symbol. Only icu depends on host-icu, so
just have icu bear the two depends.

Besides, you forgot soemthing, see below...

[--SNIP--]
> diff --git a/package/icu/Config.in b/package/icu/Config.in
> index 32f35b9d96..1b792de5ba 100644
> --- a/package/icu/Config.in
> +++ b/package/icu/Config.in
> @@ -1,13 +1,15 @@
>  config BR2_PACKAGE_ICU
>  	bool "icu"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-icu
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# icu does some funky things by generating by itself an ELF
>  	# file, and it cannot easily be changed to generate FLAT
>  	# format.
>  	depends on !BR2_BINFMT_FLAT
> +	select BR2_PACKAGE_HOST_ICU

You select BR2_PACKAGE_HOST_ICU, but you forgot to propagate its
dependency on BR2_HOST_GCC_AT_LEAST_4_9.

However, as I said, you don't need to introduce BR2_PACKAGE_HOST_ICU.
Just have BR2_PACKAGE_ICU carry the two dependencies:

    config BR2_PACKAGE_ICU
        depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11 PR56019
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11 PR56019

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
