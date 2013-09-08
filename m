From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 8 Sep 2013 13:36:33 -0400
Subject: [Buildroot] [PATCH] Makefile: make skeleton rsync options
	consistent
In-Reply-To: <1367464526-3028-1-git-send-email-danomimanchego123@gmail.com>
References: <1367464526-3028-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CANxTyt5hY7vb-E=7+ivs+Wp3+dDsUmytZzjK54wNAz_B2GKhrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping?

The patch still applies, with no fuzz but some shifted lines. The
problem described
still exists, and is still fixed by the patch.

Danomi -


On Wed, May 1, 2013 at 11:15 PM, Danomi Manchego <
danomimanchego123@gmail.com> wrote:

> Initially, a "cp" was used for the one-time target skeleton
> installation, and an "rsync" was used for the every-time overlay
> skeleton installations.  Then, the target skeleton install was
> changed to also use rsync (1cd3f992fb3659aacbb0cdd3ed64347a37569891).
> Now there are two rsyncs, but with different filter specs, which
> seems odd.
>
> This patch adds --excludes to both invocations of rsync to make them
> consistent, and removes the -u option from the initial target skeleton
> installation.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  Makefile |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 97804ff..5b690f0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -429,7 +429,9 @@ endif
>
>  $(BUILD_DIR)/.root:
>         mkdir -p $(TARGET_DIR)
> -       rsync -au --exclude=.empty --exclude=CVS --exclude=.svn
> --exclude='*~' \
> +       rsync -a \
> +               --exclude .empty --exclude .svn --exclude .git \
> +               --exclude .hg --exclude=CVS --exclude '*~' \
>                 $(TARGET_SKELETON)/ $(TARGET_DIR)/
>         cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
>         touch $@
> @@ -505,7 +507,7 @@ endif
>                 $(call MESSAGE,"Copying overlay $(d)"); \
>                 rsync -a \
>                         --exclude .empty --exclude .svn --exclude .git \
> -                       --exclude .hg --exclude '*~' \
> +                       --exclude .hg --exclude=CVS --exclude '*~' \
>                         $(d)/ $(TARGET_DIR)$(sep))
>
>         @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
> --
> 1.7.9.5
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130908/cbe8659b/attachment.html>
