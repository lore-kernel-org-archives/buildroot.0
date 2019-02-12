From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Feb 2019 11:33:12 +0100
Subject: [Buildroot] [PATCH 2/2] package/nfs-utils: enable support of
 NFSv4
In-Reply-To: <20190206160601.6360-2-kostap@marvell.com>
References: <20190206160601.6360-1-kostap@marvell.com>
 <20190206160601.6360-2-kostap@marvell.com>
Message-ID: <20190212113312.214211f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kostya,

Thanks for this work, very useful to have this.

On Wed, 6 Feb 2019 18:06:01 +0200
<kostap@marvell.com> wrote:

> From: Konstantin Porotchkin <kostap@marvell.com>
> 
> Taken from git at github.com:openstack/manila-test-image.git
> /patches/nfs-utils-enable-nfsv4.patch

Nice, I didn't know Openstack was using Buildroot for some stuff.

> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
> index 055b711f0d..08c0f4caae 100644
> --- a/package/nfs-utils/Config.in
> +++ b/package/nfs-utils/Config.in
> @@ -30,4 +30,14 @@ config BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD
>  	help
>  	  NFS remote quota server
>  
> +config BR2_PACKAGE_NFS_UTILS_NFS4
> +	bool "NFSv4 support"
> +	select BR2_PACKAGE_LIBEVENT
> +	select BR2_PACKAGE_LIBNFSIDMAP
> +	help
> +	  Enable support for NFSv4.
> +
> +comment "nfs-utils requires a toolchain with RPC and LARGEFILE support"
> +	depends on !BR2_INET_RPC || !BR2_LARGEFILE

Why are you adding this comment ? nfs-utils already has the appropriate
comment. Furthermore, neither BR2_INET_RPC nor BR2_LARGEFILE exist in
Buildroot nowadays.

> diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
> index 4183ff6268..bec7307653 100755
> --- a/package/nfs-utils/S60nfs
> +++ b/package/nfs-utils/S60nfs
> @@ -3,6 +3,8 @@
>  # nfs           This shell script takes care of starting and stopping
>  #               the NFS services. Stolen from RedHat FC5.
>  
> +ENABLEv4=yes

This seems weird. Why is it unconditional ? I guess it won't work if
BR2_PACKAGE_NFS_UTILS_NFS4 is disabled. Perhaps put this
in /etc/default/nfsd, and generate it in
package/nfs-utils/nfs-utils.mk ?

