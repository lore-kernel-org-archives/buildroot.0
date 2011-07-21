From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Jul 2011 22:39:22 +0200
Subject: [Buildroot] [PATCH] usbmount: bump to 0.0.21
In-Reply-To: <4E26EA44.8080405@visionsystems.de> (Yegor Yefremov's message of
 "Wed, 20 Jul 2011 16:46:28 +0200")
References: <4E26EA44.8080405@visionsystems.de>
Message-ID: <87y5zrz7ut.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Yegor> ---
 Yegor>  package/usbmount/usbmount-0.0.14.1.patch |   57 -------------------------------
 Yegor>  package/usbmount/usbmount.mk             |    7 ++-
 Yegor>  2 files changed, 4 insertions(+), 60 deletions(-)

Committed with some changes, thanks.

First of all you forgot to remove the BR2_PACKAGE_UDEV_VOLUME_ID select,
which was the reason for the version bump in the first place.

 Yegor> Index: b/package/usbmount/usbmount.mk
 Yegor> ===================================================================
 Yegor> --- a/package/usbmount/usbmount.mk
 Yegor> +++ b/package/usbmount/usbmount.mk
 Yegor> @@ -3,13 +3,14 @@
 Yegor>  # usbmount
 Yegor>  #
 Yegor>  #############################################################
 Yegor> -USBMOUNT_VERSION=0.0.14.1
 Yegor> +USBMOUNT_VERSION=0.0.21
 Yegor>  USBMOUNT_SOURCE:=usbmount_$(USBMOUNT_VERSION).tar.gz
 Yegor> -USBMOUNT_SITE:=http://usbmount.alioth.debian.org/package/
 Yegor> +USBMOUNT_SITE:=http://ftp.de.debian.org/debian/pool/main/u/usbmount

We have a BR2_DEBIAN_MIRROR setting that should be used.


 Yegor>  USBMOUNT_DEPENDENCIES = udev lockfile-progs
 
 Yegor>  define USBMOUNT_INSTALL_TARGET_CMDS
 Yegor> -	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/sbin/usbmount
 Yegor> +	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
 Yegor> +	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d

You need to provide the destination file name when you use install -D


 Yegor>  	@if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ]; then \
 Yegor>  	        $(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
 Yegor>  	fi

You forgot to update the uninstall step.

The script uses blkid, which we currently don't have enabled in the
default busybox config. I'll fix that.

-- 
Bye, Peter Korsgaard
