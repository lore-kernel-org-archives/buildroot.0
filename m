From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 12:36:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: add --delete to
 rsync
In-Reply-To: <1412932487-25373-1-git-send-email-alvaro.gamez@hazent.com>
References: <1412932487-25373-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20141010123659.187fd60d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro G. M,

On Fri, 10 Oct 2014 11:14:47 +0200, Alvaro G. M wrote:
> When a source overriden package is built and then its source code is modified
> and rebuilt with make package-rebuild, it is needed for the build directory
> to contain exactly the same source that is in the original directory,
> so rsync must not only copy missing files, but also remove those that existed
> previously but now don't.
> 
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f09f83e..440a750 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -117,7 +117,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
>  	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
>  	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
>  	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
> -	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
> +	rsync --delete -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
>  	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
>  	$(Q)touch $@

I don't remember how rsync behave exactly, but wouldn't this also
remove object files, shared libraries and executables that will have
been built in $(@D) ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
