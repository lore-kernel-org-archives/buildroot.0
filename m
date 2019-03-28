From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:48:57 +0100
Subject: [Buildroot] [PATCH v2] package/nfs-utils: making nfs server
 optional
In-Reply-To: <1553781189-15924-1-git-send-email-angelo@amarulasolutions.com>
References: <1553781189-15924-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20190328174857.7c1d188e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Thu, 28 Mar 2019 14:53:09 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> +ifeq ($(BR2_PACKAGE_NFS_UTILS_SERVER),y)
>  define NFS_UTILS_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
>  		$(TARGET_DIR)/etc/init.d/S60nfs
> @@ -95,6 +96,7 @@ define NFS_UTILS_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 0644 package/nfs-utils/nfs-utils_tmpfiles.conf \
>  		$(TARGET_DIR)/usr/lib/tmpfiles.d/nfs-utils.conf
>  endef
> +endif

This is only removing the installation of the init script/systemd unit
files, not really disabling the server.

Shouldn't we do like BR2_PACKAGE_NFS_UTILS_RPCDEBUG,
BR2_PACKAGE_NFS_UTILS_RPC_LOCKD and BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD
are doing, and also remove the unnecessary programs ?

Another question is: the systemd stuff installs a nfs-client.service
unit file, and you're no longer installing this. It's named
nfs-client... so it seems to be needed even when you are just a client.

In fact, I think *some* of the daemons are needed even when you are
just a client. See what nfs-client.service is doing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