> +
>  mkdir -p /var/lock/subsys
>  mkdir -p /run/nfs/sm
>  mkdir -p /run/nfs/sm.bak
> @@ -15,13 +17,26 @@ if [ -f "${CFG_FILE}" ]; then
>  	. "${CFG_FILE}"
>  fi
>  
> +if [ $ENABLEv4 == "yes" ]; then
> +	pipefs_dir="`sed -n 's/^ *Pipefs-Directory *= *//p' /etc/idmapd.conf`"
> +fi
>  
>  start() {
>  	# Start daemons.
> +	if [ $ENABLEv4 == "yes" ]; then
> +		printf "Starting NFS idmapd: "
> +		[ -d /var/lib/nfs/v4recovery ] || mkdir -p /var/lib/nfs/v4recovery
> +		[ -d "$pipefs_dir" ] || mkdir -p "$pipefs_dir"
> +		if ! ( grep -q "on $pipefs_dir type rpc_pipefs" /proc/mounts ); then
> +			mount -t rpc_pipefs sunrpc "$pipefs_dir"
> +		fi
> +		rpc.idmapd
> +		echo "done"
> +	fi
> +
>  	printf "Starting NFS statd: "
>  	rpc.statd
>  	[ $? = 0 ] && echo "OK" || echo "FAIL"
> -	touch /var/lock/subsys/nfslock
>  
>  	printf "Starting NFS services: "
>  	/usr/sbin/exportfs -r
> @@ -34,11 +49,17 @@ start() {
>  	printf "Starting NFS mountd: "
>  	rpc.mountd
>  	[ $? = 0 ] && echo "OK" || echo "FAIL"
> -	touch /var/lock/subsys/nfs
>  }
>  
>  stop() {
>  	# Stop daemons.
> +	if [ $ENABLEv4 == "yes" ]; then
> +		printf "Shutting down NFS idmapd: "
> +		killall -q rpc.idmapd
> +		umount "$pipefs_dir"
> +		echo "done"
> +	fi
> +
>  	printf "Shutting down NFS mountd: "
>  	killall -q rpc.mountd 2>/dev/null
>  	[ $? = 0 ] && echo "OK" || echo "FAIL"
> @@ -56,7 +77,6 @@ stop() {
>  	[ $? = 0 ] && echo "OK" || echo "FAIL"
>  	rm -f /var/lock/subsys/nfs
>  	rm -f /var/run/rpc.statd.pid
> -	rm -f /var/lock/subsys/nfslock

Any reason why this is being removed ?

>  }
>  
>  # See how we were called.
> @@ -73,7 +93,6 @@ case "$1" in
>  		;;
>  	reload)
>  		/usr/sbin/exportfs -r
> -		touch /var/lock/subsys/nfs

Any reason why this is being removed ?

>  		;;
>  	*)
>  		echo "Usage: $0 {start|stop|restart|reload}"
> diff --git a/package/nfs-utils/etc-idmapd.conf b/package/nfs-utils/etc-idmapd.conf
> new file mode 100644
> index 0000000000..0288c0ce03
> --- /dev/null
> +++ b/package/nfs-utils/etc-idmapd.conf
> @@ -0,0 +1,9 @@
> +[General]
> +Verbosity = 0
> +Pipefs-Directory = /var/lib/nfs/rpc_pipefs
> +Domain = localdomain
> +
> +[Mapping]
> +Nobody-User = nobody
> +Nobody-Group = nogroup
> +
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 9fa7ae200b..517ec19bea 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -15,15 +15,19 @@ NFS_UTILS_DEPENDENCIES = host-pkgconf
>  NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
>  
>  NFS_UTILS_CONF_OPTS = \
> -	--disable-nfsv4 \
> -	--disable-nfsv41 \
>  	--disable-gss \
>  	--disable-uuid \
> -	--disable-ipv6 \

I'm not sure why we are disabling IPv6 here. Changing this is
definitely OK, but it should be in a separate patch, as it's not
related.

>  	--without-tcp-wrappers \
>  	--with-statedir=/run/nfs \
>  	--with-rpcgen=internal
>  
> +ifeq ($(BR2_PACKAGE_LIBNFSIDMAP),y)
> +NFS_UTILS_DEPENDENCIES += libevent libnfsidmap lvm2 sqlite

If lvm2 and sqlite are dependencies, they should be selected from the
Config.in file. Any idea why lvm2 is needed ?

> +NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-nfsv41
> +else
> +NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
> +endif
> +
>  HOST_NFS_UTILS_CONF_OPTS = \
>  	--disable-nfsv4 \
>  	--disable-nfsv41 \
> @@ -62,7 +66,16 @@ define NFS_UTILS_INSTALL_FIXUP
>  	$(INSTALL) -D -m 644 \
>  		$(@D)/utils/mount/nfsmount.conf $(TARGET_DIR)/etc/nfsmount.conf
>  endef
> +
> +define NFS_UTILS_INSTALL_IDMAPD_CONF
> +	$(INSTALL) -m 0644 package/nfs-utils/etc-idmapd.conf \
> +		$(TARGET_DIR)/etc/idmapd.conf
> +endef

Please enclose this hook definition inside the ifeq
($(BR2_PACKAGE_NFS_UTILS_NFS4),y) condition.

> +
>  NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
> +ifeq ($(BR2_PACKAGE_NFS_UTILS_NFS4),y)
> +	NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_IDMAPD_CONF

Please don't indent.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
