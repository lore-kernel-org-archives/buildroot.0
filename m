From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 23:31:39 +0200
Subject: [Buildroot] [PATCH] package/libselinux: fix the selinuxfs mount
 point
In-Reply-To: <20201006154430.792940-1-antoine.tenart@bootlin.com>
References: <20201006154430.792940-1-antoine.tenart@bootlin.com>
Message-ID: <20201006213139.GX11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine, All,

On 2020-10-06 17:44 +0200, Antoine Tenart spake thusly:
> For 9 years the recommended mount point for selinuxfs has been
> /sys/fs/selinux, as stated in Linux kernel commit 7a627e3b9a2b:
> 
> """
> For selinuxfs, this mount point should be in /sys/fs/selinux/
> """
> 
> As other projects follow this convention, not doing so result in
> potential issues. One of them is the refpolicy not correctly labelling
> and supporting the mount point.
> 
> Fix this by using /sys/fs/selinux as of now in Buildroot.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libselinux/libselinux.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index c96b5a443109..8087af539af0 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -70,10 +70,8 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) \
>  		$(LIBSELINUX_MAKE_INSTALL_TARGETS)
> -	# Create the selinuxfs mount point
> -	if [ ! -d "$(TARGET_DIR)/selinux" ]; then mkdir $(TARGET_DIR)/selinux; fi
>  	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
> -		echo "none /selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
> +		echo "none /sys/fs/selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
>  endef
>  
>  HOST_LIBSELINUX_DEPENDENCIES = \
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
