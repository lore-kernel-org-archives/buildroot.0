From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Tue, 13 Oct 2015 09:12:29 -0300
Subject: [Buildroot] [PATCH v2 2/2] axfs: add new filesystem type
In-Reply-To: <5612C712.6020209@mind.be>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1444064102-13575-3-git-send-email-ariel@vanguardiasur.com.ar>
 <5612C712.6020209@mind.be>
Message-ID: <561CF52D.3090609@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

El 05/10/15 a las 15:53, Arnout Vandecappelle escribi?:
> On 05-10-15 17:55, Ariel D'Alessandro wrote:
>> The Advanced XIP File System is a Linux kernel filesystem driver that enables
>> files to be executed directly from flash or ROM memory rather than being copied
>> into RAM.
>>
[snip]
>> diff --git a/fs/axfs/Config.in b/fs/axfs/Config.in
>> new file mode 100644
>> index 0000000..7e25fe7
>> --- /dev/null
>> +++ b/fs/axfs/Config.in
>> @@ -0,0 +1,4 @@
>> +config BR2_TARGET_ROOTFS_AXFS
>> +	bool "axfs root filesystem"
>> +	help
>> +	  Build an axfs root filesystem
> 
>  This needs a lot more explanation. For starters, repeat the explanation you put
> in the commit message (but wrap at 72 columns!). And perhaps you should add that
> all files will be XIPified (or whatever the verb is). Also, you should mention
> that the kernel has to be built with the axfs patches to be able to read it.

OK, I'll add some notes here.

> 
>  It would be nice to add the axfs kernel side as a kernel extension as well. But
> that looks heavily non-trivial.
> 
> 
>> diff --git a/fs/axfs/axfs.mk b/fs/axfs/axfs.mk
>> new file mode 100644
>> index 0000000..05d6e5d
>> --- /dev/null
>> +++ b/fs/axfs/axfs.mk
>> @@ -0,0 +1,13 @@
>> +################################################################################
>> +#
>> +# Build the axfs root filesystem image
>> +#
>> +################################################################################
>> +
>> +ROOTFS_AXFS_DEPENDENCIES = host-axfsutils
>> +
>> +define ROOTFS_AXFS_CMD
>> +	$(HOST_DIR)/usr/bin/mkfs.axfs -s -a $(TARGET_DIR) $@
> 
>  I'm not sure if we really want to give the -s option. Is it very verbose?
> Generally I like a bit of feedback about how the filesystem is built, and we do
> get it for e.g. squashfs.

Yeah, I think it's very verbose. But on the other hand, with the -s
option it's too quiet.
I don't know what is the main criteria. Maybe you can tell me, here's
the output of two mkfs.axfs executions with and without -s option:

--
$ ./mkfs.axfs -s -a target/ output/
number of files:                   585
number of 4KB nodes:               1752

Total image size:                       5111906
--

