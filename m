From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 16:02:09 +0200
Subject: [Buildroot] [PATCH v9 09/15] dbus: selinux file context support
In-Reply-To: <1436905227-26937-10-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436905227-26937-10-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150718160209.6a3b2850@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue, 14 Jul 2015 15:20:21 -0500, Clayton Shotwell wrote:

> --- a/package/dbus/S30dbus
> +++ b/package/dbus/S30dbus
> @@ -17,6 +17,10 @@
>  [ -d /var/run/dbus ] || mkdir -p /var/run/dbus
>  [ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
>  [ -d /tmp/dbus ] || mkdir -p /tmp/dbus
> +[ -d /var/lib/dbus ] || mkdir -p /var/lib/dbus

This doesn't make a lot of sense, have you looked at what dbus.mk is
doing? It does:

        mkdir -p $(TARGET_DIR)/var/lib
        rm -rf $(TARGET_DIR)/var/lib/dbus
        ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus

In DBUS_INSTALL_INIT_SYSV. So, /var/lib/dbus is a symlink to /tmp/dbus.
And /tmp/dbus is created just above in the init script. Therefore, I
don't understand why you want to re-create /var/lib/dbus if it doesn't
exist: it should already exist as a valid symlink, pointing
to /tmp/dbus, created just above.

> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index 7deae11..e9c9aaf 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -44,6 +44,20 @@ ifeq ($(BR2_microblaze),y)
>  DBUS_CONF_OPTS += --disable-inotify
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +DBUS_CONF_OPTS += --enable-selinux
> +DBUS_DEPENDENCIES += libselinux
> +else
> +DBUS_CONF_OPTS += --disable-selinux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +DBUS_CONF_OPTS += --enable-libaudit
> +DBUS_DEPENDENCIES += audit libcap-ng
> +else
> +DBUS_CONF_OPTS += --disable-libaudit
> +endif

I've committed this part of the patch (i.e the change to dbus.mk).
Please resubmit a new patch with just the S30dbus patches. Also, can
you explain on which files/directories restorecon will have to be
called? Will it impact many init scripts?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
