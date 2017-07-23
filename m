From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 15:42:02 +0200
Subject: [Buildroot] [PATCH 18/20] fs: add pre- and post-command hooks
In-Reply-To: <9ad47b5d1b91f4c74c62b01fb37b75d85c23a9ca.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <9ad47b5d1b91f4c74c62b01fb37b75d85c23a9ca.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <1a767f33-47a3-5ab6-ed40-00e2bfa31da8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

On 18-07-17 19:25, Yann E. MORIN wrote:
> In some cases, the directory structure we want in the filesystem is not
> exactly what we have in target/
> 
> For example, when systemd is used on a read-only rootfs, /var must be a
> tmpfs. However, we may have packages that install stuff in there, and
> set important rights (via the permission-table). So, at build time, we
> need /var to be a symlink to the remanent location (/usr/share/factory)
> while at runtime we need /var to be a directory.
> 
> One option would have seen to have /var as a real directory even during
> build time, and in a target-finalize hook, move everything out of there
> and into the "factory" location. However, that's not possible because
> it's too early: some packages may want to set ownership and/or acces
> rights on directories or files in /var, and this is only done in the
> fakeroot script, which is called only later during the assembling of the
> filesystem images.
> 
> Also, there would have been no way to undo the tweak (i.e. we need to
> restore the /var symlink so that subsequent builds continue to work) if
> it were done as a target-finalize hook.
> 
> The only solution is to allow packages to register pre- and post-hooks
> that are called right before and right after the rootfs commands are
> executed, and inside in the fakeroot script.
> 
> We can however not re-use the BR2_ROOTFS_POST_FAKEROOT_SCRIPT feature
> either because it is done before the filesystem command, but there is
> nothing that is done after. Also, we don't want to add to, and modify a
> user-supplied variable.

 I completely agree with this approach.

> 
> So, we introduce two new variables that packages can set to add the
> commands they need to run to tweak the filesystem right at the last
> moment.

 But not with this.


> Those hooks are not documented on-purpose; they are probably going to
> only ever be used by systemd.

 If systemd is the only one ever to use it, then the approach with a list of
hooks is just too much over the top. Why not hardcode it? Like so:


> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> 
> ---
> Changes v2 -> v3:
>   - add space between >> and $$   (Romain)
> ---
>  fs/common.mk           | 4 ++++
>  package/pkg-generic.mk | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 14e0a6b868..9a7758ff49 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -95,10 +95,14 @@ endif
>  	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
>  		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
>  		echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
> +	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
> +		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT))

	$$(call PRINTF,$$(ROOTFS_SKELETON_PRE_CMD_HOOK)) >> $$(FAKEROOT_SCRIPT)

 You may want to change the variable name, obviously.

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
