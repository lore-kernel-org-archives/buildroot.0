From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:28:01 +0100
Subject: [Buildroot] [PATCHv3 16/74] nfs-utils: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-17-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-17-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130152801.GU4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Also move back the NFS_UTILS_INSTALL_FIXUP hook registration right
> after the hook definition.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/nfs-utils/nfs-utils.mk | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 522e790..aef051c 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -35,17 +35,20 @@ NFS_UTILS_CONF_OPTS += --disable-tirpc
>  endif
>  
>  define NFS_UTILS_INSTALL_FIXUP
> +	rm -f $(NFS_UTILS_TARGETS_)
> +endef
> +
> +NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
> +
> +define NFS_UTILS_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 0755 package/nfs-utils/S60nfs \

Missing -D option.

Regards,
Yann E. MORIN.

>  		$(TARGET_DIR)/etc/init.d/S60nfs
> -	rm -f $(NFS_UTILS_TARGETS_)
>  endef
>  
>  define NFS_UTILS_REMOVE_NFSIOSTAT
>  	rm -f $(TARGET_DIR)/usr/sbin/nfsiostat
>  endef
>  
> -NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
> -
>  # nfsiostat is interpreted python, so remove it unless it's in the target
>  NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON),,NFS_UTILS_REMOVE_NFSIOSTAT)
>  
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
