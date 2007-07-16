From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 16 Jul 2007 21:54:06 +0200
Subject: [Buildroot] _VER vs. _VERSION breakage
In-Reply-To: <20070715104024.GB4096@aon.at>
References: <20070715104024.GB4096@aon.at>
Message-ID: <1184615647.18357.27.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2007-07-15 klockan 12:40 +0200 skrev Bernhard Fischer:
> Ulf,
> 
> Your change to use _VERSION broke at least acpid. Please double-check
> that all packages that you touched in this patch still build fine and
> repair.

Here is the result of trying to build most available packages
in buildroot for ARM. (I build for ARM generic (not using WCHAR)).

A lot of the packages does not build for ARM,
but if you can download the package, decompress it
in build_<arch> and then configure or patch it, 
then the VERSION patch is OK for this package.

At least some of the packages seems to require the uClibc is 
built with WCHAR. We should probably identify these packages
and hide them during configuration if WCHAR is not enabled.

Some packages like ACPID does not build for ARM
but I think I got that right anyway, even if I did not try that
specific package.
Maybe someone building x86 can report the few packages
I have problems with on ARM?


acpid/acpid.mk			- *******************
*argus/argus.mk			- OK
*at/at.mk			- OK
*autoconf/autoconf.mk		- OK
*automake/automake.mk		- OK
avahi/avahi.mk			- *******************
				- Requires "libdaemon" which fails due 
				  to AC_PROG_LIBTOOL not recognized
*bash/bash.mk			- OK
*berkeleydb/berkeleydb.mk	- OK
*bind/bind.mk			- OK
*bison/bison.mk			- OK
*bzip2/bzip2.mk			- OK
*coreutils/coreutils.m		- OK (Fails to build on ARM)
*cvs/cvs.mk			- OK (Fails to build on ARM)
*dash/dash.mk			- OK
*dbus/dbus.mk			- OK (Fails to build on ARM)
dbus-glib/dbus-glib.mk		- *************************
				- Requires "dbus" which fails on ARM
*dhcp/dhcp.mk			- OK
*diffutils/diffutils.mk		- OK
*distcc/distcc.mk		- OK
*dmalloc/dmalloc.mk		- OK
*dnsmasq/dnsmasq.mk		- OK
*dropbear/dropbear.mk		- OK
*e2fsprogs/e2fsprogs.mk		- OK
*file/file.mk			- OK
*findutils/findutils.mk		- OK (Fails to build on ARM)
*gawk/gawk.mk			- OK (Fails to build on ARM)
*gettext/gettext.mk		- OK (Fails to build on ARM)
*grep/grep.mk			- OK
*gzip/gzip.mk			- OK
hal/hal.mk			- *************************
				- Requires "dbus" which fails on ARM
*hotplug/hotplug.mk		- OK
*iostat/iostat.mk		- OK
*iproute2/iproute2.mk		- OK
*ipsec-tools/ipsec-tools.mk	- OK
*iptables/iptables.mk		- OK
*jpeg/jpeg.mk			- OK
*kexec/kexec.mk			- OK (ARM = unsupported architecture)
*l2tp/l2tp.mk			- OK
				  Patch version 2.1 has disappeared, 
				  2.2 is current. Fails to build
*libdaemon/libdaemon.mk		- OK (Fails to build on ARM)
*libelf/libelf.mk		- OK
*libevent/libevent.mk		- OK
libglib12/libglib12.mk		- *************************
libgtk12/libgtk12.mk		- *************************
*libpcap/libpcap.mk		- OK
*libpng/libpng.mk		- OK
*libsndfile/libsndfile.mk	- OK
libsysfs/libsysfs.mk		- OK
*libtool/libtool.mk		- OK
*libusb/libusb.mk		- OK
*lighttpd/lighttpd.mk		- init.d script changed name/directory.
*links/links.mk			- OK (Fails to build on ARM)
				  Needs -I$(STAGING_DIR)/include
*lrzsz/lrzsz.mk			- OK
*ltt/ltt.mk			- OK
*lzma/lzma.mk			- OK
*m4/m4.mk			- OK
*make/make.mk			- OK 
				Make fails during Cross-Compiles since
				it calls the Cross Compiled Make binary 
				in the latter part of the build instead 
				of the /usr/bin/make
