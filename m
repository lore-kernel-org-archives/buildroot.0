From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 31 Aug 2016 00:58:36 +0200
Subject: [Buildroot] [PATCH/next v2 2/2] gcc: remove BR2_GCC_ENABLE_TLS
	option
In-Reply-To: <1472592808-18270-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472592808-18270-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1472592808-18270-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53993701-c8a4-09d9-5d0f-6510a8f0812b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-08-16 23:33, Thomas Petazzoni wrote:
[snip]
> So, this commit completely removes the BR2_GCC_ENABLE_TLS and instead
> makes the right choice inside gcc.mk directly:
> 
>  - TLS support enabled for glibc, musl and uClibc/NPTL
> 
>  - TLS support in other cases, i.e uClibc/no-thread and
>    uClibc/linuxthreads.
[snip]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
>  - Invert the condition logic, to make it simpler. Suggested by Arnout.
> ---
[snip]
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 39c3eeb..82050b4 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -133,10 +133,13 @@ ifeq ($(BR2_sparc)$(BR2_sparc64),y)
>  HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
>  endif
>  
> -ifeq ($(BR2_GCC_ENABLE_TLS),y)
> -HOST_GCC_COMMON_CONF_OPTS += --enable-tls
> -else
> +# TLS support is not needed on uClibc/no-thread and

 I thought it was not even available for nothread or linuxthreads?

 But anyway:
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> +# uClibc/linux-threads, otherwise, for all other situations (glibc,
> +# musl and uClibc/NPTL), we need it.
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_PTHREADS)$(BR2_PTHREADS_NONE),yy)
>  HOST_GCC_COMMON_CONF_OPTS += --disable-tls
> +else
> +HOST_GCC_COMMON_CONF_OPTS += --enable-tls
>  endif
>  
>  ifeq ($(BR2_GCC_ENABLE_LTO),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
