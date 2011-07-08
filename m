From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Jul 2011 20:06:06 +0200
Subject: [Buildroot] [PATCH] busybox: provide /etc/mdev.conf if mdev is
	used
In-Reply-To: <1310140073-14231-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Fri, 8 Jul 2011 17:47:53 +0200")
References: <1310140073-14231-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <8739igy7e9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Without an mdev.conf file installed, mdev generates some /dev entries in
 Luca> an incorrect or non-standard way. Some examples:
 Luca>  1. /dev/null has permissions 660, but it should be accessible to normal
 Luca>     users;
 Luca>  2. alsa devices get created in /dev, not /dev/snd as is more common,
 Luca>     and as the default value of BR2_PACKAGE_ALSA_LIB_DEVDIR suggests;
 Luca>  3. event<N> files are created in /dev, not /dev/input.

 Luca> This mdev.conf is a selection from the examples provided in the busybox
 Luca> sources with minor tweaks.

Looks good, except for ..

 Luca> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
 Luca> index 509c3bb..30b7ab6 100644
 Luca> --- a/package/busybox/busybox.mk
 Luca> +++ b/package/busybox/busybox.mk
 Luca> @@ -33,6 +33,9 @@ ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
 Luca>  define BUSYBOX_INSTALL_MDEV_SCRIPT
 Luca>  	install -m 0755 package/busybox/S10mdev $(TARGET_DIR)/etc/init.d
 Luca>  endef
 Luca> +define BUSYBOX_INSTALL_MDEV_CONF
 Luca> +	install -m 0644 package/busybox/mdev.conf $(TARGET_DIR)/etc

Please use install -D, and only install if the file is not already
there in the rootfs.

Otherwise it looks good. Care to fix and resend?

-- 
Bye, Peter Korsgaard
