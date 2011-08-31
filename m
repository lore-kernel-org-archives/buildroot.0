From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 10:19:35 +0200
Subject: [Buildroot] [PATCH v2 2/2] syslinux: add support for
 host-install
In-Reply-To: <1314770813-12307-2-git-send-email-arnout@mind.be>
References: <1314770813-12307-1-git-send-email-arnout@mind.be>
 <1314770813-12307-2-git-send-email-arnout@mind.be>
Message-ID: <20110831101935.03bda653@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 31 Aug 2011 08:06:53 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  boot/syslinux/syslinux.mk |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
> 
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index 118807a..2b4b5c0 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -34,4 +34,19 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
>  	done
>  endef
>  
> +
> +HOST_SYSLINUX_POST_EXTRACT_HOOKS += SYSLINUX_RM_MK_LBA_IMG
> +
> +define HOST_SYSLINUX_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define HOST_SYSLINUX_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR)
> install +endef
> +
> +define HOST_SYSLINUX_CLEAN_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean
> +endef
> +
>  $(eval $(call GENTARGETS,boot,syslinux))

You don't have the $(eval $(call GENTARGETS,boot,syslinux,host)) line
anymore, so the HOST_* variables are quite useless no ? This line was
present in your previous posting.

Also can you comment how this host package is used ? It isn't part of
the dependencies of any target package, so it doesn't seem to be used
anywhere (except by manually running "make host-syslinux").

Not related to your patches directly, but could you elaborate a bit on
how syslinux is used in practice by giving an example usage. This would
explain a bit why a host version is needed, how to set up syslinux on
the target, etc.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
