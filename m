From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Feb 2017 22:00:45 +0100
Subject: [Buildroot] [RFC] host-packages debugging config
In-Reply-To: <CAGszK3i=BkQKFMdbmH+_-oxVWh=i3LDXvZf=7nScrPP4Zg2deA@mail.gmail.com>
References: <CAGszK3i=BkQKFMdbmH+_-oxVWh=i3LDXvZf=7nScrPP4Zg2deA@mail.gmail.com>
Message-ID: <218e349f-6b7b-de1b-2220-39011ccd54ac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-02-17 08:09, Jan Heylen wrote:
> Hi,
> 
> I was debugging a tool on 'host', and therefore I enabled BR2_ENABLE_DEBUG.
> Although the documentation doesn't explicitly mention it is only for target
> packages, it is only for target packages ;-) ...  it does already mention 'all
> libs and bins in the staging' where host packages don't go.
> 
> So either I propose to explicitly state it in the documentation:
> 
> diff --git a/Config.in b/Config.in
> index ccd777e..e9d54a2 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -368,7 +368,7 @@ config BR2_CCACHE_USE_BASEDIR
>  endif
>  
>  config BR2_ENABLE_DEBUG
> -       bool "build packages with debugging symbols"
> +       bool "build target packages with debugging symbols"
>         help
>           Build packages with debugging symbols enabled. All libraries
                 ^ here as well.

>           and binaries in the 'staging' directory will have debugging
> 
> or to avoid confusion with 'stripped' target:
> 
> diff --git a/Config.in b/Config.in
> index ccd777e..e9d54a2 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -368,7 +368,7 @@ config BR2_CCACHE_USE_BASEDIR
>  endif
>  
>  config BR2_ENABLE_DEBUG
> -       bool "build packages with debugging symbols"
> +       bool "build target (staging) packages with debugging symbols"

 No, it's really target packages that are built with debugging symbols, and as
explained in the help text the target directory will get stripped.

>         help
>           Build packages with debugging symbols enabled. All libraries
>           and binaries in the 'staging' directory will have debugging
> 
> 
> Or (e.g. for Makefile.in here) I change the facts and also enable debugging on
> host packages with that option enabled: (and mention it in the documentation)

 For the host packages, I'd always build them with debugging symbols. That
rarely makes a huge difference. Adding options isn't much use.

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
