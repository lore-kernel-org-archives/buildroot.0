From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Tue, 31 Jul 2012 17:24:27 +0800
Subject: [Buildroot] [PATCH] linux: enable ubi and ubifs if we build a
 ubifs root filesystem
In-Reply-To: <1343721051-8380-1-git-send-email-fabio.porcedda@gmail.com>
References: <1343721051-8380-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAEvN+1hTzsgFn_QiNsm4dHmdy5Wd1N9KsbYpwPkkpwtBfgnahA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 31, 2012 at 3:50 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  linux/linux.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index ca216a3..cf43818 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -166,6 +166,9 @@ define LINUX_CONFIGURE_CMDS
>                 $(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
>         $(if $(BR2_PACKAGE_SYSTEMD),
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
> +       $(if $(BR2_TARGET_ROOTFS_UBIFS),
> +               $(call KCONFIG_ENABLE_OPT,CONFIG_MTD_UBI,$(@D)/.config)
> +               $(call KCONFIG_ENABLE_OPT,CONFIG_UBIFS_FS,$(@D)/.config))
>         yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
>  endef
>

I'm a little bit concerning about post modifications to kernel configs
during the build process (not only this patch).
It may not be so explicit that the kernel was "changed" when the users
were only peaking and poking the root file system.

Since the Kernel may only be tested and released with certain configurations.
It will be helpful if customer feedback on errors could include what
they did explicitly as possible.

Would it be better to issue warnings or even fail-stop the building
process after sanity checks?
If users really need to change the kernel configuration, make sure
they are aware of their changes. :)

Thanks,
Roy
