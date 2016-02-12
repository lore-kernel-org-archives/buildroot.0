From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 16:17:22 +0100
Subject: [Buildroot] [PATCH v2 1/1] cgroupsfs: new package
In-Reply-To: <1455286842-11540-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455286842-11540-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160212161722.48c9a703@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration! See some comments below.

On Fri, 12 Feb 2016 19:50:42 +0530, Niranjan Reddy wrote:
> From: Niranjan <niranjan.reddy@rockwellcollins.com>

We want the first name + last name in the From: field.

> diff --git a/package/cgroupfs/S30cgroupfs b/package/cgroupfs/S30cgroupfs
> new file mode 100644
> index 0000000..86819de
> --- /dev/null
> +++ b/package/cgroupfs/S30cgroupfs
> @@ -0,0 +1,50 @@
> +#!/bin/sh
> +#
> +# cgroupfs:   Set up cgroupfs mounts.
> +#
> +# description:  Control groups are a kernel mechanism for tracking and imposing
> +#  		limits on resource usage on groups of tasks.
> +#
> +#

Generally speaking, you should look at some other init scripts in
Buildroot, to be more similar to what they look like.

> +
> +RETVAL=0
> +case "$1" in
> +	start)
> +		test -x /usr/bin/cgroupfs-mount || exit 0

Not needed.

> +		echo "Mounting cgroupfs hierarchy"

Use printf here

> +		/usr/bin/cgroupfs-mount

And do something like:

		printf "Mounting cgroupfs hierarchy: "
		/usr/bin/cgroupfs-mount
		[ $? = 0 ] && echo "OK" || echo "FAIL"

> +		RETVAL=$?

I don't think there's any need for a RETVAL variable, just do exit $?
at the end of the script, like S50dropbear is doing.

> +		;;
> +
> +	stop)
> +		test -x /usr/bin/cgroupfs-umount || exit 0
> +		echo "Unmounting cgroupfs hierarchy"
> +		/usr/bin/cgroupfs-umount
> +		RETVAL=$?
> +		;;
> +
> +	restart|force-reload)
> +		if mountpoint -q /sys/fs/cgroup; then
> +			$0 stop
> +		fi
> +		exec $0 start
> +		;;
> +
> +	status)
> +		if mountpoint -q /sys/fs/cgroup; then
> +			# TODO decide whether to detect "partial mounted" status (ie, whether all available subsystems are mounted correctly)

This comment needs to be wrapped. Or handled :)

> +			echo "cgroupfs hierarchy is mounted"
> +			exit 0
> +		else
> +			echo "cgroupfs hierarchy is not mounted"
> +			exit 1
> +		fi
> +		;;
> +
> +	*)
> +		echo "Usage: $0 {start|stop|restart|status}"
> +		exit 1
> +		;;
> +esac

Also, we often put the start(), stop() and status() code in functions,
so that the indentation remains more reasonable. Again, see S50dropbear
for a pretty good example.

> diff --git a/package/cgroupfs/cgroupfs.mk b/package/cgroupfs/cgroupfs.mk
> new file mode 100644
> index 0000000..8d178ff
> --- /dev/null
> +++ b/package/cgroupfs/cgroupfs.mk
> @@ -0,0 +1,22 @@
> +#############################################################
> +#
> +# cgroupfs
> +#
> +#############################################################

We want 80 hash signs here. Yes that's silly. But we like it :)

And also, an empty new line between this comment header and the first
variable.

> +CGROUPFS_VERSION = 7285bf44402029394808339f69f4f293730fc2c6
> +CGROUPFS_SITE = $(call github,tianon,cgroupfs-mount,$(CGROUPFS_VERSION))
> +CGROUPFS_LICENSE = GPL-3+

Should be GPLv3+

> +CGROUPFS_LICENSE_FILES = COPYRIGHT
> +
> +define CGROUPFS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-mount $(TARGET_DIR)/usr/bin/cgroupfs-mount
> +	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-umount $(TARGET_DIR)/usr/bin/cgroupfs-umount
> +endef
> +
> +define CGROUPFS_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/cgroupfs/S30cgroupfs \

You can use $(CGROUPFS_PKGDIR) instead of package/cgroupfs/

Also, your should add a .hash file to this package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
