From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Aug 2013 17:58:43 +0200
Subject: [Buildroot] [PATCH v2] buildroot: Add POST_RSYNC_HOOKS support
In-Reply-To: <1375001692-12024-1-git-send-email-tjlee@ambarella.com>
References: <CAAXf6LVM7yoWaVdKp90oYOyLbVS=OvNFMzQv2nvcXp-vUmTDww@mail.gmail.com>
 <1375001692-12024-1-git-send-email-tjlee@ambarella.com>
Message-ID: <52090633.8060904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/07/13 10:54, Tzu-Jung Lee wrote:
> One of the use cases is for the 'local packages' to restore
> the SCM info.  Some packages use this information to generate
> version info during build time.  In this case, the local package
> can have this hook to restore it by symbolic link for example.
> 
> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Although IMHO it's a bit of a hack to use it for that specific use 
case. That use case would be better served with

rsync -au --cvs-exclude --include core $($(PKG)_RSYNC_OPTS) $(SRCDIR)/ $(@D)

(note that it is possible to set FOO_RSYNC_OPTS in the override file).

 Regards,
 Arnout

> ---
> Include the comments aginst v1 from Thomas De Schampheleire:
> 
>    Updte manual for the new hook.
>    Set the default hook to empty
> 
>   docs/manual/adding-packages-generic.txt | 1 +
>   package/pkg-generic.mk                  | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index faf70b1..2889add 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -441,6 +441,7 @@ The following hook points are available:
>   
>   * +LIBFOO_POST_DOWNLOAD_HOOKS+
>   * +LIBFOO_POST_EXTRACT_HOOKS+
> +* +LIBFOO_POST_RSYNC_HOOKS+
>   * +LIBFOO_PRE_PATCH_HOOKS+
>   * +LIBFOO_POST_PATCH_HOOKS+
>   * +LIBFOO_PRE_CONFIGURE_HOOKS+
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d9a12f2..3d3adc9 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -63,6 +63,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
>   	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
>   	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
>   	rsync -au --cvs-exclude --include core $(SRCDIR)/ $(@D)
> +	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
>   	$(Q)touch $@
>   
>   # Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
> @@ -337,6 +338,7 @@ $(2)_EXTRACT_CMDS ?= \
>   # post-steps hooks
>   $(2)_POST_DOWNLOAD_HOOKS        ?=
>   $(2)_POST_EXTRACT_HOOKS         ?=
> +$(2)_POST_RSYNC_HOOKS           ?=
>   $(2)_PRE_PATCH_HOOKS            ?=
>   $(2)_POST_PATCH_HOOKS           ?=
>   $(2)_PRE_CONFIGURE_HOOKS        ?=
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
