From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Feb 2012 00:12:00 +0100
Subject: [Buildroot] [PATCH 2/5] Rework of the init system
In-Reply-To: <1328279247-7277-3-git-send-email-maxime.ripard@free-electrons.com>
References: <1328279247-7277-1-git-send-email-maxime.ripard@free-electrons.com>
 <1328279247-7277-3-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <201202100012.00343.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 03 February 2012 15:27:24 Maxime Ripard wrote:
> Since we have now two uncompatible init systems, and we want only one of
> them at the same time in use in the rootfs, we need to select a
> particular init system. This patch also adds $(PKG)_INSTALL_INIT_SYSTEMD
> and $(PKG)_INSTALL_INIT_SYSV hooks that are called when the matching
> init systems are selected to install properly the init scripts of the
> package.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> +	$(if $(BR2_INIT_SYSTEMD),\
> +		$($(PKG)_INSTALL_INIT_SYSTEMD))
> +	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
> +		$($(PKG)_INSTALL_INIT_SYSV))

 I'm not sure if it really is an improvement, but you replace this with
$($(PKG)_INSTALL_INIT_$(INIT_SYSTEM))

where
INIT_SYSTEM = $(call qstrip,$(BR2_INIT_SYSTEM))

and in target/generic/Config.in
config BR2_INIT_SYSTEM
	string
	default "SYSTEMD" if BR2_INIT_SYSTEMD
	default "SYSV" if BR2_INIT_SYSV || BR2_INIT_BUSYBOX

 It doesn't simplify this patch much, but it may help if other things
depend on the init system in the future.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
