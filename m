From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 23:09:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090125230913.9491076D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 23:09:12 +0000 (Sun, 25 Jan 2009)
New Revision: 25027

Log:
Update verification scripts and status for ARM build

Modified:
   trunk/buildroot/scripts/buildall.sh
   trunk/buildroot/scripts/mkpkg
   trunk/buildroot/scripts/testheader.inc


Changeset:
Modified: trunk/buildroot/scripts/buildall.sh
===================================================================
--- trunk/buildroot/scripts/buildall.sh	2009-01-25 23:01:22 UTC (rev 25026)
+++ trunk/buildroot/scripts/buildall.sh	2009-01-25 23:09:12 UTC (rev 25027)
@@ -1,13 +1,16 @@
 #!/bin/sh
+# Should be copied to toplevel before it is run.
+# An OK sttus indicates that it compiles for an arch.
+# This has been tested on ARM and AVR32, status is for ARM
 sed	-i s/^.*Config.in.test.*//	Config.in
 echo	"source \"scripts/test/Config.in.test.$1\"" >> Config.in
 sed	-i s/^.*BR2_TARGET_TEST_PACKAGES*//	.config
 echo	"BR2_TARGET_TEST_PACKAGES=y" >> .config
-cat	scripts/test/noconfiguration.$1 >> .config
-make 	oldconfig
+#cat	scripts/test/noconfiguration.$1 >> .config
+make 	oldconfig	> info.log 2>&1
 
-
 source	"scripts/testheader.inc"
+make	flush
 
 
 skip	mk	busybox
@@ -20,6 +23,7 @@
 bb	mk	gawk
 bb	mk	grep			
 EXE	mk	make                           OK
+
 comment "# Other development stuff"
 EXE	mk	autoconf                       OK	
 EXE	mk	automake                       OK	
@@ -34,48 +38,49 @@
 EXE	mk	libmpfr                        OK	
 EXE	mk	libtool                        OK	
 EXE	mk	libiconv                       OK  
-EXE	mk	popt                           FAIL	"undefined reference to libiconv"
+EXE	mk	popt                           OK
 EXE	mk	m4                             OK	
 skip	mk	mpatrol                        DISABLED	"Needs gdb to build, and GDB_VERSION is not defined"
-EXE	mk	oprofile                       FAIL	"popt: undefined reference to libiconv"
+EXE	mk	oprofile                       FAIL	"error: bfd library not found"
 EXE	mk	pkgconfig                      OK	
 EXE	mk	readline                       OK	
 skip	mk	valgrind                       DISABLED	"x86 specific" 
 EXE	mk	pcre                           OK	
+
 comment "Other stuff"
 EXE	mk	at                             OK	
 EXE	mk	beecrypt                       OK	
-AVR	mk	berkeleydb                     FAIL	"Machine avr32 not recognized"
+AVR	mk	berkeleydb                     OK	"Machine avr32 not recognized"
 EXE	mk	bsdiff                         OK	
-bb	mk	bootutils			?
+bb	mk	bootutils
 EXE	mk	cups                           OK	
 EXE	mk	customize                      OK	
-bb	mk	dash				?
+bb	mk	dash
 EXE	mk	file                           OK	
 EXE	mk	gamin                          OK	
-EXE	mk	icu                            FAIL	"No rule to create out"
-AVR	mk	kexec                          FAIL	"Machine avr32 not recognized"
+EXE	mk	icu                            OK	"No rule to create out"
+AVR	mk	kexec                          OK	"Machine avr32 not recognized"
 bb	mk	less
 EXE	mk	libconfig                      OK	
 EXE	mk	libconfuse                     OK	
 EXE	mk	libdaemon                      OK	
 EXE	mk	libelf                         OK	
 AVR	mk	libevent                       FAIL	"Machine avr32 not recognized"
-skip	mk	libfloat                       DISABLED	  
+skip	mk	libfloat                       DISABLED	"Obsolete package"
 EXE	mk	libgcrypt                      OK	
 EXE	mk	libgpg-error                   OK	
 EXE	mk	liblockfile                    OK	
 EXE	mk	liboil                         OK	
 EXE	mk	libsysfs                       OK	
 EXE	mk	lockfile-progs                 OK	
-EXE	mk	logrotate                      FAIL	"undefined reference to libiconv"
+EXE	mk	logrotate                      OK
 EXE	mk	lsof                           OK	
 skip	mk	ltp-testsuite                  DISABLED	  
 AVR	mk	ltrace                         FAIL	"Machine avr32 not recognized"
 skip	mk	ltt                            DISABLED	"Obsolete package ltt-ng"
 EXE	mk	memstat                        OK
