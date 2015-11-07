From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Nov 2015 01:55:00 +0100
Subject: [Buildroot] [PATCH] system: Fix for NFS booting with interface
 config via DHCP
In-Reply-To: <1446841557.4553.32.camel@rtred1test09.kymeta.local>
References: <1446841557.4553.32.camel@rtred1test09.kymeta.local>
Message-ID: <563D4BE4.2020105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06-11-15 21:25, Trent Piepho wrote:
> Configuring the network interface with DHCP via
> /etc/network/interfaces generally does work when NFS booting.  The
> DHCP configuration will initially bring the interface down and system
> then hangs at that point as the root filesystem is no longer
> accessable.  See bug 4709.
> 
> The system config option adds a script to if-pre-up.d that will check
> for a NFS root filesystem and if the interface to be configured is
> used for access to the NFS server.  If this is the case, then it
> returns a failure code so that ifup will not configure the interface.
> This works for DHCP and another config methods (static, bootp, etc.).
> This system does detect if the interface to be configured isn't the
> one used for NFS and doesn't skip it when that is the case.
> 
> NFS filesystems that aren't the root fs aren't considered.
> 
> Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>

 Good one! A few small remarks below.

> ---
> 
> Example when the interface is used for NFS:
> # ifup eth0
> Skipping eth0, used for NFS from 192.168.1.123
> run-parts: /etc/network/if-pre-up.d/nfs_check: exit status 1
> 
> Example when the interface isn't used for NFS:
> # ifup eth1
> [brings interface up]
> 
> An alternative to putting the script in if-pre-up.d would be to add
> pre-up lines to the interfaces file.  This would allow running the
> script just for certain interfaces.  It also removes the "run-parts"
> message to do it this way.

 But I think ifup would still report an error, no?

> 
>  package/skeleton/nfs_check   |  7 +++++++
>  package/skeleton/skeleton.mk |  7 +++++++
>  system/Config.in             | 19 +++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100755 package/skeleton/nfs_check
> 
> diff --git a/package/skeleton/nfs_check b/package/skeleton/nfs_check
> new file mode 100755
> index 0000000..1914404
> --- /dev/null
> +++ b/package/skeleton/nfs_check
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +nfsip=`awk '$3=="nfs" && $2=="/"{ sub(/:.*/,"",$1); print $1; }' /proc/mounts`

 sed is generally better-known so we prefer it if possible. Like

sed -n '/^\([0-9.]*\):[^ ]* \/ nfs .*/s//\1/p' /proc/mounts


 However, why don't we just check if the interface is already up? Like
ip link show $IFACE | cut -d ' ' -f 3 | grep -q UP

> +if [ -n "$nfsip" ] && ip route get to "$nfsip" | grep -q "dev $IFACE"; then
> +  echo Skipping $IFACE, used for NFS from $nfsip
> +  exit 1
> +fi
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index d1b797d..059a0b9 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -33,6 +33,12 @@ define SKELETON_USR_SYMLINKS_OR_DIRS
>  endef
>  endif
>  
> +ifeq ($(BR2_SYSTEM_IFUP_NFS_ROOT),y)
> +define SKELETON_INSTALL_NFS_CHECK
> +	$(INSTALL) -m 0755 -D package/skeleton/nfs_check $(TARGET_DIR)/etc/network/if-pre-up.d/nfs_check

 Please use $(SKELETON_PKGDIR) instead of package/skeleton in new code, and also
split this long line.

> +endef
> +endif
> +
>  define SKELETON_INSTALL_TARGET_CMDS
>  	rsync -a --ignore-times $(SYNC_VCS_EXCLUSIONS) \
>  		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
> @@ -98,6 +104,7 @@ define SET_NETWORK
>  	mkdir -p $(TARGET_DIR)/etc/network/
>  	$(SET_NETWORK_LOCALHOST)
>  	$(SET_NETWORK_DHCP)
> +	$(SKELETON_INSTALL_NFS_CHECK)
>  endef
>  
>  TARGET_FINALIZE_HOOKS += SET_NETWORK
> diff --git a/system/Config.in b/system/Config.in
> index 4d07010..cd0bbf7 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -358,6 +358,25 @@ config BR2_SYSTEM_DHCP
>  	  For more complicated network setups use an overlay to overwrite
>  	  /etc/network/interfaces or add a networkd configuration file.
>  
> +config BR2_SYSTEM_IFUP_NFS_ROOT

 I wonder if it is useful to have this optional. The overhead of running this
extra script is minimal, and we know for sure that NFS-root will not boot
without it. So I'd always install it if BR2_SYSTEM_DHCP. And people who don't
want it can still get rid of it in an overlay.

 That said, we can always remove this option later.

 Great help text BTW.


 Regards,
 Arnout

> +	bool "Have network interface configuration cope with NFS root boot"
> +	default y
> +	depends on BR2_SYSTEM_DHCP != ""
> +	help
> +	  This allows NFS booting to work while also enabling the
> +	  option to configure the network interface via DHCP.
> +	  Otherwise, a NFS booted system will likely hang during DHCP
> +	  configuration.
> +
> +	  Attempting to configure the network interface used for NFS
> +	  will initially bring that network down.  Since the root
> +	  filesystem is accessed over this network, the system hangs.
> +
> +	  This option will add a script to the ifup system that will
> +	  attempt to detect if a NFS root mount uses the interface to
> +	  be configured, and if so does not configure it.  This should
> +	  allow the same build to be disk/flash booted or NFS booted.
> +
>  comment "automatic network configuration via DHCP is not compatible with networkd"
>  	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