--
$ ./mkfs.axfs -a target/ output/
-54.49% (-728 bytes)	THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
  0.00% (+0 bytes)	lib32
  0.00% (+0 bytes)	linuxrc
  0.00% (+0 bytes)	ash
  0.00% (+0 bytes)	busybox
  0.00% (+0 bytes)	cat
  0.00% (+0 bytes)	catv
  0.00% (+0 bytes)	chattr
  0.00% (+0 bytes)	chgrp
  0.00% (+0 bytes)	chmod
  0.00% (+0 bytes)	chown
  0.00% (+0 bytes)	cp
  0.00% (+0 bytes)	cpio
  0.00% (+0 bytes)	date
  0.00% (+0 bytes)	dd
  0.00% (+0 bytes)	df
  0.00% (+0 bytes)	dmesg
  0.00% (+0 bytes)	dnsdomainname
  0.00% (+0 bytes)	dumpkmap
  0.00% (+0 bytes)	echo
  0.00% (+0 bytes)	egrep
  0.00% (+0 bytes)	false
  0.00% (+0 bytes)	fdflush
  0.00% (+0 bytes)	fgrep
  0.00% (+0 bytes)	getopt
  0.00% (+0 bytes)	grep
  0.00% (+0 bytes)	gunzip
  0.00% (+0 bytes)	gzip
  0.00% (+0 bytes)	hostname
  0.00% (+0 bytes)	kill
  0.00% (+0 bytes)	linux32
  0.00% (+0 bytes)	linux64
  0.00% (+0 bytes)	ln
  0.00% (+0 bytes)	login
  0.00% (+0 bytes)	ls
  0.00% (+0 bytes)	lsattr
  0.00% (+0 bytes)	mkdir
  0.00% (+0 bytes)	mknod
  0.00% (+0 bytes)	mktemp
  0.00% (+0 bytes)	more
  0.00% (+0 bytes)	mount
  0.00% (+0 bytes)	mountpoint
  0.00% (+0 bytes)	mt
  0.00% (+0 bytes)	mv
  0.00% (+0 bytes)	netstat
  0.00% (+0 bytes)	nice
  0.00% (+0 bytes)	pidof
  0.00% (+0 bytes)	ping
  0.00% (+0 bytes)	pipe_progress
  0.00% (+0 bytes)	printenv
  0.00% (+0 bytes)	ps
  0.00% (+0 bytes)	pwd
  0.00% (+0 bytes)	rm
  0.00% (+0 bytes)	rmdir
  0.00% (+0 bytes)	run-parts
  0.00% (+0 bytes)	sed
  0.00% (+0 bytes)	setarch
  0.00% (+0 bytes)	setserial
  0.00% (+0 bytes)	sh
  0.00% (+0 bytes)	sleep
  0.00% (+0 bytes)	stty
  0.00% (+0 bytes)	su
  0.00% (+0 bytes)	sync
  0.00% (+0 bytes)	tar
  0.00% (+0 bytes)	touch
  0.00% (+0 bytes)	true
  0.00% (+0 bytes)	umount
  0.00% (+0 bytes)	uname
  0.00% (+0 bytes)	usleep
  0.00% (+0 bytes)	vi
  0.00% (+0 bytes)	watch
  0.00% (+0 bytes)	zcat
  0.00% (+0 bytes)	log
-43.44% (-139 bytes)	fstab
-34.78% (-104 bytes)	group
 10.00% (+1 bytes)	hostname
  2.50% (+1 bytes)	hosts
-49.43% (-519 bytes)	inittab
-54.41% (-642 bytes)	inputrc
  4.76% (+1 bytes)	issue
  0.00% (+0 bytes)	mtab
-24.14% (-28 bytes)	os-release
-52.29% (-194 bytes)	passwd
-53.17% (-738 bytes)	profile
-48.54% (-1332 bytes)	protocols
  0.20% (+1 bytes)	random-seed
  0.00% (+0 bytes)	resolv.conf
-60.62% (-234 bytes)	securetty
-59.55% (-6475 bytes)	services
-65.27% (-156 bytes)	shadow
-53.95% (-348 bytes)	ts.conf
  0.00% (+0 bytes)	ld-uClibc-0.9.33.2.so
  0.00% (+0 bytes)	ld-uClibc.so.0
  0.00% (+0 bytes)	libatomic.so
  0.00% (+0 bytes)	libatomic.so.1
  0.00% (+0 bytes)	libatomic.so.1.0.0
  0.00% (+0 bytes)	libc.so.0
  0.00% (+0 bytes)	libcrypt-0.9.33.2.so
  0.00% (+0 bytes)	libcrypt.so.0
  0.00% (+0 bytes)	libdl-0.9.33.2.so
  0.00% (+0 bytes)	libdl.so.0
-12.12% (-16 bytes)	libgcc_s.so
-62.18% (-76236 bytes)	libgcc_s.so.1
  0.00% (+0 bytes)	libm-0.9.33.2.so
  0.00% (+0 bytes)	libm.so.0
  0.00% (+0 bytes)	libnsl-0.9.33.2.so
  0.00% (+0 bytes)	libnsl.so.0
  0.00% (+0 bytes)	libpthread-0.9.33.2.so
  0.00% (+0 bytes)	libpthread.so.0
  0.00% (+0 bytes)	libresolv-0.9.33.2.so
  0.00% (+0 bytes)	libresolv.so.0
  0.00% (+0 bytes)	librt-0.9.33.2.so
  0.00% (+0 bytes)	librt.so.0
  0.00% (+0 bytes)	libuClibc-0.9.33.2.so
  0.00% (+0 bytes)	libutil-0.9.33.2.so
  0.00% (+0 bytes)	libutil.so.0
