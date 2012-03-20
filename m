From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 20 Mar 2012 09:35:55 +0100
Subject: [Buildroot] [PATCH 2/6] Add the systemd package
In-Reply-To: <201203200032.19236.arnout@mind.be>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <5edd6acafdb19b900e0bdb3eaf6f0796695ad09f.1332172636.git.maxime.ripard@free-electrons.com>
 <201203200032.19236.arnout@mind.be>
Message-ID: <4F68416B.50604@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Le 20/03/2012 00:32, Arnout Vandecappelle a ?crit :
> On Monday 19 March 2012 16:59:36 Maxime Ripard wrote:
> [snip]
>> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
>> new file mode 100644
>> index 0000000..d87054d
>> --- /dev/null
>> +++ b/package/systemd/Config.in
>> @@ -0,0 +1,19 @@
>> +config BR2_PACKAGE_SYSTEMD
>> +	bool "systemd"
>> +	depends on BR2_PACKAGE_UDEV
>> +	select BR2_PACKAGE_DBUS
>> +	select BR2_PACKAGE_LIBCAP
>> +	help
>> +	  systemd is a system and service manager for Linux, compatible with
>> +	  SysV and LSB init scripts. systemd provides aggressive parallelization
>> +	  capabilities, uses socket and D-Bus activation for starting services,
>> +	  offers on-demand starting of daemons, keeps track of processes using
>> +	  Linux cgroups, supports snapshotting and restoring of the system
>> +	  state, maintains mount and automount points and implements an
>> +	  elaborate transactional dependency-based service control logic.
>> +	  It can work as a drop-in replacement for sysvinit. 
>  Trailing whitespace.

Oops...

>> +
>> +	  http://freedesktop.org/wiki/Software/systemd
>> +
>> +comment "systemd not available (depends on udev and dbus)"
>> +	depends on !BR2_PACKAGE_UDEV || !BR2_PACKAGE_DBUS
> 
>  DBUS is a 'select' depedency, not a 'depends on', so it shouldn't be in
> the depends on of the comment.

Right

>> diff --git a/package/systemd/getty at .service b/package/systemd/getty at .service
> [snip]
>> diff --git a/package/systemd/serial-getty at .service b/package/systemd/serial-getty at .service
> 
>  AFAICS the only difference between these two files and the upstream 
> version is that it's getty instead of agetty.  Wouldn't it be simpler
> and more future-safe to patch the upstream files?

Probably. I'll send a patch and see how it turns out.
In the meantime, maybe I can just put a patch here instead of the whole
file.

>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>> new file mode 100644
>> index 0000000..a20ddf4
>> --- /dev/null
>> +++ b/package/systemd/systemd.mk
> [snip]
>> +# Build after Busybox
>  Why? (I know why, but it should be in the comment)

ACK

>> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>> +	SYSTEMD_DEPENDENCIES += busybox
>> +endif
> [snip]
>> +define SYSTEMD_INSTALL_INIT_HOOK
>> +	ln -fs ../bin/systemd $(TARGET_DIR)/sbin/init
>> +	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
>> +	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
>> +	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
>> +
>> +	mkdir -p $(TARGET_DIR)/run
>  In the current skeleton, /run is a symlink to /tmp.  For a
> user-defined skeleton, I would say that it's up to the user to
> make sure a valid /run exists.

Yes, of course.

>> +
>> +	ln -fs ../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
>> +endef
>> +
>> +define SYSTEMD_INSTALL_TTY_HOOK
>> +	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
>> +	[ -f $(TARGET_DIR)/etc/systemd/system/getty at .service ] || \
>> +		$(INSTALL) -D package/systemd/getty at .service \
>> +			$(TARGET_DIR)/etc/systemd/system/
>> +	[ -f $(TARGET_DIR)/etc/systemd/system/serial-getty at .service ] || \
>> +		$(INSTALL) -D package/systemd/serial-getty at .service \
>> +			$(TARGET_DIR)/etc/systemd/system/
>> +	ln -fs ../serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
> 
>  This looks strange to me.  Admittedly, I've never used systemd and
> don't really know how it works.  But to me, this looks like the
> getty at .service is actually not used.

Well, actually, this symlink with weird names is used as the way to pass
units some arguments.

If you look into the serial-getty at .service file, you will see at some
point some %i or %I. These expands to what is between the @ and the
.service in the filename. If we were to have serial-getty at ttyS2.service,
it would expand to "ttyS2", and the unit would have the start command
"/sbin/getty -L ttyS2 115200 vt100".

The symlinks are here only to avoid copying the same file over and over
again.

>> +endef
>> +
>> +SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>> +	SYSTEMD_INSTALL_INIT_HOOK \
>> +	SYSTEMD_INSTALL_TTY_HOOK \
>> +
>> +$(eval $(call AUTOTARGETS))
> [snip]
> 
>  Regards,
>  Arnout
> 

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
