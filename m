From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 08 Aug 2019 09:58:36 +0000
Subject: [Buildroot] [Bug 12096] New: tcpreplay: build fails if
 libdumbnet-dev is installed in the host
Message-ID: <bug-12096-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12096

            Bug ID: 12096
           Summary: tcpreplay: build fails if libdumbnet-dev is installed
                    in the host
           Product: buildroot
           Version: 2018.11
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ggarcia at marvell.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When compiling tcpreplay package, the build fails if the user has
libdumbnet-dev installed in the host system. 
This has been tested in ubuntu 19.04 
A workaround is to install libdnet package in buildroot.

Here is the failing code in the tcpreplay configure file:

    for testdir in $trydnetdir /usr/local /opt/local $MACOSX_SDK_PATH/usr /usr
; do
        if test -x ${testdir}/bin/dnet-config -a $founddnet = no ; then
            LDNETINC="$($testdir/bin/dnet-config --cflags)"
            LDNETLIB="$($testdir/bin/dnet-config --libs)"
            libdnet_version="$($testdir/bin/dnet-config --version)"
            founddnet=$testdir
        fi
    done



Error Logs:

/home/test/projects/buildroot-output/host/bin/aarch64-marvell-linux-gnu-gcc
-DHAVE_CONFIG_H -I. -I../../src   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -I.. -I../..  -I/usr/include
-D_U_="__attribute__((unused))" -Wall -std=gnu99 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2    -Wno-variadic-macros
-Wfatal-errors -Wno-format-contains-nul
-I/home/test/projects/buildroot-output/host/aarch64-buildroot-linux-gnu/sysroot/usr
-c -o fakepoll.o fakepoll.c
aarch64-marvell-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
/home/test/projects/buildroot-output/host/bin/aarch64-marvell-linux-gnu-gcc
-DHAVE_CONFIG_H -I. -I../../src   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -I.. -I../..  -I/usr/include
-D_U_="__attribute__((unused))" -Wall -std=gnu99 -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2    -Wno-variadic-macros
-Wfatal-errors -Wno-format-contains-nul
-I/home/test/projects/buildroot-output/host/aarch64-buildroot-linux-gnu/sysroot/usr
-c -o xX.o xX.c
aarch64-marvell-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
aarch64-marvell-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
make[6]: *** [Makefile:448: cidr.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[6]: *** [Makefile:448: err.o] Error 1
make[6]: *** [Makefile:448: list.o] Error 1
aarch64-marvell-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
make[6]: *** [Makefile:448: cache.o] Error 1
aarch64-marvell-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
make[6]: *** [Makefile:448: services.o] Error 1
aarch64-marvell-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
aarch64-marvell-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
make[6]: *** [Makefile:448: get.o] Error 1
make[6]: *** [Makefile:448: fakepcap.o] Error 1
aarch64-marvell-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
make[6]: *** [Makefile:448: fakepcapnav.o] Error 1
aarch64-marvell-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
make[6]: *** [Makefile:448: fakepoll.o] Error 1
aarch64-marvell-linux-gnu-gcc: ERROR: unsafe header/library path used in
cross-compilation: '-I/usr/include'
make[6]: *** [Makefile:448: xX.o] Error 1
make[5]: *** [Makefile:372: all] Error 2
make[4]: *** [Makefile:1147: all-recursive] Error 1
make[3]: *** [Makefile:559: all] Error 2
make[2]: *** [Makefile:437: all-recursive] Error 1
make[1]: *** [package/pkg-generic.mk:232:
/home/test/projects/buildroot-output/build/tcpreplay-4.2.6/.stamp_built] Error
2
make: *** [Makefile:23: _all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
