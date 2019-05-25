From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 May 2019 17:24:15 +0200
Subject: [Buildroot] [PATCH] linux: enable UEVENT_HELPER when mdev is
 used
In-Reply-To: <20190525130755.25678-1-peter@korsgaard.com>
References: <20190525130755.25678-1-peter@korsgaard.com>
Message-ID: <54a85c9f-1e14-de0d-c6cf-8201dea50e1d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/05/2019 15:07, Peter Korsgaard wrote:
> S10mdev uses /proc/sys/kernel/hotplug, which is only available if
> CONFIG_UEVENT_HELPER is enabled in the kernel, so ensure it is.

 So, I take a look at it, and it's a little bit more complicated...

 Busybox *does* have support for the "new" netlink-based uevent interface, but
that interface needs a daemon that keeps running and they separated that daemon
into a separate process, called uevent. So, in the "new" way, you should do
something like (not tried, just based on source code):

start-stop-daemon -S -b -x /sbin/uevent -- mdev

 But of course, that means that we have to be sure that the uevent executable is
in fact built for busybox. So we'd need to extend BUSYBOX_SET_MDEV to enable uevent.

 Also, we can only use the uevent approach if netlink uevents are available.
They exist since 2.6.12, so I guess on that side we're safe. However, they also
depend on CONFIG_NET (because netlink does).

 So, these are our options:

1. Bloat the kernel with legacy uevent helper support (this patch).

2. Bloat the kernel with networking even if it is not used for anything else,
and bloat busybox with uevent (3.1 kb), and always use uevent.

3. Use uevent in the init script but don't enforce anything (with potential
silent failures), and explain stuff in the mdev help text.

4. Try out all possibilities in the init script - which still fails silently in
case neither CONFIG_UEVENT_HELPER nor CONFIG_NET is enabled in the kernel.


 In my opinion, we definitely should *not* go for option 1. I don't want to be
the one that forces the kernel to maintain legacy stuff. I would definitely use
uevent. On the other hand, I really don't like it when we force changes into
busybox or kernel configs. Since it's really likely that CONFIG_NET is enabled
in the kernel, and since our default busybox config (but not the minimal one)
does enable uevent, I think that option 3 is the way to go.


 By the way, with netlink, the event are properly serialized, and uevent makes
sure that only one mdev subprocess is created so it maintains the serialisation.
So, it is no longer needed to create /dev/mdev.seq (which, for some reason, we
currently don't do...).

 Regards,
 Arnout


> 
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  linux/linux.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index dd182d06b2..3a5eee63df 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -333,6 +333,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
>  	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
> +	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_UEVENT_HELPER,$(@D)/.config))
>  	$(if $(BR2_PACKAGE_AUDIT),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_NET,$(@D)/.config)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config))
> 
