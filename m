From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 23 Mar 2012 09:36:02 +0100
Subject: [Buildroot] ofono package
In-Reply-To: <CAAfyv35Rq_ad_obvHC2QZdhBvebLqpsRO7G0B4qpkGZuEYamuA@mail.gmail.com>
References: <CAAfyv35Rq_ad_obvHC2QZdhBvebLqpsRO7G0B4qpkGZuEYamuA@mail.gmail.com>
Message-ID: <CAGm1_ks7QkKyFS7wWPMi3ytu4d2QU=k=gVEcnq6ENoA-CM3sKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 23, 2012 at 1:54 AM, Belisko Marek <marek.belisko@gmail.com> wrote:
> Hi,
>
> I'm trying to add ofono package to buildroot but facing strange
> problems with bluetooth support.
>
>
> From 12a05a615d38f3a72e04231a7b57402c50d0f7dd Mon Sep 17 00:00:00 2001
> From: Marek Belisko <marek.belisko@open-nandra.com>
> Date: Fri, 23 Mar 2012 01:49:16 +0100
> Subject: [PATCH] Add ofono package.
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
> ?package/Config.in ? ? ? | ? ?1 +
> ?package/ofono/Config.in | ? 18 ++++++++++++++++++
> ?package/ofono/ofono.mk ?| ? 26 ++++++++++++++++++++++++++
> ?3 files changed, 45 insertions(+), 0 deletions(-)
> ?create mode 100644 package/ofono/Config.in
> ?create mode 100644 package/ofono/ofono.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 50ef982..c37be8e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -201,6 +201,7 @@ source "package/memtester/Config.in"
> ?source "package/minicom/Config.in"
> ?source "package/mtd/Config.in"
> ?source "package/ntfs-3g/Config.in"
> +source "package/ofono/Config.in"
> ?source "package/open2300/Config.in"
> ?source "package/openocd/Config.in"
> ?source "package/parted/Config.in"
> diff --git a/package/ofono/Config.in b/package/ofono/Config.in
> new file mode 100644
> index 0000000..3760880
> --- /dev/null
> +++ b/package/ofono/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_OFONO
> + ? ? ? bool "ofono"
> + ? ? ? select BR2_PACKAGE_LIBCAP_NG
> + ? ? ? select BR2_PACKAGE_LIBGLIB2
> + ? ? ? help
> + ? ? ? ? oFono.org is a place to bring developers together around designing an
> + ? ? ? ? infrastructure for building mobile telephony (GSM/UMTS) applications.
> +
> +if BR2_PACKAGE_OFONO
> +
> +config BR2_PACKAGE_OFONO_BLUETOOTH
> + ? ? ? ?bool "ofono with bluetooth support"
> + ? ? ? select BR2_PACKAGE_BLUEZ_UTILS
> + ? ? ? ?help
> + ? ? ? ? Enable bluetooh support.
> +endif
> +
> +
> diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
> new file mode 100644
> index 0000000..d998091
> --- /dev/null
> +++ b/package/ofono/ofono.mk
> @@ -0,0 +1,26 @@
> +#############################################################
> +#
> +# ofono
> +#
> +#############################################################
> +OFONO_VERSION = 1.5
> +OFONO_SITE = git://git.kernel.org/pub/scm/network/ofono/ofono.git
> +
> +OFONO_DEPENDENCIES = host-pkg-config libglib2 libcap-ng bluez_utils
> +
> +OFONO_CONF_OPT = --disable-test
> +
> +ifneq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
> + ? ? ? OFONO_CONF_OPT += --disable-udev
> +endif
> +
> +ifneq ($(BR2_PACKAGE_OFONO_BLUETOOTH),y)
> + ? ? ? OFONO_CONF_OPT += --disable-bluetooth
> +endif
> +
> +define OFONO_CONFIGURE_CMDS
> + ? ? ? (cd $(@D) && ./bootstrap-configure $(OFONO_CONF_OPT))
> +endef
> +
> +$(eval $(call AUTOTARGETS))
> +
> --
> 1.7.5.4
>
>
> When run make I always got:
> checking for dbus_watch_get_unix_fd in -ldbus-1... yes
> checking for dbus_connection_can_send_type in -ldbus-1... yes
> checking for CAPNG... yes
> checking for USB... yes
> checking for BLUEZ... no
> configure: error: Bluetooth library >= 4.30 is required
>
> bluez is in staging and pkg-config should find it but it's not.
>
> I'm I missing something?

How did you manage to find DBUS?

checking for signalfd... yes
checking for dlopen in -ldl... yes
checking for GLIB... yes
checking for DBUS... no
configure: error: D-Bus >= 1.0 is required

Yegor
