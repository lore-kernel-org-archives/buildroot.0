From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Oct 2014 15:12:11 +0200
Subject: [Buildroot] [PATCH] freetype: Add config option for bzip2
 compressed font support
In-Reply-To: <1413599958-24524-1-git-send-email-maarten@treewalker.org>
References: <1413599958-24524-1-git-send-email-maarten@treewalker.org>
Message-ID: <5442672B.1000500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/14 04:39, Maarten ter Huurne wrote:
> If bzip2 is available, it might still be preferable to not include
> support for bzip2 compressed fonts, for example to reduce the number
> of libraries loaded when running a GUI application.

 I don't agree with this. The impact will be really small, both for memory size
and for load time - especially because any application using freetype will most
likely load much larger GUI libraries. If you're working at such details, you'll
unavoidably have to do some manual hacks to get it even better. So I don't think
it makes sense to add a config option for it - we try to keep the number of
config options in check.

 So unless you can show me a use case where it makes a real impact, it's a NACK.


> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>  package/freetype/Config.in   | 9 +++++++++
>  package/freetype/freetype.mk | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/freetype/Config.in b/package/freetype/Config.in
> index ded8738..f245b14 100644
> --- a/package/freetype/Config.in
> +++ b/package/freetype/Config.in
> @@ -4,3 +4,12 @@ config BR2_PACKAGE_FREETYPE
>  	  a free, high-quality and portable font engine.
>  
>  	  http://www.freetype.org/
> +
> +if BR2_PACKAGE_FREETYPE
> +
> +config BR2_PACKAGE_FREETYPE_BZIP2
> +	bool "support bzip2 compressed fonts"
> +	depends on BR2_PACKAGE_BZIP2
> +	default y

 In reply to Maxime's comment: it should indeed default to yes, so the default
keeps the behaviour we had up to now.


 Regards,
 Arnout

> +
> +endif
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index b85d0ec..b2d999f 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -37,7 +37,7 @@ else
>  FREETYPE_CONF_OPTS += --without-zlib
>  endif
>  
> -ifeq ($(BR2_PACKAGE_BZIP2),y)
> +ifeq ($(BR2_PACKAGE_FREETYPE_BZIP2),y)
>  FREETYPE_DEPENDENCIES += bzip2
>  FREETYPE_CONF_OPTS += --with-bzip2
>  else
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
