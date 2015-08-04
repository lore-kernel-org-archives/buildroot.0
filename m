From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 14:45:56 +0200
Subject: [Buildroot] [PATCH 2/2] i2c-tools: Adds check of i2c kernel
 option
In-Reply-To: <1438691227-23379-3-git-send-email-denis.thulin@openwide.fr>
References: <1438691227-23379-1-git-send-email-denis.thulin@openwide.fr>
 <1438691227-23379-3-git-send-email-denis.thulin@openwide.fr>
Message-ID: <20150804144556.58dd8978@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Aug 2015 14:27:07 +0200, Denis THULIN wrote:

> +I2C_TOOLS_DEPENDENCIES += linux

This is not acceptable: we want to allow people to build just a rootfs,
and not necessarily the Linux kernel with Buildroot. I personally use
Buildroot a lot to build a small initramfs that I then bundle in my
kernel image, which is built separately from Buildroot (because I'm
doing kernel development, so I build the kernel myself).

Also, this is going completely backwards compared to what we've been
doing until now. Currently, in linux/linux.mk, we have some logic to
make sure a number of kernel options are enabled when certain Buildroot
packages are enabled:

        $(if $(BR2_PACKAGE_KTAP),
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
        $(if $(BR2_PACKAGE_SYSTEMD),
                $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_XATTR,$(@D)/.config))
        $(if $(BR2_PACKAGE_SMACK),
                $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK,$(@D)/.config))
        $(if $(BR2_PACKAGE_IPTABLES),
                $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES,$(@D)/.config))

However, we generally do this only when enabling the kernel option in
question is needed to get the package to *build*. When it is necessary
to make the thing run properly, or when the dependency is really
obvious, we simply don't handle this.

So for example in your case, it is completely obvious that i2c-tools
needs I2C support in the kernel, otherwise it's a tool that is quite
useless.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
