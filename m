From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 28 Sep 2020 16:38:14 +0200
Subject: [Buildroot] [PATCH 1/4 v5] package/dbus-broker: new package
In-Reply-To: <CADYdroPKTquSLW-ZM-VVNZFULG6kFUWOp3GniYye9FOZwxZEgQ@mail.gmail.com>
References: <cover.1595072897.git.yann.morin.1998@free.fr>
 <4f1d10f9070e87ae1ed5139487762e221f2647a2.1595072897.git.yann.morin.1998@free.fr>
 <CADYdroO+RK7aj1q9cMf=k_bQYA-vtpkzTajzBH8R1_s_U1O79w@mail.gmail.com>
 <CADYdroNEwdno55UayP4kX7fz9qpT91Z0K3vtPTWJsFOOqxwYfg@mail.gmail.com>
 <CAFSsvmpZxenUdL8c7byaorGnYPuwdzKaRPVV1R=aW3ongE3wYw@mail.gmail.com>
 <CAFSsvmrOXXdL=F-xwk_7jtK=uhndmNTsF4V7kSaEVwTU2mZ7Ew@mail.gmail.com>
 <CADYdroPKTquSLW-ZM-VVNZFULG6kFUWOp3GniYye9FOZwxZEgQ@mail.gmail.com>
Message-ID: <CADYdroN-FVJgc5fCjDB6wZuW-VUS8gqAWpDmpSkzMEwZiFN-zA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 28. Sept. 2020 um 15:59 Uhr schrieb Norbert Lange <
nolange79@gmail.com>:

