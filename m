From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 15:11:57 +0200
Subject: [Buildroot] [PATCH 06/20] system: move setting getty to the
 corresponding init systems
In-Reply-To: <f00f1e7daced126edc573f652b97e9228b347615.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <f00f1e7daced126edc573f652b97e9228b347615.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <f248e93e-1454-009c-29c5-000c04ef2221@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> Currently, setting the getty is done:
>   - by the skeleton package when the init system is either busybox or
>     sysvinit;
>   - by the systemd package when the init system is systemd;
> both by registering a target-finalize hook.
> 
> This is not very consistent.
> 
> Move setting the getty out of the skeleton and into the package that
> provides the init system, by registering a per-package target-fialize
                                                                finalize
> hook.
> 
> This offloads yet a bit more out of the skeleton, so that it is easier
> to properly separate the skeletons for the various init systems.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> +define BUSYBOX_SET_GETTY
> +	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(SYSTEM_GETTY_PORT)::respawn:/sbin/getty -L $(SYSTEM_GETTY_OPTIONS) $(SYSTEM_GETTY_PORT) $(SYSTEM_GETTY_BAUDRATE) $(SYSTEM_GETTY_TERM) #~' \
> +		$(TARGET_DIR)/etc/inittab
> +endef
[snip]
> +define SYSVINIT_SET_GETTY
> +	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(SYSTEM_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(SYSTEM_GETTY_OPTIONS) $(SYSTEM_GETTY_PORT) $(SYSTEM_GETTY_BAUDRATE) $(SYSTEM_GETTY_TERM) #~' \
> +		$(TARGET_DIR)/etc/inittab
> +endef

 The only difference between these two is that for sysvinit we have to make sure
it's only 4 characters. But it actually doesn't hurt to do the same for busybox
as well. So perhaps we can factor the two in a single SYSTEM_SET_GETTY ?

[snip]
> +SYSTEM_GETTY_PORT = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
> +SYSTEM_GETTY_BAUDRATE = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
> +SYSTEM_GETTY_TERM = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
> +SYSTEM_GETTY_OPTIONS = $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_OPTIONS))

 Perhaps systemd.mk should also start making use of these?

 Both of these are of course separate patches.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
