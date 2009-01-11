From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 21:13:03 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: docs scripts
Message-ID: <20090111211304.1DE4876736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 21:13:02 +0000 (Sun, 11 Jan 2009)
New Revision: 24766

Log:
Add buildall script for testing many/most packages separately with build logs and documentation for this and mkpkg

Added:
   trunk/buildroot/docs/TESTING.html
   trunk/buildroot/scripts/buildall.sh


Changeset:
Added: trunk/buildroot/docs/TESTING.html
===================================================================
--- trunk/buildroot/docs/TESTING.html	                        (rev 0)
+++ trunk/buildroot/docs/TESTING.html	2009-01-11 21:13:02 UTC (rev 24766)
@@ -0,0 +1,67 @@
+<!--#include file="header.html" -->
+
+<h2>Testing Buildroot for an Architecture</h2>
+
+<p>
+<h4>scripts/mkpkg script</h4>
+If you want to test the build of a single package you can use the mkpkg script.
+</p>
+<p>
+<li>$ scripts/mkpkg PACKAGE</li> 
+</p>
+<p>
+Will make the board, and save the result in a log file.
+The log file resides in
+<li>$ log/OK/PACKAGE.log.OK</li> 
+</p>
+<p>
+if the build succeeds and in
+<li>$ log/OK/PACKAGE.log.FAIL</li>
+</p>
+<p>
+if it cannot complete.
+</p>
+
+<p>
+By creating an alias
+<li>alias mk=scripts/mkpkg</li>
+</p>
+<p>
+it is enough to type
+<li>$ mk PACKAGE</li> 
+</p>
+<p>
+mkpkg will only print out the <h4>{PACKAGE}......OK</h4> or <h4>{PACKAGE}......FAIL</h4>
+depending on success or failure making it easy to get an overview
+of the status of this specific architecture.
+</p>
+<p>
+It is recommended to build a simple board before running the test
+to get some basic things done.
+</p>
+<p>
+<h4>scripts/buildall.sh script</h4>
+</p>
+<p>
+By running this script you will run scripts/mkpkg on
+a lot of the packages available in Buildroot.
+</p>
+<p>
+You need to run the script while in the TOP directory.
+I.E: Where you typically run make.
+</p>
+<p>
+There are a few lacking, for no very good reason,
+but these can be easily added.
+</p>
+<p>
+Note that some packages will not build properly
+if you do not enable them using makeconfig.
+</p>
+<p>
+Examples are:
+<li>freetype</li>
+<li>socat</li>
+</p>
+
+<!--#include file="footer.html" -->