-mk	mk	module-init-tools
-mk	mk	modutils
+EXE	mk	module-init-tools	       OK	"Use this instead of modutils"
+skip	mk	modutils		       FAIL	"This package is for the Linus 2.4 kernel"
 EXE	mk	ng-spice-rework                FAIL	"Environment change"
 bb	mk	procps
 bb	mk	psmisc
@@ -83,13 +88,23 @@
 EXE	mk	strace                         OK	
 EXE	mk	sudo                           OK	
 bb	mk	sysklogd
-eomment "busybox has init and the runit stuff"
+
+comment "busybox has init and the runit stuff"
 bb	mk	sysvinit
 bb	mk	tinylogin
 bb	mk	util-linux
 bb	mk	which
+
 comment "database"
+EXE	mk	mysql_client
+EXE	mk	sqlite
+
 comment "editors"
+EXE	mk	ed
+EXE	mk	nano
+EXE	mk	uemacs
+EXE	mk	vim
+
 comment "Networking applications"
 AVR	mk	argus                          FAIL	"Machine avr32 not recognized"
 EXE	mk	avahi                          OK	
@@ -114,19 +129,19 @@
 EXE	mk	libcgi                         OK	
 EXE	mk	libcgicc                       OK	
 EXE	mk	libosip2		       FAIL
-AVR	mk	libeXosip2                     FAIL	"Machine avr32 not recognized"
+AVR	mk	libeXosip2                     OK	"Machine avr32 not recognized"
 EXE	mk	libpcap                        OK	
 EXE	mk	libupnp                        OK	
 bb	mk	lighttpd
 EXE	mk	links                          OK	
 EXE	mk	lrzsz                          OK	
-EXE	mk	mdnsresponder                  FAIL	"Unable to recognise the format of the input file build/prod/mdnsd"
+EXE	mk	mdnsresponder                  OK	"Unable to recognise the format of the input file build/prod/mdnsd"
 bb	mk	microcom
 EXE	mk	mii-diag                       OK	
 EXE	mk	mrouted                        OK	
 EXE	mk	mutt                           FAIL	"Compile Error"
 EXE	mk	nbd                            OK	
-EXE	mk	ncftp                          OK	
+EXE	mk	ncftp                          OK	"Depends on ncurses"
 EXE	mk	neon                           OK	
 bb	mk	netcat
 EXE	mk	netkitbase                     OK	
@@ -165,7 +180,8 @@
 AVR	mk	vtun                           FAIL	"Machine avr32 not recognized"
 EXE	mk	webif                          OK	
 bb	mk	wget
-EXE	mk	wireless-tools                 OK	
+EXE	mk	wireless-tools                 OK
+	
 comment "Hardware handling / blockdevices and filesystem maintenance"
 EXE	mk	acpid                          OK	
 EXE	mk	dbus                           OK	
@@ -205,6 +221,7 @@
 EXE	mk	usbutils                       OK	
 EXE	mk	wipe                           OK	
 skip	mk	xfsprogs                       DISABLED	  
+
 comment "Interpreter languages / Scripting"
 EXE	mk	lua                            OK	
 EXE	mk	microperl                      FAIL	"No rule to create target"
@@ -212,8 +229,10 @@
 AVR	mk	ruby                           FAIL	"Machine avr32 not recognized"
 EXE	mk	tcl                            FAIL	"Compile Error"
 EXE	mk	php                            FAIL	"undefined references to acs_map"
+
 comment "text rendering applications"
 EXE	mk	dialog                         OK	
+
 comment "Audio and video libraries and applications"
 EXE	mk	alsa-lib                       OK	
 EXE	mk	alsa-utils                     FAIL	"undefined references to acs_map"
@@ -236,11 +255,14 @@
 EXE	mk	speex                          OK	
 EXE	mk	festival                       FAIL	"undefined reference to EST_TokenStream"
 EXE	mk	vlc                            FAIL	"configure:Cannot find libmad library."
+
 comment "Graphic libraries and applications (graphic/text)"
+
 comment "text rendering libraries"
 EXE	mk	ncurses                        OK	
 EXE	mk	newt                           OK	
 EXE	mk	slang                          OK	
+
 comment "graphic libraries"
 EXE	mk	directfb                       OK	
 EXE	mk	directfb-examples              OK	
