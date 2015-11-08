From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 14:57:23 +0100
Subject: [Buildroot] [PATCH] system: Fix for NFS booting with interface
 config via DHCP
In-Reply-To: <1446841557.4553.32.camel@rtred1test09.kymeta.local>
References: <1446841557.4553.32.camel@rtred1test09.kymeta.local>
Message-ID: <20151108145723.49e07124@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Trent Piepho,

Thanks for working on this issue and proposing a solution for it!

On Fri, 6 Nov 2015 20:25:56 +0000, Trent Piepho wrote:
> Configuring the network interface with DHCP via
> /etc/network/interfaces generally does work when NFS booting.  The

Isn't there a missing "not" in this sentence ?

> diff --git a/package/skeleton/nfs_check b/package/skeleton/nfs_check
> new file mode 100755
> index 0000000..1914404
> --- /dev/null
> +++ b/package/skeleton/nfs_check

I think this should be in the initscripts package, not the skeleton
package. The initscripts package is the one that installs S40network,
which is the initscript calling ifup.

However, it's true that the skeleton package is currently the one that
generates the 'interfaces' file. Does that make sense? Is systemd using
the interfaces file at all?

> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +nfsip=`awk '$3=="nfs" && $2=="/"{ sub(/:.*/,"",$1); print $1; }' /proc/mounts`
> +if [ -n "$nfsip" ] && ip route get to "$nfsip" | grep -q "dev $IFACE"; then
> +  echo Skipping $IFACE, used for NFS from $nfsip
> +  exit 1

I think we generally use tabs for indentation in shell scripts.

> +config BR2_SYSTEM_IFUP_NFS_ROOT
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

Like Arnout said, I'm not sure this option is really needed. Just
always install this script when DHCP is used. You can put this text as
a big comment at the beginning of the nfs-check script, or inside
the .mk file above the command that installs this script to TARGET_DIR.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
