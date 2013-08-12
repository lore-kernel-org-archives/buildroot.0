From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Mon, 12 Aug 2013 10:21:43 +0300
Subject: [Buildroot] [PATCH 1/1] gcc: fix libstdc++_pic for AVR32
In-Reply-To: <CAHt8ZCPX1TOFRPZHVjLtt3ScTL=2vc7oYwj0u9pPd3N8mSTVsg@mail.gmail.com>
References: <1376025370-9467-1-git-send-email-alexander.lukichev@gmail.com>
 <20130810210616.51dbcbf9@skate>
 <CAHt8ZCPX1TOFRPZHVjLtt3ScTL=2vc7oYwj0u9pPd3N8mSTVsg@mail.gmail.com>
Message-ID: <CAAHaz6H5BTFV5t5FUNGmM5EVNdQziSQzifFmdZbmcrgdiV4qCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

  Sorry for the late reply, was on a trip on weekend.

2013/8/10 Simon Dawson <spdawson@gmail.com>
> I'm not sure what specific problem this patch is meant to address.
> Alexander: are you trying to solve a build problem here? Or a target
> runtime problem? Perhaps the patch description could be expanded a
> little...?

  The patch I sent fixes a build problem for me, that arises during the
final stage when libstdc++ is built:

/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/bin/ar
cru libstdc++_pic.a *.o ../libsupc++/*.o
/home/alukiche/Projects/buildroot/buildroot-project/output/host/usr/avr32-buildroot-linux-uclibc/bin/ar:
*.o: No such file or directory
make[5]: *** [install-exec-local] Error 1
make[5]: Leaving directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src'
make[4]: *** [install-am] Error 2
make[4]: Leaving directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src'
make[3]: *** [install-recursive] Error 1
make[3]: Leaving directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3'
make[2]: *** [install-target-libstdc++-v3] Error 2
make[2]: Leaving directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build'
make[1]: *** [install] Error 2
make[1]: Leaving directory
`/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/build'
make: ***
[/home/alukiche/Projects/buildroot/buildroot-project/output/build/host-gcc-final-4.2.2-avr32-2.1.5/.stamp_host_installed]
Error 2

  Lines in
host-gcc-final-4.2.2-avr32-2.1.5/build/avr32-buildroot-linux-uclibc/libstdc++-v3/src/Makefile

install-exec-local:
ifeq ($(enable_shared),yes)
    $(AR) cru libstdc++_pic.a *.o $(top_builddir)/libsupc++/*.o
    $(INSTALL_DATA) libstdc++_pic.a $(DESTDIR)$(toolexeclibdir)
endif

are triggered, failing to find object files for the library
libstdc++_pic.a. These files are actually located in .libs/ subdirectory,
not in the current directory (where that Makefile is located). This happens
when I build AVR32 toolchain with C++ support. I have attached a defconfig
that triggers the problem on my host machine.

  The triggered lines come from a patch file named 300-libstdc++-pic.patch
that has apparently been applied to GCC 4.2.2 before it was packaged into
an archive file gcc-4.2.2-avr32-2.1.5.tar.bz2 (see .applied_patches_list
inside this archive). Googling for it revealed that this patch has been
used for different versions of the toolchain for AVR32 and MIPS, changing a
little with each version to adapt to it. I have found several versions of
this patch in a repository for Midge (a project for ADM5120 MIPS
microcontroller):
https://github.com/ZigFisher/Midge/tree/master/toolchain/gcc . The patch
appears as early as 3.4.4 and alterates in reference to those object files
between './' (in gcc 4.0.3) and '.libs/' (in gcc 3.4.4, 3.4.5, 3.4.6,
4.1.0). I have not found a version of this patch for 4.2.2 but concluded
that since it fails to find object files for libstdc++_pic.a in current
directory and from version to version of gcc it alterates between './' and
'.libs/', for 4.2.2 they must be in '.libs/'.

  I have checked that object files in '.libs/' indeed contain position
independent code (I looked at the build log, where -fPIC has been given to
commands that compile these files; and checked randomly with 'nm <file> |
grep _GLOBAL_OFFSET_TABLE_'). And I have build-tested several C++ packages
with the built toolchain. I did not go as far as trying to run them: no
AVR32 hardware at hand and I am not skilled enough to set up an AVR32
virtual environment quickly.

  Without this fix the GCC fails to build with C++ support always, at least
on my host machine ('gcc (GCC) 4.5.1 20100924 (Red Hat 4.5.1-4)', binutils
2.20.51.0.7-8.fc14). The fix solves the problem.

  It seems strange to me that GCC 4.2.2 for AVR32 is so dependent on which
machine it is built on: apparently not many people on this list have
encountered the problem that I have experienced.

  Thomas Petazzoni, should I send an updated version of my patch with a
concise version of the explanation above or is it not worth it? Thanks.

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130812/3ec1dd0d/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: defconfig
Type: application/octet-stream
Size: 260 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130812/3ec1dd0d/attachment-0001.obj>
