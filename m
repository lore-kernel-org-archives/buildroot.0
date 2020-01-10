From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 10 Jan 2020 11:17:47 -0800
Subject: [Buildroot] Kconfig warnings with GCC9
Message-ID: <CAGt4E5su1GkK+5ghxC9x9G9KNizC-5jm5E58qPKkDXKuDu5CqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Using GCC9 (Ubuntu 19.10), I am getting some compiler warnings
(potential buffer overruns) in the Kconfig code. Is this a known
issue?

Looks like GCC9 is pickier (yet again) than older versions.

$ lsb_release  -a
No LSB modules are available.
Distributor ID: Ubuntu
Description: Ubuntu 19.10
Release: 19.10
Codename: eoan

$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/9/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none:hsa
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu
9.2.1-9ubuntu2' --with-bugurl=file:///usr/share/doc/gcc-9/README.Bugs
--enable-languages=c,ada,c++,go,brig,d,fortran,objc,obj-c++,gm2
--prefix=/usr --with-gcc-major-version-only --program-suffix=-9
--program-prefix=x86_64-linux-gnu- --enable-shared
--enable-linker-build-id --libexecdir=/usr/lib
--without-included-gettext --enable-threads=posix --libdir=/usr/lib
--enable-nls --enable-bootstrap --enable-clocale=gnu
--enable-libstdcxx-debug --enable-libstdcxx-time=yes
--with-default-libstdcxx-abi=new --enable-gnu-unique-object
--disable-vtable-verify --enable-plugin --enable-default-pie
--with-system-zlib --with-target-system-zlib=auto --enable-multiarch
--disable-werror --with-arch-32=i686 --with-abi=m64
--with-multilib-list=m32,m64,mx32 --enable-multilib
--with-tune=generic --enable-offload-targets=nvptx-none,hsa
--without-cuda-driver --enable-checking=release
--build=x86_64-linux-gnu --host=x86_64-linux-gnu
--target=x86_64-linux-gnu
Thread model: posix
gcc version 9.2.1 20191008 (Ubuntu 9.2.1-9ubuntu2)

My latest BR commit is:

commit 84d471a0b150bc2ff1d08755d36be86d9380c2c5 (queue/master, master)
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Fri Jan 10 08:33:58 2020 +0100

    package/iputils: use relative symlink for ping6

    Fixes (part of):
    http://autobuild.buildroot.net/results/5659e1c91831921bd9ad6af670258783771b4dc8/

$ mkdir -p output/rpi
$ make O="/storage/Development/br-current/output/rpi" raspberrypi4_defconfig
mkdir -p /storage/Development/br-current/output/rpi/build/buildroot-config/lxdialog
PKG_CONFIG_PATH="" make CC="/usr/bin/gcc" HOSTCC="/usr/bin/gcc" \
    obj=/storage/Development/br-current/output/rpi/build/buildroot-config
-C support/kconfig -f Makefile.br conf
/usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE
-I/storage/Development/br-current/output/rpi/build/buildroot-config
-DCONFIG_=\"\"  -MM *.c >
/storage/Development/br-current/output/rpi/build/buildroot-config/.depend
2>/dev/null || :
/usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE
-I/storage/Development/br-current/output/rpi/build/buildroot-config
-DCONFIG_=\"\"   -c conf.c -o
/storage/Development/br-current/output/rpi/build/buildroot-config/conf.o
/usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE
-I/storage/Development/br-current/output/rpi/build/buildroot-config
-DCONFIG_=\"\"  -I. -c
/storage/Development/br-current/output/rpi/build/buildroot-config/zconf.tab.c
-o /storage/Development/br-current/output/rpi/build/buildroot-config/zconf.tab.o
In file included from
/storage/Development/br-current/output/rpi/build/buildroot-config/zconf.tab.c:2484:
./util.c: In function ?file_write_dep?:
./util.c:54:18: warning: ?..config.tmp? directive writing 12 bytes
into a region of size between 1 and 4097 [-Wformat-overflow=]
   54 |  sprintf(buf, "%s..config.tmp", dir);
      |                  ^~~~~~~~~~~~
./util.c:54:2: note: ?sprintf? output between 13 and 4109 bytes into a
destination of size 4097
   54 |  sprintf(buf, "%s..config.tmp", dir);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from
