From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sat, 13 Jan 2007 19:52:24 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: argus at atk
	autoconf automake avahi bas etc...
Message-ID: <20070114035224.755B5485D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-13 19:52:21 -0800 (Sat, 13 Jan 2007)
New Revision: 17287

Log:
fixup a whole steaming pile of insanity.  When packages are configured,
they should be configured with --prefix=/usr and we then need to use
make DESTDIR=$(STAGING_DIR) install to get things installed into the
staging directory.  The current situation for many packages, which use
--prefix=$(STAGING_DIR) results in the staging_dir paths getting compiled
into the binary itself.

This also adds in a pile of libtool fixups.  Between broken pkgconfig,
broken libtool handling, and broken --prefix settings, its a wonder
things have worked as well as they have up till now.
 -Erik


Added:
   trunk/buildroot/package/atk/libdir-la.patch
   trunk/buildroot/package/cairo/libdir-la.patch
   trunk/buildroot/package/expat/libdir-la.patch
   trunk/buildroot/package/freetype/libdir-la.patch
   trunk/buildroot/package/gettext/libdir-la.patch
   trunk/buildroot/package/libglib2/libdir-la.patch
   trunk/buildroot/package/libgtk2/libdir-la.patch
   trunk/buildroot/package/libpng/libdir-la.patch
   trunk/buildroot/package/pango/libdir-la.patch
   trunk/buildroot/package/xorg/libXfont-1.1.0-noftinternals.patch
   trunk/buildroot/package/xorg/libdir-la.patch

Modified:
   trunk/buildroot/package/argus/argus.mk
   trunk/buildroot/package/at/at.mk
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/autoconf/autoconf.mk
   trunk/buildroot/package/automake/automake.mk
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/bash/bash.mk
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/bind/bind.mk
   trunk/buildroot/package/bison/bison.mk
   trunk/buildroot/package/boa/boa.mk
   trunk/buildroot/package/bridge/bridge.mk
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/coreutils/coreutils.mk
   trunk/buildroot/package/cvs/cvs.mk
   trunk/buildroot/package/diffutils/diffutils.mk
   trunk/buildroot/package/directfb/directfb.mk
   trunk/buildroot/package/distcc/distcc.mk
   trunk/buildroot/package/dm/dm.mk
   trunk/buildroot/package/dmalloc/dmalloc.mk
   trunk/buildroot/package/dropbear/dropbear.mk
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
   trunk/buildroot/package/expat/expat.mk
   trunk/buildroot/package/file/file.mk
   trunk/buildroot/package/findutils/findutils.mk
   trunk/buildroot/package/flex/flex.mk
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/gawk/gawk.mk
   trunk/buildroot/package/gettext/gettext.mk
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/grep/grep.mk
   trunk/buildroot/package/gzip/gzip.mk
   trunk/buildroot/package/jpeg/jpeg.mk
   trunk/buildroot/package/kexec/kexec.mk
   trunk/buildroot/package/libcgi/libcgi.mk
   trunk/buildroot/package/libcgicc/libcgicc.mk
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/libglib12/libglib12.mk
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk12/libgtk12.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/libpcap/libpcap.mk
   trunk/buildroot/package/libpng/libpng.mk
   trunk/buildroot/package/libraw1394/libraw1394.mk
   trunk/buildroot/package/libtool/libtool.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/lighttpd/lighttpd.mk
   trunk/buildroot/package/links/links.mk
   trunk/buildroot/package/lrzsz/lrzsz.mk
   trunk/buildroot/package/ltt/ltt.mk
   trunk/buildroot/package/make/make.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/package/nano/nano.mk
   trunk/buildroot/package/ncurses/ncurses.mk
   trunk/buildroot/package/newt/newt.mk
   trunk/buildroot/package/ntp/ntp.mk
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openvpn/openvpn.mk
   trunk/buildroot/package/pango/no-tests.patch
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/patch/patch.mk
   trunk/buildroot/package/pppd/pppd.mk
   trunk/buildroot/package/psmisc/psmisc.mk
   trunk/buildroot/package/qte/qte.mk
   trunk/buildroot/package/raidtools/raidtools.mk
   trunk/buildroot/package/readline/readline.mk
   trunk/buildroot/package/rsync/rsync.mk
   trunk/buildroot/package/ruby/ruby.mk
   trunk/buildroot/package/sdl/sdl.mk
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/package/smartmontools/smartmontools.mk
   trunk/buildroot/package/socat/socat.mk
   trunk/buildroot/package/sqlite/sqlite.mk
   trunk/buildroot/package/strace/strace.mk
   trunk/buildroot/package/stunnel/stunnel.mk
   trunk/buildroot/package/sudo/sudo.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/package/tcpdump/dhcpdump.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk
   trunk/buildroot/package/tftpd/tftpd.mk
   trunk/buildroot/package/thttpd/thttpd.mk
   trunk/buildroot/package/tiff/tiff.mk
   trunk/buildroot/package/tn5250/tn5250.mk
   trunk/buildroot/package/usbutils/usbutils.mk
   trunk/buildroot/package/util-linux/util-linux.mk
   trunk/buildroot/package/valgrind/valgrind.mk
   trunk/buildroot/package/vtun/vtun.mk
   trunk/buildroot/package/wget/wget.mk
   trunk/buildroot/package/which/which.mk
   trunk/buildroot/package/xorg/Config.in
   trunk/buildroot/package/xorg/xorg-config.patch
   trunk/buildroot/package/xorg/xorg.mk


Changeset:

Sorry, the patch is too large to include (3734 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=17287
