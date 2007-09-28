From: Leonid <Leonid@a-k-a.net>
Date: Fri, 28 Sep 2007 08:37:31 -0700
Subject: [Buildroot] Cannot build TinyX
In-Reply-To: <bcba51a0709280431n56c69ed5v45c9d0e753a60d0c@mail.gmail.com>
References: <bcba51a0709280431n56c69ed5v45c9d0e753a60d0c@mail.gmail.com>
Message-ID: <406A31B117F2734987636D6CCC93EE3CB05B92@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Dmitry:

Try to locate line in the make file which you think "runs" the binary
file. With some level of probability there could be in fact some macro
definitions, placed before the file and intended to do something with
the file. If the macros happened to be not defined, it looks like
running the file itself. I have bumped into the same problem with STRIP
related macros - in my config file BR2_STRIP_strip was not defined and
it manifested itself similarly to yours.

Regards,

Leonid. 

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Dimitry Golubovsky
Sent: Friday, September 28, 2007 4:31 AM
To: buildroot at uclibc.org
Subject: [Buildroot] Cannot build TinyX

Hi,

When building TinyX, the process stops at the attempt to run the imake
executable built by the toolchain's compiler.

The executable has format that Linux cannot run:

[dima at bldroot buildroot]$ file build_i686/xc-011010/config/imake/imake
build_i686/xc-011010/config/imake/imake: ELF 32-bit LSB executable,
Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs),
not stripped
[dima at bldroot buildroot]$ build_i686/xc-011010/config/imake/imake
-bash: build_i686/xc-011010/config/imake/imake: No such file or
directory
[dima at bldroot buildroot]$ ldd build_i686/xc-011010/config/imake/imake
/usr/bin/ldd: line 124: build_i686/xc-011010/config/imake/imake: No
such file or directory

For comparison, the host's make looks like this:

[dima at bldroot buildroot]$ file `which make`
/usr/bin/make: ELF 32-bit LSB executable, Intel 80386, version 1
(SYSV), for GNU/Linux 2.4.1, dynamically linked (uses shared libs),
stripped

imake was linked like this:

making imake with BOOTSTRAPCFLAGS= in config/imake
/home/dima/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gc
c
-Os -pipe  -I/home/dima/buildroot/build_i686/staging_dir/usr/include
-I/home/dima/buildroot/build_i686/staging_dir/include
--sysroot=/home/dima/buildroot/build_i686/staging_dir/ -isysroot
/home/dima/buildroot/build_i686/staging_dir -mtune=i686 -march=i686 -o
ccimake  -O -I../../include -I../../imports/x11/include/X11 ccimake.c
/home/dima/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gc
c
-Os -pipe  -I/home/dima/buildroot/build_i686/staging_dir/usr/include
-I/home/dima/buildroot/build_i686/staging_dir/include
--sysroot=/home/dima/buildroot/build_i686/staging_dir/ -isysroot
/home/dima/buildroot/build_i686/staging_dir -mtune=i686 -march=i686 -c
 -O -I../../include -I../../imports/x11/include/X11 `./ccimake`
imake.c
/bin/sh: ./ccimake: No such file or directory
/home/dima/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gc
c
-Os -pipe  -I/home/dima/buildroot/build_i686/staging_dir/usr/include
-I/home/dima/buildroot/build_i686/staging_dir/include
--sysroot=/home/dima/buildroot/build_i686/staging_dir/ -isysroot
/home/dima/buildroot/build_i686/staging_dir -mtune=i686 -march=i686 -o
imake  -O -I../../include -I../../imports/x11/include/X11 imake.o

It looks like some `ccimake' was missing (or indeed did not get on the
proper path) - how could this be fixed?

Thanks.

-- 
Dimitry Golubovsky

Anywhere on the Web
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
