From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Nov 2017 21:57:56 +0100
Subject: [Buildroot] [PATCH 1/1] Allow adding per-package overrlice
 rsync exclusions
In-Reply-To: <20171107015730.20311-1-aperez@igalia.com>
References: <20171107015730.20311-1-aperez@igalia.com>
Message-ID: <04ece7d7-8192-2029-5edc-63ae48bb7532@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adrien,

On 07-11-17 02:57, Adrian Perez de Castro wrote:
> This allows using <PKG>_SRCDIR_OVERRIDE_RSYNC_EXCLUSIONS in local.mk to
> skip copying parts of source trees unneeded for building. For example,
> when developing WebKitGTK+, it's handy to skip copying all the tests and
> other build directories, which are huge:
> 
>     WEBKITGTK_OVERRIDE_SRCDIR = /home/aperez/WebKit
>     WEBKITGTK_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = \
>         --exclude JSTests --exclude ManualTests \
> 	--exclude PerformanceTests --exclude WebDriverTests \
> 	--exclude WebKitBuild --exclude WebKitLibraries \
> 	--exclude WebKit.xcworkspace --exclude Websites \
> 	--exclude Examples
> 
> This saves a good chunk of time when rsync is used for the first time to
> copy the source tree over before building.

 Looks like an interesting feature. Although, if the out-of-tree build feature
gets merged, it's probably less useful. That is, assuming that webkitgtk
supports out-of-tree build, which is not a given...

 I could bikeshed a little on the name, but it's actually OK.

> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 0e28675fbe..c895afc498 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -181,7 +181,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
>  	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
>  	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
>  	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
> -	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
> +	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)

 Would have been nice to split the long line. But even without split:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Could you also add this feature to the documentation of _OVERRIDE_SRCDIR in the
manual?

 Regards,
 Arnout


>  	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
>  	$(Q)touch $@
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
