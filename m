From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 00:20:16 +0200
Subject: [Buildroot] [PATCH] package/dbusbroker: new package
In-Reply-To: <20200605231038.15209-1-nolange79@gmail.com>
References: <20200605231038.15209-1-nolange79@gmail.com>
Message-ID: <20200606222016.GI13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-06-06 01:10 +0200, Norbert Lange spake thusly:
> Add dbus-broker, which is a drop-in replacement
> for the dbus-daemon.

So, is it possible to have both dbus and dbus-broker in the same system?
It sould seem so, as far as I can see: one or the other can serve as the
system bus daemon. As for the session, each user may opt for running one
or the other, it seems.

However, dbus-broker does not provide libdbus. So packages that wqant to
link with libdbus will still need to select the origian dbus package.

> Its possible to use this package standalone (without the dbus
> package - if buildroot's systemd would not depend on dbus).
> This is sufficient to provide systemd's (d)bus functionality.
> To allow standalone usage, the necessary config files are
> copied and adopted over from dbus.

Sorry, but this explanation does not make sense to me...

So you mean you;d like to be able to uses sytemd with dbus-broker rather
than with the original dbus? In that case, you can change systemd'
Config.in to something like:

    select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER  # runtime

... in a followup patch

Also, the part about the config files should probably bne a separate
paragraph, otherwise it gets confusing...

[--SNIP--]
> diff --git a/package/dbusbroker/Config.in b/package/dbusbroker/Config.in
> new file mode 100644
> index 0000000000..aa628b4d5b
> --- /dev/null
> +++ b/package/dbusbroker/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_DBUSBROKER
> +	bool "dbusbroker"

The name as defined upstream is dbus-borker, so this is what we should
be using too:

    package/dbus-broker/
    BR2_PACKAGE_DBUS_BROKER

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU

Dependency on MMU should be first.

> +	depends on BR2_INIT_SYSTEMD
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_SYSTEMD

No, you can't select BR2_PACKAGE_SYSTEMD.

For one, it is forcibly enabled by BR2_INIT_SYSTEMD, so as you depend on
it, you areguaranteed it is availbe.

However, systemd does not look like it is a mandatory dependency of
dbus-broker. Indeed, systemd is only needed for the launcher, which is
optional.

So you should drop the depenency on BR2_INIT_SYSTEMD, and you must drop
the select on BR2_PACKAGE_SYSTEMD.

[--SNIP--]
> diff --git a/package/dbusbroker/dbusbroker.hash b/package/dbusbroker/dbusbroker.hash
> new file mode 100644
> index 0000000000..4eefe63725
> --- /dev/null
> +++ b/package/dbusbroker/dbusbroker.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256	95adfde56bce898c3b69eee0524732365e802348dd8189a35d5d00c30990dc81	dbus-broker-23.tar.xz
> +sha256	3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4	LICENSE

The convention is to use two spaces to spearate the fields now.

> diff --git a/package/dbusbroker/dbusbroker.mk b/package/dbusbroker/dbusbroker.mk
> new file mode 100644
> index 0000000000..71d13e5ebe
> --- /dev/null
> +++ b/package/dbusbroker/dbusbroker.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# dbusbroker
> +#
> +# Launching services is delegated to systemd so there is very little else
> +# needed. No separate user is necessary and no helper for launching.
> +#
> +# Service + Config files were copied over from dbus,
> +# uneeded / unecessary entries removed for clarity.
> +#
> +################################################################################
> +
> +DBUSBROKER_VERSION = 23
> +DBUSBROKER_SOURCE = dbus-broker-$(DBUSBROKER_VERSION).tar.xz
> +DBUSBROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUSBROKER_VERSION)
> +
> +DBUSBROKER_LICENSE = Apache-2.0
> +DBUSBROKER_LICENSE_FILES = LICENSE
> +# Compatibility Launcher requires this
> +DBUSBROKER_DEPENDENCIES += expat systemd

Do not use += on the first assignment of DEPENDENCIES (unless said first
assignment is in a conditional block).

However, systemd is not a mandatory requirement; it is only needed for
the launcher.

