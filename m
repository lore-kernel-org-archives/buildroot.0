From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jan 2014 06:23:44 +0800
Subject: [Buildroot] [git commit] udev: mention dependancy on inotify
In-Reply-To: <20140107203417.C734D9BEF5@busybox.osuosl.org>
References: <20140107203417.C734D9BEF5@busybox.osuosl.org>
Message-ID: <20140108062344.362a979d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 7 Jan 2014 21:33:34 +0100, Peter Korsgaard wrote:

> -	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
> +	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
> +	  and inotify.

Then, maybe we need something like:

diff --git a/linux/linux.mk b/linux/linux.mk
index fa8aa0c..ab25fe9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -185,6 +185,8 @@ define LINUX_CONFIGURE_CMDS
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
        $(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
                $(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
+       $(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
+               $(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
        $(if $(BR2_PACKAGE_KTAP),
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