>
> Am Do., 30. Juli 2020 um 18:54 Uhr schrieb Adam Duskett <
> aduskett at gmail.com>:
>
>> One more thing:
>>
>> On Thu, Jul 30, 2020 at 9:51 AM Adam Duskett <aduskett@gmail.com> wrote:
>> >
>> > Hello;
>> >
>> > I tend to test all packages at the beginning with the following
>> > defconfig I have:
>> > BR2_aarch64=y
>> > BR2_TOOLCHAIN_EXTERNAL=y
>> > BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
>> > # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
>> > # BR2_TARGET_GENERIC_GETTY is not set
>> > # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
>> > # BR2_ENABLE_LOCALE_PURGE is not set
>> > # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>> > # BR2_PACKAGE_URANDOM_SCRIPTS is not set
>> > # BR2_TARGET_ROOTFS_TAR is not set
>> >
>> > I use the Linaro toolchain for two reasons:
>> > 1) It's much smaller than the standard Arm AArch64 2019.12
>> > 2) It has older headers (4.10) which can cause problems with packages
>> > I am testing.
>> >
>> > In this case, dbus-broker requires kernel headers >= 4.13, which the
>> > linaro toolchain does
>> > not provide
>> >
>> > See https://github.com/bus1/dbus-broker/issues/119
>> >
>> > As such, I would suggest adding a dependency on
>> > BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
>> >
>> > When testing with the standard Arm AArch64 2019.12 toolchain,
>> > dbus-broker built fine.
>> >
>> > Thanks!
>> > Adam
>> >
>> > On Sat, Jul 18, 2020 at 7:27 AM Norbert Lange <nolange79@gmail.com>
>> wrote:
>> > >
>> > > Am Sa., 18. Juli 2020 um 16:26 Uhr schrieb Norbert Lange <
>> nolange79 at gmail.com>:
>> > > >
>> > > > Am Sa., 18. Juli 2020 um 13:48 Uhr schrieb Yann E. MORIN
>> > > > <yann.morin.1998@free.fr>:
>> > > > >
>> > > > > From: Norbert Lange <nolange79@gmail.com>
>> > > > >
>> > > > > dbus-broker is an alternate implementation of a dbus dameon. It
>> can be
>> > > > > used as a drop-in replacement for the system bus daemon, as well
>> as the
>> > > > > session bus daemon.
>> > > > >
>> > > > > dbus-broker is (basically, and as far as we're concerned in
>> Buildroot)
>> > > > > split in two components:
>> > > > >
>> > > > >   - the actual message bus daemon, that relays messages across
>> clients
>> > > > >
>> > > > >   - a launcher, which is responsible for setting various aspects
>> of the
>> > > > >     bus, like setting the policy et al. and opening the socket(s)
>> the
>> > > > >     message bus daemon will have to listen on...
>> > > > >
>> > > > > The launcher can only be used in a systemd setup (it makes heavy
>> use of
>> > > > > systemd facilities), while the message bus is generic. However,
>> the
>> > > > > message bus daemon is useless without a launcher. There does not
>> exist a
>> > > > > non-systemd launcher, which makes dbus-broker actually a
>> systemd-only
>> > > > > package; this can be revisited when/if a non-systemd launcher
>> appears.
>> > > > >
>> > > > > There are two cases:
>> > > > >
>> > > > >  1. original dbus disabled
>> > > > >
>> > > > >     Here, we install the config files and systemd socket
>> activation
>> > > > >     units; dbus-broker provides the system and sessions bus
>> daemons.
>> > > > >
>> > > > >  2. original dbus enabled
>> > > > >
>> > > > >     In this case, we do not install the config files and systemd
>> socket
>> > > > >     activation units, or define a user: they all are provided by
>> the
>> > > > >     original dbus, and we piggy-back on those.
>> > > > >
>> > > > >     In this situation, the default system and sessions message
>> bus are
>> > > > >     the original dbus; dbus-broker is not enabled.
>> > > > >
>> > > > >     However, users may opt-in to use dbus-broker in a few ways:
>> > > > >       - at build-time: by providing drop-in units or presets in an
>> > > > >         overlay or custom skeleton;
>> > > > >       - at build-time: by calling systemctl enable/disable from a
>> > > > >         post-build script;
>> > > > >       - at runtime (on a RW filesystem): by calling systemctl
>> > > > >         enable/disable
>> > > > >
>> > > > > Note about the user: the path to the system bus socket is a
>> so-called
>> > > > > "well-known location": it is expected to be there, by spec.
>> Moving it
>> > > > > elsewhere is going to break existing programs. So, the user
>> running the
>> > > > > system bus daemon must be able to create that socket.
>> > > > >
>> > > > > As we may have two packages providing a system bus daemon, they
>> have to
>> > > > > be both able to create the socket, and thus must both be able to
>> write
>> > > > > in the directory containing the socket. And since they can be
>> switched
>> > > > > at runtime, they must be running as the same user.
>> > > > >
>> > > > > We can't just reference the original dbus user, so we duplicate
>> the
>> > > > > entry. What is important, is that the user be named 'dbus', as
>> that's
>> > > > > what we use in both cases.
>> > > > >
>> > > > > Finally, the licensing terms are pretty trivial for dbus-broker
>> itself,
>> > > > > but it makes use of third-party code that it inherits as git
>> submodules
>> > > > > (that are bundled in the release archive). Thus the licensing is
>> a bit
>> > > > > convoluted... The third-party codes claim to be licensed as
>> "Apache-2.0
>> > > > > and LGP-2.1+" in their AUTHORS files, but at the same time claim
>> > > > > "**Apache-2.0** OR **LGPL-2.1-or-later**" in their README files.
>> The
>> > > > > individual source files (that are used) do not seem to have any
>> > > > > licensing header to clarify the situation. So we represent the
>> situation
>> > > > > with "Apache-2.0 and/or LGPL-2.1+".
>> > > > >
>> > > > > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>> > > > > [yann.morin.1998 at free.fr:
>> > > > >   - don't select systemd; depend on it instead
>> > > > >   - only install config files and systemd units without original
>> dbus
>> > > > >   - install a user to run the message bus as
>> > > > >   - fix licensing info
>> > > > >   - entirely reword and extend the commit log
>> > > > >   - add myself to DEVELOPERS as well
>> > > > > ]
>> > > > > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>> > > > >
>> > > > > ---
>> > > > > Changes v4 -> v5  (Yann, after review by Norbert):
>> > > > >   - define the user to run as directly in system.conf
>> > > > >   - as a consequence, drop the unit drop-in
>> > > > >   - add myself to DEVELOPERS as well
>> > > > >
>> > > > > Changes v3 -> v4  (Yann, respining after review by Norbert):
>> > > > >   - drop the non-systemd case
>> > > > >   - drop the launcher option
>> > > > >   - reinstate BR2_COREUTILS_HOST_DEPENDENCY and ln --relative
>> > > > >   - reinstate the user, explain it
>> > > > >
>> > > > > Changes v2 -> v3  (Norbert, respinning after Yann):
>> > > > >   - add an own config entry for dbus-broker-launch
>> > > > >     enabled by default if systemd init is used
>> > > > >   - undo BR2_COREUTILS_HOST_DEPENDENCY
>> > > > >   - undo adding dbus user - never used by this package
>> > > > >   - add condtional audit dependency
>> > > > >   - cleanup conditional logic a bit
>> > > > >
>> > > > > Changes v1 -> v2 (Yann):
>> > > > >   - make launcher conditional
>> > > > >   - don't select systemd; don't depend on it either
>> > > > >   - don't install systemd units without systemd
>> > > > >   - only install config files and systemd units wihtout original
>> dbus
>> > > > >   - rename hooks with meaningful names
>> > > > >   - fix licensing info
>> > > > >   - entirely reword and extend the commit log
>> > > > > ---
>> > > > >  DEVELOPERS                           |   2 +
>> > > > >  package/Config.in                    |   1 +
>> > > > >  package/dbus-broker/Config.in        |  22 +++++
>> > > > >  package/dbus-broker/dbus-broker.hash |   3 +
>> > > > >  package/dbus-broker/dbus-broker.mk   |  77 +++++++++++++++++
>> > > > >  package/dbus-broker/dbus.socket      |   5 ++
>> > > > >  package/dbus-broker/session.conf     |  65 ++++++++++++++
>> > > > >  package/dbus-broker/system.conf      | 123
>> +++++++++++++++++++++++++++
>> > > > >  8 files changed, 298 insertions(+)
>> > > > >  create mode 100644 package/dbus-broker/Config.in
>> > > > >  create mode 100644 package/dbus-broker/dbus-broker.hash
>> > > > >  create mode 100644 package/dbus-broker/dbus-broker.mk
>> > > > >  create mode 100644 package/dbus-broker/dbus.socket
>> > > > >  create mode 100644 package/dbus-broker/session.conf
>> > > > >  create mode 100644 package/dbus-broker/system.conf
>> > > > >
>> > > > > diff --git a/DEVELOPERS b/DEVELOPERS
>> > > > > index f91314a13a..4f89276f80 100644
>> > > > > --- a/DEVELOPERS
>> > > > > +++ b/DEVELOPERS
>> > > > > @@ -1900,6 +1900,7 @@ F:        package/tpm-tools/
>> > > > >  F:     package/trousers/
>> > > > >
>> > > > >  N:     Norbert Lange <nolange79@gmail.com>
>> > > > > +F:     package/dbus-broker/
>> > > > >  F:     package/tcf-agent/
>> > > > >
>> > > > >  N:     Nylon Chen <nylon7@andestech.com>
>> > > > > @@ -2641,6 +2642,7 @@ F:        package/asterisk/
>> > > > >  F:     package/cegui/
>> > > > >  F:     package/dahdi-linux/
>> > > > >  F:     package/dahdi-tools/
>> > > > > +F:     package/dbus-broker/
>> > > > >  F:     package/dtc/
>> > > > >  F:     package/dtv-scan-tables/
>> > > > >  F:     package/dvb-apps/
>> > > > > diff --git a/package/Config.in b/package/Config.in
>> > > > > index aafaa312a1..b42c444902 100644
>> > > > > --- a/package/Config.in
>> > > > > +++ b/package/Config.in
>> > > > > @@ -434,6 +434,7 @@ endmenu
>> > > > >         source "package/dahdi-linux/Config.in"
>> > > > >         source "package/dahdi-tools/Config.in"
>> > > > >         source "package/dbus/Config.in"
>> > > > > +       source "package/dbus-broker/Config.in"
>> > > > >         source "package/dbus-cpp/Config.in"
>> > > > >         source "package/dbus-glib/Config.in"
>> > > > >         source "package/dbus-python/Config.in"
>> > > > > diff --git a/package/dbus-broker/Config.in
>> b/package/dbus-broker/Config.in
>> > > > > new file mode 100644
>> > > > > index 0000000000..30d8b27280
>> > > > > --- /dev/null
>> > > > > +++ b/package/dbus-broker/Config.in
>> > > > > @@ -0,0 +1,22 @@
>> > > > > +config BR2_PACKAGE_DBUS_BROKER
>> > > > > +       bool "dbus-broker"
>> > > > > +       depends on BR2_USE_MMU
>> > > > > +       depends on BR2_TOOLCHAIN_HAS_THREADS
>> > > > > +       depends on BR2_PACKAGE_SYSTEMD
>> > > > > +       select BR2_PACKAGE_EXPAT
>> > > > > +       help
>> > > > > +         Linux D-Bus Message Broker.
>> > > > > +
>> > > > > +         The dbus-broker project is an implementation of a
>> message bus
>> > > > > +         as defined by the D-Bus specification. Its aim is to
>> provide
>> > > > > +         high performance and reliability, while keeping
>> compatibility
>> > > > > +         to the D-Bus reference implementation.
>> > > > > +
>> > > > > +         It is exclusively written for Linux systems, and makes
>> use of
>> > > > > +         many modern features provided by recent linux kernel
>> releases.
>> > > > > +
>> > > > > +         https://github.com/bus1/dbus-broker/wiki
>> > > > > +
>> > > > > +comment "dbusbroker needs systemd and a toolchain w/ threads"
>> s/dbusbroker/dbus-broker/g
>>
>> > > > > +       depends on BR2_USE_MMU
>> > > > > +       depends on !BR2_TOOLCHAIN_HAS_THREADS ||
>> !BR2_PACKAGE_SYSTEMD
>> > > > > diff --git a/package/dbus-broker/dbus-broker.hash
>> b/package/dbus-broker/dbus-broker.hash
>> > > > > new file mode 100644
>> > > > > index 0000000000..b8d631767f
>> > > > > --- /dev/null
>> > > > > +++ b/package/dbus-broker/dbus-broker.hash
>> > > > > @@ -0,0 +1,3 @@
>> > > > > +# Locally calculated
>> > > > > +sha256
>> 95adfde56bce898c3b69eee0524732365e802348dd8189a35d5d00c30990dc81
>> dbus-broker-23.tar.xz
>> > > > > +sha256
>> 3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
>> > > > > diff --git a/package/dbus-broker/dbus-broker.mk
>> b/package/dbus-broker/dbus-broker.mk
>> > > > > new file mode 100644
>> > > > > index 0000000000..8b13c03d72
>> > > > > --- /dev/null
>> > > > > +++ b/package/dbus-broker/dbus-broker.mk
>> > > > > @@ -0,0 +1,77 @@
>> > > > >
>> +################################################################################
>> > > > > +#
>> > > > > +# dbus-broker
>> > > > > +#
>> > > > >
>> +################################################################################
>> > > > > +
>> > > > > +DBUS_BROKER_VERSION = 23
>> > > > > +DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
>> > > > > +DBUS_BROKER_SITE =
>> https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
>> > > > > +
>> > > > > +# For the third-party code, the licensing legla-info is
>> inconsistent between
>> > > > > +# the AUTHORS and README, so keep both
>> > > > > +DBUS_BROKER_LICENSE = \
>> > > > > +       Apache-2.0, \
>> > > > > +       Apache-2.0 and/or LGPL-2.1+ (c-dvar, c-ini, c-list,
>> c-rbtree, c-shquote, c-stdaux, c-utf8)
>> > > > > +DBUS_BROKER_LICENSE_FILES = \
>> > > > > +       LICENSE \
>> > > > > +       subprojects/c-dvar/AUTHORS subprojects/c-dvar/README.md \
>> > > > > +       subprojects/c-ini/AUTHORS subprojects/c-ini/README.md \
>> > > > > +       subprojects/c-list/AUTHORS subprojects/c-list/README.md \
>> > > > > +       subprojects/c-rbtree/AUTHORS
>> subprojects/c-rbtree/README.md \
>> > > > > +       subprojects/c-shquote/AUTHORS
>> subprojects/c-shquote/README.md \
>> > > > > +       subprojects/c-stdaux/AUTHORS
>> subprojects/c-stdaux/README.md \
>> > > > > +       subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
>> > > > > +
>> > > > > +DBUS_BROKER_DEPENDENCIES = expat systemd
>> > > > > +DBUS_BROKER_CONF_OPTS = -Dlauncher=true
>> > > > > +
>> > > > > +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17),y)
>> > > > > +DBUS_BROKER_CONF_OPTS += -Dlinux-4-17=true
>> > > > > +else
>> > > > > +DBUS_BROKER_CONF_OPTS += -Dlinux-4-17=false
>> > > > > +endif
>> > > > > +
>> > > > > +ifeq ($(BR2_PACKAGE_AUDIT),y)
>> > > > > +DBUS_BROKER_DEPENDENCIES += audit
>> > > > > +DBUS_BROKER_CONF_OPTS += -Daudit=true
>> > > > > +else
>> > > > > +DBUS_BROKER_CONF_OPTS += -Daudit=false
>> > > > > +endif
>> > > > > +
>> > > > > +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>> > > > > +DBUS_BROKER_DEPENDENCIES += libselinux
>> > > > > +DBUS_BROKER_CONF_OPTS += -Dselinux=true
>> > > > > +else
>> > > > > +DBUS_BROKER_CONF_OPTS += -Dselinux=false
>> > > > > +endif
>> > > > > +
>> > > > > +# We must be using the same user as the original dbus, so we can
>> share
>> > > > > +# the home directory and create a socket there. As a
>> consequence, the
>> > > > > +# username and groupname must be dbus:dbus, and they both need
>> to have
>> > > > > +# the same home.
>> > > > > +define DBUS_BROKER_USERS
>> > > > > +       dbus -1 dbus -1 * /var/run/dbus - dbus DBus messagebus
>> user
>>
>
use /run/dbus


