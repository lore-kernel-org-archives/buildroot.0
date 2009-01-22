From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 22 Jan 2009 22:02:49 +0100
Subject: [Buildroot] Problem building ALSA_UTILS
Message-ID: <1232658169.5311.29.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I finally discovered the reason I have had problems with alsa-utils

I get the following problem:

alsamixer.o: In function `mixer_init_dc':
alsamixer.c:(.text+0x476): undefined reference to `acs_map'
alsamixer.o: In function `mixer_show_text':
alsamixer.c:(.text+0x8b6): undefined reference to `acs_map'
alsamixer.c:(.text+0x8d0): undefined reference to `acs_map'
alsamixer.c:(.text+0x8ea): undefined reference to `acs_map'
alsamixer.c:(.text+0x904): undefined reference to `acs_map'
alsamixer.o:alsamixer.c:(.text+0x92c): more undefined references to ...

acs_map is coming from the ncurses directory, but
in ncurses.h, acs_map is defined to something else.
I have not found any library using acs_map,
they are all using nc_acs_map.

in $(ALSA_UTILS_DIR)/alamizer/,deps/alsamixer.Po I found


/home/ulf/projects/Buildroot/20090122/buildroot/build_avr32/staging_dir/usr/include/sys/user.h:
/home/ulf/projects/Buildroot/20090122/buildroot/build_avr32/staging_dir/usr/include/locale.h:
/home/ulf/projects/Buildroot/20090122/buildroot/build_avr32/staging_dir/usr/include/bits/uClibc_locale.h:
/usr/include/ncurses/ncurses.h:
/home/ulf/projects/Buildroot/20090122/buildroot/build_avr32/staging_dir/usr/include/ncurses_dll.h:

so ncurses.h comes from the host machine, and not from the target
machine.

In OpenSuSE 11.0 this contains:

#if 0
extern NCURSES_EXPORT_VAR(chtype*) _nc_acs_map(void);
#define acs_map (_nc_acs_map())
#else
extern NCURSES_EXPORT_VAR(chtype) acs_map[];
#endif

which means that acs_map becomes a valid identifier
which is exported but not found, since Buildroot ncurses uses:

?#if 1
extern NCURSES_EXPORT_VAR(chtype*) _nc_acs_map(void);
#define acs_map (_nc_acs_map())
#else
extern NCURSES_EXPORT_VAR(chtype) acs_map[];
#endif


I do not yet know why the host alsa-utils
uses ?/usr/include/ncurses/ncurses.h.

BR
Ulf Samuelsson
