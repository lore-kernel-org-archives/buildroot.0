From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 May 2018 01:19:59 +0200
Subject: [Buildroot] 'make foo-menuconfig' broken when host-ncurses was
 built
In-Reply-To: <876047f843.fsf@dell.be.48ers.dk>
References: <cb69fcf8-5af1-eafd-5fbb-bb0339831877@mind.be>
 <876047f843.fsf@dell.be.48ers.dk>
Message-ID: <5bca3339-b202-0882-0cb6-a492dc739adc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-05-18 22:12, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  >  Hi all,
>  >  My colleague David observed that since a month or so, the dialogs of 'make
>  > linux-menuconfig' looked pretty garbled. After a bit of debugging, it turns out
>  > that the problem is mixing host-ncurses with recent (6.0+) system ncurses. Based
>  > on the output, I suspect it's mixing an 8-bit ncurses library with widechar
>  > termcap files.
> 
>  >  This issue is caused by dde090c299 linux: fix passing of host CFLAGS and LDFLAGS
> 
>  >  What happens is that kconfig uses pkg-config to discover the ncurses
>  > installation. Since our host-ncurses doesn't install a pc file (and in linux.mk
>  > we anyway don't pass the approprate PKG_CONFIG_* variables), this will pick up
>  > the system's pkg-config settings. However, we set HOSTCC="/usr/bin/gcc -O2
>  > -I.../host/include -L.../host/lib -Wl,-rpath,.../host/lib" on the linux make
>  > command line, so it *will* actually pick up our host-ncurses library. On my
>  > system, 'pkg-config --libs ncurses' returns '-lncurses -ltinfo'. Our ncurses
>  > only has libncurses.so, so libtinfo.so will be picked up from the host.
> 
> Ahh :/

 See the patch I sent: my analysis was not entirely correct. The issue is not in
libtinfo.so. The issue is that we include the system's ncursesw.h (which is
actually called ncurses.h), but linking with buildroot's ncurses library that
doesn't support widechar. Hence the ^@ everywhere.

 By the way, the issue is not limited to pkg-config: older versions of
check-lxdialog.sh would just add -I/usr/include/ncurses if they find an
ncurses.h there, and that ncurses.h might be a widechar version...

> 
>  >  The question is how to resolve this. The correct thing to do would be to
>  > install the .pc file, and to do what Thomas proposed a while ago:
>  > $(HOST_DIR)/bin/pkg-config returns the host config, $(CROSS_COMPILE)pkg-config
>  > returns the target config. But this will probably result in breakage of a lot of
>  > packages...
> 
>  >  Any better ideas?
> 
> Is that really needed? Can't we just change linux.mk to use
> HOST_MAKE_ENV instead of TARGET_MAKE_ENV (it is a target package, but it
> only needs to link against host libraries). That wil ensure that the
> PKG_CONFIG_* environment variables are set, so if we were to install a
> ncurses(w) pc file for the host, kconfig should find and use it?

 Unfortunately, we have a fragment in pkg-kconfig.mk that *removes* the
PKG_CONFIG_* stuff from the environment...

 Also, the same issue may happen for *any* package using (recent) kconfig. I
didn't find an example that does it, but it's possible that a kconfig-package
adds TARGET_CONFIGURE_OPTS to FOO_MAKE_ENV, and this would cause the same issue
(TARGET_CONFIGURE_OPTS includes LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" and
HOST_LDFLAGS adds -L$(HOST_DIR)/lib).

 So my patch enabling widechar is the simplest solution :-). Not perfect of
course, because that patch will break again if the host has an ncurses.h which
is NOT widechar...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
