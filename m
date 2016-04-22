From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Fri, 22 Apr 2016 16:57:08 -0400
Subject: [Buildroot] [PATCH v1 4/4] ring-daemon: new package
In-Reply-To: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <1461358628-9352-5-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ring is a secure and distributed voice, video and chat communication
platform that requires no centralized server. This package only
contains the communication daemon and an optional simple python
client which interacts with the daemon through DBus to manage accounts
and calls.
---
 package/Config.in                    |   1 +
 package/ring-daemon/Config.in        |  47 ++++++++++++++
 package/ring-daemon/dring.yml        | 118 +++++++++++++++++++++++++++++++++++
 package/ring-daemon/ring-client.init |  38 +++++++++++
 package/ring-daemon/ring-daemon.hash |   2 +
 package/ring-daemon/ring-daemon.init |  47 ++++++++++++++
 package/ring-daemon/ring-daemon.mk   |  66 ++++++++++++++++++++
 7 files changed, 319 insertions(+)
 create mode 100644 package/ring-daemon/Config.in
 create mode 100644 package/ring-daemon/dring.yml
 create mode 100644 package/ring-daemon/ring-client.init
 create mode 100644 package/ring-daemon/ring-daemon.hash
 create mode 100644 package/ring-daemon/ring-daemon.init
 create mode 100644 package/ring-daemon/ring-daemon.mk

diff --git a/package/Config.in b/package/Config.in
index 3796147..912f9d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1488,6 +1488,7 @@ endif
 	source "package/putty/Config.in"
 	source "package/quagga/Config.in"
 	source "package/radvd/Config.in"
+	source "package/ring-daemon/Config.in"
 	source "package/rp-pppoe/Config.in"
 	source "package/rpcbind/Config.in"
 	source "package/rsh-redone/Config.in"
