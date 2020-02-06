From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  6 Feb 2020 10:40:39 +0100
Subject: [Buildroot] [PATCH] package/dbusbroker: new package
Message-ID: <20200206094040.251684-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add dbus-broker, which is a drop-in replacement
for the dbus-daemon.

Its possible to use this package standalone (without the dbus
package - if the dependency from systemd package is removed).
This is sufficient to provides systemd's (d)bus functionality.
For this usecase, the necessary config files are
copied over from dbus.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 DEVELOPERS                         |   1 +
 package/Config.in                  |   1 +
 package/dbusbroker/Config.in       |  23 ++++++
 package/dbusbroker/dbus.socket     |   5 ++
 package/dbusbroker/dbusbroker.hash |   3 +
 package/dbusbroker/dbusbroker.mk   |  41 ++++++++++
 package/dbusbroker/session.conf    |  65 ++++++++++++++++
 package/dbusbroker/system.conf     | 120 +++++++++++++++++++++++++++++
 8 files changed, 259 insertions(+)
 create mode 100644 package/dbusbroker/Config.in
 create mode 100644 package/dbusbroker/dbus.socket
 create mode 100644 package/dbusbroker/dbusbroker.hash
 create mode 100644 package/dbusbroker/dbusbroker.mk
 create mode 100644 package/dbusbroker/session.conf
 create mode 100644 package/dbusbroker/system.conf

diff --git a/DEVELOPERS b/DEVELOPERS
index d8ea23e0b3..a4790aab3c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1840,6 +1840,7 @@ F:	package/tpm-tools/
 F:	package/trousers/
 
 N:	Norbert Lange <nolange79@gmail.com>
+F:	package/dbusbroker/
 F:	package/tcf-agent/
 
 N:	Nylon Chen <nylon7@andestech.com>
diff --git a/package/Config.in b/package/Config.in
index bad4f9cba6..f81fbab9fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -433,6 +433,7 @@ endmenu
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
 	source "package/dbus-triggerd/Config.in"
+	source "package/dbusbroker/Config.in"
 	source "package/dfu-util/Config.in"
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
diff --git a/package/dbusbroker/Config.in b/package/dbusbroker/Config.in
new file mode 100644
index 0000000000..aa628b4d5b
--- /dev/null
+++ b/package/dbusbroker/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_DBUSBROKER
+	bool "dbusbroker"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_INIT_SYSTEMD
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_SYSTEMD
+	help
+	  Linux D-Bus Message Broker.
+
+	  The dbus-broker project is an implementation of a message bus as defined
+	  by the D-Bus specification. Its aim is to provide high performance and
+	  reliability, while keeping compatibility to the D-Bus reference
+	  implementation.
+
+	  It is exclusively written for Linux systems, and makes use of many modern
+	  features provided by recent linux kernel releases.
+
+	  https://github.com/bus1/dbus-broker/wiki
+
+comment "dbusbroker needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbusbroker/dbus.socket b/package/dbusbroker/dbus.socket
new file mode 100644
index 0000000000..5c373cf450
--- /dev/null
+++ b/package/dbusbroker/dbus.socket
@@ -0,0 +1,5 @@
+[Unit]
+Description=D-Bus System Message Bus Socket
+
+[Socket]
+ListenStream=/run/dbus/system_bus_socket
diff --git a/package/dbusbroker/dbusbroker.hash b/package/dbusbroker/dbusbroker.hash
new file mode 100644
index 0000000000..e198cd119d
--- /dev/null
+++ b/package/dbusbroker/dbusbroker.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e	dbus-broker-21.tar.xz
+sha256	3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4	LICENSE
diff --git a/package/dbusbroker/dbusbroker.mk b/package/dbusbroker/dbusbroker.mk
new file mode 100644
index 0000000000..ee69b3ab65
--- /dev/null
+++ b/package/dbusbroker/dbusbroker.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# dbusbroker
+#
+# Launching services is delegated to systemd so there is very little else
+# needed. No separate user is necessary and no helper for launching.
+#
+# Service + Config files were copied over from dbus,
+# uneeded / unecessary entries removed for clarity.
+#
+################################################################################
+
+DBUSBROKER_VERSION = 21
+DBUSBROKER_SOURCE = dbus-broker-$(DBUSBROKER_VERSION).tar.xz
+DBUSBROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUSBROKER_VERSION)
+
+DBUSBROKER_LICENSE = Apache-2.0
+DBUSBROKER_LICENSE_FILES = LICENSE
+# Compatibility Launcher requires this
+DBUSBROKER_DEPENDENCIES += expat systemd
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+DBUSBROKER_DEPENDENCIES += libselinux
+DBUSBROKER_CONF_OPTS += -Dselinux=true
+else
+DBUSBROKER_CONF_OPTS += -Dselinux=false
+endif
+
+# Only install config and service files if dbus is not available
+ifeq ($(BR2_PACKAGE_DBUS),)
+define DBUSBROKER_INSTALL_TARGET_POST
+	$(INSTALL) -D -m644 $(DBUSBROKER_PKGDIR)/dbus.socket $(TARGET_DIR)/usr/lib/systemd/system/dbus.socket
+	ln -sf ../dbus.socket $(TARGET_DIR)/usr/lib/systemd/system/sockets.target.wants/dbus.socket
+	$(INSTALL) -D -m644 $(DBUSBROKER_PKGDIR)/session.conf $(TARGET_DIR)/usr/share/dbus-1/session.conf
+	$(INSTALL) -D -m644 $(DBUSBROKER_PKGDIR)/system.conf $(TARGET_DIR)/usr/share/dbus-1/system.conf
+endef
+
+DBUSBROKER_POST_INSTALL_TARGET_HOOKS += DBUSBROKER_INSTALL_TARGET_POST
+endif
+
+$(eval $(meson-package))
diff --git a/package/dbusbroker/session.conf b/package/dbusbroker/session.conf
new file mode 100644
index 0000000000..e4758fa218
--- /dev/null
+++ b/package/dbusbroker/session.conf
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
diff --git a/package/dbusbroker/system.conf b/package/dbusbroker/system.conf
new file mode 100644
index 0000000000..a1e8df7367
--- /dev/null
+++ b/package/dbusbroker/system.conf
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
2.24.1
