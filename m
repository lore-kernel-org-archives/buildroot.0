From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 22:12:15 +0200
Subject: [Buildroot] [PATCH] package/axel: fix link order
In-Reply-To: <1471182669-4429-1-git-send-email-yann.morin.1998@free.fr>
References: <1471182669-4429-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <16ed649c-6fc7-db82-3f9b-cb4c469fd0e0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-08-16 15:51, Yann E. MORIN wrote:
> libintl may use thread-related functions, so -lpthread must come after
> -lintl.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/e9d/e9d89fd5b24a76a3c5ab9dc8f01f4643f7c13396/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/axel/axel.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/axel/axel.mk b/package/axel/axel.mk
> index 6328d99..b60af0e 100644
> --- a/package/axel/axel.mk
> +++ b/package/axel/axel.mk
> @@ -9,13 +9,14 @@ AXEL_SITE = http://sources.buildroot.net
>  AXEL_LICENSE = GPLv2+
>  AXEL_LICENSE_FILES = COPYING
>  
> -AXEL_LDFLAGS = -lpthread
> -
>  ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>  AXEL_DEPENDENCIES += gettext
>  AXEL_LDFLAGS += -lintl
>  endif
>  
> +# -lintl may use symbols from -pthread

 Either pthread or -lpthread or libpthread, but not -pthread. I think if you use
-pthread that gcc (or collect2?) _will_ put it in the right order.

 Even so:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> +AXEL_LDFLAGS += -lpthread
> +
>  ifneq ($(BR2_ENABLE_LOCALE),y)
>  AXEL_DISABLE_I18N = --i18n=0
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
