From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 16 Jan 2009 22:45:32 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090116224532.46E2F77586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-16 22:45:31 +0000 (Fri, 16 Jan 2009)
New Revision: 24892

Log:
Update buildall.sh script

Modified:
   trunk/buildroot/scripts/buildall.sh


Changeset:
Modified: trunk/buildroot/scripts/buildall.sh
===================================================================
--- trunk/buildroot/scripts/buildall.sh	2009-01-16 22:39:05 UTC (rev 24891)
+++ trunk/buildroot/scripts/buildall.sh	2009-01-16 22:45:31 UTC (rev 24892)
@@ -3,14 +3,49 @@
 
 function nmk()
 {
-	echo Not building $1
+	printf "mk	%-31s" "$1"
+	if [ "$2X" == "OKX" ] ; then
+		echo "DISABLED	$3 $4"
+	elif [ "$2X" == "FAILX" ] ; then
+		echo "DISABLED	$3 $4"
+	elif [ "$2X" == "BROKENX" ] ; then
+		echo "DISABLED	$3 $4"
+	elif [ "$2X" == "DISABLEDX" ] ; then
+		echo "DISABLED	$3 $4"
+	else
+		echo "DISABLED	$2 $3 $4"
+	fi
 }
 
 if	[ ${already-done} == 1 ] ; then
 nmk	busybox
+
 fi	# ********* already-done
 #**********************************************************************************
 
+# Enable HASERL
+sed -i s/.*BR2_PACKAGE_HASERL.*// .config
+echo "# BR2_PACKAGE_HASERL_VERSION_0_8_X is not set" >> .config
+echo "BR2_PACKAGE_HASERL_VERSION_0_9_X=y" >> .config
+echo "BR2_PACKAGE_HASERL_VERSION=\"0.9.25\"" >> .config
+echo "BR2_PACKAGE_HASERL=y" >> .config
+# Enable SSL
+sed -i s/.*BR2_PACKAGE_OPENSSL.*// .config
+echo "BR2_PACKAGE_OPENSSL=y" >> .config
+# Enable socat
+sed -i s/.*BR2_PACKAGE_SOCAT.*// .config
+echo "BR2_PACKAGE_SOCAT=y" >> .config
+echo "BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT=\"9\"" >> .config
+echo "BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT=\"11\"" >> .config
+echo "BR2_PACKAGE_SOCAT_PREDEF_CSIZE_SHIFT=\"4\"" >> .config
+# Enable Freetype
+sed -i s/.*BR2_PACKAGE_FREETYPE.*// .config
+echo "BR2_PACKAGE_FREETYPE=y" >> .config
+sed -i s/.*BR2_FREETYPE_VERSION.*// .config
+echo "# BR2_FREETYPE_VERSION_2_2_1 is not set" >> .config
+echo "BR2_FREETYPE_VERSION_2_3_7=y" >> .config
+echo "BR2_FREETYPE_VERSION=\"2.3.7\"" >> .config
+
 if	[ ${busybox-tools} == 1 ] ; then
 	mk	bash
 	mk	bzip2
@@ -37,7 +72,7 @@
 	mk	tar
 fi
 
-echo "Other development stuff"
+echo "# Other development stuff"
 mk	autoconf
 mk	automake
 mk	bison
@@ -47,19 +82,21 @@
 mk	dmalloc
 mk	fakeroot
 mk	gettext
+
+
 mk	libgmp
 mk	gperf
 mk	libmpfr
 mk	libtool
 mk	m4
-mk	mpatrol
+nmk	mpatrol		"Needs gdb to build, and GDB_VERSION is not defined"
 mk	oprofile
 mk	pkgconfig
 mk	readline
-mk	valgrind
+nmk	valgrind	"x86 specific"
 mk	pcre
 
-echo "Other stuff"
+echo "# Other stuff"
 mk	at
 mk	beecrypt
 mk	berkeleydb
@@ -93,7 +130,7 @@
 nmk	libfloat	# obsolete
 mk	libgcrypt
 mk	libgpg-error
-mk	libiconv
+nmk	libiconv
 mk	liblockfile
 mk	liboil
 mk	libsysfs
@@ -133,7 +170,7 @@
 	mk	which
 fi
 
-mk	database
+nmk	database			BROKEN "Need to enter subdirectory"
 
 if	[ ${busybox-tools} == 1 ] ; then
 	# busybox has an editor
@@ -144,7 +181,7 @@
 fi
 
 
-echo "Networking applications"
+echo "# Networking applications"
 mk	argus
 mk	avahi
 mk	axel
@@ -163,10 +200,11 @@
 mk	dnsmasq
 mk	dropbear
 mk	ethtool
+
 mk	haserl
 mk	hostap
 mk	ifplugd
-nmk	irda-utils	# makefile is broken
+mk	irda-utils	"Makefile is invalid"
 mk	iperf
 mk	iproute2
 mk	ipsec-tools
@@ -175,14 +213,13 @@
 mk	l2tp
 mk	libcgi
 mk	libcgicc
