From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jun 2020 19:44:48 +0200
Subject: [Buildroot] [PATCH 1/3] package/dbusbroker: new package
In-Reply-To: <cover.1591551884.git.yann.morin.1998@free.fr>
References: <cover.1591551884.git.yann.morin.1998@free.fr>
Message-ID: <88d0b40006a9ff1d5ab458cdf478268c1ebf12a0.1591551884.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Norbert Lange <nolange79@gmail.com>

dbus-broker is an alternate implementation of a dbus dameon. It can be
used as a drop-in replacement for the system bus daemon, as well as the
session bus daemon.

dbus-broker is (basically, and as far as we're concerned in Buildroot)
split in two components:

  - the actual message bus daemon, that relays messages across clients

  - a launcher, which is responsible for setting various aspects of the
    bus, like settign the policy et al.

The launcher can only be used in a systemd setup (it makes heavy use of
systemd facilities), but the message bus is generic.

There are four cases:

 1. systemd disabled, original dbus disabled:
 2. systemd disabled, original dbus enabled

    In both situations, we do not build the launcer (it needs systemd).
    Obviously, we do not install systemd socket activation units either.
    We also do not install config files, because they are only used by
    the launcher; the message bus daemon can still be spawned by other
    means, though. Finally, we do not define a user, as we can't be
    spawned as a system bus daemon anyway.

    In this situation, dbus-broker can only be used as a session bus,
    but will require that it is spawned by another program that sets it
    up (there is not such program available in dbus-broker, but it could
    be provided by an out-of-tree package, e.g. in a br2-external).

 3. systemd enabled, original dbus disabled

    Here, we build the launcher, install the config files and systemd
    socket activation units, and define a user.

    In this situation, dbus-broker acts as the system bus daemon, and as
    the session bus daemon too.

 4. systemd enabled, original dbus enabled

    In this case, we build the launcher, bt do not install the config
    files and systemd socket activation units (both provided by the
    original dbus). We do not define the dbus user, as it is defined by
    the original dbus.

    In this situation, dbus-broker can only be used as the session bus
    daemon, for those UIDs that opt in to use it; the default session
    bus daemon is still the original dbus.

As for the licensing terms: they are pretty trivial for dbus-broker
itelf, but it makes use of third-party code that it inherits as git
submodules (that are bundeld in the release archive). Thus the licensing
is a bit convoluted... The thirdparty codes claim to be licensed as
"Apache-2.0 and LGP-2.1+)" in their AUTHORS files, but at the same time
claim *Apache-2.0** OR **LGPL-2.1-or-later** in their README files. The
individual source files (that are used) do not seem to have any
licensing header to clarify the situation.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998 at free.fr:
  - make launcher conditional
  - don't select systemd; don't depend on it either
  - don't install systemd units without systemd
  - only install config files and systemd units wihtout original dbus
  - rename hooks with meaningful names
  - fix licensing info
  - entirely reword and extend the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                           |   1 +
 package/Config.in                    |   1 +
 package/dbus-broker/Config.in        |  21 +++++
 package/dbus-broker/dbus-broker.hash |   3 +
 package/dbus-broker/dbus-broker.mk   |  71 ++++++++++++++++
 package/dbus-broker/dbus.socket      |   5 ++
 package/dbus-broker/session.conf     |  65 +++++++++++++++
 package/dbus-broker/system.conf      | 120 +++++++++++++++++++++++++++
 8 files changed, 287 insertions(+)
 create mode 100644 package/dbus-broker/Config.in
 create mode 100644 package/dbus-broker/dbus-broker.hash
 create mode 100644 package/dbus-broker/dbus-broker.mk
 create mode 100644 package/dbus-broker/dbus.socket
 create mode 100644 package/dbus-broker/session.conf
 create mode 100644 package/dbus-broker/system.conf

diff --git a/DEVELOPERS b/DEVELOPERS
index f697c96ce4..b21a4574e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1883,6 +1883,7 @@ F:	package/tpm-tools/
 F:	package/trousers/
 
 N:	Norbert Lange <nolange79@gmail.com>
+F:	package/dbus-broker/
 F:	package/tcf-agent/
 
 N:	Nylon Chen <nylon7@andestech.com>
diff --git a/package/Config.in b/package/Config.in
index 520e5d5570..cfb19dcfce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -432,6 +432,7 @@ endmenu
 	source "package/dahdi-linux/Config.in"
 	source "package/dahdi-tools/Config.in"
 	source "package/dbus/Config.in"
+	source "package/dbus-broker/Config.in"
 	source "package/dbus-cpp/Config.in"
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
diff --git a/package/dbus-broker/Config.in b/package/dbus-broker/Config.in
new file mode 100644
index 0000000000..8033848e73
--- /dev/null
+++ b/package/dbus-broker/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_DBUS_BROKER
+	bool "dbus-broker"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_EXPAT if BR2_PACKAGE_SYSTEMD
+	help
+	  Linux D-Bus Message Broker.
+
+	  The dbus-broker project is an implementation of a message bus
+	  as defined by the D-Bus specification. Its aim is to provide
+	  high performance and reliability, while keeping compatibility
+	  to the D-Bus reference implementation.
+
+	  It is exclusively written for Linux systems, and makes use of
+	  many modern features provided by recent linux kernel releases.
+
+	  https://github.com/bus1/dbus-broker/wiki
+
+comment "dbusbroker needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
new file mode 100644
index 0000000000..b8d631767f
--- /dev/null
+++ b/package/dbus-broker/dbus-broker.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  95adfde56bce898c3b69eee0524732365e802348dd8189a35d5d00c30990dc81  dbus-broker-23.tar.xz
+sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
new file mode 100644
index 0000000000..864209a046
--- /dev/null
+++ b/package/dbus-broker/dbus-broker.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# dbus-broker
+#
+################################################################################
+
+DBUS_BROKER_VERSION = 23
+DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
+DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
+
+DBUS_BROKER_LICENSE = \
+	Apache-2.0, \
+	Apache-2.0 and/or LGPL-2.1+ (c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
+DBUS_BROKER_LICENSE_FILES = \
+	LICENSE \
+	subprojects/c-dvar/AUTHORS subprojects/c-dvar/README.md \
+	subprojects/c-ini/AUTHORS subprojects/c-ini/README.md \
+	subprojects/c-list/AUTHORS subprojects/c-list/README.md \
+	subprojects/c-rbtree/AUTHORS subprojects/c-rbtree/README.md \
+	subprojects/c-shquote/AUTHORS subprojects/c-shquote/README.md \
+	subprojects/c-stdaux/AUTHORS subprojects/c-stdaux/README.md \
+	subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+DBUS_BROKER_DEPENDENCIES += expat systemd
+DBUS_BROKER_CONF_OPTS += -Dlauncher=true
+else
+DBUS_BROKER_CONF_OPTS += -Dlauncher=false
+endif
+
+# Do not install units for system bus daemon socket if original dbus present
+# Do not install config and service files if original dbus present
+# Note: BR2_COREUTILS_HOST_DEPENDENCY to be able to use ln --relative
+ifeq ($(BR2_PACKAGE_DBUS),)
+DBUS_BROKER_DEPENDENCIES += $(BR2_COREUTILS_HOST_DEPENDENCY)
+
+# We only need the user when systemd is enabled
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+define DBUS_BROKER_USERS
+	dbus -1 dbus -1 * /var/run/dbus - - DBus messagebus user
+endef
+endif # BR2_PACKAGE_SYSTEMD
+
+define DBUS_BROKER_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m644 $(DBUS_BROKER_PKGDIR)/session.conf \
+		$(TARGET_DIR)/usr/share/dbus-1/session.conf
+	$(INSTALL) -D -m644 $(DBUS_BROKER_PKGDIR)/system.conf \
+		$(TARGET_DIR)/usr/share/dbus-1/system.conf
+	$(INSTALL) -D -m644 $(DBUS_BROKER_PKGDIR)/dbus.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/dbus.socket
+	$(HOST_MAKE_ENV) ln -sf --relative \
+		$(TARGET_DIR)/usr/lib/systemd/system/dbus.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket
+endef
+
+endif # !BR2_PACKAGE_DBUS
+
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17),y)
+DBUS_BROKER_CONF_OPTS += -Dlinux-4-17=true
+else
+DBUS_BROKER_CONF_OPTS += -Dlinux-4-17=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+DBUS_BROKER_DEPENDENCIES += libselinux
+DBUS_BROKER_CONF_OPTS += -Dselinux=true
+else
+DBUS_BROKER_CONF_OPTS += -Dselinux=false
+endif
+
+$(eval $(meson-package))
diff --git a/package/dbus-broker/dbus.socket b/package/dbus-broker/dbus.socket
new file mode 100644
index 0000000000..5c373cf450
--- /dev/null
+++ b/package/dbus-broker/dbus.socket
@@ -0,0 +1,5 @@
+[Unit]
+Description=D-Bus System Message Bus Socket
+
+[Socket]
+ListenStream=/run/dbus/system_bus_socket
diff --git a/package/dbus-broker/session.conf b/package/dbus-broker/session.conf
new file mode 100644
index 0000000000..e4758fa218
--- /dev/null
+++ b/package/dbus-broker/session.conf
@@ -0,0 +1,65 @@
+<!-- This configuration file controls the per-user-login-session message bus.
+     Add a session-local.conf and edit that rather than changing this
+     file directly. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-Bus Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+  <!-- Our well-known bus type, don't change this -->
+  <type>session</type>
+
+  <!-- If we fork, keep the user's original umask to avoid affecting
+       the behavior of child processes. -->
+  <keep_umask/>
+
+  <standard_session_servicedirs />
+
+  <policy context="default">
+    <!-- Allow everything to be sent -->
+    <allow send_destination="*" eavesdrop="true"/>
+    <!-- Allow everything to be received -->
+    <allow eavesdrop="true"/>
+    <!-- Allow anyone to own anything -->
+    <allow own="*"/>
+  </policy>
+
+  <!-- Config files are placed here that among other things,
+       further restrict the above policy for specific services. -->
+  <includedir>session.d</includedir>
+
+  <includedir>/etc/dbus-1/session.d</includedir>
+
+  <!-- This is included last so local configuration can override what's
+       in this standard file -->
+  <include ignore_missing="yes">/etc/dbus-1/session-local.conf</include>
+
+  <include if_selinux_enabled="yes" selinux_root_relative="yes">contexts/dbus_contexts</include>
+
+  <!-- For the session bus, override the default relatively-low limits
+       with essentially infinite limits, since the bus is just running
+       as the user anyway, using up bus resources is not something we need
+       to worry about. In some cases, we do set the limits lower than
+       "all available memory" if exceeding the limit is almost certainly a bug,
+       having the bus enforce a limit is nicer than a huge memory leak. But the
+       intent is that these limits should never be hit. -->
+
+  <!-- the memory limits are 1G instead of say 4G because they can't exceed 32-bit signed int max -->
+  <limit name="max_incoming_bytes">1000000000</limit>
+  <limit name="max_incoming_unix_fds">250000000</limit>
+  <limit name="max_outgoing_bytes">1000000000</limit>
+  <limit name="max_outgoing_unix_fds">250000000</limit>
+  <limit name="max_message_size">1000000000</limit>
+  <!-- We do not override max_message_unix_fds here since the in-kernel
+       limit is also relatively low -->
+  <limit name="service_start_timeout">120000</limit>
+  <limit name="auth_timeout">240000</limit>
+  <limit name="pending_fd_timeout">150000</limit>
+  <limit name="max_completed_connections">100000</limit>
+  <limit name="max_incomplete_connections">10000</limit>
+  <limit name="max_connections_per_user">100000</limit>
+  <limit name="max_pending_service_starts">10000</limit>
+  <limit name="max_names_per_connection">50000</limit>
+  <limit name="max_match_rules_per_connection">50000</limit>
+  <limit name="max_replies_per_connection">50000</limit>
+
+</busconfig>
diff --git a/package/dbus-broker/system.conf b/package/dbus-broker/system.conf
new file mode 100644
index 0000000000..a1e8df7367
--- /dev/null
+++ b/package/dbus-broker/system.conf
@@ -0,0 +1,120 @@
+<!-- This configuration file controls the systemwide message bus.
+     Add a system-local.conf and edit that rather than changing this
+     file directly. -->
+
+<!-- Note that there are any number of ways you can hose yourself
+     security-wise by screwing up this file; in particular, you
+     probably don't want to listen on any more addresses, add any more
+     auth mechanisms, run as a different user, etc. -->
+
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-Bus Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+
+  <!-- Our well-known bus type, do not change this -->
+  <type>system</type>
+
+  <!-- Fork into daemon mode -->
+  <fork/>
+
+  <!-- We use system service launching using a helper -->
+  <standard_system_servicedirs/>
+
+  <!-- Enable logging to syslog -->
+  <syslog/>
+
+  <policy context="default">
+    <!-- All users can connect to system bus -->
+    <allow user="*"/>
+
+    <!-- Holes must be punched in service configuration files for
+         name ownership and sending method calls -->
+    <deny own="*"/>
+    <deny send_type="method_call"/>
+
+    <!-- Signals and reply messages (method returns, errors) are allowed
+         by default -->
+    <allow send_type="signal"/>
+    <allow send_requested_reply="true" send_type="method_return"/>
+    <allow send_requested_reply="true" send_type="error"/>
+
+    <!-- All messages may be received by default -->
+    <allow receive_type="method_call"/>
+    <allow receive_type="method_return"/>
+    <allow receive_type="error"/>
+    <allow receive_type="signal"/>
+
+    <!-- Allow anyone to talk to the message bus -->
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus" />
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus.Introspectable"/>
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus.Properties"/>
+    <!-- But disallow some specific bus services -->
+    <deny send_destination="org.freedesktop.DBus"
+          send_interface="org.freedesktop.DBus"
+          send_member="UpdateActivationEnvironment"/>
+    <deny send_destination="org.freedesktop.DBus"
+          send_interface="org.freedesktop.DBus.Debug.Stats"/>
+    <deny send_destination="org.freedesktop.DBus"
+          send_interface="org.freedesktop.systemd1.Activator"/>
+  </policy>
+
+  <!-- Only systemd, which runs as root, may report activation failures. -->
+  <policy user="root">
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.systemd1.Activator"/>
+  </policy>
+
+  <!-- root may monitor the system bus. -->
+  <policy user="root">
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus.Monitoring"/>
+  </policy>
+
+  <!-- If the Stats interface was enabled@compile-time, root may use it.
+       Copy this into system.local.conf or system.d/*.conf if you want to
+       enable other privileged users to view statistics and debug info -->
+  <policy user="root">
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus.Debug.Stats"/>
+  </policy>
+
+
+  <!-- The defaults for these limits are hard-coded in dbus-daemon.
+       Some clarifications:
+       Times are in milliseconds (ms); 1000ms = 1 second
+       133169152 bytes = 127 MiB
+       33554432 bytes = 32 MiB
+       150000ms = 2.5 minutes -->
+  <!-- <limit name="max_incoming_bytes">133169152</limit> -->
+  <!-- <limit name="max_incoming_unix_fds">64</limit> -->
+  <!-- <limit name="max_outgoing_bytes">133169152</limit> -->
+  <!-- <limit name="max_outgoing_unix_fds">64</limit> -->
+  <!-- <limit name="max_message_size">33554432</limit> -->
+  <!-- <limit name="max_message_unix_fds">16</limit> -->
+  <!-- <limit name="service_start_timeout">25000</limit> -->
+  <!-- <limit name="auth_timeout">5000</limit> -->
+  <!-- <limit name="pending_fd_timeout">150000</limit> -->
+  <!-- <limit name="max_completed_connections">2048</limit> -->
+  <!-- <limit name="max_incomplete_connections">64</limit> -->
+  <!-- <limit name="max_connections_per_user">256</limit> -->
+  <!-- <limit name="max_pending_service_starts">512</limit> -->
+  <!-- <limit name="max_names_per_connection">512</limit> -->
+  <!-- <limit name="max_match_rules_per_connection">512</limit> -->
+  <!-- <limit name="max_replies_per_connection">128</limit> -->
+
+  <!-- Config files are placed here that among other things, punch
+       holes in the above policy for specific services. -->
+  <includedir>system.d</includedir>
+
+  <includedir>/etc/dbus-1/system.d</includedir>
+
+  <!-- This is included last so local configuration can override what's
+       in this standard file -->
+  <include ignore_missing="yes">/etc/dbus-1/system-local.conf</include>
+
+  <include if_selinux_enabled="yes" selinux_root_relative="yes">contexts/dbus_contexts</include>
+
+</busconfig>
-- 
2.20.1
