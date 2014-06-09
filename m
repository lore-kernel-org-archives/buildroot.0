From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Jun 2014 12:07:09 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-08
In-Reply-To: <20140609063010.9CF93101624@stock.ovh.net>
References: <20140609063010.9CF93101624@stock.ovh.net>
Message-ID: <20140609100709.GA3512@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Here's a quick analysis of the build failures.

On 2014-06-09 08:30 +0200, Thomas Petazzoni spake thusly:
>     xtensa |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/511193d2c43ced35fada333c8b2d13a7f096fb10/

Did something change in the luarocks infra ?
    gzip: cosmo-14.03.04.tar.gz: not in gzip format
    tar: This does not look like a tar archive
    tar: Exiting with failure status due to previous errors

Fran?ois ?

>       bfin | faifa-aa0b5f90b89a9fd153313... | NOK | http://autobuild.buildroot.net/results/0aa518705be3d8809dff1a5d40be946d9d26a131/

    fatal: Not a git repository (or any of the parent directories): .git
    fatal: Not a git repository (or any of the parent directories): .git
    make[1]: Entering directory
    `/home/test/test/1/output/build/faifa-aa0b5f90b89a9fd1533137b68ebf85f5437aba53'
    /home/test/test/1/output/host/usr/bin/bfin-linux-uclibc-gcc -DLINUX
    -DGIT_REV="\"-\"" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
    -D_FILE_OFFSET_BITS=64  -pipe -Os  -Wall -Wno-unused-result -fPIC -c
    main.c
    cc1: error: unrecognized command line option "-Wno-unused-result"

Maxime is on it.

>       i486 |                   libbsd-0.6.0 | NOK | http://autobuild.buildroot.net/results/e949d8fabeeecc74bd1c324c516e0b4938c99dbc/
>     x86_64 |                   libbsd-0.6.0 | NOK | http://autobuild.buildroot.net/results/d3e1b70fb91571efacbe32af2cd12d055508f5ac/

Does not build with uClibc.
I'm on it.

>   mips64el |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/0ee234e4557cbdf14aaa8f1a95156845c0dfe05a/
>        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/43c491a8875bba4b4eed13950346422d52841bf5/

Needs udev:
    checking for LIBUDEV... no
    configure: error: libudev-dev required for building DRI

Bernd, we need to revisit your libudev patch. ;-)

>        arm | rpi-userland-4855a45b118cb7... | NOK | http://autobuild.buildroot.net/results/6f36ad6a78d9c0e204d617ec6d15e7b577542c28/

Should be fixed by the recent cleanup from Samuel.

>        arm |                    systemd-213 | NOK | http://autobuild.buildroot.net/results/1524d346fa17749e2ae62e063b9cfdd0de95c76a/

Needs gcrypt?
    configure.ac:616: warning: macro 'AM_PATH_LIBGCRYPT' not found in library
    configure.ac:48: error: possibly undefined macro: AC_MSG_ERROR
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
    configure.ac:616: error: possibly undefined macro: AM_PATH_LIBGCRYPT

Eric ?

>        sh4 | tvheadend-0ebca1b3dbb6a18d8... | NOK | http://autobuild.buildroot.net/results/2278a078af5cc2e9f36661ad11e70b7692481266/

No clear error:
    CC              tvheadend
    /home/test/test/1/output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr//lib/libcrypto.so:
    warning: gethostbyname is obsolescent, use getnameinfo() instead.
    make[1]: *** [/home/test/test/1/output/build/tvheadend-0ebca1b3dbb6a18d8adcf66a32b5922ce769b9b5/data/dvb-scan/.stamp]
    Error 1

I'm on it...

>     mipsel |                   weston-1.5.0 | NOK | http://autobuild.buildroot.net/results/4e996c65f5b33d4518b0596d9c7076083d491a52/

My removal of the libxkbcommon seems to cause some issues:
    checking for CLIENT... no
    configure: error: Package requirements (wayland-client cairo >= 1.10.0 xkbcommon wayland-cursor) were not met:

    Package xkbcommon was not found in the pkg-config search path.
    Perhaps you should add the directory containing `xkbcommon.pc'
    to the PKG_CONFIG_PATH environment variable
    No package 'xkbcommon' found

I'm on it.

> microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/061ef838681d8cbfa34c579c05d1460df0e7ae38/

No idea:
    make[3]: Entering directory `/home/test/test/3/output/build/xapp_bdftopcf-1.0.4'
      CC     bdftopcf.o
      CCLD   bdftopcf
    /home/test/test/3/output/host/usr/microblazeel-buildroot-linux-gnu/sysroot/usr/lib/libXfont.so: undefined reference to `serverGeneration'
    collect2: error: ld returned 1 exit status

Bernd ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