*memtester/memtester.mk		- OK
metacity/metacity.mk		- *************************
*microcom/microcom.mk		- OK
*microperl/microperl.mk		- OK
*mkdosfs/mkdosfs.mk		- OK
*modutils/modutils.mk		- OK
*mpatrol/mpatrol.mk		- OK (Fails to build on ARM)
*mrouted/mrouted.mk		- OK (Fails to build on ARM)
*nano/nano.mk			- OK
*ncurses/ncurses.mk		- OK
*netkitbase/netkitbase.mk	- OK (Fails to build on ARM)
netkittelnet/netkittelnet.mk	- *************************
*netplug/netplug.mk		- OK (Requires bk (bitkeeper))
*netsnmp/netsnmp.mk		- OK Needs "defined(xxx) 
*nfs-utils/nfs-utils.mk		- OK (Fails to build on ARM)
*openssh/openssh.mk		- OK (Fails to build on ARM)
				  Needs to include $(STAGING_DIR)/ 
				  include
				  64/64 division
*openssl/openssl.mk		- OK
*patch/patch.mk			- OK
*pciutils/pciutils.mk		- OK, requires inux
*pkgconfig/pkgconfig.mk		- OK
*portmap/portmap.mk		- OK (Fails to build on ARM)
*procps/procps.mk		- OK (Fails to build on ARM)
				  wchar.h => bits/wchar.h,wctype.h 
					-I???
*proftpd/proftpd.mk		- OK
*psmisc/psmisc.mk		- OK (Fails to build on ARM)
qtopia4/qtopia4.mk		- *************************
*quagga/quagga.mk		- OK (Fails to build on ARM) (no SNMP)
raidtools/raidtools.mk		- *************************
*readline/readline.mk		- OK
*rsync/rsync.mk			- OK
*ruby/ruby.mk			- OK (Fails to build on ARM) 
					  (tried 1.8.2,1.86 + svn)
*samba/samba.mk			- OK (Fails to build on ARM)
					(tries to run test program
					compiled for ARM 
					during configure)
*sed/sed.mk			- OK (Fails to build on ARM)
					(WCHAR)
*sfdisk/sfdisk.mk		- OK (Fails to build on ARM)
*slang/slang.mk			- OK
*smartmontools/smartmontools.mk	- OK
*strace/strace.mk		- OK
*stunnel/stunnel.mk		- OK (Fails to build on ARM)
					needs SSL
*sudo/sudo.mk			- OK
*sysklogd/sysklogd.mk		- OK (Fails to build on ARM)
				 	lacks "linux/linkage.h"
*sysvinit/sysvinit.mk		- OK
*tar/tar.mk			- OK (Fails to build on ARM)
					(wcint_t not declared)
*tcpdump/tcpdump.mk		- OK
*tftpd/tftpd.mk			- OK
*thttpd/thttpd.mk		- OK
*tiff/tiff.mk			- OK
*tinylogin/tinylogin.mk		- OK
tinyx/tinyx.mk			- OK (Fails to build on ARM)
					cannot find -lXft
tn5250/tn5250.mk		- OK (Fails to build on ARM)
					needs slang.h
ttcp/ttcp.mk			- OK (Fails to build on ARM)
					needs #include <strings.h>
*udhcp/udhcp.mk			- This was merged into busybox!
*uemacs/uemacs.mk		- OK
*usbutils/usbutils.mk		- OK
*util-linux/util-linux.mk	- OK (Fails to build on ARM)
*wget/wget.mk			- OK
*which/which.mk			- OK
*wipe/wipe.mk			- OK
*wireless-tools/wireless-tools.mk OK
*vtun/vtun.mk			- OK
*xfsprogs/xfsprogs.mk		- OK (Fails to build on ARM)
*zlib/zlib.mk			- OK
=====================
Some other failures (not affected by VERSION patch)
asterisk
DirectFB
dmraid
fontconfig
libdaemon/libdaemon.mk Fails.
	avahi depends on this.
curl does not download	7.13.1 is too old...
	7.16.4 cannot be patched...
libid3tag does not compile
	=> madplay does not compile
lvm2



> 
> thanks,
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
