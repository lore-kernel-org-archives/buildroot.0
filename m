From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 15:05:07 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20150805130529.A6A7281E7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da63d87ce0d97911fe02e4cc898398b46c947643
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |  202 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 196 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1e94929..830f525 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,12 +2,202 @@
 
 	Fixes all over the tree and new features.
 
-	Infrastructure: Buildroot takes better care now of generating
-	predictable permissions in the target filesystem. However,
-	existing permissions on a custom skeleton or rootfs overlay
-	will no longer be preserved. Therefore, it is necessary to
-	add a permission table (BR2_ROOTFS_DEVICE_TABLE) to set
-	the required permissions.
+	Architectures:
+
+	 - Refactor how the availability of an MMU is described.
+	 - Minimal support for Cortex-M3
+	 - Minimal support for AArch64 big-endian
+
+	Toolchains:
+
+	 - Add CodeSourcery MIPS 2015.05, remove MIPS 2013.11
+	 - Use uClibc-ng as the default uClibc version, instead of the
+	   official uClibc, which hasn't done any release since 3+
+	   years
+	 - eglibc is now marked as deprecated
+	 - GCC: gcc 4.9.x is now the default and was updated to 4.9.3,
+	   support for gcc 5.x added.
+	 - Binutils: use Binutils 2.24 as the default, 2.25.x series
+	   bumped to 2.25.1, remove old Binutils 2.22.
+	 - Update ARC toolchain components to 2015.06
+	 - Add support for Fortran when building gcc
+
+	Bootloaders:
+
+	 - Support for using the kconfig configuration system in
+	   U-Boot
+
+	New Defconfigs:
+
+	 - VIA VAB-820/AMOS-820
+	 - OLimex OLinuxino A20 Lime
+	 - Many new defconfigs for Atmel evaluation boards:
+	   at91sam9rlek, at91sam9x5ek, sama5d3xek, sama5d4ek, sama5d4
+	   Xplained Ultra, sama5d3 Xplained.
+	 - ACME Systems Aria G25
+	 - WarPboard
+	 - Altera Cyclone 5 Development Board
+	 - Xilinx zc706
+	 - ARC AXS101 and AXS103 Software Development Platforms
+	 - Significant updates to Raspberry Pi / Raspberry Pi 2
+
+	Infrastructure:
+
+	 - Buildroot takes better care now of generating predictable
+	   permissions in the target filesystem. However, existing
+	   permissions on a custom skeleton or rootfs overlay will no
+	   longer be preserved. Therefore, it is necessary to add a
+	   permission table (BR2_ROOTFS_DEVICE_TABLE) to set the
+	   required permissions.
+	 - Add support for kconfig fragments.
+	 - No longer pass --{enable,disable}-debug to autotools
+	   packages depending on the value of
+	   BR2_ENABLE_DEBUG. BR2_ENABLE_DEBUG now only controls
+	   whether we build with -g or not.
+	 - Support for extracting archives in .lzma in the generic
+	   package infrastructure.
+	 - Remove random-seed file from the default skeleton, since
+	   seeding the entropy pool with a known seed makes more harm
+	   than good.
+	 - In the CVS download helper, add support to use a date as
+	   the version.
+	 - Add support for a per-package <pkg>_STRIP_COMPONENTS
+	   variable, which packages can use to specify how many path
+	   components should be stripped when extracting the tarball.
+	 - Addition of a 'kernel-module' package infrastructure, which
+	   simplifies the packaging of external kernel modules. Many
+	   existing packages are converted to use it.
+	 - Allow bootloaders to be implemented in $(BR2_EXTERNAL)
+	 - Remove /etc/securetty from the default skeleton.
+	 - Migration of sysV initscripts from the default skeleton to
+	   a package called 'initscripts', installed only when Busbox
+	   init or sysvinit are used.
+	 - Migration of the skeleton logic to a proper 'skeleton'
+	   package.
+	 - Addition of a 'linux-tools' infrastructure in the 'linux'
+	   package, to support building user-space tools bundled
+	   within the Linux kernel sources, such as perf and cpupower.
+	 - Usage of backticks instead of make $(shell ...) to execute
+	   shell commands. This allows to delay the evaluation of such
+	   commands when actually needed, and not when expanding the
+	   variables. It is useful to make 'make printvars' less
+	   noisy, and as a preparation to support top-level parallel
+	   build.
+	 - Libtool .la files are not mungled for all package types,
+	   instead of being handled only for packages using the
+	   autotools-package infrastructure.
+	 - Add mechanism to allow packages to express a dependency on
+	   gcc versions. This is needed for packages that use C++11 or
+	   C11 support for example.
+
+	Important package updates:
+
+	 - Complete rework of the matchbox packaging
+	 - Lots of fixes in packages for compatibility with musl and
+	   gcc 5.
+	 - Hash files added to a large number of packages.
+	 - Update a significant number of packages to use a new
+	   hosting, after the announcement of Google Code and
+	   Gitorious closing.
+	 - Major packages needed for SELinux support have been merged,
+	   but the support is not complete yet.
+	 - Significant update of OpenCV to version 3.0, and addition
+	   of lots of eatures.
+	 - Significant update of all packages supporting the GPU and
+	   VPU of i.MX ARM processors.
+	 - Addition of systemd support in a significant number of
+	   packages.
+	 - Qt5 updated to 5.5.0
+	 - Use modular X.org server by default instead of KDrive
+
+	Filesystems:
+
+	 - Complete overhaul of the iso9660 support. Now allows to use
+	   directly IS9660 as the root filesystem format and not only
+	   an initrd, and supports Grub 2 and isolinux in addition to
+	   Grub.
+
+	Updated packages: a10disp, agentpp, apache, at91bootstrap3,
+	audit, barebox, bc, bind, bmon, boost, btrfs-progs,
+	ca-certificates, can-utils, ccache, cloog, collectd, connman,
+	coreutils, c-periphery, cryptsetup, dado, dbus, dejavu,
+	dhcpcd, dnsmasq, dosfstools, dovecot, dovecot-pigeonhole,
+	e2fsprogs, ejabberd, erlang-p1-cache-tab, erlang-p1-sip,
+	erlang-p1-stringprep, erlang-p1-stun, erlang-p1-tls,
+	erlang-p1-utils, erlang-p1-xml, erlang-p1-yaml, ethtool,
+	eudev, evtest, exim, expect, explorercanvas, feh, ffmpeg,
+	file, flashrom, freescale-imx, freetype, gawk, gcc, gdb,
+	gettext, git, glib-networking, gnupg2, gnutls, gpsd, gptfdisk,
+	gpu-viv-bin-mx6q, gst-fsl-plugins, harfbuzz, hdparm, heimdal,
+	i2c-tools, imagemagick, imx-vpu, iproute2, ipset, isl, iw,
+	kodi, kodi-addon-xvdr, kodi-audioencoder-flac,
+	kodi-audioencoder-lame, kodi-audioencoder-vorbis,
+	kodi-audioencoder-wav, lftp, libass, libassuan, libcec,
+	libconfi, libcurl, libdrm, libevdev, libfreefare, libfslcodec,
+	libfslparser, libfslvpuwrap, libfuse, libglib2, libgpgme,
+	libgtk2, libgtk3, libical, libidn, libiio, libinput, libiscsi,
+	libllcp, libmicrohttpd, libnfc, libnss, libpcap, libpciaccess,
+	libpng, libserialport, libsigrok, libsoc, libtirpc, libubox,
+	libunistring, libupnp, libuv, libv4l, libva,
+	libva-intel-driver, libXrandr, lighttpd, linenoise, linux,
+	linux-firmware, linux-headers, live555, ltrace, lua,
+	lua-csnappy, lua-ev, luajit, lua-messagepack, luaperiphery,
+	lvm2, lxc, lzo, mesa3d, mesa3d-headers, midori, mmc-utils,
+	modem-manager, mono, mosquitto, mpd, mpd-mpc, mpfr, mpg123,
+	mtd, musl, nano, netperf, network-manager, nfs-utils, nginx,
+	nodejs, ntp, ola, opencv, openldap, openssh, openssl,
+	openswan, openvmtools, openvpn, opkg, orbit, orc, pcmanfm,
+	perl-cross, perl-encode-locale, perl-io-socket-ssl,
+	perl-mojolicious, perl-net-ssleay, perl-path-tiny, perl-uri,
+	perl-xml-libxml, php, pinentry, polarssl, postgresql,
+	pulseview, pure-ftpd, python, python-dpkt, python-lxml,
+	python-networkmanager, python-pyinotify, python-pypcap,
+	python-tornado, qextserialport, qt, qt5, rapidjson, redis,
+	rpcbind, rpi-firmware, rpi-userland, samba4, shairport-sync,
+	snmpp, sqlite, squid, strongswan, stunnel, sudo, sunxi-boards,
+	sunxi-mali, sysdig, sysstat, systemd, tcpdump, tiff, tmux,
+	tor, txheadend, tzdata, uboot, uclibc, ulogd, upmpdcli,
+	usb_modeswitch, usb_modeswitch_data, vala, vsftpd, wayland,
+	weston, whois, wireless-regdb, wireshark, x264, xapp_xvinfo,
+	xdriver_xf86-input-libinput, xdriver_xf86-input-vmmouse,
+	xdriver_xf86-video-cirrus, xdriver_xf86-video-geode,
+	xdriver_xf86-video-imx-viv, xdriver_xf86-video-mach64,
+	xdriver_xf86-video-neomagic, xdriver_xf86-video-r128,
+	xdriver_xf86-video-savage, xdriver_xf86-video-siliconmotion,
+	xdriver_xf86-video-vesa, xkeyboard-config, xlib_libfontenc,
+	xlib_libFS, xlib_libXaw, xlib_libxkbfile, xlib_libXrender,
+	xlib_libXt, xproto_kbproto, xproto_xproto, xproto_xrandrproto,
+	xscreensaver, xserver_xorg-server, xtables-addons, yaml-cpp,
+	zic.
+
+	New packages: angularjs, atf, audit, c-icap, c-icap-modules,
+	cpio, dawgdic, faketime, fcgiwrap, gflags, glog, initscripts,
+	jquery-datetimepicker, kodi-audioencoder-modplug,
+	kodi-audioencoder-nosefar, kodi-audioencoder-sidplay,
+	kodi-audioencoder-snesapu, kodi-audioencoder-stsound,
+	kodi-audioencoder-timidity, kodi-audioencoder-vgmstream,
+	kodi-platform, kodi-pvr-argustv, kodi-pvr-dvblink,
+	kodi-pvr-dvbviewer, kodi-pvr-filmon, kodi-pvr-hts,
+	kodi-pvr-iptvsimple, kodi-pvr-mediaportal-tvserver,
+	kodi-pvr-mythtv, kodi-pvr-nextpvr, kodi-pvr-njoy,
+	kodi-pvr-pctv, kodi-pvr-stalker, kodi-pvr-vbox,
+	kodi-pvr-vdr-vnsi, kodi-pvr-vuplus, kodi-pvr-wmc,
+	kodi-screensaver-asteroids, kodi-screensaver-biogenesis,
+	kodi-screensaver-crystalmorph, kodi-screensaver-greynetic,
+	kodi-screensaver-pingpong, kodi-screensaver-pyro,
+	kodi-screensaver-stars, kodi-visualisation-shadertoy,
+	kodi-visualisation-spectrum, kodi-visualisation-waveforhue,
+	kodi-visualisation-waveform, kvmtool, kyua, libfm,
+	libfm-extra, libplatform, librtas, libsodium, libsquish,
+	libucl, libump, linux-backports, lua-iconv, lutok, menu-cache,
+	moarvm, monkey, mono-gtksharp3, mosh, openipmi, python-can,
+	python-pycli, python-pydal, python-pyyaml, python-web2py,
+	qpid-proton, qt5webchannel, quazip, racehound, rtl8188eu,
+	rtl8821au, sepolgen, setools, skeleton, stm32flash,
+	webkitgtk24, xdriver_xf86-video-qxl, zynq-boot-bin.
+
+	Deprecated packages: webkitgtk, libgail, eglibc support in
+	glibc package.
 
 2015.05, Released May 31st, 2015
 
