From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Jun 2010 21:43:10 +0200
Subject: [Buildroot] [PATCH 08/10] linux: adjust kernel config according
	to the Buildroot configuration
In-Reply-To: <655e8a3a75bc2f73712ebabca64e83805dd8b87d.1276454802.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 13 Jun 2010 20:50:12 +0200")
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<655e8a3a75bc2f73712ebabca64e83805dd8b87d.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87y6ec9lf5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We only adjust the configuration or ARM EABI and IPv6. The (more

s/or/of/.

 Thomas> complicated) initramfs case is handled in a separate commit. The user
 Thomas> is expected to take care of all other configuration details (like
 Thomas> having Netfilter enabled to make iptables work, etc.)

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  linux/linux.mk |   12 ++++++++++++
 Thomas>  1 files changed, 12 insertions(+), 0 deletions(-)

 Thomas> diff --git a/linux/linux.mk b/linux/linux.mk
 Thomas> index d3a583e..4cdc304 100644
 Thomas> --- a/linux/linux.mk
 Thomas> +++ b/linux/linux.mk
 Thomas> @@ -90,6 +90,18 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM),y)
 Thomas>  	cp $(BR2_LINUX_KERNEL_CUSTOM_FILE) $(@D)/.config
 Thomas>  	yes "" | $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
 Thomas>  endif
 Thomas> +ifeq ($(BR2_ARM_EABI),y)
 Thomas> +	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config)
 Thomas> +	$(call KCONFIG_DISABLE_OPT,CONFIG_OABI_COMPAT,$(@D)/.config)
 Thomas> +else
 Thomas> +	$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config)

I'm not sure I like this hardcoded policy. What if the user wants to run
some precompiled OABI binaries together with his EABI rootfs?


 Thomas> +endif
 Thomas> +ifeq ($(BR2_INET_IPV6),y)
 Thomas> +	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6,$(@D)/.config)
 Thomas> +else
 Thomas> +	$(call KCONFIG_DISABLE_OPT,CONFIG_IPV6,$(@D)/.config)
 Thomas> +endif
 Thomas> +	yes "" | $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig 2>&1 >/dev/null

The yes shouldn't be needed, and I don't like hiding errors.

-- 
Bye, Peter Korsgaard