Added: trunk/buildroot/scripts/buildall.sh
===================================================================
--- trunk/buildroot/scripts/buildall.sh	                        (rev 0)
+++ trunk/buildroot/scripts/buildall.sh	2009-01-11 21:13:02 UTC (rev 24766)
@@ -0,0 +1,460 @@
+#!/bin/sh
+alias mk="scripts/mkpkg"
+
+function nmk()
+{
+	echo Not building $1
+}
+
+if	[ ${already-done} == 1 ] ; then
+
+
+nmk	busybox
+
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	bash
+	mk	bzip2
+	mk	coreutils
+	mk	diffutils
+	mk	findutils
+fi
+
+mk	flex
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	gawk
+fi
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	grep
+fi
+
+mk	make
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	patch
+	mk	sed
+	mk	tar
+fi
+
+echo "Other development stuff"
+mk	autoconf
+mk	automake
+mk	bison
+
+mk	cvs
+mk	distcc
+mk	dmalloc
+mk	fakeroot
+mk	gettext
+mk	libgmp
+mk	gperf
+mk	libmpfr
+mk	libtool
+mk	m4
+mk	mpatrol
+mk	oprofile
+mk	pkgconfig
+mk	readline
+mk	valgrind
+mk	pcre
+
+echo "Other stuff"
+mk	at
+mk	beecrypt
+mk	berkeleydb
+mk	bsdiff
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	bootutils
+fi
+
+mk	cups
+mk	customize
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	dash
+fi
+
+mk	file
+mk	gamin
+mk	icu
+mk	kexec
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	less
+fi
+
+mk	libconfig
+mk	libconfuse
+mk	libdaemon
+mk	libelf
+mk	libevent
+mk	libfloat
+mk	libgcrypt
+mk	libgpg-error
+mk	libiconv
+mk	liblockfile
+mk	liboil
+mk	libsysfs
+mk	lockfile-progs
+mk	logrotate
+mk	lsof
+nmk	ltp-testsuite
+mk	ltrace
+mk	ltt
+mk	memstat
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	module-init-tools
+	mk	modutils
+fi
+
+mk	ng-spice-rework
+mk	popt
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	procps
+fi
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	psmisc
+fi
+
+mk	screen
+mk	startup-notification
+mk	strace
+mk	sudo
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	sysklogd
+# busybox has init and the runit stuff
+	mk	sysvinit
+	mk	tinylogin
+	mk	util-linux
+	mk	which
+fi
+
+mk	database
+
+if	[ ${busybox-tools} == 1 ] ; then
+	# busybox has an editor
+
+	# text editors
+	mk	editors
+
+fi
+
+
+echo "Networking applications"
+mk	argus
+mk	avahi
+mk	axel
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	boa
+fi
+
+mk	bind
+mk	bridge
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	dhcp
+fi
+
+mk	dnsmasq
+mk	dropbear
+mk	ethtool
+mk	haserl
+mk	hostap
+mk	ifplugd
+mk	irda-utils
+mk	iperf
+mk	iproute2
+mk	ipsec-tools
+mk	iptables
+mk	kismet
+mk	l2tp
+mk	libcgi
+mk	libcgicc
+mk	libcurl
+mk	libeXosip2
+mk	libosip2
+mk	libpcap
+mk	libupnp
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	lighttpd
+fi
+mk	links
+mk	lrzsz
+mk	mdnsresponder
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	microcom
+fi
+mk	mii-diag
+mk	mrouted
+mk	mutt
+mk	nbd
+mk	ncftp
+mk	neon
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	netcat
+fi
+mk	netkitbase
+mk	netkittelnet
+mk	netplug
+mk	netsnmp
+mk	nfs-utils
+mk	ntp
+mk	olsr
+mk	openntpd
+mk	openssh
+mk	openssl
+mk	openvpn
+mk	openswan
+mk	portmap
+mk	pppd
+mk	rp-pppoe
+mk	pptp-linux
+mk	proftpd
+nmk	quagga
+mk	rsync
+mk	samba
+mk	socat
+mk	stunnel
+mk	tcpdump
+mk	tftpd
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	thttpd
+	mk	tinyhttpd
+fi
+mk	tn5250
+mk	ttcp
+if	[ ${busybox-tools} == 1 ] ; then
+	# ATTENTION! This was merged into busybox!
+	nmk	udhcp
+fi
+mk	udpcast
+mk	vpnc
+mk	vsftpd
+mk	vtun
+mk	webif
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	wget
+fi
+
+mk	wireless-tools
+
+
+echo "Hardware handling / blockdevices and filesystem maintenance"
+mk	acpid
+mk	dbus
+mk	dbus-glib
+mk	devmem2
+mk	dm
+mk	dmraid
+mk	e2fsprogs
+mk	eeprog
+mk	fconfig
+mk	fis
+mk	libfuse
+mk	gadgetfs-test
+mk	hal
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	hdparm
+	mk	hotplug
+fi
+mk	hwdata
+mk	i2c-tools
+mk	input-tools
+mk	iostat
+mk	libaio
+mk	libraw1394
+mk	libusb
+mk	lm-sensors
+mk	lvm2
+mk	mdadm
+mk	memtester
+mk	mkdosfs
+mk	mtd
+mk	ntfs-3g
+mk	pciutils
+mk	pcmcia
+mk	raidtools
+mk	setserial
+if	[ ${busybox-tools} == 1 ] ; then
+	# busybox has fdisk
+	mk	sfdisk
+fi
+mk	smartmontools
+if	[ ${busybox-tools} == 1 ] ; then
+	# mdev
+	mk	udev
+fi
+mk	usbmount
+mk	usbutils
+mk	wipe
+nmk	xfsprogs
+echo "	text rendering applications"
+mk	dialog
+
+# Audio/Video support
+echo "Audio and video libraries and applications"
+mk	alsa-lib
+mk	alsa-utils
+mk	asterisk
+fi	# ********* already-done
+#**********************************************************************************
+mk	aumix
+mk	gstreamer
+mk	gst-plugins-base
+mk	gst-plugins-good
+mk	gst-plugins-ugly
+mk	libid3tag
+mk	libmad
+mk	libmpd
+mk	libogg
+mk	libsndfile
+mk	libtheora
+mk	libvorbis
+mk	madplay
+mk	mpg123
+mk	mplayer
+mk	speex
+mk	festival
+mk	vlc
+
+
+echo "Graphic libraries and applications (graphic/text)"
+echo "	text rendering libraries"
+mk	ncurses
+mk	newt
+mk	slang
+
+
+echo "	graphic libraries"
+mk	directfb
+mk	directfb-examples
+mk	fbdump
+mk	fusion
+mk	imagemagick
+mk	jpeg
+mk	libart
+mk	libpng
+mk	libungif
+mk	lite
+mk	pixman
+mk	sawman
+mk	sdl
+mk	sdl_image
+mk	sdl_mixer
+mk	sdl_net
+mk	sdl_ttf
+mk	tiff
+
+echo "busybox graphic applications"
+echo "--> May be broken in busybox"
+mk	fbv
+mk	fbset
+
+echo "other GUIs"
+mk	qte
+mk	qtopia4
+
+
+if	[ ${X-WIN} == 1 ] ; then
+
+
+	mk	x11r7
+
+echo "X libraries and helper libraries"
+echo "maybe some of these should depend on !BR2_PACKAGE_XSERVER_none"
+mk	atk
+mk	cairo
+mk	pango
+mk	libdrm
+mk	liberation
+mk	libglade
+mk	libglib12
+mk	libglib2
+mk	libgtk12
+mk	libgtk2
+mk	gtk2-engines
+mk	gtk2-themes
+mk	libsexy
+mk	fltk
+mk	openmotif
+mk	fontconfig
+mk	freetype
+mk	tslib
+mk	webkit
+
+echo "X Window managers"
+mk	matchbox
+mk	metacity
+mk	blackbox
+
+echo "X applications"
+mk	alsamixergui
+mk	dillo
+mk	docker
+mk	gqview
+mk	gmpc
+mk	gtkperf
+mk	leafpad
+mk	midori
+mk	pcmanfm
+mk	rdesktop
+mk	rxvt
+mk	sylpheed
+mk	synergy
+mk	torsmo
+mk	x11vnc
+mk	xpdf
+mk	xstroke
+mk	xvkbd
+fi
+
+echo "Compressors / decompressors"
+
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	gzip
+fi
+mk	lzo
+mk	lzma-host
+mk	lzma-target
+mk	zlib
+
+echo "Package managers"
+
+mk	ipkg
+nmk	portage
+if	[ ${busybox-tools} == 1 ] ; then
+	mk	rpm
+fi
+
+echo "Interpreter languages / Scripting"
+
+mk	lua
+mk	microperl
+mk	python
+mk	ruby
+mk	tcl
+mk	php
+
+echo "XML handling"
+
+mk	expat
+mk	ezxml
+mk	libxml2
+mk	libxslt
+mk	xerces
+
+
+# java support
+nmk	java
+
+# various games packages
+nmk	games
+


Property changes on: trunk/buildroot/scripts/buildall.sh
___________________________________________________________________
Added: svn:executable
   + *
