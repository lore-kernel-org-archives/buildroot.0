From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Jul 2011 21:54:49 +0200
Subject: [Buildroot] [PATCH 3/3]  usbmount fixes
In-Reply-To: <4E29900B.6040502@visionsystems.de> (Yegor Yefremov's message of
 "Fri, 22 Jul 2011 16:58:19 +0200")
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de> <4E298ED8.5000901@visionsystems.de>
 <4E29900B.6040502@visionsystems.de>
Message-ID: <87zkjzsdme.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> - create mounting points
 Yegor> - fix dependencies
 Yegor> - fix udev rules
 Yegor> - fix fs type detection

Thanks, committed with some fixes (see below).

 Yegor> Index: b/package/usbmount/Config.in
 Yegor> ===================================================================
 Yegor> --- a/package/usbmount/Config.in
 Yegor> +++ b/package/usbmount/Config.in
 Yegor> @@ -2,6 +2,8 @@
 Yegor>  	bool "usbmount"
 Yegor>  	select BR2_PACKAGE_UDEV
 Yegor>  	select BR2_PACKAGE_LOCKFILE_PROGS
 Yegor> +	select BR2_PACKAGE_UTIL_LINUX
 Yegor> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID

util-linux needs wchar + largefile, and is only visible if
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, so those needs to be selected (and a
comment shown if wchar/largefile isn't available).

 Yegor> +++ b/package/usbmount/usbmount.mk
 Yegor> @@ -6,20 +6,36 @@
 Yegor>  USBMOUNT_VERSION = 0.0.21
 Yegor>  USBMOUNT_SOURCE = usbmount_$(USBMOUNT_VERSION).tar.gz
 Yegor>  USBMOUNT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/u/usbmount
 Yegor> -USBMOUNT_DEPENDENCIES = udev lockfile-progs
 Yegor> +USBMOUNT_DEPENDENCIES = udev lockfile-progs util-linux
 
 Yegor>  define USBMOUNT_INSTALL_TARGET_CMDS
 Yegor>  	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
 Yegor> +
 Yegor> +	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink 	\
 Yegor> +		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_create_model_symlink
 Yegor> +	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink 	\
 Yegor> +		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_remove_model_symlink
 Yegor> +
 Yegor>  	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
 Yegor>  	@if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ]; then \
 Yegor>  	        $(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
 Yegor>  	fi
 Yegor> +
 Yegor> +	mkdir -p $(TARGET_DIR)/media
 Yegor> +	mkdir -p $(TARGET_DIR)/media/usb0
 Yegor> +	mkdir -p $(TARGET_DIR)/media/usb1
 Yegor> +	mkdir -p $(TARGET_DIR)/media/usb2
 Yegor> +	mkdir -p $(TARGET_DIR)/media/usb3
 Yegor> +	mkdir -p $(TARGET_DIR)/media/usb4
 Yegor> +	mkdir -p $(TARGET_DIR)/media/usb5
 Yegor> +	mkdir -p $(TARGET_DIR)/media/usb6

usbmount handles /media/usb[0-7], so you forgot usb7.
 
 Yegor> Index: b/package/usbmount/usbmount-rules-fix.patch
 Yegor> ===================================================================
 Yegor> --- /dev/null
 Yegor> +++ b/package/usbmount/usbmount-rules-fix.patch
 Yegor> @@ -0,0 +1,19 @@
 Yegor> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Please provide a proper description of what patches do in the future.

-- 
Bye, Peter Korsgaard
