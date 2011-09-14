From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 14 Sep 2011 02:05:16 +0200
Subject: [Buildroot] [PATH 0/1] package/ncurses: disable use of the GPM
	library
Message-ID: <1315958717-9861-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

That one gave me a hard time most of the day, until I found out exactly
why building ncurses on my machine was consistently failing in buildroot
when it worked manually...

When building the toolchain, uClibc installs a host-ldd that is capable of
interpreting the target ELF files without running them (which the standard
ldd for the host can't, obviously).

That host-ldd is then installed as $(HOST_DIR)/usr/bin/ldd, which is first
in the PATH.

Then, when building the target ncurses, we first need to build the host tic
so we do configure ncurses for the host. At this step, ncurses' ./configure
tries to link against the GPM library, and if successful, extracts it's
SONAME using the ldd in the PATH, in it find the host-ldd previously
installed by uClibc. Alas, that host-ldd, besides being for interpreting
the _target_ files, is non-compliant on its output:

- ldd from glibc:
$ /usr/bin/ldd conftest
        linux-vdso.so.1 =>  (0x00007fffc87ff000)
        libgpm.so.2 => /usr/lib/libgpm.so.2 (0x00007f60ea873000)
        libdl.so.2 => /lib/libdl.so.2 (0x00007f60ea66f000)
        libc.so.6 => /lib/libc.so.6 (0x00007f60ea30d000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f60eaa94000)

- ldd installed by uClibc:
$ /home/ymorin/dev/buildroot/O/host/usr/bin/ldd conftest
checking sub-depends for '/usr/lib/libgpm.so.2'
checking sub-depends for '/lib64/libdl.so.2'
checking sub-depends for '/lib64/libc.so.6'
        libgpm.so.2 => /usr/lib/libgpm.so.2 (0x00000000)
        libdl.so.2 => /lib64/libdl.so.2 (0x00000000)
        libc.so.6 => /lib64/libc.so.6 (0x00000000)
        /lib64/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00000000)

Well, apart the addresses that are obviously faked, but has absolutely no
impact whatsoever, the problem are the first three lines, which makes
./configure improperly extract the SONAME as beeing (whitout leading spaces):
  libgpm.so.2'
  libgpm.so.2

And, no, that's not a typo; first line has a trailing single quote, and the
second line repeats the library name, without the trainling single quote.

Which makes the build break very hard soon afterward...

This problem only happens if one does have the GPM developement files
installed on the host, of course, which happens to be my case... :-/

Regards,
Yann E. MORIN.
