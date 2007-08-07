From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 7 Aug 2007 19:31:53 +0200
Subject: [Buildroot] [patch] udev broken, update and fix
References: <46B7BE61.5060107@mainstreetsoftworks.com>
Message-ID: <022001c7d939$a7eb56d0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Brad House" <brad@mainstreetsoftworks.com>
To: <buildroot@uclibc.org>
Sent: Tuesday, August 07, 2007 2:35 AM
Subject: [Buildroot] [patch] udev broken, update and fix


> /etc/udev/rules.d/ is empty with the current udev.  It should be
> populated by default with one of the examples provided with udev.
> Also, /dev/pts should be mounted by default from the udev (S10udev)
> start script, otherwise 'dropbear' won't allow logins as it requires
> /dev/pts...  (and this shouldn't be done automatically in fstab since
> udev creates a tmpfs which would mount over it).
> 
> Also, udev_root isn't configured by default in /etc/udev/udev.conf as
> the start script requires.
> 
> I've attached a patch which fixes those and goes ahead and bumps the
> version to 114 (from 101).  Also, you can remove the
> 'udev-install.patch', as I've modified the makefile to do the same
> thing...
> 
> -Brad
>


> --- package/udev/udev.mk (revision 19415)
> +++ package/udev/udev.mk (working copy)
> @@ -46,6 +46,9 @@
>  USE_LOG=false USE_SELINUX=false \
>  udevdir=$(UDEV_ROOT) -C $(UDEV_DIR) install
>  $(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d
> + $(INSTALL) -m 0644 $(UDEV_DIR)/etc/udev/frugalware/* $(TARGET_DIR)/etc/udev/rules.d
> + echo 'udev_root=/dev' >> $(TARGET_DIR)/etc/udev/udev.conf

If you build udev, and then delete the source directory, and build udev again
you will get multiple lines "udev_root=/dev" in the udev.conf.

It would be better to check if it is there and add it, if it is not.

Best Regards
Ulf Samuelsson
