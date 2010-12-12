From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 12 Dec 2010 11:37:22 +0100
Subject: [Buildroot] [PATCH 13/15] toolchain: expose thread options in
	the Crosstool-NG backend
In-Reply-To: <ebd285ae70fb69572d98ea560e2180aecf57ffd7.1291541115.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<ebd285ae70fb69572d98ea560e2180aecf57ffd7.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201012121137.22698.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 05 December 2010 10:25:40 Thomas Petazzoni wrote:
[--SNIP--]
> diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> index 1c5e864..b7f88ee 100644
> --- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> +++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
> @@ -213,6 +213,27 @@ else
>  CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_LANG_CXX)=.*:\# \1 is not set:;
>  endif
>  
> +# Thread implementation selection
> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\# \2 is not set:;
> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_LINUXTHREADS).*:\# \2 is not set:;
> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NPTL).*:\# \2 is not set:;
> +ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS))$(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD)),)
> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_LINUXTHREADS).*:\2=y:;
> + ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc)),)
> +  ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD)),)
> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_NEW).*:\# \2 is not set:;
> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_OLD).*:\2=y:;
> +  else
> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_OLD).*:\# \2 is not settted:;

'settted' ?

> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_NEW).*:\2=y:;
> +  endif
> + endif
> +else ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_NPTL)),)
> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NPTL).*:\2=y:;
> +else ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_NONE)),)
> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\2=y:;
> +endif
> +
>  #--------------
>  # And the specials for paths
>  CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_PREFIX_DIR)=.*:\1="$(TOOLCHAIN_DIR)":;

I am not so sure what to say about this one...

There is already a place where we check the C library, on line 223 (upstream)
and I would say that should go there.

I'll look at it tonight...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
