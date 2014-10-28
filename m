From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 19:02:36 +0100
Subject: [Buildroot] [PATCH 2/3] iptables: enable basic kernel options
In-Reply-To: <1413925852-12765-2-git-send-email-gustavo@zacarias.com.ar>
References: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
 <1413925852-12765-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141028190236.7b8ed9be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, Peter,

On Tue, 21 Oct 2014 18:10:51 -0300, Gustavo Zacarias wrote:
> Enable the basic kernel options for iptables to be useful at least to
> filter incoming connections.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  linux/linux.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 2b862ec..b9d3c8e 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -210,6 +210,11 @@ define LINUX_CONFIGURE_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK,$(@D)/.config)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK,$(@D)/.config))
> +	$(if $(BR2_PACKAGE_IPTABLES),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES,$(@D)/.config))
>  	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
>  	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig

For this one, I don't know. Back some time ago, Peter said that his
preference was to not enforce too much stuff in terms of kernel
configuration options in linux/linux.mk. I think the idea is that it's
something that can quickly become very complicated if you want to
handle all the kernel config options that all packages might need. It's
also being forced without the user being capable of doing anything
against that: those KCONFIG_ENABLE_OPT calls are done even if the user
passes a custom configuration file.

But back at the time, we only had the CONFIG_AEABI option being
handled. Now it's true we already have ktap, systemd, smack being
handled, and many other things related to appended DTB, initramfs, and
more. So it seems like the iptables/xtables-addons proposal from
Gustavo are not really creating a precedent.

Peter, what is your position on this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
