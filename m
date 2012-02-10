From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 10 Feb 2012 17:43:01 +0100
Subject: [Buildroot] [PATCH v2] new program: usb_modeswitch_data
In-Reply-To: <1328886361-28209-1-git-send-email-jwoltz@gmail.com>
References: <1328886361-28209-1-git-send-email-jwoltz@gmail.com>
Message-ID: <CAAXf6LWBERS=9xF0ZNK0=o+8i5EfTu3nX8YoNPanD5Z5SB4--A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 10, 2012 at 4:06 PM, J.C. Woltz <jwoltz@gmail.com> wrote:
> usb_modeswitch_data provides udev rules for usb VID/PID combinations to
> switch usb deices from their default mode into a more useable mode. The
> default mode usually is a cdrom with installation software that is of
> little use in linux.
>
> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
> ---
> ?package/Config.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? ?1 +
> ?package/usb_modeswitch_data/Config.in ? ? ? ? ? ? ?| ? ?9 +++++++
> ?.../usb_modeswitch_data-makefile.patch ? ? ? ? ? ? | ? 24 ++++++++++++++++++
> ?package/usb_modeswitch_data/usb_modeswitch_data.mk | ? 26 ++++++++++++++++++++
> ?4 files changed, 60 insertions(+), 0 deletions(-)
> ?create mode 100644 package/usb_modeswitch_data/Config.in
> ?create mode 100644 package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
> ?create mode 100644 package/usb_modeswitch_data/usb_modeswitch_data.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index c679652..ff11cd0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -220,6 +220,7 @@ source "package/uboot-tools/Config.in"
> ?source "package/udev/Config.in"
> ?source "package/unionfs/Config.in"
> ?source "package/usb_modeswitch/Config.in"
> +source "package/usb_modeswitch_data/Config.in"
> ?source "package/usbmount/Config.in"
> ?source "package/usbutils/Config.in"
> ?source "package/wipe/Config.in"
> diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
> new file mode 100644
> index 0000000..a2a0bf7
> --- /dev/null
> +++ b/package/usb_modeswitch_data/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_USB_MODESWITCH_DATA
> + ? ? ? depends on BR2_PACKAGE_USB_MODESWITCH
> + ? ? ? bool "usb_modeswitch_data"
> + ? ? ? select BR2_PACKAGE_USB_MODESWITCH

You don't need the select line anymore.

> + ? ? ? help
> + ? ? ? ? USB mode switch data
> + ? ? ? ? Contains udev rules and other device data
> +
> + ? ? ? ? http://www.draisberghof.de/usb_modeswitch/
> diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
> new file mode 100644
> index 0000000..024bc76
> --- /dev/null
> +++ b/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
> @@ -0,0 +1,24 @@
> +diff -Nura usb_modeswitch_data-20120120.orig/Makefile usb_modeswitch_data-20120120/Makefile
> +--- usb_modeswitch_data-20120120.orig/Makefile 2012-01-20 17:25:32.000000000 -0500
> ++++ usb_modeswitch_data-20120120/Makefile ? ? ?2012-02-06 14:20:47.000000000 -0500
> +@@ -12,9 +12,9 @@
> +
> + clean:
> +
> +-install: files-install db-install rules-reload
> ++install: files-install db-install
> +
> +-install-packed: files-install db-install-packed rules-reload
> ++install-packed: files-install db-install-packed
> +
> + files-install:
> + ? ? ? install -d $(PREFIX)/share/usb_modeswitch
> +@@ -50,7 +50,7 @@
> + ? ? ? ? ? ? ? fi \
> + ? ? ? fi
> +
> +-uninstall: files-uninstall rules-reload
> ++uninstall: files-uninstall
> +
> + files-uninstall:
> + ? ? ? $(RM) $(RULESDIR)/40-usb_modeswitch.rules
> diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
> new file mode 100644
> index 0000000..9f1b3ff
> --- /dev/null
> +++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
> @@ -0,0 +1,26 @@
> +#############################################################
> +#
> +# usb_modeswitch_data
> +#
> +#############################################################
> +
> +USB_MODESWITCH_DATA_VERSION = 20120120
> +USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
> +USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
> +USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
> +
> +define USB_MODESWITCH_DATA_BUILD_CMDS
> + ? ? ? $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
> +endef
> +
> +define USB_MODESWITCH_DATA_INSTALL_TARGET_CMDS
> + ? ? ? $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +
> +define USB_MODESWITCH_DATA_CLEAN_CMDS
> + ? ? ? $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) clean
> +endef
> +
> +$(eval $(call GENTARGETS))
> +
> --
> 1.7.5.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
