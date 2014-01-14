From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 21:51:17 +0100
Subject: [Buildroot] [PATCH 4/6] package infra: DOWNLOAD is never called
 with two arguments
In-Reply-To: <894fddeb65b5990ef4926605cfe58f1d19804ec8.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <894fddeb65b5990ef4926605cfe58f1d19804ec8.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <52D5A345.6080309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/01/14 00:44, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Currently, the DOWNLOAD helper accepts one or two arguments:
>    - the source URI
>    - the source filename, if missing, derived from the URI

  The idea was that it would be possible to download to a different local 
file than what is in the URL, which would e.g. work around the 
<sha1>.tar.gz URLs of gitorious. However, that currently anyway doesn't 
work (because the primary and secondary download sites should use the 
buildroot-filename rather than the url-filename). So I'm OK with removing it.

>
> But we have no caller of DOWNLOAD that passes a second argument.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>   package/pkg-download.mk | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 8e6f7a3..f3354d1 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -227,14 +227,13 @@ endef
>   # 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
>   #
>   # Argument 1 is the source location
> -# Argument 2 is the source filename
>   #
>   # E.G. use like this:
> -# $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
> +# $(call DOWNLOAD,$(FOO_SITE))
>   ################################################################################
>
>   define DOWNLOAD
> -	$(call DOWNLOAD_INNER,$(1),$(if $(2),$(2),$(notdir $(1))))
> +	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)))
>   endef
>
>   define DOWNLOAD_INNER
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