diff --git a/package/ring-daemon/Config.in b/package/ring-daemon/Config.in
new file mode 100644
index 0000000..128a943
--- /dev/null
+++ b/package/ring-daemon/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_RING_DAEMON
+	bool "ring-daemon"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_DBUS_CPP
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_LIBSAMPLERATE
+	select BR2_PACKAGE_LIBSNDFILE
+	select BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_X264
+	select BR2_PACKAGE_OPENDHT
+	select BR2_PACKAGE_LIBPJSIP
+	select BR2_PACKAGE_YAML_CPP
+	help
+		ring-daemon package
+		Ring is a secure and distributed voice, video and chat communication
+		platform that requires no centralized server and leaves the power of
+		privacy in the hands of the user.
+
+			https://ring.cx
+
+comment "ring needs a toolchain w/ C++, thread, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP         \
+				|| !BR2_USE_WCHAR             \
+				|| !BR2_TOOLCHAIN_HAS_THREADS \
+				|| !BR2_TOOLCHAIN_HAS_SYNC_4  \
+				|| BR2_STATIC_LIBS            \
+				|| !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
+
+if BR2_PACKAGE_RING_DAEMON
+
+config BR2_PACKAGE_RING_SIMPLE_CLIENT
+	bool "ring-simple-client"
+	select BR2_PACKAGE_DBUS_PYTHON
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_GOBJECT
+	help
+		ring-simple client package
+		This is a Python CLI to manage Ring accounts and calls through DBus.
+
+endif
diff --git a/package/ring-daemon/dring.yml b/package/ring-daemon/dring.yml
new file mode 100644
index 0000000..6a59a3f
--- /dev/null
+++ b/package/ring-daemon/dring.yml
@@ -0,0 +1,118 @@
+accounts:
+  - id: IP2IP
+    alias: IP2IP
+    enable: true
+    type: SIP
+    allCodecs: 1/2/3/4/6/10/11/
+    mailbox: ""
+    autoAnswer: true
+    activeCallLimit: -1
+    ringtoneEnabled: true
+    ringtonePath: /usr/share/ring/ringtones/konga.ul
+    hasCustomUserAgent: false
+    useragent: Ring/2.3.0
+    username: ""
+    displayName: ""
+    hostname: ""
+    upnpEnabled: false
+    audioPortMax: 32766
+    audioPortMin: 16384
+    dtmfType: overrtp
+    interface: default
+    publishAddr: ""
+    publishPort: 5060
+    sameasLocal: true
+    videoEnabled: true
+    videoPortMax: 65534
+    videoPortMin: 49152
+    stunEnabled: false
+    stunServer: ""
+    turnEnabled: false
+    turnServer: ""
+    turnServerUserName: ""
+    turnServerPassword: ""
+    turnServerRealm: ""
+    port: 5060
+    credential:
+      []
+    keepAlive: false
+    presenceModuleEnabled: false
+    presencePublishSupported: false
+    presenceSubscribeSupported: false
+    registrationexpire: 60
+    serviceRoute: ""
+    tls:
+      calist: ""
+      certificate: ""
+      password: ""
+      privateKey: ""
+      enable: false
+      tlsPort: 5061
+      verifyClient: true
+      verifyServer: false
+      requireCertif: true
+      timeout: 2
+      ciphers: ""
+      method: TLSv1
+      server: ""
+    srtp:
+      keyExchange: ""
+      rtpFallback: false
+    zrtp:
+      displaySas: true
+      displaySasOnce: false
+      helloHashEnabled: true
+      notSuppWarning: true
+preferences:
+  historyLimit: 30
+  historyMaxCalls: 20
+  md5Hash: false
+  order: ""
+  portNum: 5060
+  registrationexpire: 180
+  searchBarDisplay: true
+  zoneToneChoice: North America
+voipPreferences:
+  playDtmf: true
+  playTones: true
+  pulseLength: 250
+  symmetric: true
+  zidFile: zidFile
+hooks:
+  iax2Enabled: false
+  numberAddPrefix: ""
+  sipEnabled: false
+  urlCommand: x-www-browser
+  urlSipField: X-ring-url
+audio:
+  alsa:
+    cardIn: 0
+    cardOut: 0
+    cardRing: 0
+    plugin: default
+    smplRate: 16000
+  alwaysRecording: false
+  audioApi: alsa
+  automaticGainControl: false
+  captureMuted: false
+  noiseReduce: false
+  playbackMuted: false
+  pulse:
+    devicePlayback: ""
+    deviceRecord: ""
+    deviceRingtone: ""
+  recordPath: ""
+  volumeMic: 1
+  volumeSpkr: 1
+video:
+  devices:
+    - video_size: 160x120
+      name: ""
+      channel: Camera 1
+      framerate: 2
+shortcuts:
+  hangUp: ""
+  pickUp: ""
+  popupWindow: ""
+  toggleHold: ""
+  togglePickupHangup: ""
diff --git a/package/ring-daemon/ring-client.init b/package/ring-daemon/ring-client.init
new file mode 100644
index 0000000..01208cd
--- /dev/null
+++ b/package/ring-daemon/ring-client.init
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+CLIENT_PID_FILE=/var/run/ring-client.pid
+DBUS_ADDR_FILE=/tmp/dbus-session-bus-address
+
+start() {
+	# load dbus address for ring session, create one if necessary
+	[ -f $DBUS_ADDR_FILE ] && . $DBUS_ADDR_FILE
+	[ -z $DBUS_SESSION_BUS_ADDRESS ] && \
+		{ echo "Ring-Client: couldn't load DBus address for"; return 1; }
+	export DBUS_SESSION_BUS_ADDRESS
+
+	# start auto-answer client
+	start-stop-daemon -b -S -m -p $CLIENT_PID_FILE -c ring:ring \
+		--exec /usr/bin/python -- /usr/share/ring/dringctrl/dringctrl.py --auto-answer
+	echo "Ring-Client: started"
+}
+
+stop() {
+	start-stop-daemon -K -p $CLIENT_PID_FILE
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		stop
+		start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		;;
+esac
+exit $RETVAL
diff --git a/package/ring-daemon/ring-daemon.hash b/package/ring-daemon/ring-daemon.hash
new file mode 100644
index 0000000..8143999
--- /dev/null
+++ b/package/ring-daemon/ring-daemon.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	15096f6d78127a284cfb7a05646cacb72e9385f087e8381fb21670e4644d4f59  ring-daemon-0cc44fa269ab1054c248b7f0383cb2249d2091aa.tar.gz
diff --git a/package/ring-daemon/ring-daemon.init b/package/ring-daemon/ring-daemon.init
new file mode 100644
index 0000000..7913a6b
--- /dev/null
+++ b/package/ring-daemon/ring-daemon.init
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+DAEMON_PID_FILE=/var/run/ring-daemon.pid
+DBUS_ADDR_FILE=/tmp/dbus-session-bus-address
+
+start() {
+	# add missing modules
+	modprobe ring
+
+	# load dbus address for ring session, create one if necessary
+	[ -f $DBUS_ADDR_FILE ] && . $DBUS_ADDR_FILE
+	if [ -z $DBUS_SESSION_BUS_ADDRESS ]; then
+		echo " Ring: start a DBus session."
+		su ring -c 'dbus-uuidgen --ensure; \
+					eval $(dbus-launch --sh-syntax); \
+					echo DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS > '$DBUS_ADDR_FILE
+		. $DBUS_ADDR_FILE
+	fi
+	export DBUS_SESSION_BUS_ADDRESS
+
+	# dring program needs $HOME to access user config
+	export HOME=/var/lib/ring
+	start-stop-daemon -b -S -m -p $DAEMON_PID_FILE -c ring:ring --exec /usr/libexec/dring -- -d
+	echo "Ring-Daemon: started"
+}
+
+stop() {
+	start-stop-daemon -K -p $DAEMON_PID_FILE
+	# this can take a while
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		stop
+		start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		;;
+esac
+exit $RETVAL
diff --git a/package/ring-daemon/ring-daemon.mk b/package/ring-daemon/ring-daemon.mk
new file mode 100644
index 0000000..2f1a07e
--- /dev/null
+++ b/package/ring-daemon/ring-daemon.mk
@@ -0,0 +1,66 @@
+################################################################################
+#
+# ring-daemon
+#
+################################################################################
+
+RING_DAEMON_VERSION = 0cc44fa269ab1054c248b7f0383cb2249d2091aa
+RING_DAEMON_SITE_METHOD = git
+RING_DAEMON_SITE = https://github.com/savoirfairelinux/ring-daemon.git
+RING_DAEMON_LICENSE = GPLv3
+RING_DAEMON_LICENSE_FILES = COPYING
+RING_DAEMON_AUTORECONF = YES
+RING_DAEMON_INSTALL_STAGING = YES
+RING_DAEMON_INSTALL_TARGET = YES
+RING_DAEMON_CONF_OPTS = \
+	--without-pulse     \
+	--without-gsm       \
+	--without-speex     \
+	--without-speexdsp  \
+	--disable-ipv6
+RING_DAEMON_CONF_ENV = \
+	GNUTLS_CFLAGS="-I$(STAGING_DIR)/usr/include" \
+	GNUTLS_LIBS="-I$(STAGING_DIR)/usr/lib -lgnutls -lnettle -lhogweed" \
+	DBUSCPP_CFLAGS="-I/usr/include/dbus-c++-1"
+RING_DAEMON_DEPENDENCIES = \
+	eudev        \
+	dbus-cpp     \
+	ffmpeg       \
+	gnutls       \
+	host-pkgconf \
+	jsoncpp    \
+	libpjsip    \
+	libsamplerate \
+	libsndfile   \
+	libupnp      \
+	opendht      \
+	yaml-cpp
+
+RING_DAEMON_POST_INSTALL_TARGET_HOOKS += RING_DAEMON_POST_INSTALL
+
+define RING_DAEMON_USERS
+	ring -1  ring -1 * /var/lib/ring /bin/sh ring,audio,video Ring user for both daemon and interface
+endef
+
+define RING_DAEMON_POST_INSTALL
+	# init script
+	$(INSTALL) -m 0755 -D package/ring-daemon/ring-daemon.init $(TARGET_DIR)/etc/init.d/S60ring-daemon
+	# default config
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/lib/ring/.config/ring/
+	$(INSTALL) -m 0644 -D package/ring-daemon/dring.yml $(TARGET_DIR)/var/lib/ring/.config/ring/
+
+endef
+
+ifeq ($(BR2_PACKAGE_RING_SIMPLE_CLIENT),y)
+RING_DAEMON_POST_INSTALL_TARGET_HOOKS += RING_CLIENT_INSTALL
+
+define RING_CLIENT_INSTALL
+	# init script
+	$(INSTALL) -m 0755 -D package/ring-daemon/ring-client.init $(TARGET_DIR)/etc/init.d/S61ring-client
+	# default config
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/ring/dringctrl
+	$(INSTALL) -m 0755 -D $(@D)/tools/dringctrl/* $(TARGET_DIR)/usr/share/ring/dringctrl
+endef
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