So:

    # BR2_COREUTILS_HOST_DEPENDENCY to be able to use ln --relative
    ifeq ($(BR2_PACKAGE_SYSTEMD),y)
    DBUS_BROKER_DEPENDENCIES += $(BR2_COREUTILS_HOST_DEPENDENCY) expat systemd
    DBUS_BROKER_CONF_OPTS += -Dlauncher=true
    else
    DBUS_BROKER_CONF_OPTS += -Dlauncher=false
    endif

    # Do not install units for system bus daemon if original dbus present
    ifeq ($(BR2_PACKAGE_DBUS),) 
    define DBUS_BROKER_INSTALL_INIT_SYSTEMD
        $(INSTALL) -D -m644 $(DBUSBROKER_PKGDIR)/dbus.socket \
            $(TARGET_DIR)/usr/lib/systemd/system/dbus.socket
        $(HOST_MAKE_ENV) ln -sf --relative \
            $(TARGET_DIR)/usr/lib/systemd/system/dbus.socket \
            $(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket
    endef
    endif

But you also need to provide startup script for the non-systemd case:

    # Do not install startup script for system bus daemon if original dbus present
    ifeq ($(BR2_PACKAGE_DBUS),)
    define DBUS_BROKER_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 0755 $(DBUSBROKER_PKGDIR)/S30dbus-broker \
            $(TARGET_DIR)/etc/init.d/S30dbus-broker
    endef
    endif

(use your imagination to come up with a good startup script; use
package/busybox/S01syslogd as reference.)

> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17),y)
> +DBUSBROKER_CONF_OPTS += -Dlinux-4-17=true

We want to explicitly disable that otherwise:

    else
    DBUSBROKER_CONF_OPTS += -Dlinux-4-17=false
    endif

> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +DBUSBROKER_DEPENDENCIES += libselinux
> +DBUSBROKER_CONF_OPTS += -Dselinux=true
> +else
> +DBUSBROKER_CONF_OPTS += -Dselinux=false
> +endif
> +
> +# Only install config and service files if dbus is not available
> +ifeq ($(BR2_PACKAGE_DBUS),)
> +define DBUSBROKER_INSTALL_TARGET_POST

This macro name is not explict. What about:
    DBUS_BROKER_INSTALL_CONFIG_FILES

