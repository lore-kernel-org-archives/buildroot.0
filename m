From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 22:12:28 +0200
Subject: [Buildroot] 'make foo-menuconfig' broken when host-ncurses was
 built
In-Reply-To: <cb69fcf8-5af1-eafd-5fbb-bb0339831877@mind.be> (Arnout
 Vandecappelle's message of "Tue, 24 Apr 2018 17:24:19 +0200")
References: <cb69fcf8-5af1-eafd-5fbb-bb0339831877@mind.be>
Message-ID: <876047f843.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >  Hi all,
 >  My colleague David observed that since a month or so, the dialogs of 'make
 > linux-menuconfig' looked pretty garbled. After a bit of debugging, it turns out
 > that the problem is mixing host-ncurses with recent (6.0+) system ncurses. Based
 > on the output, I suspect it's mixing an 8-bit ncurses library with widechar
 > termcap files.

 >  This issue is caused by dde090c299 linux: fix passing of host CFLAGS and LDFLAGS

 >  What happens is that kconfig uses pkg-config to discover the ncurses
 > installation. Since our host-ncurses doesn't install a pc file (and in linux.mk
 > we anyway don't pass the approprate PKG_CONFIG_* variables), this will pick up
 > the system's pkg-config settings. However, we set HOSTCC="/usr/bin/gcc -O2
 > -I.../host/include -L.../host/lib -Wl,-rpath,.../host/lib" on the linux make
 > command line, so it *will* actually pick up our host-ncurses library. On my
 > system, 'pkg-config --libs ncurses' returns '-lncurses -ltinfo'. Our ncurses
 > only has libncurses.so, so libtinfo.so will be picked up from the host.

Ahh :/

 >  The question is how to resolve this. The correct thing to do would be to
 > install the .pc file, and to do what Thomas proposed a while ago:
 > $(HOST_DIR)/bin/pkg-config returns the host config, $(CROSS_COMPILE)pkg-config
 > returns the target config. But this will probably result in breakage of a lot of
 > packages...

 >  Any better ideas?

Is that really needed? Can't we just change linux.mk to use
HOST_MAKE_ENV instead of TARGET_MAKE_ENV (it is a target package, but it
only needs to link against host libraries). That wil ensure that the
PKG_CONFIG_* environment variables are set, so if we were to install a
ncurses(w) pc file for the host, kconfig should find and use it?

-- 
Bye, Peter Korsgaard
