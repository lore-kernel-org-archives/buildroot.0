From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 28 Apr 2019 00:03:02 +0200
Subject: [Buildroot] [PATCH v3] package/nfs-utils: making nfs server
 optional
In-Reply-To: <1556098414-13394-1-git-send-email-angelo@amarulasolutions.com>
References: <1556098414-13394-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <a0036d1a-538a-55dc-ce35-e5812305dada@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Angelo,

On 24/04/2019 11:33, Angelo Compagnucci wrote:
> This patch makes nfs server component optional. This is useful when
> only client tools are used and the full nfs server is not needed.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> v1->v2: Fixing minor formatting nitpick.
> v2->v3: fixing systemd stuff as suggested by Thomas
> 
>  package/nfs-utils/Config.in    |  6 ++++++
>  package/nfs-utils/nfs-utils.mk | 10 ++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
> index 055b711..04ea4db 100644
> --- a/package/nfs-utils/Config.in
> +++ b/package/nfs-utils/Config.in
> @@ -25,6 +25,12 @@ config BR2_PACKAGE_NFS_UTILS_RPC_LOCKD
>  	help
>  	  NFS lock manager for Linux kernels older than 2.4
>  
> +config BR2_PACKAGE_NFS_UTILS_RPC_NFSD
> +	bool "rpc.nfsd"
> +	default y
> +	help
> +	  NFS server
> +
>  config BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD
>  	bool "rpc.rquotad"
>  	help
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 9fa7ae2..188d7f4 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -41,6 +41,8 @@ HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
>  NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
>  NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
>  NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
> +NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
> +	usr/sbin/rpc.mountd usr/sbin/rpc.nfsd usr/lib/systemd/system/nfs-server.service
>  
>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  NFS_UTILS_CONF_OPTS += --enable-caps
> @@ -57,7 +59,7 @@ NFS_UTILS_CONF_OPTS += --disable-tirpc
>  endif
>  
>  define NFS_UTILS_INSTALL_FIXUP
> -	rm -f $(NFS_UTILS_TARGETS_)
> +	cd $(TARGET_DIR) && rm -f $(NFS_UTILS_TARGETS_)

 This looks like it's a fix that is independent of the rest and should be
backported to the 2019.02 branch. So separate patch, please.

>  	touch $(TARGET_DIR)/etc/exports
>  	$(INSTALL) -D -m 644 \
>  		$(@D)/utils/mount/nfsmount.conf $(TARGET_DIR)/etc/nfsmount.conf
> @@ -71,16 +73,20 @@ else
>  NFS_UTILS_CONF_OPTS += --without-systemd
>  endif
>  
> +ifeq ($(BR2_PACKAGE_NFS_UTILS_RPC_NFSD),y)
>  define NFS_UTILS_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
>  		$(TARGET_DIR)/etc/init.d/S60nfs
>  endef
> +endif
>  
>  define NFS_UTILS_INSTALL_INIT_SYSTEMD
>  	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>  
> +	$(if $(BR2_PACKAGE_NFS_UTILS_RPC_NFSD), \
>  	ln -fs ../../../../usr/lib/systemd/system/nfs-server.service \
> -		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-server.service
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-server.service,)
> +
>  	ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-client.target


 Instead of this $(if ...) construct which we (almost) don't use anywhere else,
it's better and easier to read like this:

ifeq ($(BR2_PACKAGE_NFS_UTILS_RPC_NFSD),y)
define NFS_UTILS_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
		$(TARGET_DIR)/etc/init.d/S60nfs
endef

define NFS_UTILS_INSTALL_INIT_SYSTEMD_NFSD
	ln -fs ../../../../usr/lib/systemd/system/nfs-server.service \
		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-server.service
endef
endif

define NFS_UTILS_INSTALL_INIT_SYSTEMD
	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants

	$(NFS_UTILS_INSTALL_INIT_SYSTEMD_NFSD)
	ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-client.target
...


 Regards,
 Arnout
