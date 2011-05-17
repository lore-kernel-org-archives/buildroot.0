From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2011 09:04:26 +0200
Subject: [Buildroot] [git commit] Allow several device tables and split
 in two parts our device table
In-Reply-To: <20110510215121.DFA53826FF@busybox.osuosl.org>
References: <20110510215121.DFA53826FF@busybox.osuosl.org>
Message-ID: <20110517090426.0bd12953@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2011 23:43:00 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

>  config BR2_ROOTFS_DEVICE_TABLE
> -	string "Path to the device table"
> -	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
> -	default "target/generic/device_table.txt"
> +	string "Path to the device tables"
> +	default "target/generic/device_table.txt target/generic/device_table_dev.txt" \
> +		if BR2_ROOTFS_DEVICE_CREATION_STATIC
> +	default "target/generic/device_table.txt" \
> +		if (BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV || \
> +		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || \
> +		    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS)
>  	help
> -	  Specify the location of a device table, that will be passed
> -	  to the makedevs utility to create all the special device
> -	  files in the target filesystem.
> +	  Specify a space-separated list of device table locations,
> +	  that will be passed to the makedevs utility to create all
> +	  the special device files and assign correct owners and
> +	  permissions on various files in the target filesystem.
> +
> +	  See package/makedevs/README for details on the usage and
> +	  syntax of these files.

I know it's my stuff, but this doesn't work that well. Once you have
choosen one particular solution, if you switch to another, then the
list of default device table isn't updated accordingly. Of course, we
want to preserve the user choice for the list of device tables, but I'm
quite sure we'll have some support requests from people doing :

 * A build based on a dynamic /dev
 * Change configuration to static /dev
 * Build
 * See that nothing works, because /dev is empty

But I don't know what we can do against this. Should we instead add an
option to makedevs to instruct makedevs to skip entries in /dev ? This
option could then be used for all dynamic /dev cases, and would work
even if the device table contains entries for /dev ? Or should we keep
it as it is ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
