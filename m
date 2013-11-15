From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 15 Nov 2013 20:54:34 +0100
Subject: [Buildroot] [PATCH v3 0/5] udev is now provided by systemd or
 eudev
In-Reply-To: <20131114005329.3eb8ab04@skate>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20131114005329.3eb8ab04@skate>
Message-ID: <52867BFA.3080808@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le 14/11/2013 00:53, Thomas Petazzoni a ?crit :

> However, while your demo defconfig work fine, I was not able to get
> a working configuration started from scratch. I.e, I have the following
> Buildroot configuration:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_SYSTEMD=y
> BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> 
> and I boot it with the same kernel image that I used to boot the eudev
> example (under the ARM Versatile Qemu emulation). The kernel has
> cgroup support. But the boot hangs at:
> 
> Freeing unused kernel memory: 120K (c0399000 - c03b7000)
> systemd[1]: Failed to mount /dev/shm: Invalid argument

This problem occurs because tmpfs support is not enabled in your kernel
configuration. Setting CONFIG_TMPFS and CONFIG_TMPFS_POSIX_ACL will
solve this issue. I will add these kernel requirements in the help menu
of Systemd.

> Also, I've noted that kconfig complains about a dependency problem
> after applying your patch set:
> 
> warning: (BR2_PACKAGE_SYSTEMD && BR2_PACKAGE_MODULE_INIT_TOOLS) selects
> BR2_PACKAGE_KMOD_TOOLS which has unmet direct dependencies
> (BR2_PACKAGE_KMOD && BR2_PACKAGE_BUSYBOX_SHOW_OTHERS)

Thanks for noticing! As module-init-tools has been deprecated in favor
of kmod, the tools lsmod, modprobe and friends are now symlinks to kmod.
Systemd directly invokes kmod, so it can not be used with the ones
provided by Busybox.
I will had a 'select BR2_PACKAGE_BUSYBOX_SHOW_OTHER' in the Config.in of
Systemd.

Best regards,
ELB
