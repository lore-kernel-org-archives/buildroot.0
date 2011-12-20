From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Dec 2011 08:05:11 +0100
Subject: [Buildroot] [PATCH 1/3] Add the systemd package
In-Reply-To: <1322047811-12933-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
 <1322047811-12933-2-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <201112200805.11054.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 23 November 2011 12:30:09 Maxime Ripard wrote:
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 5c5a1d2..22f50b4 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -149,6 +149,8 @@ define LINUX_CONFIGURE_CMDS
> 
>         $(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
>         
>                 $(call
>                 KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$
>                 (@D)/.config))
>         
>         yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D)
>         oldconfig
> 
> +       $(if $(BR2_INIT_SYSTEMD),
> +               $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config),)
 I don't see the symbol BR2_INIT_SYSTEMD defined anywhere... (it's only
defined in the next patch).  Shouldn't it anyway be BR2_PACKAGE_SYSTEMD?

> 
>  endef
>  
>  # Compilation. We make sure the kernel gets rebuilt when the
[snip]
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> new file mode 100644
> index 0000000..09cedb9
> --- /dev/null
> +++ b/package/systemd/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_SYSTEMD
> +	bool "systemd"
> +	depends on BR2_PACKAGE_UDEV
> +	depends on BR2_PACKAGE_DBUS
 With depends on, there should also be a comment to explain why systemd is not
available:
comment "systemd not available (depends on udev and dbus)"
	depends on !BR2_PACKAGE_UDEV || !BR2_PACKAGE_DBUS

> +	select BR2_PACKAGE_LIBCAP
> +	help
> +	  systemd is a system and service manager for Linux, compatible with
> +	  SysV and LSB init scripts. systemd provides aggressive parallelization
> +	  capabilities, uses socket and D-Bus activation for starting services,
> +	  offers on-demand starting of daemons, keeps track of processes using
> +	  Linux cgroups, supports snapshotting and restoring of the system
> +	  state, maintains mount and automount points and implements an
> +	  elaborate transactional dependency-based service control logic. It can
> +	  work as a drop-in replacement for sysvinit. 
> +
> +	  http://freedesktop.org/wiki/Software/systemd
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> new file mode 100644
> index 0000000..8733ce0
> --- /dev/null
> +++ b/package/systemd/systemd.mk
> @@ -0,0 +1,45 @@
> +#############################################################
> +#
> +# systemd
> +#
> +#############################################################
> +SYSTEMD_VERSION = 37
> +SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
> +SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.bz2
> +SYSTEMD_DEPENDENCIES = \
> +	host-intltool \
> +	libcap \
> +	udev \
> +	dbus
> +
> +SYSTEMD_CONF_OPT = \
> +	--with-distro=other \
> +	--disable-selinux \
> +	--disable-acl \
 acl should be selected based on BR2_PACKAGE_ACL

> +	--disable-pam \
> +	--disable-libcryptsetup \
> +	--disable-gtk \
> +	--disable-plymouth \
> +	--with-rootdir=/ \
> +	--with-dbuspolicydir=/etc/dbus-1/system.d \
> +	--with-dbussessionservicedir=/usr/share/dbus-1/services \
> +	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
> +	--with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
> +	--with-udevrulesdir=/etc/udev/rules.d \
> +
> +define SYSTEMD_INSTALL_INIT_HOOK
> +	ln -fs /bin/systemd $(TARGET_DIR)/sbin/init
> +	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/halt
> +	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/poweroff
> +	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/reboot
 I don't think it's a standard in buildroot, but personally I prefer relative
links here.  That way you can do things like gdb or objdump on the link, without
accidentally referring to the host systemd.

> +endef
> +
> +define SYSTEMD_INSTALL_TTY_HOOK
> +	ln -fs /lib/systemd/system/getty at .service $(TARGET_DIR)/etc/systemd/system/getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
> +endef
> +
> +SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> +	SYSTEMD_INSTALL_INIT_HOOK \
> +	SYSTEMD_INSTALL_TTY_HOOK \
> +
> +$(eval $(call AUTOTARGETS))


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