> +	$(INSTALL) -D -m644 $(DBUSBROKER_PKGDIR)/dbus.socket $(TARGET_DIR)/usr/lib/systemd/system/dbus.socket
> +	ln -sf ../dbus.socket $(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket

The systemd-related files should only be installed if systemd is
enabled (see above).

> +	$(INSTALL) -D -m644 $(DBUSBROKER_PKGDIR)/session.conf $(TARGET_DIR)/usr/share/dbus-1/session.conf
> +	$(INSTALL) -D -m644 $(DBUSBROKER_PKGDIR)/system.conf $(TARGET_DIR)/usr/share/dbus-1/system.conf

Split lines that are too long.

Also, even if the original dbus is enabled (e.g. as the system bus, but
one uses dbus-broker as session bus), one may still need those files on
the target.

So we may want to unconditionally install both of them as:
    $(TARGET_DIR)/usr/share/dbus-1/system-broker.conf
    $(TARGET_DIR)/usr/share/dbus-1/session-broker.conf

... and when the origian dbus is not enabled, then we symlink those two
to be the default ones.

> +endef
> +
> +DBUSBROKER_POST_INSTALL_TARGET_HOOKS += DBUSBROKER_INSTALL_TARGET_POST
> +endif

I think we also need a user to run the system daemon, like is done with
the original dbus:

    define DBUS_BROKER_USERS
        dbus-broker -1 dbus-broker -1 * /var/run/dbus-broker - - dbus-broker messagebus user
    endef

> +$(eval $(meson-package))
> diff --git a/package/dbusbroker/session.conf b/package/dbusbroker/session.conf
> new file mode 100644
> index 0000000000..e4758fa218
> --- /dev/null
> +++ b/package/dbusbroker/session.conf
> @@ -0,0 +1,65 @@
[--SNIP--]

I would like that we have a very simple, basic session config file, that
does not filter anything for the owning user, and does not allow any
other user to connect.

People who need more complex configurations will have to provide their
own session config file.

> diff --git a/package/dbusbroker/system.conf b/package/dbusbroker/system.conf
> new file mode 100644
> index 0000000000..a1e8df7367
> --- /dev/null
> +++ b/package/dbusbroker/system.conf
> @@ -0,0 +1,120 @@
> +<!-- This configuration file controls the systemwide message bus.
> +     Add a system-local.conf and edit that rather than changing this
> +     file directly. -->
> +
> +<!-- Note that there are any number of ways you can hose yourself
> +     security-wise by screwing up this file; in particular, you
> +     probably don't want to listen on any more addresses, add any more
> +     auth mechanisms, run as a different user, etc. -->
> +
> +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-Bus Bus Configuration 1.0//EN"
> + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> +<busconfig>
> +
> +  <!-- Our well-known bus type, do not change this -->
> +  <type>system</type>

And we should use the 'dbus-broker' user:

      <!-- Run as special user -->
      <user>dbus-broker</user>

> +  <!-- Fork into daemon mode -->
> +  <fork/>

With systemd, isn't this playing badly with systemd's monitoring of
processes? I.e. this implies setting forking=tru in the unit for this
dameon, while systemd is usually very capable and spawning dameons in
the background.

> +  <!-- We use system service launching using a helper -->
> +  <standard_system_servicedirs/>
> +
> +  <!-- Enable logging to syslog -->
> +  <syslog/>
> +
> +  <policy context="default">
> +    <!-- All users can connect to system bus -->
> +    <allow user="*"/>
> +
> +    <!-- Holes must be punched in service configuration files for
> +         name ownership and sending method calls -->
> +    <deny own="*"/>
> +    <deny send_type="method_call"/>
> +
> +    <!-- Signals and reply messages (method returns, errors) are allowed
> +         by default -->
> +    <allow send_type="signal"/>
> +    <allow send_requested_reply="true" send_type="method_return"/>
> +    <allow send_requested_reply="true" send_type="error"/>
> +
> +    <!-- All messages may be received by default -->
> +    <allow receive_type="method_call"/>
> +    <allow receive_type="method_return"/>
> +    <allow receive_type="error"/>
> +    <allow receive_type="signal"/>
> +
> +    <!-- Allow anyone to talk to the message bus -->
> +    <allow send_destination="org.freedesktop.DBus"
> +           send_interface="org.freedesktop.DBus" />
> +    <allow send_destination="org.freedesktop.DBus"
> +           send_interface="org.freedesktop.DBus.Introspectable"/>
> +    <allow send_destination="org.freedesktop.DBus"
> +           send_interface="org.freedesktop.DBus.Properties"/>
> +    <!-- But disallow some specific bus services -->
> +    <deny send_destination="org.freedesktop.DBus"
> +          send_interface="org.freedesktop.DBus"
> +          send_member="UpdateActivationEnvironment"/>
> +    <deny send_destination="org.freedesktop.DBus"
> +          send_interface="org.freedesktop.DBus.Debug.Stats"/>
> +    <deny send_destination="org.freedesktop.DBus"
> +          send_interface="org.freedesktop.systemd1.Activator"/>
> +  </policy>
> +
> +  <!-- Only systemd, which runs as root, may report activation failures. -->
> +  <policy user="root">
> +    <allow send_destination="org.freedesktop.DBus"
> +           send_interface="org.freedesktop.systemd1.Activator"/>
> +  </policy>
> +
> +  <!-- root may monitor the system bus. -->
> +  <policy user="root">
> +    <allow send_destination="org.freedesktop.DBus"
> +           send_interface="org.freedesktop.DBus.Monitoring"/>
> +  </policy>
> +
> +  <!-- If the Stats interface was enabled@compile-time, root may use it.
> +       Copy this into system.local.conf or system.d/*.conf if you want to
> +       enable other privileged users to view statistics and debug info -->
> +  <policy user="root">
> +    <allow send_destination="org.freedesktop.DBus"
> +           send_interface="org.freedesktop.DBus.Debug.Stats"/>
> +  </policy>
> +
> +
> +  <!-- The defaults for these limits are hard-coded in dbus-daemon.
> +       Some clarifications:
> +       Times are in milliseconds (ms); 1000ms = 1 second
> +       133169152 bytes = 127 MiB
> +       33554432 bytes = 32 MiB
> +       150000ms = 2.5 minutes -->
> +  <!-- <limit name="max_incoming_bytes">133169152</limit> -->
> +  <!-- <limit name="max_incoming_unix_fds">64</limit> -->
> +  <!-- <limit name="max_outgoing_bytes">133169152</limit> -->
> +  <!-- <limit name="max_outgoing_unix_fds">64</limit> -->
> +  <!-- <limit name="max_message_size">33554432</limit> -->
> +  <!-- <limit name="max_message_unix_fds">16</limit> -->
> +  <!-- <limit name="service_start_timeout">25000</limit> -->
> +  <!-- <limit name="auth_timeout">5000</limit> -->
> +  <!-- <limit name="pending_fd_timeout">150000</limit> -->
> +  <!-- <limit name="max_completed_connections">2048</limit> -->
> +  <!-- <limit name="max_incomplete_connections">64</limit> -->
> +  <!-- <limit name="max_connections_per_user">256</limit> -->
> +  <!-- <limit name="max_pending_service_starts">512</limit> -->
> +  <!-- <limit name="max_names_per_connection">512</limit> -->
> +  <!-- <limit name="max_match_rules_per_connection">512</limit> -->
> +  <!-- <limit name="max_replies_per_connection">128</limit> -->
> +
> +  <!-- Config files are placed here that among other things, punch
> +       holes in the above policy for specific services. -->
> +  <includedir>system.d</includedir>
> +
> +  <includedir>/etc/dbus-1/system.d</includedir>
> +
> +  <!-- This is included last so local configuration can override what's
> +       in this standard file -->
> +  <include ignore_missing="yes">/etc/dbus-1/system-local.conf</include>
> +
> +  <include if_selinux_enabled="yes" selinux_root_relative="yes">contexts/dbus_contexts</include>
> +
> +</busconfig>
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
