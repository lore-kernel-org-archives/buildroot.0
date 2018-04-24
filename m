From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Apr 2018 17:24:19 +0200
Subject: [Buildroot] 'make foo-menuconfig' broken when host-ncurses was built
Message-ID: <cb69fcf8-5af1-eafd-5fbb-bb0339831877@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 My colleague David observed that since a month or so, the dialogs of 'make
linux-menuconfig' looked pretty garbled. After a bit of debugging, it turns out
that the problem is mixing host-ncurses with recent (6.0+) system ncurses. Based
on the output, I suspect it's mixing an 8-bit ncurses library with widechar
termcap files.

 This issue is caused by dde090c299 linux: fix passing of host CFLAGS and LDFLAGS

 What happens is that kconfig uses pkg-config to discover the ncurses
installation. Since our host-ncurses doesn't install a pc file (and in linux.mk
we anyway don't pass the approprate PKG_CONFIG_* variables), this will pick up
the system's pkg-config settings. However, we set HOSTCC="/usr/bin/gcc -O2
-I.../host/include -L.../host/lib -Wl,-rpath,.../host/lib" on the linux make
command line, so it *will* actually pick up our host-ncurses library. On my
system, 'pkg-config --libs ncurses' returns '-lncurses -ltinfo'. Our ncurses
only has libncurses.so, so libtinfo.so will be picked up from the host.

 The question is how to resolve this. The correct thing to do would be to
install the .pc file, and to do what Thomas proposed a while ago:
$(HOST_DIR)/bin/pkg-config returns the host config, $(CROSS_COMPILE)pkg-config
returns the target config. But this will probably result in breakage of a lot of
packages...

 Any better ideas?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
