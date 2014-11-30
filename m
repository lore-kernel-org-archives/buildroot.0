From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:09:40 +0100
Subject: [Buildroot] [PATCHv3 13/74] samba: use <pkg>_INSTALL_INIT_SYSV
 mechanism
In-Reply-To: <1417357142-14307-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130150940.GR4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Also makes the installation of the init script unconditional.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/samba/samba.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/samba/samba.mk b/package/samba/samba.mk
> index ec8e6ec..92bbe4e 100644
> --- a/package/samba/samba.mk
> +++ b/package/samba/samba.mk
> @@ -176,17 +176,17 @@ ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
>  SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
>  endif
>  
> -define SAMBA_INSTALL_INITSCRIPTS_CONFIG
> -	# install start/stop script
> -	@if [ ! -f $(TARGET_DIR)/etc/init.d/S91smb ]; then \
> -		$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb; \
> -	fi
> +define SAMBA_INSTALL_CONFIG
>  	# install config
>  	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
>  		$(INSTALL) -m 0644 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
>  	fi

OK, I won't repeat it ad-infinitum, so here it is for the last time:
don't we want to remove the check for the existing target, and just
always do the installation, to delegate the customisation to a
post-build script or a rootfs-overlay?

Of course, that can/should be part of a separate patch.

Promised, that's the last time I write this comment in this series! ;-p

>  endef
>  
> -SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_INITSCRIPTS_CONFIG
> +SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_CONFIG
> +
> +define SAMBA_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb
> +endef

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