@@ -260,15 +282,18 @@
 EXE	mk	SDL_net                        OK	
 EXE	mk	sdl_ttf                        OK	
 EXE	mk	tiff                           OK	
+
 comment	"busybox graphic applications"
 comment " --> May be broken in busybox"
 EXE	mk	fbv                            OK	
 EXE	mk	fbset                          OK	
+
 comment "other GUIs"
 SKIP
 EXE	mk	qte                            DISABLED	  
 EXE	mk	qtopia4                        DISABLED	 
 EXE	mk	x11r7 			       DISABLED
+RESTART
 EXE	mk	atk
 EXE	mk	cairo
 EXE	mk	pango
@@ -287,12 +312,15 @@
 EXE	mk	fontconfig
 EXE	mk	freetype
 EXE	mk	tslib
+SKIP
 EXE	mk	webkit
-skip	startup-notification		"Depends on X11"
+skip	mk	startup-notification	       DISABLED	"Depends on X11"
+
 comment	"X Window managers"
 EXE	mk	matchbox
 EXE	mk	metacity
 EXE	mk	blackbox
+
 comment	"X applications"
 EXE	mk	alsamixergui
 EXE	mk	dillo
@@ -319,9 +347,11 @@
 EXE	mk	lzma-host                      OK	
 EXE	mk	lzma-target                    OK	
 EXE	mk	zlib                           OK	
+
 comment "Package managers"
 EXE	mk	ipkg                           OK	
-EXE	mk	portage                        DISABLED	  
+EXE	mk	portage                        OK 
+
 comment "XML handling"
 EXE	mk	expat                          OK	
 EXE	mk	ezxml                          OK	

Modified: trunk/buildroot/scripts/mkpkg
===================================================================
--- trunk/buildroot/scripts/mkpkg	2009-01-25 23:01:22 UTC (rev 25026)
+++ trunk/buildroot/scripts/mkpkg	2009-01-25 23:09:12 UTC (rev 25027)
@@ -38,36 +38,72 @@
 	grep "\.tar\." ${LOG} > ${DEPENDENCY}
 	if [ ${test} == ${OK} ] ; then
 		mv ${LOG} ${LOG_OK_FILE}
-		echo "OK	"
+		printf "%-16s" "OK"
+		if [ "${2}X" != "X" ] ; then
+			printf	"%-16s"	"\"$2\"";
+		fi
+		if [ "${3}X" != "X" ] ; then
+			printf	"%s"	"\"$3\"";
+		fi
+		echo
 	else
 		mv ${LOG} ${LOG_FAIL_FILE}
-		printf "FAIL	"
-		echo	\"$2\"
+		printf "%-16s" "FAIL"
+		if [ "${2}X" != "X" ] ; then
+			printf	"%-16s"	"\"$2\"";
+		else
+			printf	"%-16s"	"\"\""
+		fi
+		if [ "${3}X" != "X" ] ; then
+			printf	"%s"	"\"$3\"";
+		fi
+		echo
 	fi
 }
 
 function build_package ()
 {
-	printf "mk	%-31s" "$1"
+	# echo "BUILD PACKAGE:1=$1 2=$2 3=$3 4=$4 5=$5 6=$6 7=$7"
+	printf "mk	%-32s" "$1"
 	if [ "$2X" == "X" ] ; then		# no parameters
 		clean_files	$1
 		dirclean	$1
-		process		$1
+		process		$1 "$3"
+	elif [ "$2X" == "?X" ] ; then		# no parameters
+		clean_files	$1
+		dirclean	$1
+		process		$1 "$3"
 	elif [ "$2X" == "OKX" ] ; then	# Previous build was OK
 		clean_files	$1
 		dirclean	$1
-		process		$1
+		process		$1 "$3"
 	elif [ "$2X" == "FAILX" ] ; then
 		clean_files	$1
 		dirclean	$1
-		process		$1 $3
+		process		$1 "$3"
 	elif [ "$2X" == "BROKENX" ] ; then
-		printf  "BROKEN	"
-		echo	\"$3\"
+		printf  "%-16s" "BROKEN"
+		if [ "${3}X" != "X" ] ; then
+			printf	"%s"	"\"$3\"";
+		fi
+		echo
+	elif [ "$2X" == "DISABLEDX" ] ; then
+		printf  "%-16s" "DISABLED"
+		if [ "${3}X" != "X" ] ; then
+			printf	"%s"	"\"$3\"";
+		fi
+		echo
+	else
+		printf  "%-16s" "?BROKEN"
+		if [ "${3}X" != "X" ] ; then
+			printf	"%s"	"\"$3\"";
+		fi
+		echo
 	fi
 }
 
