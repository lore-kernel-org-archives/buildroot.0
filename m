From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 19:06:50 +0100
Subject: [Buildroot] [PATCHv3 67/74] ifplugd: install configuration
 files unconditionally
In-Reply-To: <1417357142-14307-68-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-68-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130180650.GW4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> As discussed, users should use a rootfs overlay or a post-build script
> instead of a custom skeleton to override files installed by Buildroot,
> so there is no point in having conditions when installing init scripts
> or configuration files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see a comment, below...

> ---
>  package/ifplugd/ifplugd.mk | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
> index 3d0736a..b24c79d 100644
> --- a/package/ifplugd/ifplugd.mk
> +++ b/package/ifplugd/ifplugd.mk
> @@ -21,14 +21,10 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  endif
>  
>  define IFPLUGD_INSTALL_FIXUP
> -	if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.conf ]; then \
> -		$(INSTALL) -D $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
> -		$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
> -	fi
> -	if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.action ]; then \
> -		$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
> -			$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
> -	fi
> +	$(INSTALL) -D $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \

Maybe it would be nice to enforce -m 644 on that file, no?

Regards,
Yann E. MORIN.

> +	$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
> +	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
> +		$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
>  endef
>  
>  IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
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
