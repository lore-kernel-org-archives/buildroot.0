From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Jan 2017 22:31:33 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: ensure that /usr/{lib, bin,
 sbin} exist
In-Reply-To: <1483588509-2653-1-git-send-email-danomimanchego123@gmail.com>
References: <1483588509-2653-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20170105213133.GC3939@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2017-01-04 22:55 -0500, Danomi Manchego spake thusly:
> It is possible to have a custom skeleton without a /usr/{lib,bin,sbin},
> and indeed without a /usr directory at all.  These directories eventually
> get created when packages install there, but at skeleton installation time,
> the following command fails if /usr does not yet exist:
> 
> ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
> 
> So, in the spirit of ensuring that directories exist before installing there,
> ensure that at least /usr exists to avoid the above failure.  While doing
> so, lets ensure that /usr/{lib,bin,sbin} exist too, to be thematically
> consistent with SKELETON_USR_SYMLINKS_OR_DIRS.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

NAK. Our stance is that, when using a custom skeleton, the user is
responsible for providing a correct skeleton. For example, we check
for the merged-usr consistency on lines 36-57, so this means that bin
sbin and lib should already exist.

So, instead of crating those directories, we should check they do exist.

Just for your information, I've been working on a series that reworks
our handling of skeletons:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton
and the pending rewrite to accomodate for requested changes:
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton-2

In this series (which was basically approved on the principles), the
custom skeleton is now checking that those dirs exists:
    https://git.buildroot.org/~ymorin/git/buildroot/tree/package/skeleton-custom/skeleton-custom.mk?h=yem/systemd-skeleton&id=5a9b164a32e888b713d9aad911313c27fbb5052f

Regards,
Yann E. MORIN.

> ---
>  package/skeleton/skeleton.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 1000161..4b661fe 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -91,6 +91,9 @@ define SKELETON_INSTALL_TARGET_CMDS
>  	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
>  		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  		$(SKELETON_PATH)/ $(TARGET_DIR)/
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/bin
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/sbin
>  	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
>  	ln -snf lib $(TARGET_DIR)/$(SKELETON_LIB_SYMLINK)
>  	ln -snf lib $(TARGET_DIR)/usr/$(SKELETON_LIB_SYMLINK)
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
