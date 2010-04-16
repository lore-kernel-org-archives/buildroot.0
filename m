From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 16 Apr 2010 18:37:21 +0200
Subject: [Buildroot] transmission 1.74 fails to build
In-Reply-To: <20100416164248.0f8890a5@surf>
References: <y2pe7c6a05e1004160014vf65ef3b9z1ade66ebe4bab63a@mail.gmail.com>
	<20100416164248.0f8890a5@surf>
Message-ID: <p2je7c6a05e1004160937mfce6921bu36df256e24c019b5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

finally I can test. Thanks for suggestion and thanks for making buildroot.
I saw in bugzilla that transmission is postponed to 2010.5. Following patch
add transmission client to buildroot.

Based on work jasaw81 at yahoo.com.au which make initial support
for transmission (v. 1.74). Just added more dependencies used in newest
version ( v. 1.92). Compile tested only.


Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in                           |    2 +-
 package/transmission/Config.in              |   23 +++++++
 package/transmission/settings.json.template |   52 ++++++++++++++
 package/transmission/transmission-init      |   88 ++++++++++++++++++++++++
 package/transmission/transmission.mk        |   96 +++++++++++++++++++++++++++
 package/transmission/transmissionmkdir      |   29 ++++++++
 6 files changed, 289 insertions(+), 1 deletions(-)
 create mode 100755 package/transmission/Config.in
 create mode 100755 package/transmission/settings.json.template
 create mode 100755 package/transmission/transmission-init
 create mode 100755 package/transmission/transmission.mk
 create mode 100755 package/transmission/transmissionmkdir

diff --git a/package/Config.in b/package/Config.in
index 6104903..b4def2f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -424,7 +424,7 @@ source "package/wget/Config.in"
 endif
 source "package/wireless-tools/Config.in"
 source "package/wpa_supplicant/Config.in"
