From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 17:05:29 +0200
Subject: [Buildroot] [PATCH v2 1/1] Allow adding per-package override
 rsync exclusions
In-Reply-To: <20171108132641.8234-1-aperez@igalia.com>
References: <20171108132641.8234-1-aperez@igalia.com>
Message-ID: <87b1e91e-f24b-87ae-ee09-17a4464191a5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-17 14:26, Adrian Perez de Castro wrote:
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
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 Applied to master, thanks.

 I've moved the documentation to the end of the section, otherwise it breaks the
flow IMO.

 Regards,
 Arnout

> ---
>  docs/manual/using-buildroot-development.txt | 16 ++++++++++++++++
>  package/pkg-generic.mk                      |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
> index 1071de5132..d16dc482f3 100644
> --- a/docs/manual/using-buildroot-development.txt
> +++ b/docs/manual/using-buildroot-development.txt
> @@ -64,6 +64,22 @@ This mechanism is best used in conjunction with the +make
>  _rsync_, only the modified files are copied), and restart the build
>  process of just this package.
>  
> +Source trees for big projects often contain hundreds or thousands of
> +files which are not needed for building, but will slow down the process
> +of copying the sources with _rsync_. Optionally, it is possible define
> ++<pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS+ to skip syncing certain files
> +from the source tree. For example, when working on the +webkitgtk+
> +package, the following will exclude the tests and in-tree builds from
> +a local WebKit source tree:
> +
> +------------------
> +WEBKITGTK_OVERRIDE_SRCDIR = /home/bob/WebKit
> +WEBKITGTK_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS = \
> +	--exclude JSTests --exclude ManualTests --exclude PerformanceTests \
> +	--exclude WebDriverTests --exclude WebKitBuild --exclude WebKitLibraries \
> +	--exclude WebKit.xcworkspace --exclude Websites --exclude Examples
> +------------------
> +
>  In the example of the +linux+ package above, the developer can then
>  make a source code change in +/home/bob/linux+ and then run:
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
