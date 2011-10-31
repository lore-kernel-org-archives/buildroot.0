From: Will Moore <will.moore@beraninstruments.com>
Date: Mon, 31 Oct 2011 11:15:19 -0000
Subject: [Buildroot] [PATCH] syslinux: add support for host-install
In-Reply-To: <1319668075-20291-1-git-send-email-arnout@mind.be>
References: <85632AA8828446C5B830EBF9A14700E5@beraninstruments.com.local>
 <1319668075-20291-1-git-send-email-arnout@mind.be>
Message-ID: <477964B20A0A4C19B09BADE9B337ACC6@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

> -----Original Message-----
> From: Arnout Vandecappelle (Essensium/Mind) [mailto:arnout at mind.be]
> Sent: 26 October 2011 23:28
> To: buildroot at busybox.net
> 
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Hoi Will,
> 
>  This patch (applied to the current HEAD) builds syslinux for the host.
> 
>  What is still missing from this is a way to have a Windows self-installer.
> I've got a patch cooking for that too, but it's a hack: it copies the
> precompiled syslinux.exe binary from the extracted tar file.
> 
>  Regards,
>  Arnout
> ---
>  boot/syslinux/syslinux.mk |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
> 
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index fa5af07..66a7076 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -26,4 +26,20 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
>  	done
>  endef
> 
> +
> +HOST_SYSLINUX_POST_EXTRACT_HOOKS += SYSLINUX_RM_MK_LBA_IMG

What have you got defined for SYSLINUX_RM_MK_LBA_IMG?

> +
> +define HOST_SYSLINUX_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)

As per syslinux /doc/distrib.txt:

$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean
$(HOST_MAKE_ENV) $(MAKE) -C $(@D) installer

> +endef
> +
> +define HOST_SYSLINUX_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
> +endef
> +
> +define HOST_SYSLINUX_CLEAN_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean
> +endef
> +
>  $(eval $(call GENTARGETS))
> +$(eval $(call GENTARGETS,host))
> --
> 1.7.7
