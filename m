From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Aug 2019 10:59:45 +0200
Subject: [Buildroot] [PATCH 1/1] font-awesome compatible with fontconfig
 [FIXED]
In-Reply-To: <20180921151515.5128-1-benj.calderon@gmail.com>
References: <20180921151515.5128-1-benj.calderon@gmail.com>
Message-ID: <9a58bc3e-ec6a-ab99-ddcc-71caa25cb691@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Benjamin,

 Sorry that we didn't come back earlier to this patch. It just got dropped from
our radar...

On 21/09/2018 17:15, Benjamin Calderon wrote:
> This commit installs font-awesome in the standard fonts directory
> making it available systemwide.

 This part of the commit is great.

> The extra folders (css, less, scss) together with the webfonts (*.eot,
> *.woff*, etc) are also left out since they are useless in this context.

 ... but this is not entirely true.

> CSS and webfonts files are usually delivered via CDN or need to be in
> the webroot of an http server in order to serve any purpose thus having those
> files installed with this package is pointless.

 Indeed, the webserver has to be configured to export that particular directory
- which I assume is exactly what the original contributor of this package did.

 It is true that the location is less than ideal - but we unfortunately don't
have a standard location for the webroot, and definitely no standard
subdirectories for CSS etc. We probably should have that. but we currently
don't. We *mostly* use /var/www, but I believe that there are some web-related
packages that install stuff in other locations.

 So, for sure, removing the woff*, eot and css is not good. The less and sccs
I'm not so sure of, but I think even those may be used by a web service because
they can be converted to css by Javascript on the browser.

 So I think this patch should *only* move the "classical" fonts to the fonts
directory. Perhaps you could add a separate patch that moves all the rest to
/var/www. And finally, if there is a good reason for it, you could have a third
patch that removes less and sccs.

 For now, I've marked this patch as Changes Requested in patchwork.

 Regards,
 Arnout

> 
> Thanks to baruch for his technical critique.
> 
> Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
> ---
>  package/font-awesome/font-awesome.mk | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
> index f39401041a..1bf41c6020 100644
> --- a/package/font-awesome/font-awesome.mk
> +++ b/package/font-awesome/font-awesome.mk
> @@ -6,13 +6,11 @@
>  
>  FONT_AWESOME_VERSION = v4.7.0
>  FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
> -FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
> -FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
> +FONT_AWESOME_LICENSE = OFL-1.1
>  
>  define FONT_AWESOME_INSTALL_TARGET_CMDS
> -	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
> -	$(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
> -		cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/font-awesome$(sep))
> +	mkdir -p $(TARGET_DIR)/usr/share/fonts/font-awesome/
> +	cp $(@D)/fonts/FontAwesome.otf $(TARGET_DIR)/usr/share/fonts/font-awesome/FontAwesome.otf
>  endef
>  
>  $(eval $(generic-package))
> 