-build_package $1 $2 $3
+#build_package $1 $2 "\"$3\""
+build_package $1 $2 "$3"
 
 
 

Modified: trunk/buildroot/scripts/testheader.inc
===================================================================
--- trunk/buildroot/scripts/testheader.inc	2009-01-25 23:01:22 UTC (rev 25026)
+++ trunk/buildroot/scripts/testheader.inc	2009-01-25 23:09:12 UTC (rev 25027)
@@ -1,4 +1,7 @@
-alias mk="scripts/mkpkg"
+function mk()
+{
+	scripts/mkpkg $1 $2 "$3"
+}
 
 function	header()
 {
@@ -26,11 +29,16 @@
 {
 	printf 	"EXE	"
 	if [ ${active} == 1 ] ; then
-		printf "$1	"
-		$1 $2 $3 $4 $5 $6
+		$1 $2 $3 "$4"
 		return 0;
 	else
-		echo "$1 $2 $3 $4 $5 $6"
+		printf	"%-8s"	"$1"
+		printf	"%-32s"	"$2"
+		printf	"%-16s"	"$3"
+		if [ "${4}X" != "X" ] ; then
+			printf	"%-64s"	"\"$4\""
+		fi
+		echo
 		return 1;
 	fi
 }
@@ -42,11 +50,16 @@
 		echo "mk $2 UNSUPPORTED \"$4\" $5 $6"
 		return 1;
 	elif [ ${active} == 1 ] ; then
-		printf "$1	"
-		$1 $2 $3 $4 $5 $6
+		$1 $2 "$3" "$4"
 		return 0;
 	else
-		echo "$1 $2 $3 $4 $5 $6"
+		printf	"%-8s"	"$1"
+		printf	"%-32s"	"$2"
+		printf	"%-16s"	"$3"
+		if [ "${4}X" != "X" ] ; then
+			printf	"%-64s"	"\"$4\"";
+		fi
+		echo
 		return 1;
 	fi
 }
@@ -54,29 +67,46 @@
 
 function skip()
 {
-	printf "skip	%-31s" "$1"
-	if [ "$2X" == "OKX" ] ; then
-		echo "DISABLED	$3 $4"
-	elif [ "$2X" == "FAILX" ] ; then
-		echo "DISABLED	$3 $4"
-	elif [ "$2X" == "BROKENX" ] ; then
-		echo "DISABLED	$3 $4"
-	elif [ "$2X" == "DISABLEDX" ] ; then
-		echo "DISABLED	\"$3 $4\""
+	printf "skip	%-8s" "$1"
+	printf "%-32s" "$2"
+	if [   "$3X" == "OKX" ] ; then
+		printf "%-16s"	"DISABLED"
+		if [ "${4}X" != "X" ] ; then
+			printf	"%-64s"	"\"$4\""
+		fi
+	elif [ "$3X" == "FAILX" ] ; then
+		printf "%-16s"	"DISABLED"
+		if [ "${4}X" != "X" ] ; then
+			printf	"%-64s"	"\"$4\""
+		fi
+	elif [ "$3X" == "BROKENX" ] ; then
+		printf "%-16s"	"DISABLED"
+		if [ "${4}X" != "X" ] ; then
+			printf	"%-64s"	"\"$4\""
+		fi
+	elif [ "$3X" == "DISABLEDX" ] ; then
+		printf "%-16s"	"DISABLED"
+		if [ "${4}X" != "X" ] ; then
+			printf	"%-64s"	"\"$4\""
+		fi
 	else
-		echo "DISABLED	\"$2 $3 $4\""
+		printf "%-16s"	"DISABLED"
+		if [ "${4}X" != "X" ] ; then
+			printf	"%-64s"	"\"$4\""
+		fi
 	fi
+	echo
 }
 
 function bb()
 {
-	printf 	"bb	"
+	printf 	"%-8s"	"bb"
 	if [ ${busybox} == 1 ] ; then
-		printf "$1	"
+		printf "%-8s"	"$1"
 		$1 $2 $3 $4 $5 $6
 		return 0;
 	else
-		echo "$1 $2 $3 $4 $5 $6"
+		echo "$1	$2 $3 $4 $5 $6"
 		return 1;
 	fi
 }
