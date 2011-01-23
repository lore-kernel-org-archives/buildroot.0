From: bruce bushby <bruce.bushby@gmail.com>
Date: Sun, 23 Jan 2011 19:02:54 +0000
Subject: [Buildroot] Python 2.7 and ARM targets
Message-ID: <AANLkTimb4i816rBar-v4o7-xwgG2-fu3sndYqX=rUAsy@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I Recently started using buildroot for a project involving Telit's
GE863-PRO.

OS: Fedora 14
Buidlroot: 2010.11  and  "daily snapshot"

First a newbie question:
1. Why do I always end up with the word "unknown" in the resulting
"arm-unknown-linux-uclibcgnueabi"?

I have the following settings in my ".config":
BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_GCC_TARGET_TUNE="arm926ej-s"
BR2_GCC_TARGET_ARCH="armv5te"

Is it possible to have the results reflect my target, for example:
"arm-ge863pro-linux-uclibcgnueabi".......or "arm-arm926-linux-uclibcgnueabi"
?



Using the daily snapshot, I get the following Python issue:

1. Fedora 14 uses python 2.7 and not python 2.4, this appears to cause the
following error:

Making all in python
make[2]: Entering directory
`/home/bruce/arm-buildroot/buildroot/output/build/libdnet-1.11/python'
CC="/home/bruce/arm/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/home/bruce/arm/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot"
LDSHARED="/home/bruce/arm/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/home/bruce/arm/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
-shared" python2.4 setup.py build_ext
-I/home/bruce/arm/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/python2.4
/bin/sh: python2.4: command not found
make[2]: *** [python-build] Error 127
make[2]: Leaving directory
`/home/bruce/arm-buildroot/buildroot/output/build/libdnet-1.11/python'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/bruce/arm-buildroot/buildroot/output/build/libdnet-1.11'
make: *** [/home/bruce/arm/buildroot/output/build/libdnet-1.11/.stamp_built]
Error 2
[bruce at varm buildroot]$


So to get around this, I changed my "buildroot/package/python/python.mk" to
install "python 2.7"  .... however that produces a follow on issue:

/usr/bin/make -j2
CC="/home/bruce/arm-buildroot/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot"
-C /home/bruce/arm-buildroot/buildroot/output/build/Python-2.7
DESTDIR=/home/bruce/arm-buildroot/buildroot/output/target \

 PYTHON_MODULES_INCLUDE=/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include
\

 PYTHON_MODULES_LIB="/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/lib
/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib"
\
        PYTHON_DISABLE_MODULES="dbm zipfile gdbm nis" \
        HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen
make[1]: Entering directory
`/home/bruce/arm-buildroot/buildroot/output/build/Python-2.7'
/home/bruce/arm-buildroot/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
-c -fno-strict-aliasing -pipe -Os  -mtune=arm926ej-s -march=armv5te
-mabi=aapcs-linux -msoft-float
-I/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include
-I/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/include
-DNDEBUG -pipe -Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux
-msoft-float
-I/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include
-I/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/include
 -I. -IInclude -I./Include  -fPIC -DPy_BUILD_CORE -o Modules/python.o
./Modules/python.c
/home/bruce/arm-buildroot/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
-c -fno-strict-aliasing -pipe -Os  -mtune=arm926ej-s -march=armv5te
-mabi=aapcs-linux -msoft-float
-I/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include
-I/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/include
-DNDEBUG -pipe -Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux
-msoft-float
-I/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include
-I/home/bruce/arm-buildroot/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/include
 -I. -IInclude -I./Include  -fPIC -DPy_BUILD_CORE -o Parser/acceler.o
Parser/acceler.c
In file included from Include/Python.h:58,
                 from ./Modules/python.c:3In file included from
Include/Python.h:58:
Include/pyport.h:243:13:,
                 from Include/pgenheaders.h:10 ,
                 from Parser/acceler.c:13error: :
#error "This platform's pyconfig.h needs to define
PY_FORMAT_LONG_LONG"Include/pyport.h:243:13:
 error: #error "This platform's pyconfig.h needs to define
PY_FORMAT_LONG_LONG"
make[1]: *** [Modules/python.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Parser/acceler.o] Error 1
make[1]: Leaving directory
`/home/bruce/arm-buildroot/buildroot/output/build/Python-2.7'
make: ***
[/home/bruce/arm-buildroot/buildroot/output/build/Python-2.7/python] Error 2
[bruce at varm buildroot]$


Searching google I get the impression there are patches for "buildroot" to
enable python 2.7 ........  any pointers in locating and applying these
patches would be a great help!!!!

Thanks
Bruce
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110123/970a7f8c/attachment.html>