-mk	libcurl
 mk	libeXosip2
-mk	libosip2
 mk	libpcap
 mk	libupnp
 if	[ ${busybox-tools} == 1 ] ; then
 	mk	lighttpd
 fi
+
 mk	links
 mk	lrzsz
 mk	mdnsresponder
@@ -205,15 +242,22 @@
 mk	nfs-utils
 mk	ntp
 mk	olsr
+
+
+
 mk	ntpd
 mk	openssh
+
 mk	openssl
+mk	libcurl
+
 mk	openvpn
 mk	openswan
 mk	portmap
 mk	pppd
 mk	rp-pppoe
 mk	pptp-linux
+
 mk	proftpd
 nmk	quagga
 mk	rsync
@@ -238,6 +282,15 @@
 mk	vtun
 mk	webif
 
+mk	libsoup.mk
+mk	gssdp
+mk	gupnp
+mk	gupnp-av
+mk	gupnp-igd
+
+
+
+
 if	[ ${busybox-tools} == 1 ] ; then
 	mk	wget
 fi
@@ -245,7 +298,7 @@
 mk	wireless-tools
 
 
-echo "Hardware handling / blockdevices and filesystem maintenance"
+echo "# Hardware handling / blockdevices and filesystem maintenance"
 mk	acpid
 mk	dbus
 mk	dbus-glib
@@ -256,8 +309,11 @@
 mk	eeprog
 mk	fconfig
 mk	fis
+
 mk	libfuse
 mk	gadgetfs-test
+
+
 mk	hal
 if	[ ${busybox-tools} == 1 ] ; then
 	mk	hdparm
@@ -294,18 +350,24 @@
 mk	usbutils
 mk	wipe
 nmk	xfsprogs
-echo "	text rendering applications"
+
+echo "# Interpreter languages / Scripting"
+
+mk	lua
+mk	microperl
+mk	python
+mk	ruby
+mk	tcl
+mk	php
+
+echo "# 	text rendering applications"
 mk	dialog
 
 # Audio/Video support
-echo "Audio and video libraries and applications"
+echo "# Audio and video libraries and applications"
 mk	alsa-lib
 mk	alsa-utils
 mk	asterisk
-
-
-if	[ ${already-done} == 1 ] ; then
-
 mk	aumix
 mk	gstreamer
 mk	gst-plugins-base
@@ -326,14 +388,14 @@
 mk	vlc
 
 
-echo "Graphic libraries and applications (graphic/text)"
-echo "	text rendering libraries"
+echo "# Graphic libraries and applications (graphic/text)"
+echo "# 	text rendering libraries"
 mk	ncurses
 mk	newt
 mk	slang
 
 
-echo "	graphic libraries"
+echo "# 	graphic libraries"
 mk	directfb
 mk	directfb-examples
 mk	fbdump
@@ -353,14 +415,14 @@
 mk	sdl_ttf
 mk	tiff
 
-echo "busybox graphic applications"
-echo "--> May be broken in busybox"
+echo "# busybox graphic applications"
+echo "# --> May be broken in busybox"
 mk	fbv
 mk	fbset
 
-echo "other GUIs"
-mk	qte
-mk	qtopia4
+echo "# other GUIs"
+nmk	qte
+nmk	qtopia4
 
 
 if	[ ${X-WIN} == 1 ] ; then
@@ -368,8 +430,8 @@
 
 	mk	x11r7
 
-echo "X libraries and helper libraries"
-echo "maybe some of these should depend on !BR2_PACKAGE_XSERVER_none"
+echo "# X libraries and helper libraries"
+echo "# maybe some of these should depend on !BR2_PACKAGE_XSERVER_none"
 mk	atk
 mk	cairo
 mk	pango
@@ -392,12 +454,12 @@
 
 nmk	startup-notification		# Depends on X11
 
-echo "X Window managers"
+echo "# X Window managers"
 mk	matchbox
 mk	metacity
 mk	blackbox
 
-echo "X applications"
+echo "# X applications"
 mk	alsamixergui
 mk	dillo
 mk	docker
@@ -418,7 +480,7 @@
 mk	xvkbd
 fi
 
-echo "Compressors / decompressors"
+echo "# Compressors / decompressors"
 
 if	[ ${busybox-tools} == 1 ] ; then
 	mk	gzip
@@ -428,7 +490,7 @@
 mk	lzma-target
 mk	zlib
 
-echo "Package managers"
+echo "# Package managers"
 
 mk	ipkg
 nmk	portage
@@ -436,17 +498,8 @@
 	mk	rpm
 fi
 
-echo "Interpreter languages / Scripting"
+echo "# XML handling"
 
-mk	lua
-mk	microperl
-mk	python
-mk	ruby
-mk	tcl
-mk	php
-
-echo "XML handling"
-
 mk	expat
 mk	ezxml
 mk	libxml2
@@ -454,11 +507,10 @@
 mk	xerces
 
 
+
 # java support
 nmk	java
 
 # various games packages
 nmk	games
 
-fi	# ********* already-done
-#**********************************************************************************
