From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Sat, 04 Feb 2012 14:13:09 +0100
Subject: [Buildroot] [PATCH 1/5] Add the systemd package
In-Reply-To: <87liojd5e5.fsf@macbook.be.48ers.dk>
References: <1328279247-7277-1-git-send-email-maxime.ripard@free-electrons.com>
 <1328279247-7277-2-git-send-email-maxime.ripard@free-electrons.com>
 <87liojd5e5.fsf@macbook.be.48ers.dk>
Message-ID: <4F2D2EE5.2000205@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi Peter,

On 03/02/2012 21:32, Peter Korsgaard wrote:
>>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:
>  Maxime> diff --git a/fs/skeleton/etc/mtab b/fs/skeleton/etc/mtab
>  Maxime> index e1c2045..4c0a094 120000
>  Maxime> --- a/fs/skeleton/etc/mtab
>  Maxime> +++ b/fs/skeleton/etc/mtab
>  Maxime> @@ -1 +1 @@
>  Maxime> -../proc/mounts
>  Maxime> \ No newline at end of file
>  Maxime> +/proc/mounts
>  Maxime> \ No newline at end of file
> 
> Is this needed by systemd? I would prefer to see this as a seperate
> patch.

Yes, this is needed as it checks for /etc/mtab being equal to
/proc/mounts or /proc/self/mounts.

http://cgit.freedesktop.org/systemd/tree/src/main.c#n1082

Or I guess I can patch it as well...
What do you prefer ? A patch for systemd, a separate patch to change
this or keep it this way ?

> 
>  Maxime> diff --git a/linux/linux.mk b/linux/linux.mk
>  Maxime> index dbe1ad7..d7c9c9c 100644
>  Maxime> --- a/linux/linux.mk
>  Maxime> +++ b/linux/linux.mk
>  Maxime> @@ -150,6 +150,8 @@ define LINUX_CONFIGURE_CMDS
>  Maxime>  	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
>  Maxime>  		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
>  Maxime>  	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
>  Maxime> +	$(if $(BR2_PACKAGE_SYSTEMD),
>  Maxime> +		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config),)
> 
> The very last ',' can be removed. This could also go in a seperate
> patch.

Ok.

>  Maxime> +++ b/package/systemd/Config.in
>  Maxime> @@ -0,0 +1,19 @@
>  Maxime> +config BR2_PACKAGE_SYSTEMD
>  Maxime> +	bool "systemd"
>  Maxime> +	depends on BR2_PACKAGE_UDEV
>  Maxime> +	select BR2_PACKAGE_DBUS
>  Maxime> +	select BR2_PACKAGE_LIBCAP
>  Maxime> +	help
>  Maxime> +	  systemd is a system and service manager for Linux, compatible with
>  Maxime> +	  SysV and LSB init scripts. systemd provides aggressive parallelization
>  Maxime> +	  capabilities, uses socket and D-Bus activation for starting services,
>  Maxime> +	  offers on-demand starting of daemons, keeps track of processes using
>  Maxime> +	  Linux cgroups, supports snapshotting and restoring of the system
>  Maxime> +	  state, maintains mount and automount points and implements an
>  Maxime> +	  elaborate transactional dependency-based service control logic. It can
> 
> This looks a bit too wide. "It can" should go on the next line.

Ok.

>  Maxime> +++ b/package/systemd/systemd.mk
>  Maxime> @@ -0,0 +1,68 @@
>  Maxime> +#############################################################
>  Maxime> +#
>  Maxime> +# systemd
>  Maxime> +#
>  Maxime> +#############################################################
>  Maxime> +SYSTEMD_VERSION = 37
>  Maxime> +SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
>  Maxime> +SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.bz2
>  Maxime> +SYSTEMD_DEPENDENCIES = \
>  Maxime> +	host-intltool \
>  Maxime> +	libcap \
>  Maxime> +	udev \
>  Maxime> +	dbus
>  Maxime> +
>  Maxime> +# Build after Busybox
>  Maxime> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  Maxime> +	SYSTEMD_DEPENDENCIES += busybox
>  Maxime> +endif
>  Maxime> +
>  Maxime> +SYSTEMD_CONF_OPT += \
>  Maxime> +	--with-distro=other \
>  Maxime> +	--disable-selinux \
>  Maxime> +	--disable-pam \
>  Maxime> +	--disable-libcryptsetup \
>  Maxime> +	--disable-gtk \
>  Maxime> +	--disable-plymouth \
>  Maxime> +	--with-rootdir=/ \
>  Maxime> +	--with-dbuspolicydir=/etc/dbus-1/system.d \
>  Maxime> +	--with-dbussessionservicedir=/usr/share/dbus-1/services \
>  Maxime> +	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
>  Maxime> +	--with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
>  Maxime> +	--with-udevrulesdir=/etc/udev/rules.d \
>  Maxime> +	--with-sysvinit-path=/etc/init.d/ \
>  Maxime> +	--without-sysvrcd-path
>  Maxime> +
>  Maxime> +ifeq ($(BR2_PACKAGE_ACL),y)
>  Maxime> +	SYSTEMD_CONF_OPT += --enable-acl
> 
> You're missing
> SYSTEMD_DEPENDENCIES += acl

Right.

>  Maxime> +++ b/package/udev/udev.mk
>  Maxime> @@ -12,7 +12,7 @@ UDEV_CONF_OPT =			\
>  Maxime>  	--sbindir=/sbin		\
>  Maxime>  	--with-rootlibdir=/lib	\
>  Maxime>  	--libexecdir=/lib/udev	\
>  Maxime> -	--disable-introspection
>  Maxime> +	--disable-introspection \
> 
> Why?

Sorry, I used to have a line following this one, but it got removed,
will fix.


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