/storage/Development/br-current/output/rpi/build/buildroot-config/zconf.tab.c:2485:
./confdata.c: In function ?conf_write?:
./confdata.c:778:23: warning: ?.tmpconfig.? directive writing 11 bytes
into a region of size between 1 and 4097 [-Wformat-overflow=]
  778 |   sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
      |                       ^~~~~~~~~~~
./confdata.c:778:3: note: ?sprintf? output between 13 and 4119 bytes
into a destination of size 4097
  778 |   sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./confdata.c: In function ?conf_write_autoconf?:
./confdata.c:989:18: warning: ?.config.cmd? directive writing 11 bytes
into a region of size between 1 and 4097 [-Wformat-overflow=]
  989 |  sprintf(buf, "%s.config.cmd", dir);
      |                  ^~~~~~~~~~~
./confdata.c:989:2: note: ?sprintf? output between 12 and 4108 bytes
into a destination of size 4097
  989 |  sprintf(buf, "%s.config.cmd", dir);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./confdata.c:995:18: warning: ?.tmpconfig? directive writing 10 bytes
into a region of size between 1 and 4097 [-Wformat-overflow=]
  995 |  sprintf(buf, "%s.tmpconfig", dir);
      |                  ^~~~~~~~~~
./confdata.c:995:2: note: ?sprintf? output between 11 and 4107 bytes
into a destination of size 4097
  995 |  sprintf(buf, "%s.tmpconfig", dir);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./confdata.c:1000:18: warning: ?.tmpconfig_tristate? directive writing
19 bytes into a region of size between 1 and 4097 [-Wformat-overflow=]
 1000 |  sprintf(buf, "%s.tmpconfig_tristate", dir);
      |                  ^~~~~~~~~~~~~~~~~~~
./confdata.c:1000:2: note: ?sprintf? output between 20 and 4116 bytes
into a destination of size 4097
 1000 |  sprintf(buf, "%s.tmpconfig_tristate", dir);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./confdata.c:1007:18: warning: ?.tmpconfig.h? directive writing 12
bytes into a region of size between 1 and 4097 [-Wformat-overflow=]
 1007 |  sprintf(buf, "%s.tmpconfig.h", dir);
      |                  ^~~~~~~~~~~~
./confdata.c:1007:2: note: ?sprintf? output between 13 and 4109 bytes
into a destination of size 4097
 1007 |  sprintf(buf, "%s.tmpconfig.h", dir);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./confdata.c:1040:18: warning: ?.tmpconfig.h? directive writing 12
bytes into a region of size between 1 and 4097 [-Wformat-overflow=]
 1040 |  sprintf(buf, "%s.tmpconfig.h", dir);
      |                  ^~~~~~~~~~~~
./confdata.c:1040:2: note: ?sprintf? output between 13 and 4109 bytes
into a destination of size 4097
 1040 |  sprintf(buf, "%s.tmpconfig.h", dir);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./confdata.c:1046:18: warning: ?.tmpconfig_tristate? directive writing
19 bytes into a region of size between 1 and 4097 [-Wformat-overflow=]
 1046 |  sprintf(buf, "%s.tmpconfig_tristate", dir);
      |                  ^~~~~~~~~~~~~~~~~~~
./confdata.c:1046:2: note: ?sprintf? output between 20 and 4116 bytes
into a destination of size 4097
 1046 |  sprintf(buf, "%s.tmpconfig_tristate", dir);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./confdata.c:1054:18: warning: ?.tmpconfig? directive writing 10 bytes
into a region of size between 1 and 4097 [-Wformat-overflow=]
 1054 |  sprintf(buf, "%s.tmpconfig", dir);
      |                  ^~~~~~~~~~
./confdata.c:1054:2: note: ?sprintf? output between 11 and 4107 bytes
into a destination of size 4097
 1054 |  sprintf(buf, "%s.tmpconfig", dir);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/bin/gcc -DCURSES_LOC="<curses.h>" -DLOCALE
-I/storage/Development/br-current/output/rpi/build/buildroot-config
-DCONFIG_=\"\"
/storage/Development/br-current/output/rpi/build/buildroot-config/conf.o
/storage/Development/br-current/output/rpi/build/buildroot-config/zconf.tab.o
 -o /storage/Development/br-current/output/rpi/build/buildroot-config/conf
rm /storage/Development/br-current/output/rpi/build/buildroot-config/zconf.tab.c
  GEN     /storage/Development/br-current/output/rpi/Makefile
#
# configuration written to /storage/Development/br-current/output/rpi/.config
#

Regards,
-Markus
