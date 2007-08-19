From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 20 Aug 2007 00:19:11 +0200
Subject: [Buildroot] make clean in topdir tries to remove
	host	/usr/bin/patch :(
In-Reply-To: <0708192057530.12216@somehost>
References: <0708192057530.12216@somehost>
Message-ID: <1187561952.31921.57.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2007-08-19 klockan 21:02 +0200 skrev Cristian Ionescu-Idbohrn:
> Odd...
> 
> make[1]: Entering directory `buildroot/build_i486/openntpd-3.9p1'
> rm -f ntpd.o buffer.o log.o imsg.o ntp.o ntp_msg.o config.o server.o
> client.o util.o y.tab.o ntpd openbsd-compat/*.o openbsd-compat/*.a \
>             configure.lineno config.h.in~ ntpd.8.out ntpd.conf.5.out
> make[1]: Leaving directory `buildroot/build_i486/openntpd-3.9p1'
> 
> /usr/bin/make -j1 DESTDIR=buildroot/project_build_i486/uclibc/root
> CC=buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc
> -C buildroot/build_i486/patch-2.5.9 uninstall
> make[1]: Entering directory `buildroot/build_i486/patch-2.5.9'
> rm -f /usr/bin/`echo patch | sed 's,x,x,'`
> rm: cannot remove `/usr/bin/patch': Permission denied
> make[1]: *** [uninstall] Error 1
> 
> 

These are the rules in the Makefile

uninstall::
	rm -f $(bindir)/$(patch_name)$(EXEEXT)
	rm -f $(man1dir)/$(patch_name)$(man1ext)

patch_name = `echo patch | sed '$(transform)'`
transform = s,x,x,

prefix = /usr
exec_prefix = /usr
bindir = $(exec_prefix)/bin


Search for DEST_DIR in patch build directory gives no result...

----
It is therefore wrong the make -C PATCHDIR "uninstall"


BR
Ulf Samuelsson
