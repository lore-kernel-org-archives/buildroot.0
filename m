From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jun 2014 14:43:08 +0200
Subject: [Buildroot] [PATCH 1/1] rpcbind : add startup script
In-Reply-To: <1402832300-17147-1-git-send-email-sagaert.johan@skynet.be>
References: <1402832300-17147-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140615144308.6763b930@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 15 Jun 2014 13:38:20 +0200, Sagaert Johan wrote:
> rpcbind must be started at boot time.
> Without this any nfs mount will fail.
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

Thanks!

> diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
> index 19bdace..6a946f9 100644
> --- a/package/rpcbind/rpcbind.mk
> +++ b/package/rpcbind/rpcbind.mk
> @@ -15,4 +15,12 @@ RPCBIND_CONF_ENV += \
>  	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
>  RPCBIND_DEPENDENCIES += libtirpc
>  
> +define RPCBIND_INSTALL_STARTUP_SCRIPT
> +	[ -f $(TARGET_DIR)/etc/init.d/S30rpcbind ] || \
> +		$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
> +			$(TARGET_DIR)/etc/init.d/S30rpcbind
> +endef
> +
> +RPCBIND_POST_INSTALL_TARGET_HOOKS += RPCBIND_INSTALL_STARTUP_SCRIPT

This should instead be using the <pkg>_INIT_SYSV mechanism, see the
Buildroot manual.

Also, since you said portmap and rpcbind cannot be used simultaneously,
I think it would be good to reflect this in the dependencies. So, in a
separate patch, adding a "depends on !BR2_PACKAGE_RPCBIND" in portmap
would probably be good to have.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