-18.86% (-33 bytes)	.bash_logout
 -6.41% (-5 bytes)	.bash_profile
-34.99% (-162 bytes)	.profile
  0.00% (+0 bytes)	arp
  0.00% (+0 bytes)	blkid
  0.00% (+0 bytes)	devmem
  0.00% (+0 bytes)	fdisk
  0.00% (+0 bytes)	freeramdisk
  0.00% (+0 bytes)	fsck
  0.00% (+0 bytes)	fstrim
  0.00% (+0 bytes)	getty
  0.00% (+0 bytes)	halt
  0.00% (+0 bytes)	hdparm
  0.00% (+0 bytes)	hwclock
  0.00% (+0 bytes)	ifconfig
  0.00% (+0 bytes)	ifdown
  0.00% (+0 bytes)	ifup
  0.00% (+0 bytes)	init
  0.00% (+0 bytes)	insmod
  0.00% (+0 bytes)	ip
  0.00% (+0 bytes)	ipaddr
  0.00% (+0 bytes)	iplink
  0.00% (+0 bytes)	iproute
  0.00% (+0 bytes)	iprule
  0.00% (+0 bytes)	iptunnel
  0.00% (+0 bytes)	klogd
  0.00% (+0 bytes)	ldconfig
  0.00% (+0 bytes)	loadkmap
  0.00% (+0 bytes)	losetup
  0.00% (+0 bytes)	lsmod
  0.00% (+0 bytes)	makedevs
  0.00% (+0 bytes)	mdev
  0.00% (+0 bytes)	mkswap
  0.00% (+0 bytes)	modprobe
  0.00% (+0 bytes)	nameif
  0.00% (+0 bytes)	pivot_root
  0.00% (+0 bytes)	poweroff
  0.00% (+0 bytes)	reboot
  0.00% (+0 bytes)	rmmod
  0.00% (+0 bytes)	route
  0.00% (+0 bytes)	runlevel
  0.00% (+0 bytes)	setconsole
  0.00% (+0 bytes)	start-stop-daemon
  0.00% (+0 bytes)	sulogin
  0.00% (+0 bytes)	swapoff
  0.00% (+0 bytes)	swapon
  0.00% (+0 bytes)	switch_root
  0.00% (+0 bytes)	sysctl
  0.00% (+0 bytes)	syslogd
  0.00% (+0 bytes)	udhcpc
  0.00% (+0 bytes)	vconfig
  0.00% (+0 bytes)	watchdog
  0.00% (+0 bytes)	lib32
  0.00% (+0 bytes)	cache
  0.00% (+0 bytes)	lock
  0.00% (+0 bytes)	log
  0.00% (+0 bytes)	run
  0.00% (+0 bytes)	spool
  0.00% (+0 bytes)	tmp
  0.00% (+0 bytes)	S01logging
  0.00% (+0 bytes)	S20urandom
  0.00% (+0 bytes)	S40network
  0.00% (+0 bytes)	S99_rea_setup
  0.00% (+0 bytes)	rcK
  0.00% (+0 bytes)	rcS
 -3.90% (-3 bytes)	interfaces
  0.00% (+0 bytes)	linux-fincore
  0.00% (+0 bytes)	mem
  0.01% (+15 bytes)	eggs.jpg
-17.02% (-4792 bytes)	renesas_logo-800x480.jpg
 -0.20% (-333 bytes)	tiger.jpg
