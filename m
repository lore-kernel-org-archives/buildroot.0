From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Jul 2014 12:12:29 +0200
Subject: [Buildroot] [PATCH 20/20 v3] package/xserver_xorg-server: needs
	libudev, not a udev daemon
References: <cover.1405777634.git.yann.morin.1998@free.fr>
 <7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <XnsA3777C2F4BB23berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.199
8 at free.fr:

> xserver_xorg-server is happy enough with just a libudev, and does
> not require a udev daemon.

Hi,

although it is true that xserver_xorg-server compiles with libudev alone it 
segfaults at runtime when checking for video hardware without udev daemon:

========================================================================
(gdb) run
Starting program: /usr/bin/Xorg :0.0 vt01 -s 0 -noreset -allowMouseOpenFail 
-logfile /data/log/xorg.log
[...]
X.Org X Server 1.16.0
[...]
Program received signal SIGSEGV, Segmentation fault.
0x080e058a in xf86OutputClassDriverList (nmatches=20, matches=0xbffff710, 
index=0) at xf86platformBus.c:260
260     xf86platformBus.c: No such file or directory.
(gdb) bt full
#0  0x080e058a in xf86OutputClassDriverList (nmatches=20, matches=
0xbffff710, index=0) at xf86platformBus.c:260
        cl = <optimized out>
        i = 0
#1  xf86PlatformMatchDriver (matches=matches at entry=0xbffff710, 
nmatches=nmatches at entry=20) at xf86platformBus.c:297
        i = 0
        j = 0
        info = <optimized out>
        pass = 0
#2  0x080e3975 in listPossibleVideoDrivers (matches=matches at entry=
0xbffff710, nmatches=20) at xf86AutoConfig.c:203
        i = 0
#3  0x080e3b22 in xf86AutoConfig () at xf86AutoConfig.c:152
        deviceList = {0x0 <repeats 20 times>}
        p = <optimized out>
        cp = <optimized out>
        buf = "\b\000\000\000\b\000\000\000\b\000\000\000\b\000\000\000\200
\370\377\277", '\000' <repeats 60 times>, "\206\200\022\004\a\004\220\000
\006\000\000\003\000\000\000\000\004\000\000\360\000\000\000\000\f\000\000
\340\000\000\000\000\001\360\000\000\000\000\000\000\000\000\000\000I\030
\022\004\000\000\000\000\220\000\000\000\000\000\000\000\v\001\000\000\t
\000\f\001m\200\204b\320\000DV\000\000\000\000A\002\000\000\071\000\000\000
\000\000\000\000\001\000\240\317\000\000\002", '\000' <repeats 45 times>...
        ret = <optimized out>
#4  0x080c075a in InitOutput (pScreenInfo=pScreenInfo at entry=0x822b260 
<screenInfo>, argc=argc at entry=9, argv=argv at entry=0xbffffd44)
    at xf86Init.c:476
        i = <optimized out>
        j = <optimized out>
        k = <optimized out>
        scr_index = <optimized out>
        modulelist = <optimized out>
        optionlist = 0x822b260 <screenInfo>
        screenpix24 = <optimized out>
        pix24 = <optimized out>
        pix24From = X_DEFAULT
        pix24Fail = 0
        autoconfig = 1
        sigio_blocked = 0
        want_hw_access = 0
        configured_device = <optimized out>
#5  0x0807e7e4 in dix_main (argc=argc at entry=9, argv=argv at entry=0xbffffd44, 
envp=envp at entry=0xbffffd6c) at main.c:202
        i = <optimized out>
        alwaysCheckForInput = {0, 1}
#6  0x080686fe in main (argc=9, argv=0xbffffd44, envp=0xbffffd6c) at 
stubmain.c:34
No locals.
(gdb)
========================================================================
strace shows:

open("/etc/udev/udev.conf", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file 
or directory)
access("/run/udev/control", F_OK)       = -1 ENOENT (No such file or 
directory)

Luckily enough xserver_xorg-server does not depend on udev/hal, configure 
just prints:

configure: WARNING:
             ***********************************************
             Neither HAL nor udev backend will be enabled.
             Input device hotplugging will not be available!
             ***********************************************

which is fine for me, everything works good without udev/hal ;)

Regards, Bernd