-
+source "package/transmission/Config.in"
 endmenu

 menu "Package managers"
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
new file mode 100755
index 0000000..f42c79d
--- /dev/null
+++ b/package/transmission/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_TRANSMISSION
+	bool "transmission"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBEVENT
+	default n
+	help
+	  transmission - Transmission BitTorrent Client
+
+config BR2_PACKAGE_TRANSMISSION_CLI
+	bool "transmissioncli"
+	depends on BR2_PACKAGE_TRANSMISSION
+	default no
+	help
+	  Install transmission command line interface.
+
+config BR2_PACKAGE_TRANSMISSION_REMOTE
+	bool "transmission-remote"
+	depends on BR2_PACKAGE_TRANSMISSION
+	default no
+	help
+	  Install transmission remote management tool.
diff --git a/package/transmission/settings.json.template
b/package/transmission/settings.json.template
new file mode 100755
index 0000000..f21a853
--- /dev/null
+++ b/package/transmission/settings.json.template
@@ -0,0 +1,52 @@
+{
+    "alt-speed-down": 50,
+    "alt-speed-enabled": false,
+    "alt-speed-time-begin": 540,
+    "alt-speed-time-day": 127,
+    "alt-speed-time-enabled": false,
+    "alt-speed-time-end": 1020,
+    "alt-speed-up": 50,
+    "bind-address-ipv4": "0.0.0.0",
+    "bind-address-ipv6": "::",
+    "blocklist-enabled": false,
+    "dht-enabled": true,
+    "download-dir": "{DOWNLOAD_DIR}",
+    "watch-dir": "{WATCH_DIR}",
+    "watch-dir-enabled": false,
+    "encryption": 1,
+    "lazy-bitfield-enabled": true,
+    "message-level": 2,
+    "open-file-limit": 32,
+    "peer-limit-global": 240,
+    "peer-limit-per-torrent": 60,
+    "peer-port": 51413,
+    "peer-port-random-high": 65535,
+    "peer-port-random-low": 49152,
+    "peer-port-random-on-start": false,
+    "peer-socket-tos": 0,
+    "pex-enabled": true,
+    "port-forwarding-enabled": true,
+    "preallocation": 2,
+    "proxy": "",
+    "proxy-auth-enabled": false,
+    "proxy-auth-password": "",
+    "proxy-auth-username": "",
+    "proxy-enabled": false,
+    "proxy-port": 80,
+    "proxy-type": 0,
+    "ratio-limit": 2.0000,
+    "ratio-limit-enabled": false,
+    "rpc-authentication-required": false,
+    "rpc-bind-address": "0.0.0.0",
+    "rpc-enabled": true,
+    "rpc-password": "",
+    "rpc-port": 9091,
+    "rpc-username": "",
+    "rpc-whitelist": "127.0.0.1",
+    "rpc-whitelist-enabled": false,
+    "speed-limit-down": 100,
+    "speed-limit-down-enabled": false,
+    "speed-limit-up": 100,
+    "speed-limit-up-enabled": false,
+    "upload-slots-per-torrent": 14
+}
diff --git a/package/transmission/transmission-init
b/package/transmission/transmission-init
new file mode 100755
index 0000000..9c15aae
--- /dev/null
+++ b/package/transmission/transmission-init
@@ -0,0 +1,88 @@
+#!/bin/sh
+if [ ! -z "$2" ]; then
+	TRANSMISSION_ARGS="$2"
+else
+	TRANSMISSION_ARGS=""
+fi
+
+if [ ! -z "$3" ]; then
+	NET_INTERFACE="$3"
+else
+	NET_INTERFACE=""
+fi
+
+DESC="bittorrent client"
+NAME=transmission-daemon
+DAEMON=$(which $NAME)
+SCRIPTNAME=/etc/init.d/$0
+
+[ -x "$DAEMON" ] || exit 0
+
+do_start()
+{
+	if [ ! -z "$NET_INTERFACE" ]; then
+		# poll network interface
+		IFCONFIG_OUTPUT=`ifconfig $NET_INTERFACE`
+		IP_ADDR=`expr match "$IFCONFIG_OUTPUT" '.*inet
addr:\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*'`
+		while [ -z "$IP_ADDR" ]
+		do
+			sleep 5
+			IFCONFIG_OUTPUT=`ifconfig $NET_INTERFACE`
+			IP_ADDR=`expr match "$IFCONFIG_OUTPUT" '.*inet
addr:\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*'`
+		done
+	fi
+	if [ -z "$TRANSMISSION_ARGS" ]; then
+		start-stop-daemon -S -b -x ${DAEMON}
+	else
+		start-stop-daemon -S -b -x ${DAEMON} -- ${TRANSMISSION_ARGS}
+	fi
+	return $?
+}
+
+do_stop()
+{
+	start-stop-daemon -K -b -x ${DAEMON}
+	return $?
+}
+
+case "$1" in
+	start)
+		echo "Starting $DESC" "$NAME..."
+		do_start
+		case "$?" in
+			0) echo "   Start $DESC $NAME: SUCCESS" ;;
+			*)
+				echo "   Start $DESC $NAME: FAILED"
+				exit 3
+				;;
+		esac
+		;;
+	stop)
+		echo "Stopping $DESC $NAME..."
+		do_stop
+		case "$?" in
+			0) echo "   Stop $DESC $NAME: SUCCESS" ;;
+			*)
+				echo "   Stop $DESC $NAME: FAILED"
+				exit 3
+				;;
+		esac
+		;;
+	restart|force-reload)
+		echo "Restarting $DESC $NAME..."
+		do_stop
+		sleep 2
+		do_start
+		case "$?" in
+			0) echo "   Restart $DESC $NAME: SUCCESS" ;;
+			*)
+				echo "   Restart $DESC $NAME: FAILED: couldn't start $NAME"
+				exit 3
+				;;
+		esac
+		;;
+	*)
+		echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+		exit 3
+		;;
+esac
diff --git a/package/transmission/transmission.mk
b/package/transmission/transmission.mk
new file mode 100755
index 0000000..930c2aa
--- /dev/null
+++ b/package/transmission/transmission.mk
@@ -0,0 +1,96 @@
+#############################################################
+#
+# transmission
+#
+#############################################################
+TRANSMISSION_VERSION:=1.92
+TRANSMISSION_SOURCE:=transmission-$(TRANSMISSION_VERSION).tar.bz2
+TRANSMISSION_SITE:=http://mirrors.m0k.org/transmission/files/
+TRANSMISSION_DIR:=$(BUILD_DIR)/transmission-$(TRANSMISSION_VERSION)
+TRANSMISSION_CAT:=$(BZCAT)
+TRANSMISSION_BINARY:=daemon/transmission-daemon
+TRANSMISSION_TARGET_BINARY:=usr/sbin/transmission-daemon
+
+$(DL_DIR)/$(TRANSMISSION_SOURCE):
+	$(call DOWNLOAD,$(TRANSMISSION_SITE),$(TRANSMISSION_SOURCE))
+
+$(TRANSMISSION_DIR)/.unpacked: $(DL_DIR)/$(TRANSMISSION_SOURCE)
+	$(TRANSMISSION_CAT) $(DL_DIR)/$(TRANSMISSION_SOURCE) | tar -C
$(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh `dirname $(TRANSMISSION_DIR)`
package/transmission \*.patch
+	$(CONFIG_UPDATE) $(TRANSMISSION_DIR)
+	touch $@
+
+$(TRANSMISSION_DIR)/.configured: $(TRANSMISSION_DIR)/.unpacked
+	(cd $(TRANSMISSION_DIR); rm -rf config.cache; \
+		./autogen.sh; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--localstatedir=/var \
+		--disable-gtk \
+		--disable-libnotify \
+		--enable-cli \
+		--enable-daemon \
+		--with-zlib=$(STAGING_DIR) \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+	)
+	touch $@
+
+$(TRANSMISSION_DIR)/$(TRANSMISSION_BINARY): $(TRANSMISSION_DIR)/.configured
+	$(MAKE) -C $(TRANSMISSION_DIR)
+
+TRANSMISSION_TARGETS_ :=
+TRANSMISSION_TARGETS_y :=
+
+TRANSMISSION_TARGETS_$(BR2_PACKAGE_TRANSMISSION_REMOTE) +=
usr/sbin/transmission-remote
+TRANSMISSION_TARGETS_$(BR2_PACKAGE_TRANSMISSION_CLI) +=
usr/sbin/transmissioncli
+
+$(TARGET_DIR)/$(TRANSMISSION_TARGET_BINARY):
$(TRANSMISSION_DIR)/$(TRANSMISSION_BINARY)
+	mkdir -p $(TARGET_DIR)/usr/sbin
+	mkdir -p $(TARGET_DIR)/usr/share/transmission/web
+	mkdir -p $(TARGET_DIR)/etc/init.d
+	mkdir -p $(TARGET_DIR)/etc/transmission
+	cp -f $(TRANSMISSION_DIR)/$(TRANSMISSION_BINARY)
$(TARGET_DIR)/$(TRANSMISSION_TARGET_BINARY)
+	rsync -r --exclude=.svn $(TRANSMISSION_DIR)/web/
$(TARGET_DIR)/usr/share/transmission/web
+	$(INSTALL) -m 0755 package/transmission/transmission-init
$(TARGET_DIR)/etc/init.d/transmission-init
+	$(INSTALL) -m 0755 package/transmission/transmissionmkdir
$(TARGET_DIR)/usr/sbin/transmissionmkdir
+	$(INSTALL) -m 0755 -D package/transmission/settings.json.template
$(TARGET_DIR)/etc/transmission/settings.json.template
+ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
+	cp -f $(TRANSMISSION_DIR)/daemon/transmission-remote
$(TARGET_DIR)/usr/sbin/transmission-remote
+endif
+ifeq ($(BR2_PACKAGE_TRANSMISSION_CLI),y)
+	cp -f $(TRANSMISSION_DIR)/cli/transmissioncli
$(TARGET_DIR)/usr/sbin/transmissioncli
+endif
+
+transmission:host-pkg-config host-intltool  uclibc zlib openssl
libcurl libevent $(TARGET_DIR)/$(TRANSMISSION_TARGET_BINARY)
+
+transmission-source: $(DL_DIR)/$(TRANSMISSION_SOURCE)
+
+transmission-unpacked: $(TRANSMISSION_DIR)/.unpacked
+
+transmission-clean:
+	rm -f $(TARGET_DIR)/$(TRANSMISSION_TARGET_BINARY)
+	for file in $(TRANSMISSION_TARGETS_y); do \
+		rm -f $(TARGET_DIR)/$$file; \
+	done
+	rm -f $(TARGET_DIR)/etc/init.d/transmission-init
+	rm -f $(TARGET_DIR)/usr/sbin/transmissionmkdir
+	rm -rf $(TARGET_DIR)/etc/transmission
+	rm -rf $(TARGET_DIR)/usr/share/transmission/web
+	-$(MAKE) -C $(TRANSMISSION_DIR) clean
+
+transmission-dirclean:
+	rm -rf $(TRANSMISSION_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_TRANSMISSION),y)
+TARGETS+=transmission
+endif
diff --git a/package/transmission/transmissionmkdir
b/package/transmission/transmissionmkdir
new file mode 100755
index 0000000..df67f92
--- /dev/null
+++ b/package/transmission/transmissionmkdir
@@ -0,0 +1,29 @@
+#!/bin/sh
+[ -z "$1" ] && echo "Error: Directory to be made Transmission home
path must be specified" && exit 1
+[ ! -e "$1" ] && echo "Error: Directory does not exist" && exit 1
+[ ! -d "$1" ] && echo "Error: $1 is not a directory" && exit 1
+
+CONFIG_FILENAME="settings.json"
+TEMPLATE_FILEPATH="/etc/transmission"
+BLOCKLISTS_DIR="${1}/blocklists"
+RESUME_DIR="${1}/resume"
+TORRENTS_DIR="${1}/torrents"
+DOWNLOADS_DIR="${1}/downloads"
+WATCH_DIR="${1}/watch_torrents"
+
+mkdir -p ${DOWNLOADS_DIR}
+[ $? -ne 0 ] &&	echo "ERROR: Unable to create directory
${DOWNLOADS_DIR}" && exit 1
+mkdir -p ${WATCH_DIR}
+[ $? -ne 0 ] &&	echo "ERROR: Unable to create directory ${WATCH_DIR}" && exit 1
+mkdir -p ${TORRENTS_DIR}
+[ $? -ne 0 ] &&	echo "ERROR: Unable to create directory
${TORRENTS_DIR}" && exit 1
+mkdir -p ${RESUME_DIR}
+[ $? -ne 0 ] &&	echo "ERROR: Unable to create directory
${RESUME_DIR}" && exit 1
+mkdir -p ${BLOCKLISTS_DIR}
+[ $? -ne 0 ] &&	echo "ERROR: Unable to create directory
${BLOCKLISTS_DIR}" && exit 1
+
+sed \
+-e "s,{DOWNLOAD_DIR},"${DOWNLOADS_DIR}",g" \
+-e "s,{WATCH_DIR},"${WATCH_DIR}",g" \
+< ${TEMPLATE_FILEPATH}/${CONFIG_FILENAME}.template \
+> ${1}/${CONFIG_FILENAME}
-- 
1.6.4.2


On Fri, Apr 16, 2010 at 4:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 16 Apr 2010 09:14:41 +0200
> Belisko Marek <marek.belisko@gmail.com> wrote:
>
>> during playing with transmission package get following error:
>
> Unless I'm missing something, transmission is not packaged in Buildroot
> official source tree, is it ?
>
>> checking pkg-config is at least version 0.9.0... ./configure: line
>> 17710: /home/open-nandra/projects/buildroot/output/host/usr/bin/pkg-config:
>> No such file or directory
>
> host-pkg-config must be added to the list of dependencies of
> transmission in the .mk file. If you need details, could you share your
> package .mk file ?
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
