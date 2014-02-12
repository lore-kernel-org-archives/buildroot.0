From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Feb 2014 18:52:48 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140212093245.49e2b6ac@skate>
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate>
Message-ID: <20140212175247.GB5581@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-12 09:32 +0100, Thomas Petazzoni spake thusly:
> As usual, analysis of yesterday build failures.
> >        arm | qtuio-abe4973ff60654aad9df7... | NOK | http://autobuild.buildroot.net/results/9b57f76672c8d0a74980cb1de32661761b666ce7/
> 
> /home/test/test/1/output/host/usr/bin/arm-unknown-linux-gnueabi-g++ -L/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -lGAL -lEGL -Wl,-O1 -o pinchzoom graphicsview.o main.o mouse.o moc_graphicsview.o moc_mouse.o qrc_mice.o    -L/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -L../../lib -lqTUIO -lQtGui -L/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot//usr/lib -ldirectfb -lfusion -L/home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -ldirect -lEGL -lQtNetwork -lQtCore -lpthread 
> /home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-gnueabi/4.6.4/../../../../arm-unknown-linux-gnueabi/bin/ld: warning: libXdamage.so.1, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
> /home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-gnueabi/4.6.4/../../../../arm-unknown-linux-gnueabi/bin/ld: warning: libXfixes.so.3, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
> /home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-gnueabi/4.6.4/../../../../arm-unknown-linux-gnueabi/bin/ld: warning: libXext.so.6, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)
> /home/test/test/1/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-unknown-linux-gnueabi/4.6.4/../../../../arm-unknown-linux-gnueabi/bin/ld: warning: libX11.so.6, needed by /home/test/test/1/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so, not found (try using -rpath or -rpath-link)

I already looked at that one, and the situatioon is strange:

  - libGAL is provided by gpu-viv-bin-mx6q

  - Xorg is not selected, so gpu-viv-bin-mx6q should install the 'fb'
    version of the lib, which does not have those X11 dependencies

  - on the other hand, the X11 version of libGAL does have a dependency
    on two of the X11 libs, so it looks it was the one installed

So I tried rebuilding it here, and the build was sucessful:

  - the installed libGAL is the 'fb' one

  - qtuio build OK

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