> > > > > +endef
>> > > >
>> > > > The basic issue is, that we read the same configuration file. The
>> sockets/dir is
>> > > > owned by root and connection is done as root.
>> > > > But it's fine as-is, there's always potential for improvement.
>> > > >
>> > > > > +
>> > > > > +# Only install units for system bus daemon socket if original
>> dbus is not present
>> > > > > +# Only install config and service files if original dbus is not
>> present
>> > > > > +#
>> > > > > +# Note: BR2_COREUTILS_HOST_DEPENDENCY to be able to use ln
>> --relative
>> > > > > +ifeq ($(BR2_PACKAGE_DBUS),)
>> > > > > +DBUS_BROKER_DEPENDENCIES += $(BR2_COREUTILS_HOST_DEPENDENCY)
>> > > > > +
>> > > > > +define DBUS_BROKER_INSTALL_INIT_SYSTEMD
>> > > > > +       $(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/session.conf \
>> > > > > +               $(TARGET_DIR)/usr/share/dbus-1/session.conf
>> > > > > +       $(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/system.conf \
>> > > > > +               $(TARGET_DIR)/usr/share/dbus-1/system.conf
>> > > > > +       $(INSTALL) -D -m 0644 $(DBUS_BROKER_PKGDIR)/dbus.socket \
>> > > > > +               $(TARGET_DIR)/usr/lib/systemd/system/dbus.socket
>> > > > > +       $(HOST_MAKE_ENV) ln -sf --relative \
>> > > > > +               $(TARGET_DIR)/usr/lib/systemd/system/dbus.socket \
>> > > > > +
>>  $(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket
>> > > > > +endef
>> > > > > +endif # !BR2_PACKAGE_DBUS
>> > > > > +
>> > > > > +$(eval $(meson-package))
>> > > > > diff --git a/package/dbus-broker/dbus.socket
>> b/package/dbus-broker/dbus.socket
>> > > > > new file mode 100644
>> > > > > index 0000000000..5c373cf450
>> > > > > --- /dev/null
>> > > > > +++ b/package/dbus-broker/dbus.socket
>> > > > > @@ -0,0 +1,5 @@
>> > > > > +[Unit]
>> > > > > +Description=D-Bus System Message Bus Socket
>> > > > > +
>> > > > > +[Socket]
>> > > > > +ListenStream=/run/dbus/system_bus_socket
>> > > > > diff --git a/package/dbus-broker/session.conf
>> b/package/dbus-broker/session.conf
>> > > > > new file mode 100644
>> > > > > index 0000000000..e4758fa218
>> > > > > --- /dev/null
>> > > > > +++ b/package/dbus-broker/session.conf
>> > > > > @@ -0,0 +1,65 @@
>> > > > > +<!-- This configuration file controls the per-user-login-session
>> message bus.
>> > > > > +     Add a session-local.conf and edit that rather than changing
>> this
>> > > > > +     file directly. -->
>> > > > > +
>> > > > > +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-Bus Bus
>> Configuration 1.0//EN"
>> > > > > + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
>> > > > > +<busconfig>
>> > > > > +  <!-- Our well-known bus type, don't change this -->
>> > > > > +  <type>session</type>
>> > > > > +
>> > > > > +  <!-- If we fork, keep the user's original umask to avoid
>> affecting
>> > > > > +       the behavior of child processes. -->
>> > > > > +  <keep_umask/>
>> > > > > +
>> > > > > +  <standard_session_servicedirs />
>> > > > > +
>> > > > > +  <policy context="default">
>> > > > > +    <!-- Allow everything to be sent -->
>> > > > > +    <allow send_destination="*" eavesdrop="true"/>
>> > > > > +    <!-- Allow everything to be received -->
>> > > > > +    <allow eavesdrop="true"/>
>> > > > > +    <!-- Allow anyone to own anything -->
>> > > > > +    <allow own="*"/>
>> > > > > +  </policy>
>> > > > > +
>> > > > > +  <!-- Config files are placed here that among other things,
>> > > > > +       further restrict the above policy for specific services.
>> -->
>> > > > > +  <includedir>session.d</includedir>
>> > > > > +
>> > > > > +  <includedir>/etc/dbus-1/session.d</includedir>
>> > > > > +
>> > > > > +  <!-- This is included last so local configuration can override
>> what's
>> > > > > +       in this standard file -->
>> > > > > +  <include
>> ignore_missing="yes">/etc/dbus-1/session-local.conf</include>
>> > > > > +
>> > > > > +  <include if_selinux_enabled="yes"
>> selinux_root_relative="yes">contexts/dbus_contexts</include>
>> > > > > +
>> > > > > +  <!-- For the session bus, override the default relatively-low
>> limits
>> > > > > +       with essentially infinite limits, since the bus is just
>> running
>> > > > > +       as the user anyway, using up bus resources is not
>> something we need
>> > > > > +       to worry about. In some cases, we do set the limits lower
>> than
>> > > > > +       "all available memory" if exceeding the limit is almost
>> certainly a bug,
>> > > > > +       having the bus enforce a limit is nicer than a huge
>> memory leak. But the
>> > > > > +       intent is that these limits should never be hit. -->
>> > > > > +
>> > > > > +  <!-- the memory limits are 1G instead of say 4G because they
>> can't exceed 32-bit signed int max -->
>> > > > > +  <limit name="max_incoming_bytes">1000000000</limit>
>> > > > > +  <limit name="max_incoming_unix_fds">250000000</limit>
>> > > > > +  <limit name="max_outgoing_bytes">1000000000</limit>
>> > > > > +  <limit name="max_outgoing_unix_fds">250000000</limit>
>> > > > > +  <limit name="max_message_size">1000000000</limit>
>> > > > > +  <!-- We do not override max_message_unix_fds here since the
>> in-kernel
>> > > > > +       limit is also relatively low -->
>> > > > > +  <limit name="service_start_timeout">120000</limit>
>> > > > > +  <limit name="auth_timeout">240000</limit>
>> > > > > +  <limit name="pending_fd_timeout">150000</limit>
>> > > > > +  <limit name="max_completed_connections">100000</limit>
>> > > > > +  <limit name="max_incomplete_connections">10000</limit>
>> > > > > +  <limit name="max_connections_per_user">100000</limit>
>> > > > > +  <limit name="max_pending_service_starts">10000</limit>
>> > > > > +  <limit name="max_names_per_connection">50000</limit>
>> > > > > +  <limit name="max_match_rules_per_connection">50000</limit>
>> > > > > +  <limit name="max_replies_per_connection">50000</limit>
>> > > > > +
>> > > > > +</busconfig>
>> > > > > diff --git a/package/dbus-broker/system.conf
>> b/package/dbus-broker/system.conf
>> > > > > new file mode 100644
>> > > > > index 0000000000..4b17fbd90e
>> > > > > --- /dev/null
>> > > > > +++ b/package/dbus-broker/system.conf
>> > > > > @@ -0,0 +1,123 @@
>> > > > > +<!-- This configuration file controls the systemwide message bus.
>> > > > > +     Add a system-local.conf and edit that rather than changing
>> this
>> > > > > +     file directly. -->
>> > > > > +
>> > > > > +<!-- Note that there are any number of ways you can hose yourself
>> > > > > +     security-wise by screwing up this file; in particular, you
>> > > > > +     probably don't want to listen on any more addresses, add
>> any more
>> > > > > +     auth mechanisms, run as a different user, etc. -->
>> > > > > +
>> > > > > +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-Bus Bus
>> Configuration 1.0//EN"
>> > > > > + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
>> > > > > +<busconfig>
>> > > > > +
>> > > > > +  <!-- Our well-known bus type, do not change this -->
>> > > > > +  <type>system</type>
>> > > > > +
>> > > > > +  <!-- Fork into daemon mode -->
>> > > > > +  <fork/>
>> > > > > +
>> > > > > +  <!-- Run as special user -->
>> > > > > +  <user>dbus</user>
>> > > > > +
>> > > > > +  <!-- We use system service launching using a helper -->
>> > > > > +  <standard_system_servicedirs/>
>> > > > > +
>> > > > > +  <!-- Enable logging to syslog -->
>> > > > > +  <syslog/>
>> > > > > +
>> > > > > +  <policy context="default">
>> > > > > +    <!-- All users can connect to system bus -->
>> > > > > +    <allow user="*"/>
>> > > > > +
>> > > > > +    <!-- Holes must be punched in service configuration files for
>> > > > > +         name ownership and sending method calls -->
>> > > > > +    <deny own="*"/>
>> > > > > +    <deny send_type="method_call"/>
>> > > > > +
>> > > > > +    <!-- Signals and reply messages (method returns, errors) are
>> allowed
>> > > > > +         by default -->
>> > > > > +    <allow send_type="signal"/>
>> > > > > +    <allow send_requested_reply="true"
>> send_type="method_return"/>
>> > > > > +    <allow send_requested_reply="true" send_type="error"/>
>> > > > > +
>> > > > > +    <!-- All messages may be received by default -->
>> > > > > +    <allow receive_type="method_call"/>
>> > > > > +    <allow receive_type="method_return"/>
>> > > > > +    <allow receive_type="error"/>
>> > > > > +    <allow receive_type="signal"/>
>> > > > > +
>> > > > > +    <!-- Allow anyone to talk to the message bus -->
>> > > > > +    <allow send_destination="org.freedesktop.DBus"
>> > > > > +           send_interface="org.freedesktop.DBus" />
>> > > > > +    <allow send_destination="org.freedesktop.DBus"
>> > > > > +           send_interface="org.freedesktop.DBus.Introspectable"/>
>> > > > > +    <allow send_destination="org.freedesktop.DBus"
>> > > > > +           send_interface="org.freedesktop.DBus.Properties"/>
>> > > > > +    <!-- But disallow some specific bus services -->
>> > > > > +    <deny send_destination="org.freedesktop.DBus"
>> > > > > +          send_interface="org.freedesktop.DBus"
>> > > > > +          send_member="UpdateActivationEnvironment"/>
>> > > > > +    <deny send_destination="org.freedesktop.DBus"
>> > > > > +          send_interface="org.freedesktop.DBus.Debug.Stats"/>
>> > > > > +    <deny send_destination="org.freedesktop.DBus"
>> > > > > +          send_interface="org.freedesktop.systemd1.Activator"/>
>> > > > > +  </policy>
>> > > > > +
>> > > > > +  <!-- Only systemd, which runs as root, may report activation
>> failures. -->
>> > > > > +  <policy user="root">
>> > > > > +    <allow send_destination="org.freedesktop.DBus"
>> > > > > +           send_interface="org.freedesktop.systemd1.Activator"/>
>> > > > > +  </policy>
>> > > > > +
>> > > > > +  <!-- root may monitor the system bus. -->
>> > > > > +  <policy user="root">
>> > > > > +    <allow send_destination="org.freedesktop.DBus"
>> > > > > +           send_interface="org.freedesktop.DBus.Monitoring"/>
>> > > > > +  </policy>
>> > > > > +
>> > > > > +  <!-- If the Stats interface was enabled@compile-time, root
>> may use it.
>> > > > > +       Copy this into system.local.conf or system.d/*.conf if
>> you want to
>> > > > > +       enable other privileged users to view statistics and
>> debug info -->
>> > > > > +  <policy user="root">
>> > > > > +    <allow send_destination="org.freedesktop.DBus"
>> > > > > +           send_interface="org.freedesktop.DBus.Debug.Stats"/>
>> > > > > +  </policy>
>> > > > > +
>> > > > > +
>> > > > > +  <!-- The defaults for these limits are hard-coded in
>> dbus-daemon.
>> > > > > +       Some clarifications:
>> > > > > +       Times are in milliseconds (ms); 1000ms = 1 second
>> > > > > +       133169152 bytes = 127 MiB
>> > > > > +       33554432 bytes = 32 MiB
>> > > > > +       150000ms = 2.5 minutes -->
>> > > > > +  <!-- <limit name="max_incoming_bytes">133169152</limit> -->
>> > > > > +  <!-- <limit name="max_incoming_unix_fds">64</limit> -->
>> > > > > +  <!-- <limit name="max_outgoing_bytes">133169152</limit> -->
>> > > > > +  <!-- <limit name="max_outgoing_unix_fds">64</limit> -->
>> > > > > +  <!-- <limit name="max_message_size">33554432</limit> -->
>> > > > > +  <!-- <limit name="max_message_unix_fds">16</limit> -->
>> > > > > +  <!-- <limit name="service_start_timeout">25000</limit> -->
>> > > > > +  <!-- <limit name="auth_timeout">5000</limit> -->
>> > > > > +  <!-- <limit name="pending_fd_timeout">150000</limit> -->
>> > > > > +  <!-- <limit name="max_completed_connections">2048</limit> -->
>> > > > > +  <!-- <limit name="max_incomplete_connections">64</limit> -->
>> > > > > +  <!-- <limit name="max_connections_per_user">256</limit> -->
>> > > > > +  <!-- <limit name="max_pending_service_starts">512</limit> -->
>> > > > > +  <!-- <limit name="max_names_per_connection">512</limit> -->
>> > > > > +  <!-- <limit name="max_match_rules_per_connection">512</limit>
>> -->
>> > > > > +  <!-- <limit name="max_replies_per_connection">128</limit> -->
>> > > > > +
>> > > > > +  <!-- Config files are placed here that among other things,
>> punch
>> > > > > +       holes in the above policy for specific services. -->
>> > > > > +  <includedir>system.d</includedir>
>> > > > > +
>> > > > > +  <includedir>/etc/dbus-1/system.d</includedir>
>> > > > > +
>> > > > > +  <!-- This is included last so local configuration can override
>> what's
>> > > > > +       in this standard file -->
>> > > > > +  <include
>> ignore_missing="yes">/etc/dbus-1/system-local.conf</include>
>> > > > > +
>> > > > > +  <include if_selinux_enabled="yes"
>> selinux_root_relative="yes">contexts/dbus_contexts</include>
>> > > > > +
>> > > > > +</busconfig>
>> > > > > --
>> > > > > 2.20.1
>> > > > >
>> > > >
>> > > > Regards, Norbert
>> > >
>> > > Forgot:
>> > > Reviewed-by: Norbert Lange <nolange79@gmail.com>
>> > > _______________________________________________
>> > > buildroot mailing list
>> > > buildroot at busybox.net
>> > > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> Ping,
>
> where are we with this series, seemed like this is good to go?
> (new upstream release btw)
>
> Norbert
>

FYI, with nss-systemd plugin working, it's possible to remove the dbus
user/group
from the system configuration. Place this in the service file:

User=dbus
Group=dbus
DynamicUser=true
ExecStart=!/usr/bin/dbus-broker-launch --scope system --audit
ExecReload=!/usr/bin/busctl call org.freedesktop.DBus /org/freedesktop/DBus
org.freedesktop.DBus ReloadConfig

Norbert
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200928/9f65a306/attachment.html>
