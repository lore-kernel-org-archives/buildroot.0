From: JS <js@hipro.co.in>
Date: Sun, 02 Mar 2008 01:05:40 +0530
Subject: [Buildroot] Reg. CC_FOR_BUILD in xlib_libX11
Message-ID: <1204400140.23564.9.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

In package/x11r7/xlib_libX11/xlib_libX11.mk, the variable
'XLIB_LIBX11_CONF_ENV' confuses me. CC_FOR_BUILD is set to
use /usr/bin/gcc (native gcc) to use the headers from cross-compiler's
toolchain. Is this right?

Building x11r7 for mipsel fails with failures starting as,


> make[3]: Entering directory `/home/joe/work/inventsoln/tornado/tornado-gnu/buildroot/build_mipsel/xlib_libX11-1.1.1/src/util'
> Makefile:510: warning: overriding commands for target `makekeys-makekeys.o'
> Makefile:313: warning: ignoring old commands for target `makekeys-makekeys.o'
> Makefile:513: warning: overriding commands for target `makekeys'
> Makefile:280: warning: ignoring old commands for target `makekeys'
> /usr/bin/gcc -I/home/joe/work/inventsoln/tornado/tornado-gnu/buildroot/build_mipsel/staging_dir/usr/include -DHAVE_CONFIG_H -I. -I../../src -I../../include/X11      -c makekeys.c -o makekeys-makekeys.o
> In file included from /home/joe/work/inventsoln/tornado/tornado-gnu/buildroot/build_mipsel/staging_dir/usr/include/sys/types.h:31,
>                  from /home/joe/work/inventsoln/tornado/tornado-gnu/buildroot/build_mipsel/staging_dir/usr/include/X11/Xos.h:60,
>                  from makekeys.c:35:
> /home/joe/work/inventsoln/tornado/tornado-gnu/buildroot/build_mipsel/staging_dir/usr/include/bits/types.h:133:3: error: #error 
> In file included from /home/joe/work/inventsoln/tornado/tornado-gnu/buildroot/build_mipsel/staging_dir/usr/include/sys/types.h:31,
>                  from /home/joe/work/inventsoln/tornado/tornado-gnu/buildroot/build_mipsel/staging_dir/usr/include/X11/Xos.h:60,
>                  from makekeys.c:35:

After a bit of digging into the failure, I saw that __WORDSIZE is
defined to _MIPS_SZPTR in include/bits/wordsize.h . And, since the
compiler used is a native compiler (i686), I did not define that macro.

-- 
HiPro Solutions
http://hipro.co.in/
