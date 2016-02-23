From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:47:48 +0100
Subject: [Buildroot] [Buildroot PATCH Selinux v10 05/11] busybox:
 applets as individual binaries
In-Reply-To: <1455603506-26138-5-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <1455603506-26138-5-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160223224748.05d575d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Feb 2016 11:48:20 +0530, Niranjan Reddy wrote:

> +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> +define BUSYBOX_PERMISSIONS
> +	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
> +endef
> +
> +# Set permissions on all applets with BB_SUID_REQUIRE and BB_SUID_MAYBE. The
> +# permissions are pulled from the applets.h file that is generated during
> +# the build and used to determine all of the possible applets. The permissions
> +# file is generated and added to the list of device tables used by makedevs to
> +# set file permissions.
> +define BUSYBOX_MAKEDEV_PERMISSIONS
> +	if [ -f $(@D)/.buildroot_permissions ]; then \
> +		rm $(@D)/.buildroot_permissions; \
> +	fi; \
> +	touch $(@D)/.buildroot_permissions; \
> +	for app in `grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE" $(@D)/include/applets.h \
> +			| sed -e 's/,.*//' -e 's/.*(//'`; \
> +	do \
> +		temp=`grep -w $${app} $(@D)/busybox.links`; \
> +		if [ -n "$${temp}" ]; then \
> +			echo "$${temp} f 4755 0  0 - - - - -" >> $(@D)/.buildroot_permissions; \
> +		fi; \
> +	done
> +endef
> +BUSYBOX_POST_INSTALL_TARGET_HOOKS += BUSYBOX_MAKEDEV_PERMISSIONS
> +BR2_ROOTFS_DEVICE_TABLE += $(BUSYBOX_DIR)/.buildroot_permissions
> +else

I already said it in previous reviews, but I really don't like this. I
don't like that you're appending directly to BR2_ROOTFS_DEVICE_TABLE,
and I don't like the complicated logic.

There are 6 applets with BB_SUID_REQUIRE, and 6 applets with
BB_SUID_MAYBE. So I would prefer to have:

define BUSYBOX_PERMISSIONS
	/bin/ping	f	f4755 0 0 - - - - -
	...
endef

for all 12 applets. The issue you will probably encounter is that
makedevs will fail if you specify a file that doesn't exist. My
proposal to solve this (I'm Cc'ing Yann here to get his opinion) is to
add a marker or flag to tell makedevs "don't fail if the file doesn't
exist". Maybe:

	-/bin/ping

or something like this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
