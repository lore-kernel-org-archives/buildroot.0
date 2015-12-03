From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Dec 2015 00:35:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/gawk: clean the mpfr dependency
In-Reply-To: <6dcb0e2bfe0573ddcfba8f9b7c90d18090c46a1a.1449181275.git.yann.morin.1998@free.fr>
References: <cover.1449181275.git.yann.morin.1998@free.fr>
 <6dcb0e2bfe0573ddcfba8f9b7c90d18090c46a1a.1449181275.git.yann.morin.1998@free.fr>
Message-ID: <5660D1B6.5040404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-12-15 23:22, Yann E. MORIN wrote:
> When available, mpfr provides support for BIGNUM, which allows gawk to
> work on arbitrarily-large numbers (hence the name).
> 
> Forcibly disable mpfr if the mpfr package is not enabled. Let
> ./configure find it automatically when it is enabled.
> 
> To be noted, the host-gawk needs not have BIGNUM to build the target
                             ^^^^^^^^^ doesn't need to have

> variant with support for BIGNUM.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Just minor comments.

> ---
>  package/gawk/gawk.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
> index 6702c48..74c1fe4 100644
> --- a/package/gawk/gawk.mk
> +++ b/package/gawk/gawk.mk
> @@ -7,7 +7,7 @@
>  GAWK_VERSION = 4.1.3
>  GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
>  GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
> -GAWK_DEPENDENCIES = host-gawk $(if $(BR2_PACKAGE_MPFR),mpfr)
> +GAWK_DEPENDENCIES = host-gawk
>  GAWK_LICENSE = GPLv3+
>  GAWK_LICENSE_FILES = COPYING
>  
> @@ -16,6 +16,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  GAWK_DEPENDENCIES += busybox
>  endif
>  
> +# When enabled, let ./configure find it automatically

 I think a more appropriate comment would be

# --with-mpfr requires an argument so just let configure
# find it automatically.


 Regards,
 Arnout

> +ifeq ($(BR2_PACKAGE_MPFR),y)
> +GAWK_DEPENDENCIES += mpfr
> +else
> +GAWK_CONF_OPTS += --without-mpfr
> +endif
> +
>  # We don't have a host-busybox, and we don't want to use readline or mpfr
>  HOST_GAWK_DEPENDENCIES =
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
