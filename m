From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Feb 2020 12:04:21 +0000
Subject: [Buildroot] [Bug 11926] Cross compiled Qt applications aren't
 working anymore
In-Reply-To: <bug-11926-163@https.bugs.busybox.net/>
References: <bug-11926-163@https.bugs.busybox.net/>
Message-ID: <bug-11926-163-wSVsd1pbIP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11926

--- Comment #10 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Martin from comment #9)

Hello Martin,

can reproduce your problem with the given defconfig (independent of the custom
setting BR2_HOST_DIR or using the default).

Using sunxi-mali-mainline I get:

    $ readelf -d target/usr/bin/qtdiag | grep libGLESv2
    0x00000001 (NEEDED)                     Shared library:
[/my_build_path/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libGLESv2.so]


Same defconfig changed to rpi-userland leads to:

    $ readelf -d target/usr/bin/qtdiag | grep libGLESv2
    0x00000001 (NEEDED)                     Shared library: [libGLESv2.so]


For sunxi-mali-mainline:

    $ cat
host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig/glesv2.pc
    prefix=/usr
    exec_prefix=${prefix}
    libdir=${exec_prefix}/lib
    includedir=${prefix}/include

    Name: glesv2
    Description: ARM Mali implementation of OpenGL ESv2
    Version: 2.0
    Requires:
    Libs: -L${libdir} -lGLESv2 -lGLESv1_CM
    Cflags: -I${includedir}


For rpi-userland:

    $ cat
host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig/glesv2.pc 
    prefix=/usr
    exec_prefix=${prefix}
    libdir=${exec_prefix}/lib
    includedir=${prefix}/include

    Name: glesv2
    Description: RasberryPi implementation of OpenGL ESv2
    Version: 2.0
    Libs: -L${libdir} -lGLESv2
    Cflags: -I${includedir}/


Did not see where the different linking comes from...

Regards,
Peter

-- 
You are receiving this mail because:
You are on the CC list for the bug.
