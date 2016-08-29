From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Aug 2016 00:38:33 +0200
Subject: [Buildroot] [PATCH/next 1/2] valgrind: let the valgrind
 configure script detect TLS availability
In-Reply-To: <1472507657-9983-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472507657-9983-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <4b2745e2-7705-7cae-eb20-0b827c0112cf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-08-16 23:54, Thomas Petazzoni wrote:
> Back in 2005, in commit
> a2c326396a43ecbc8d02c3d815d4010a7ba2e004 ("update valgrind to the latest
> and greatest"), an explicit --disable-tls option was added. More
> recently, in commit 31a3f4bd54e12b8d6de286ab8fb6d9651990e2f5 ("valgrind:
> enable tls support") changed this to be conditional on
> BR2_GCC_ENABLE_TLS.
> 
> However, the configure script of valgrind is perfectly capable of
> detecting TLS support, even in a cross-compilation case: it tries to
> compile a program that uses __thread and sees if it works.
> 
> Since we're about to modify how BR2_GCC_ENABLE_TLS is handled, we'd
> better remove its usage from packages, and valgrind is the only package
> using this config option.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/valgrind/valgrind.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index 46ba13e..b97d446 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -15,12 +15,6 @@ VALGRIND_INSTALL_STAGING = YES
>  # patch 0004-Fixes-for-musl-libc.patch touching configure.ac
>  VALGRIND_AUTORECONF = YES
>  
> -ifeq ($(BR2_GCC_ENABLE_TLS),y)
> -VALGRIND_CONF_OPTS += --enable-tls
> -else
> -VALGRIND_CONF_OPTS += --disable-tls
> -endif
> -
>  # When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
>  # -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture,
>  # it forcibly adds -march=mips64. This causes Valgrind to be built
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
