From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Dec 2015 15:48:39 +0100
Subject: [Buildroot] [PATCH] wine: fix sane related build failure
In-Reply-To: <5661C4CF.7030709@dawncrow.de>
References: <1436094900-3217-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5661C4CF.7030709@dawncrow.de>
Message-ID: <5662F947.6090900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-12-15 17:52, Andr? Hentschel wrote:
> Hi Thomas,
> 
> Moving this discussion to the correct thread...
> I meanwhile submitted https://bugs.winehq.org/show_bug.cgi?id=39660 which didn't caught much attention yet.
> But I looked at it myself and I think I found a way to avoid patching Wine.
> Wines configure exposes special COMPONENT_CFLAGS and COMPONENT_LIBS variables which get prioritized over "guessed" tools.
> What's your opinion on this (afaict it works):
> 
> 
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> index 38576db..e29d616 100644
> --- a/package/wine/wine.mk
> +++ b/package/wine/wine.mk
> @@ -173,8 +173,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
>  WINE_CONF_OPTS += --with-sane
> +WINE_CONF_OPTS += SANE_CFLAGS="`$(STAGING_DIR)/usr/bin/sane-config --cflags 2>/dev/null`"
> +WINE_CONF_OPTS += SANE_LIBS="`$(STAGING_DIR)/usr/bin/sane-config --ldflags 2>/dev/null`"
>  WINE_DEPENDENCIES += sane-backends
> -WINE_CONF_ENV += SANE_CONFIG=$(STAGING_DIR)/usr/bin/sane-config
>  else
>  WINE_CONF_OPTS += --without-sane
>  endif

 Looks good to me. However, doesn't sane install a pkg-config file as well? I'd
prefer to use that one then.

 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
