From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Sep 2011 12:02:44 +0200
Subject: [Buildroot] [PATCH 02/15] package: enhance infrastructure to
	support source dir override
In-Reply-To: <ad6a9779e87399fbd8f70dbafa666006d8c846d1.1314826231.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <ad6a9779e87399fbd8f70dbafa666006d8c846d1.1314826231.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201109021202.45783.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 31 August 2011 23:31:10, Thomas Petazzoni wrote:
> Those <pkg>_OVERRIDE_SRCDIR variables will be defined by a local
> makefile included by Buildroot, which will be handled in a later
> commit.

 Or on the make command line...

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Makefile.package.in |   54
> +++++++++++++++++++++++++++++++++++++++++- 1 files changed, 52
> insertions(+), 2 deletions(-)
> 
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index 6dae8f7..1de2838 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -251,6 +251,25 @@ $(BUILD_DIR)/%/.stamp_extracted:
>  	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
>  	$(Q)touch $@
> 
> +# Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
> +# used.
> +$(BUILD_DIR)/%/.stamp_rsynced:
> +	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
> +	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
> +	rsync -au $(SRCDIR)/ $(@D)

 I use rsync -rltDO --exclude=.svn --exclude=.git:

 * -rltD instead of -a because I don't want to keep group, owner and 
permissions (otherwise you'll probably have to fixup permissions anyway).

 * -O because otherwise the directory times will be reset to the past, which 
does not correspond to reality if there are still object files lying around.  
If there would be a dependency on a directory, it will be incorrect.

 * --exclude=.git: if you're doing this for the kernel, you know why :-)  
There should probably be a --exclude=.hg as well.


 [snip]


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
