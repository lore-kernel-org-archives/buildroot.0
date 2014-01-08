From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 8 Jan 2014 09:13:25 -0500
Subject: [Buildroot] [PATCH] force devtmpfs and inotify kernel option
 when udev is used as dev handler
In-Reply-To: <1389188913-15173-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1389188913-15173-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <CANxTyt7ihvMb8NCwuNUbfvFXVsfC8M1KQA851zG5TpsLX3j-7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my,

On Wed, Jan 8, 2014 at 8:48 AM, J?r?my Rosen <jeremy.rosen@openwide.fr> wrote:
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
>
> ---
> patch suggested by Thomas Petazzoni
>
> I also added devtmpfs because it's documented as needed but wasn't enforced
> ---
>  linux/linux.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index fa8aa0c..2482952 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -185,6 +185,10 @@ define LINUX_CONFIGURE_CMDS
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
>         $(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
>                 $(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
> +       $(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
> +                $(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)

The above INOTIFY line has an extra leading space compared with the other lines.

Danomi -

> +               $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
> +               $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
>         $(if $(BR2_PACKAGE_KTAP),
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
> --
> 1.8.5.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