-13.69% (-126625 bytes)	ring.wav
  0.00% (+0 bytes)	[
  0.00% (+0 bytes)	[[
  0.00% (+0 bytes)	alsamixer
  0.00% (+0 bytes)	amixer
  0.00% (+0 bytes)	aplay
  0.00% (+0 bytes)	ar
  0.00% (+0 bytes)	arecord
  0.00% (+0 bytes)	aserver
  0.00% (+0 bytes)	awk
  0.00% (+0 bytes)	basename
  0.00% (+0 bytes)	bunzip2
  0.00% (+0 bytes)	bzcat
  0.00% (+0 bytes)	chrt
  0.00% (+0 bytes)	chvt
  0.00% (+0 bytes)	cksum
  0.00% (+0 bytes)	clear
  0.00% (+0 bytes)	cmp
  0.00% (+0 bytes)	crontab
  0.00% (+0 bytes)	cut
  0.00% (+0 bytes)	dc
  0.00% (+0 bytes)	deallocvt
  0.00% (+0 bytes)	diff
  0.00% (+0 bytes)	dirname
  0.00% (+0 bytes)	dos2unix
  0.00% (+0 bytes)	du
  0.00% (+0 bytes)	eject
  0.00% (+0 bytes)	env
  0.00% (+0 bytes)	expr
  0.00% (+0 bytes)	fbv
  0.00% (+0 bytes)	find
  0.00% (+0 bytes)	flock
  0.00% (+0 bytes)	fold
  0.00% (+0 bytes)	free
  0.00% (+0 bytes)	fuser
  0.00% (+0 bytes)	getconf
  0.00% (+0 bytes)	head
  0.00% (+0 bytes)	hexdump
  0.00% (+0 bytes)	hostid
  0.00% (+0 bytes)	id
  0.00% (+0 bytes)	inputattach
  0.00% (+0 bytes)	install
  0.00% (+0 bytes)	ipcrm
  0.00% (+0 bytes)	ipcs
  0.00% (+0 bytes)	killall
  0.00% (+0 bytes)	last
  0.00% (+0 bytes)	ldd
  0.00% (+0 bytes)	less
  0.00% (+0 bytes)	logger
  0.00% (+0 bytes)	logname
  0.00% (+0 bytes)	lsof
  0.00% (+0 bytes)	lspci
  0.00% (+0 bytes)	lsusb
  0.00% (+0 bytes)	lzcat
  0.00% (+0 bytes)	lzma
  0.00% (+0 bytes)	md5sum
  0.00% (+0 bytes)	mesg
  0.00% (+0 bytes)	microcom
  0.00% (+0 bytes)	mkfifo
  0.00% (+0 bytes)	mpg123
  0.00% (+0 bytes)	mpg123-id3dump
  0.00% (+0 bytes)	mpg123-strip
  0.00% (+0 bytes)	nohup
  0.00% (+0 bytes)	nslookup
  0.00% (+0 bytes)	od
  0.00% (+0 bytes)	openvt
  0.00% (+0 bytes)	out123
  0.00% (+0 bytes)	passwd
  0.00% (+0 bytes)	patch
  0.00% (+0 bytes)	printf
  0.00% (+0 bytes)	readlink
  0.00% (+0 bytes)	realpath
  0.00% (+0 bytes)	renice
  0.00% (+0 bytes)	reset
  0.00% (+0 bytes)	resize
  0.00% (+0 bytes)	seq
  0.00% (+0 bytes)	setkeycodes
  0.00% (+0 bytes)	setsid
  0.00% (+0 bytes)	sha1sum
  0.00% (+0 bytes)	sha256sum
  0.00% (+0 bytes)	sha3sum
  0.00% (+0 bytes)	sha512sum
  0.00% (+0 bytes)	sort
  0.00% (+0 bytes)	strings
  0.00% (+0 bytes)	tail
  0.00% (+0 bytes)	tee
  0.00% (+0 bytes)	telnet
  0.00% (+0 bytes)	test
  0.00% (+0 bytes)	tftp
  0.00% (+0 bytes)	time
  0.00% (+0 bytes)	top
  0.00% (+0 bytes)	tr
  0.00% (+0 bytes)	traceroute
  0.00% (+0 bytes)	ts_calibrate
  0.00% (+0 bytes)	ts_finddev
  0.00% (+0 bytes)	ts_harvest
  0.00% (+0 bytes)	ts_print
  0.00% (+0 bytes)	ts_print_raw
  0.00% (+0 bytes)	ts_test
  0.00% (+0 bytes)	tty
  0.00% (+0 bytes)	uniq
  0.00% (+0 bytes)	unix2dos
  0.00% (+0 bytes)	unlink
  0.00% (+0 bytes)	unlzma
  0.00% (+0 bytes)	unxz
  0.00% (+0 bytes)	unzip
  0.00% (+0 bytes)	uptime
  0.00% (+0 bytes)	uudecode
  0.00% (+0 bytes)	uuencode
  0.00% (+0 bytes)	vlock
  0.00% (+0 bytes)	wc
  0.00% (+0 bytes)	wget
  0.00% (+0 bytes)	which
  0.00% (+0 bytes)	who
  0.00% (+0 bytes)	whoami
  0.00% (+0 bytes)	xargs
  0.00% (+0 bytes)	xz
  0.00% (+0 bytes)	xzcat
  0.00% (+0 bytes)	yes
  0.00% (+0 bytes)	libasound.so
  0.00% (+0 bytes)	libasound.so.2
  0.00% (+0 bytes)	libasound.so.2.0.0
  0.00% (+0 bytes)	libform.so
  0.00% (+0 bytes)	libform.so.5
  0.00% (+0 bytes)	libform.so.5.9
  0.00% (+0 bytes)	libjpeg.so
  0.00% (+0 bytes)	libjpeg.so.8
  0.00% (+0 bytes)	libjpeg.so.8.0.2
  0.00% (+0 bytes)	libmenu.so
  0.00% (+0 bytes)	libmenu.so.5
  0.00% (+0 bytes)	libmenu.so.5.9
  0.00% (+0 bytes)	libmpg123.so
  0.00% (+0 bytes)	libmpg123.so.0
  0.00% (+0 bytes)	libmpg123.so.0.41.0
  0.00% (+0 bytes)	libncurses.so
  0.00% (+0 bytes)	libncurses.so.5
  0.00% (+0 bytes)	libncurses.so.5.9
  0.00% (+0 bytes)	libpanel.so
  0.00% (+0 bytes)	libpanel.so.5
  0.00% (+0 bytes)	libpanel.so.5.9
  0.00% (+0 bytes)	libts-1.0.so.0
  0.00% (+0 bytes)	libts-1.0.so.0.0.0
  0.00% (+0 bytes)	libts.so
  0.00% (+0 bytes)	libturbojpeg.so
  0.00% (+0 bytes)	libturbojpeg.so.0
  0.00% (+0 bytes)	libturbojpeg.so.0.1.0
  0.00% (+0 bytes)	terminfo
  0.00% (+0 bytes)	addgroup
  0.00% (+0 bytes)	adduser
  0.00% (+0 bytes)	alsactl
  0.00% (+0 bytes)	arping
  0.00% (+0 bytes)	chroot
  0.00% (+0 bytes)	crond
  0.00% (+0 bytes)	delgroup
  0.00% (+0 bytes)	deluser
  0.00% (+0 bytes)	dnsd
  0.00% (+0 bytes)	ether-wake
  0.00% (+0 bytes)	fbset
  0.00% (+0 bytes)	fdformat
  0.00% (+0 bytes)	flash_erase
  0.00% (+0 bytes)	flash_lock
  0.00% (+0 bytes)	flash_unlock
  0.00% (+0 bytes)	flashcp
  0.00% (+0 bytes)	inetd
  0.00% (+0 bytes)	killall5
  0.00% (+0 bytes)	loadfont
  0.00% (+0 bytes)	mtd_debug
  0.00% (+0 bytes)	mtdinfo
  0.00% (+0 bytes)	nanddump
  0.00% (+0 bytes)	nandtest
  0.00% (+0 bytes)	nandwrite
  0.00% (+0 bytes)	rdate
  0.00% (+0 bytes)	readprofile
  0.00% (+0 bytes)	setlogcons
  0.00% (+0 bytes)	ubiattach
  0.00% (+0 bytes)	ubiblock
  0.00% (+0 bytes)	ubicrc32
  0.00% (+0 bytes)	ubidetach
  0.00% (+0 bytes)	ubiformat
  0.00% (+0 bytes)	ubimkvol
  0.00% (+0 bytes)	ubinfo
  0.00% (+0 bytes)	ubinize
  0.00% (+0 bytes)	ubirename
  0.00% (+0 bytes)	ubirmvol
  0.00% (+0 bytes)	ubirsvol
  0.00% (+0 bytes)	ubiupdatevol
  0.00% (+0 bytes)	misc
  0.00% (+0 bytes)	arctic2.so
  0.00% (+0 bytes)	collie.so
  0.00% (+0 bytes)	corgi.so
  0.00% (+0 bytes)	dejitter.so
  0.00% (+0 bytes)	dmc.so
  0.00% (+0 bytes)	galax.so
  0.00% (+0 bytes)	h3600.so
  0.00% (+0 bytes)	input.so
  0.00% (+0 bytes)	linear.so
  0.00% (+0 bytes)	linear_h2200.so
  0.00% (+0 bytes)	mk712.so
  0.00% (+0 bytes)	pthres.so
  0.00% (+0 bytes)	tatung.so
  0.00% (+0 bytes)	touchkit.so
  0.00% (+0 bytes)	ucb1x00.so
  0.00% (+0 bytes)	variance.so
-75.94% (-7076 bytes)	alsa.conf
-38.06% (-59 bytes)	smixer.conf
  0.00% (+0 bytes)	default.script
-86.07% (-5155 bytes)	asound.state
  0.00% (+0 bytes)	smixer-ac97.so
  0.00% (+0 bytes)	smixer-hda.so
  0.00% (+0 bytes)	smixer-sbase.so
-10.68% (-11 bytes)	README
-56.95% (-381 bytes)	AACI.conf
-24.83% (-75 bytes)	ATIIXP-MODEM.conf
-74.16% (-1659 bytes)	ATIIXP-SPDMA.conf
-76.68% (-1904 bytes)	ATIIXP.conf
-55.15% (-241 bytes)	AU8810.conf
-16.98% (-27 bytes)	AU8820.conf
-57.31% (-298 bytes)	AU8830.conf
-81.62% (-4815 bytes)	Audigy.conf
-85.14% (-6647 bytes)	Audigy2.conf
-74.72% (-1770 bytes)	Aureon51.conf
-75.63% (-1890 bytes)	Aureon71.conf
-80.72% (-3106 bytes)	CA0106.conf
-66.48% (-1186 bytes)	CMI8338-SWIEC.conf
-66.67% (-1274 bytes)	CMI8338.conf
-71.37% (-1521 bytes)	CMI8738-MC6.conf
-78.57% (-2343 bytes)	CMI8738-MC8.conf
-68.98% (-1132 bytes)	CMI8788.conf
-77.05% (-2269 bytes)	CS46xx.conf
-76.73% (-4352 bytes)	EMU10K1.conf
-76.29% (-2101 bytes)	EMU10K1X.conf
-64.52% (-882 bytes)	ENS1370.conf
-68.94% (-1245 bytes)	ENS1371.conf
-11.84% (-18 bytes)	ES1968.conf
-85.34% (-3754 bytes)	Echo_Echo3G.conf
-63.98% (-785 bytes)	FM801.conf
-37.84% (-126 bytes)	FWSpeakers.conf
-59.83% (-420 bytes)	FireWave.conf
-24.88% (-54 bytes)	GUS.conf
-81.25% (-5503 bytes)	HDA-Intel.conf
-74.80% (-1802 bytes)	ICE1712.conf
-76.41% (-2209 bytes)	ICE1724.conf
-17.19% (-33 bytes)	ICH-MODEM.conf
-75.64% (-2310 bytes)	ICH.conf
-77.55% (-2238 bytes)	ICH4.conf
-64.47% (-820 bytes)	Loopback.conf
-49.28% (-275 bytes)	Maestro3.conf
-76.47% (-3673 bytes)	NFORCE.conf
-53.27% (-350 bytes)	PC-Speaker.conf
-50.41% (-245 bytes)	PMac.conf
-55.89% (-394 bytes)	PMacToonie.conf
-61.28% (-706 bytes)	PS3.conf
-51.79% (-404 bytes)	RME9636.conf
-51.79% (-404 bytes)	RME9652.conf
-69.84% (-1049 bytes)	SB-XFi.conf
-74.63% (-1700 bytes)	SI7018.conf
-68.14% (-1221 bytes)	TRID4DWAVENX.conf
-69.92% (-6275 bytes)	USB-Audio.conf
-61.05% (-732 bytes)	VIA686A.conf
-76.52% (-2109 bytes)	VIA8233.conf
-78.09% (-2196 bytes)	VIA8233A.conf
-72.97% (-1887 bytes)	VIA8237.conf
-58.67% (-487 bytes)	VX222.conf
-58.40% (-490 bytes)	VXPocket.conf
-66.49% (-984 bytes)	VXPocket440.conf
-66.10% (-897 bytes)	YMF744.conf
-61.14% (-859 bytes)	aliases.conf
-58.13% (-1051 bytes)	00main
-72.40% (-960 bytes)	ca0106
-86.14% (-9360 bytes)	default
-70.05% (-1064 bytes)	hda
-44.76% (-175 bytes)	help
-71.35% (-665 bytes)	info
-87.63% (-9375 bytes)	test
-55.40% (-446 bytes)	center_lfe.conf
-54.86% (-418 bytes)	default.conf
-71.65% (-1087 bytes)	dmix.conf
-65.58% (-423 bytes)	dpl.conf
-71.48% (-1095 bytes)	dsnoop.conf
-55.59% (-418 bytes)	front.conf
-56.65% (-673 bytes)	hdmi.conf
-56.64% (-687 bytes)	iec958.conf
-68.19% (-896 bytes)	modem.conf
-55.51% (-413 bytes)	rear.conf
-55.51% (-413 bytes)	side.conf
-53.06% (-477 bytes)	surround21.conf
-54.39% (-477 bytes)	surround40.conf
-54.03% (-536 bytes)	surround41.conf
-54.33% (-539 bytes)	surround50.conf
-54.19% (-504 bytes)	surround51.conf
-54.50% (-533 bytes)	surround71.conf
-38.14% (-45 bytes)	sample_map.csv
-58.88% (-872 bytes)	ansi
-53.46% (-957 bytes)	linux
-53.39% (-835 bytes)	screen
-51.26% (-612 bytes)	vt100
-51.09% (-607 bytes)	vt102
-48.16% (-616 bytes)	vt200
-48.16% (-616 bytes)	vt220
-52.39% (-1713 bytes)	xterm
-59.64% (-925 bytes)	xterm-color
-52.38% (-1177 bytes)	xterm-xfree86
 -3.19% (-3 bytes)	DAISY-I2S.conf
-78.79% (-1285 bytes)	HiFi.conf
 -1.09% (-1 bytes)	GoogleNyan.conf
-77.74% (-1711 bytes)	HiFi.conf
-73.88% (-843 bytes)	HiFi.conf
-66.14% (-707 bytes)	PAZ00.conf
-78.47% (-1418 bytes)	Record.conf
-69.17% (-848 bytes)	FMAnalog
-67.08% (-591 bytes)	PandaBoard.conf
-74.48% (-1655 bytes)	hifi
-68.41% (-851 bytes)	hifiLP
-69.31% (-926 bytes)	record
-68.48% (-845 bytes)	voice
-76.31% (-1681 bytes)	voiceCall
-69.31% (-858 bytes)	FMAnalog
-67.26% (-604 bytes)	PandaBoardES.conf
-74.53% (-1665 bytes)	hifi
-68.55% (-861 bytes)	hifiLP
-69.44% (-936 bytes)	record
-68.70% (-856 bytes)	voice
-76.34% (-1691 bytes)	voiceCall
-68.87% (-832 bytes)	FMAnalog
-66.74% (-584 bytes)	SDP4430.conf
-73.84% (-1598 bytes)	hifi
-67.50% (-814 bytes)	hifiLP
-68.76% (-821 bytes)	record
-67.64% (-809 bytes)	voice
-75.98% (-1645 bytes)	voiceCall
-67.64% (-719 bytes)	tegraalc5632.conf

number of files:                   585
number of 4KB nodes:               1752

offset to node_type bytetable:          984
offset to node_index bytetable:	        2739
offset to cnode_offset bytetable:       9759
offset to cnode_index bytetable:        11463
offset to banode_offset bytetable:      13167
offset to cblock_offset bytetable:      14991
offset to inode_file_size bytetable:    16695
offset to inode_name_offset bytetable:  19035
offset to inode_num_entries bytetable:  21375
offset to inode_mode_index bytetable:   23715
offset to inode_array_index bytetable:  26055
offset to modes bytetable:              28395
offset to uids bytetable:               28443
offset to gids bytetable:               28491
offset to zero padding:                 28539
offset to xip data:                     28672
offset to byte_aligned data:            3600384
offset to compressed data:              4150720
offset to strings data:                 5106657
offset to zero padding:                 5111902

Total image size:                       5111906
--

> 
> 
>  But basically, the patch looks good to me. I'm a bit surprised it's so simple.

Cool, thanks again for your response.

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
