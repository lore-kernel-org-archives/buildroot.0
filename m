From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Nov 2013 00:53:29 +0100
Subject: [Buildroot] [PATCH v3 0/5] udev is now provided by systemd or
 eudev
In-Reply-To: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20131114005329.3eb8ab04@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Wed,  6 Nov 2013 16:34:33 +0100, Eric Le Bihan wrote:

> This series converts udev to a virtual package, either provided by systemd or
> eudev.
> 
> Starting with version 183, udev has been merged into systemd. This forces the
> use of systemd as the init system if /dev is to be dynamically managed by
> udev. eudev is a fork of udev, maintained by Gentoo, but isolated from
> systemd, so it can be used with any init system.
> 
> Systemd has been bumped to v207 and a new eudev package has been added.
> Version 1.3 of eudev is in sync with systemd v207.
> 
> The bump of systemd to v207 also introduces new options, like the activation
> of the journal gateway.

I've tested this patch series. I managed to get the eudev part working
without any problem.

However, while your demo defconfig work fine, I was not able to get
a working configuration started from scratch. I.e, I have the following
Buildroot configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"

and I boot it with the same kernel image that I used to boot the eudev
example (under the ARM Versatile Qemu emulation). The kernel has
cgroup support. But the boot hangs at:

Freeing unused kernel memory: 120K (c0399000 - c03b7000)
systemd[1]: Failed to mount /dev/shm: Invalid argument

Also, I've noted that kconfig complains about a dependency problem
after applying your patch set:

warning: (BR2_PACKAGE_SYSTEMD && BR2_PACKAGE_MODULE_INIT_TOOLS) selects
BR2_PACKAGE_KMOD_TOOLS which has unmet direct dependencies
(BR2_PACKAGE_KMOD && BR2_PACKAGE_BUSYBOX_SHOW_OTHERS)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
