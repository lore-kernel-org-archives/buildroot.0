From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sun, 7 Mar 2010 13:00:30 -0800 (PST)
Subject: [Buildroot] How to build crosstools-ng and commonc++ POSIX
	framework library
Message-ID: <190455.98316.qm@web44814.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FYI, notes on how to build crosstools-ng and commonc++ for QEMU ARM versatilepb.

My objective is to get the commonc++ POSIX framework running in a Buildroot RFS
under QEMU.

Disclaimer:  I am a crosstools-ng/commonc++ rookie.  This seems to work, but
so did fusion in a bottle.

Jim Thomas


Sat 6 Mar 2010

Download and expand crosstools-ng:

  /home/jthomas/work

  $ wget http://ymorin.is-a-geek.org/download/crosstool-ng/crosstool-ng-1.6.0.tar.bz2 

  -rw-r--r--  1 jthomas swdev 1830798 2010-01-31 16:14 crosstool-ng-1.6.0.tar.bz2

  $ tar xfj crosstool-ng-1.6.0.tar.bz2 

Install gawk:

  $ sudo apt-get install gawk

Create directory where crosstools-ng will store downloaded tarballs:

  $ mkdir ~/src

Build crosstools-ng:

  /home/jthomas/work/crosstool-ng-1.6.0

  $ ./configure --local

    <snip>

    Building up Makefile... done

    crosstool-NG configured as follows:
      PREFIX='/home/jthomas/work/crosstool-ng-1.6.0'
      BINDIR='/home/jthomas/work/crosstool-ng-1.6.0'
      LIBDIR='/home/jthomas/work/crosstool-ng-1.6.0'
      DOCDIR='/home/jthomas/work/crosstool-ng-1.6.0/docs'
      MANDIR='/home/jthomas/work/crosstool-ng-1.6.0/docs'

    Now run:
      make

  $ make

  $ ./ct-ng help

NOTE: Select 'arm' (not 'armeb') to match little endian versatilepb and G20.

  $ ./ct-ng arm-unknown-linux-gnueabi

  $ ./ct-ng menuconfig

     Toolchain options
       Tuple's alias
         arm-linux       <-- alias for arm-unknown-linux-gnueabi
     Operating System
       Linux kernel version
         2.6.32.7        <-- closest to Buildroot 2.6.32.9
     C compiler
       gcc version
         4.3.2           <-- Buildroot uses 4.3.4
       [*] C++
       [ ] Fortran       <-- deselect
       [ ] Java          <-- deselect
     Debug facilities
       strace
         strace version
           4.5.19        <-- 4.5.18 build fails
     Tools facilities
       [ ] sstrip        <-- deselect

  $ ./ct-ng build

The build completes successfully in 1 hour 40 minutes.

The build consumes:

  /home/jthomas/work/crosstool-ng-1.6.0

  $ du -sh
  2.1G    .

  /home/jthomas/x-tools

  $ du -sh
  162M    .

  /home/jthomas/src

  $ du -sh
  171M    .

The build installs the following tarballs:

  /home/jthomas/src

  -rw-r--r-- 1 jthomas swdev 16245771 2010-03-06 12:52 binutils-2.19.1.tar.bz2
  -rw-r--r-- 1 jthomas swdev   666608 2007-05-14 12:26 dmalloc-5.5.2.tgz
  -rw-r--r-- 1 jthomas swdev   240479 2009-04-11 17:29 duma_2_5_15.tar.gz
  -rw-r--r-- 1 jthomas swdev 58929447 2010-03-06 12:52 gcc-4.3.2.tar.bz2
  -rw-r--r-- 1 jthomas swdev 15581509 2010-03-06 12:53 gdb-6.8.tar.bz2
  -rw-r--r-- 1 jthomas swdev 16079568 2010-03-06 12:53 glibc-2.9.tar.bz2
  -rw-r--r-- 1 jthomas swdev   457264 2010-03-06 12:53 glibc-ports-2.9.tar.bz2
  -rw-r--r-- 1 jthomas swdev  1881090 2010-03-06 12:51 gmp-4.3.1.tar.bz2
  -rw-r--r-- 1 jthomas swdev   147553 2009-05-22 12:20 libelf-0.8.11.tar.gz
  -rw-r--r-- 1 jthomas swdev 64385857 2010-03-06 12:51 linux-2.6.32.7.tar.bz2
  -rw-r--r-- 1 jthomas swdev   210152 2010-03-06 12:53 ltrace_0.5.2.orig.tar.gz
  -rw-r--r-- 1 jthomas swdev  1064281 2009-02-25 17:02 mpfr-2.4.1.tar.bz2
  -rw-r--r-- 1 jthomas swdev  2445052 2010-03-06 12:53 ncurses-5.7.tar.gz
  -rw-r--r-- 1 jthomas swdev   499565 2009-10-21 12:43 strace-4.5.19.tar.bz2

The build creates toolchain executables:

  /home/jthomas/x-tools/arm-unknown-linux-gnueabi/bin

  lrwxrwxrwx  1 jthomas swdev  35 2010-03-06 14:28 arm-linux-addr2line -> arm-unknown-linux-gnueabi-addr2line
  lrwxrwxrwx  1 jthomas swdev  28 2010-03-06 14:28 arm-linux-ar -> arm-unknown-linux-gnueabi-ar
  lrwxrwxrwx  1 jthomas swdev  28 2010-03-06 14:28 arm-linux-as -> arm-unknown-linux-gnueabi-as
  lrwxrwxrwx  1 jthomas swdev  29 2010-03-06 14:28 arm-linux-c++ -> arm-unknown-linux-gnueabi-c++
  lrwxrwxrwx  1 jthomas swdev  28 2010-03-06 14:28 arm-linux-cc -> arm-unknown-linux-gnueabi-cc
  lrwxrwxrwx  1 jthomas swdev  33 2010-03-06 14:28 arm-linux-c++filt -> arm-unknown-linux-gnueabi-c++filt
  lrwxrwxrwx  1 jthomas swdev  29 2010-03-06 14:28 arm-linux-cpp -> arm-unknown-linux-gnueabi-cpp
  lrwxrwxrwx  1 jthomas swdev  38 2010-03-06 14:28 arm-linux-ct-ng.config -> arm-unknown-linux-gnueabi-ct-ng.config
  lrwxrwxrwx  1 jthomas swdev  29 2010-03-06 14:28 arm-linux-g++ -> arm-unknown-linux-gnueabi-g++
  lrwxrwxrwx  1 jthomas swdev  29 2010-03-06 14:28 arm-linux-gcc -> arm-unknown-linux-gnueabi-gcc
  lrwxrwxrwx  1 jthomas swdev  35 2010-03-06 14:28 arm-linux-gcc-4.3.2 -> arm-unknown-linux-gnueabi-gcc-4.3.2
  lrwxrwxrwx  1 jthomas swdev  32 2010-03-06 14:28 arm-linux-gccbug -> arm-unknown-linux-gnueabi-gccbug
  lrwxrwxrwx  1 jthomas swdev  30 2010-03-06 14:28 arm-linux-gcov -> arm-unknown-linux-gnueabi-gcov
  lrwxrwxrwx  1 jthomas swdev  29 2010-03-06 14:28 arm-linux-gdb -> arm-unknown-linux-gnueabi-gdb
  lrwxrwxrwx  1 jthomas swdev  32 2010-03-06 14:28 arm-linux-gdbtui -> arm-unknown-linux-gnueabi-gdbtui
  lrwxrwxrwx  1 jthomas swdev  31 2010-03-06 14:28 arm-linux-gprof -> arm-unknown-linux-gnueabi-gprof
  lrwxrwxrwx  1 jthomas swdev  28 2010-03-06 14:28 arm-linux-ld -> arm-unknown-linux-gnueabi-ld
  lrwxrwxrwx  1 jthomas swdev  28 2010-03-06 14:28 arm-linux-nm -> arm-unknown-linux-gnueabi-nm
  lrwxrwxrwx  1 jthomas swdev  33 2010-03-06 14:28 arm-linux-objcopy -> arm-unknown-linux-gnueabi-objcopy
  lrwxrwxrwx  1 jthomas swdev  33 2010-03-06 14:28 arm-linux-objdump -> arm-unknown-linux-gnueabi-objdump
  lrwxrwxrwx  1 jthomas swdev  34 2010-03-06 14:28 arm-linux-populate -> arm-unknown-linux-gnueabi-populate
  lrwxrwxrwx  1 jthomas swdev  32 2010-03-06 14:28 arm-linux-ranlib -> arm-unknown-linux-gnueabi-ranlib
  lrwxrwxrwx  1 jthomas swdev  33 2010-03-06 14:28 arm-linux-readelf -> arm-unknown-linux-gnueabi-readelf
  lrwxrwxrwx  1 jthomas swdev  29 2010-03-06 14:28 arm-linux-run -> arm-unknown-linux-gnueabi-run
  lrwxrwxrwx  1 jthomas swdev  30 2010-03-06 14:28 arm-linux-size -> arm-unknown-linux-gnueabi-size
  lrwxrwxrwx  1 jthomas swdev  33 2010-03-06 14:28 arm-linux-strings -> arm-unknown-linux-gnueabi-strings
  lrwxrwxrwx  1 jthomas swdev  31 2010-03-06 14:28 arm-linux-strip -> arm-unknown-linux-gnueabi-strip

  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-addr2line
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-ar
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-as
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-c++
  lrwxrwxrwx  1 jthomas swdev  29 2010-03-06 14:01 arm-unknown-linux-gnueabi-cc -> arm-unknown-linux-gnueabi-gcc
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-c++filt
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-cpp
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-ct-ng.config
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-g++
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-gcc
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-gcc-4.3.2
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-gccbug
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-gcov
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-gdb
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-gdbtui
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-gprof
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-ld
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-nm
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-objcopy
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-objdump
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-populate
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-ranlib
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-readelf
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-run
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-size
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-strings
  -r-xr-xr-x 26 jthomas swdev 395 2010-03-06 14:28 arm-unknown-linux-gnueabi-strip

The cross-compiler executes properly:

  /home/jthomas/x-tools/arm-unknown-linux-gnueabi/bin

  $ ./arm-linux-g++ --version
  .arm-unknown-linux-gnueabi-g++ (crosstool-NG-1.6.0) 4.3.2

The lib files for the ARM target RFS are:

  /home/jthomas/x-tools/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sys-root/lib

  -r-xr-xr-x 1 jthomas swdev  161510 2010-03-06 13:47 ld-2.9.so
  lrwxrwxrwx 1 jthomas swdev       9 2010-03-06 13:47 ld-linux.so.3 -> ld-2.9.so
  dr-xr-xr-x 2 jthomas swdev    4096 2010-03-06 13:06 ldscripts
  -r-xr-xr-x 1 jthomas swdev   15640 2010-03-06 13:47 libanl-2.9.so
  lrwxrwxrwx 1 jthomas swdev      13 2010-03-06 13:47 libanl.so.1 -> libanl-2.9.so
  -r-xr-xr-x 1 jthomas swdev    8957 2010-03-06 13:45 libBrokenLocale-2.9.so
  lrwxrwxrwx 1 jthomas swdev      22 2010-03-06 13:45 libBrokenLocale.so.1 -> libBrokenLocale-2.9.so
  -r-xr-xr-x 1 jthomas swdev 1522723 2010-03-06 13:47 libc-2.9.so
  -r-xr-xr-x 1 jthomas swdev   45794 2010-03-06 13:46 libcrypt-2.9.so
  lrwxrwxrwx 1 jthomas swdev      15 2010-03-06 13:46 libcrypt.so.1 -> libcrypt-2.9.so
  lrwxrwxrwx 1 jthomas swdev      11 2010-03-06 13:45 libc.so.6 -> libc-2.9.so
  -r-xr-xr-x 1 jthomas swdev   15887 2010-03-06 13:46 libdl-2.9.so
  lrwxrwxrwx 1 jthomas swdev      12 2010-03-06 13:46 libdl.so.2 -> libdl-2.9.so
  lrwxrwxrwx 1 jthomas swdev      13 2010-03-06 14:01 libgcc_s.so -> libgcc_s.so.1
  -r--r--r-- 1 jthomas swdev  178607 2010-03-06 14:01 libgcc_s.so.1
  -r--r--r-- 1 jthomas swdev  206918 2010-03-06 14:01 libgomp.a
  -r-xr-xr-x 1 jthomas swdev    1014 2010-03-06 14:01 libgomp.la
  lrwxrwxrwx 1 jthomas swdev      16 2010-03-06 14:01 libgomp.so -> libgomp.so.1.0.0
  lrwxrwxrwx 1 jthomas swdev      16 2010-03-06 14:01 libgomp.so.1 -> libgomp.so.1.0.0
  -r-xr-xr-x 1 jthomas swdev  140073 2010-03-06 14:01 libgomp.so.1.0.0
  -r--r--r-- 1 jthomas swdev     170 2010-03-06 14:01 libgomp.spec
  -r--r--r-- 1 jthomas swdev  541708 2010-03-06 14:01 libiberty.a
  -r-xr-xr-x 1 jthomas swdev  758718 2010-03-06 13:46 libm-2.9.so
  -r-xr-xr-x 1 jthomas swdev   24769 2010-03-06 13:46 libmemusage.so
  lrwxrwxrwx 1 jthomas swdev      11 2010-03-06 13:46 libm.so.6 -> libm-2.9.so
  -r--r--r-- 1 jthomas swdev  339774 2010-03-06 14:01 libmudflap.a
  -r-xr-xr-x 1 jthomas swdev    1035 2010-03-06 14:01 libmudflap.la
  lrwxrwxrwx 1 jthomas swdev      19 2010-03-06 14:01 libmudflap.so -> libmudflap.so.0.0.0
  lrwxrwxrwx 1 jthomas swdev      19 2010-03-06 14:01 libmudflap.so.0 -> libmudflap.so.0.0.0
  -r-xr-xr-x 1 jthomas swdev  249337 2010-03-06 14:01 libmudflap.so.0.0.0
  -r--r--r-- 1 jthomas swdev  272248 2010-03-06 14:01 libmudflapth.a
  -r-xr-xr-x 1 jthomas swdev    1049 2010-03-06 14:01 libmudflapth.la
  lrwxrwxrwx 1 jthomas swdev      21 2010-03-06 14:01 libmudflapth.so -> libmudflapth.so.0.0.0
  lrwxrwxrwx 1 jthomas swdev      21 2010-03-06 14:01 libmudflapth.so.0 -> libmudflapth.so.0.0.0
  -r-xr-xr-x 1 jthomas swdev  255715 2010-03-06 14:01 libmudflapth.so.0.0.0
  -r-xr-xr-x 1 jthomas swdev   98636 2010-03-06 13:47 libnsl-2.9.so
  lrwxrwxrwx 1 jthomas swdev      13 2010-03-06 13:47 libnsl.so.1 -> libnsl-2.9.so
  -r-xr-xr-x 1 jthomas swdev   34908 2010-03-06 13:47 libnss_compat-2.9.so
  lrwxrwxrwx 1 jthomas swdev      20 2010-03-06 13:47 libnss_compat.so.2 -> libnss_compat-2.9.so
  -r-xr-xr-x 1 jthomas swdev   23578 2010-03-06 13:47 libnss_dns-2.9.so
  lrwxrwxrwx 1 jthomas swdev      17 2010-03-06 13:47 libnss_dns.so.2 -> libnss_dns-2.9.so
  -r-xr-xr-x 1 jthomas swdev   54538 2010-03-06 13:47 libnss_files-2.9.so
  lrwxrwxrwx 1 jthomas swdev      19 2010-03-06 13:47 libnss_files.so.2 -> libnss_files-2.9.so
  -r-xr-xr-x 1 jthomas swdev   20168 2010-03-06 13:47 libnss_hesiod-2.9.so
  lrwxrwxrwx 1 jthomas swdev      20 2010-03-06 13:47 libnss_hesiod.so.2 -> libnss_hesiod-2.9.so
  -r-xr-xr-x 1 jthomas swdev   50067 2010-03-06 13:47 libnss_nis-2.9.so
  -r-xr-xr-x 1 jthomas swdev   59773 2010-03-06 13:47 libnss_nisplus-2.9.so
  lrwxrwxrwx 1 jthomas swdev      21 2010-03-06 13:47 libnss_nisplus.so.2 -> libnss_nisplus-2.9.so
  lrwxrwxrwx 1 jthomas swdev      17 2010-03-06 13:47 libnss_nis.so.2 -> libnss_nis-2.9.so
  -r-xr-xr-x 1 jthomas swdev    9200 2010-03-06 13:47 libpcprofile.so
  -r-xr-xr-x 1 jthomas swdev  126578 2010-03-06 13:46 libpthread-2.9.so
  lrwxrwxrwx 1 jthomas swdev      17 2010-03-06 13:46 libpthread.so.0 -> libpthread-2.9.so
  -r-xr-xr-x 1 jthomas swdev   88535 2010-03-06 13:47 libresolv-2.9.so
  lrwxrwxrwx 1 jthomas swdev      16 2010-03-06 13:47 libresolv.so.2 -> libresolv-2.9.so
  -r-xr-xr-x 1 jthomas swdev   40065 2010-03-06 13:47 librt-2.9.so
  lrwxrwxrwx 1 jthomas swdev      12 2010-03-06 13:47 librt.so.1 -> librt-2.9.so
  -r-xr-xr-x 1 jthomas swdev   13930 2010-03-06 13:47 libSegFault.so
  -r--r--r-- 1 jthomas swdev   46522 2010-03-06 14:01 libssp.a
  -r-xr-xr-x 1 jthomas swdev    1002 2010-03-06 14:01 libssp.la
  -r--r--r-- 1 jthomas swdev    2622 2010-03-06 14:01 libssp_nonshared.a
  -r-xr-xr-x 1 jthomas swdev     984 2010-03-06 14:01 libssp_nonshared.la
  lrwxrwxrwx 1 jthomas swdev      15 2010-03-06 14:01 libssp.so -> libssp.so.0.0.0
  lrwxrwxrwx 1 jthomas swdev      15 2010-03-06 14:01 libssp.so.0 -> libssp.so.0.0.0
  -r-xr-xr-x 1 jthomas swdev   30039 2010-03-06 14:01 libssp.so.0.0.0
  -r--r--r-- 1 jthomas swdev 7519394 2010-03-06 14:01 libstdc++.a
  -r-xr-xr-x 1 jthomas swdev    1029 2010-03-06 14:01 libstdc++.la
  -r--r--r-- 1 jthomas swdev 7655126 2010-03-06 14:01 libstdc++_pic.a
  lrwxrwxrwx 1 jthomas swdev      19 2010-03-06 14:01 libstdc++.so -> libstdc++.so.6.0.10
  lrwxrwxrwx 1 jthomas swdev      19 2010-03-06 14:01 libstdc++.so.6 -> libstdc++.so.6.0.10
  -r-xr-xr-x 1 jthomas swdev 3721562 2010-03-06 14:01 libstdc++.so.6.0.10
  -r--r--r-- 1 jthomas swdev  582470 2010-03-06 14:01 libsupc++.a
  -r-xr-xr-x 1 jthomas swdev     967 2010-03-06 14:01 libsupc++.la
  -r-xr-xr-x 1 jthomas swdev   36837 2010-03-06 13:47 libthread_db-1.0.so
  lrwxrwxrwx 1 jthomas swdev      19 2010-03-06 13:47 libthread_db.so.1 -> libthread_db-1.0.so
  -r-xr-xr-x 1 jthomas swdev   14770 2010-03-06 13:47 libutil-2.9.so
  lrwxrwxrwx 1 jthomas swdev      14 2010-03-06 13:47 libutil.so.1 -> libutil-2.9.so

  $ du -sh
  24M     .

---------------------------------------

Sat 6 Mar 2010

Install commonc++:

  /home/jthomas/work

  $ wget www.hyperrealm.com/commoncpp/libcommonc++-0.6.2.tar.gz

  -rw-r--r-- 1 jthomas swdev 8215617 2010-01-04 23:40 libcommonc++-0.6.2.tar.gz

  $ tar xfz libcommonc++-0.6.2.tar.gz

Modify source to avoid compile error:

  /home/jthomas/work/libcommonc++-0.6.2/lib/CharTraits.c++

  Change from:

    return(std::strtof(str, endptr));

  to:

    return(strtof(str, endptr));

Use cross-compiler built using crosstools-ng:

  /home/jthomas/work/libcommonc++-0.6.2

  $ export PATH=$PATH:/home/jthomas/x-tools/arm-unknown-linux-gnueabi/bin/

  $ which arm-linux-g++
  /home/jthomas/x-tools/arm-unknown-linux-gnueabi/bin//arm-linux-g++

  $ arm-linux-g++ --version
  .arm-unknown-linux-gnueabi-g++ (crosstool-NG-1.6.0) 4.3.2

Configure commonc++, using exports to avoid 'realloc' compile error, and the prefix for the crosstools:

  /home/jthomas/work/libcommonc++-0.6.2

  $ export ac_cv_func_malloc_0_nonnull=yes

  $ export ac_cv_func_realloc_0_nonnull=yes

  $ ./configure --host=arm-linux --prefix=/home/jthomas/work/libcommonc++-0.6.2/usr

  $ make

The configure completes in ~2 minutes.  The make completes in ~6 minutes.

Install the libraries:

  $ make install

These directories and files are installed per '--prefix=' above:

  /home/jthomas/work/libcommonc++-0.6.2/usr

  drwxr-xr-x 3 jthomas swdev 4096 2010-03-06 17:10 include
  drwxr-xr-x 3 jthomas swdev 4096 2010-03-06 17:10 lib
  drwxr-xr-x 3 jthomas swdev 4096 2010-03-06 17:10 share

  /home/jthomas/work/libcommonc++-0.6.2/usr/lib

  -rw-r--r-- 1 jthomas swdev 12199738 2010-03-06 17:10 libcommonc++.a
  -rw-r--r-- 1 jthomas swdev   368826 2010-03-06 17:10 libcommonc++db.a
  -rwxr-xr-x 1 jthomas swdev     1526 2010-03-06 17:10 libcommonc++db.la
  lrwxrwxrwx 1 jthomas swdev       23 2010-03-06 17:10 libcommonc++db.so -> libcommonc++db.so.8.0.0
  lrwxrwxrwx 1 jthomas swdev       23 2010-03-06 17:10 libcommonc++db.so.8 -> libcommonc++db.so.8.0.0
  -rwxr-xr-x 1 jthomas swdev   915597 2010-03-06 17:10 libcommonc++db.so.8.0.0
  -rwxr-xr-x 1 jthomas swdev     1449 2010-03-06 17:10 libcommonc++.la
  lrwxrwxrwx 1 jthomas swdev       21 2010-03-06 17:10 libcommonc++.so -> libcommonc++.so.8.0.0
  lrwxrwxrwx 1 jthomas swdev       21 2010-03-06 17:10 libcommonc++.so.8 -> libcommonc++.so.8.0.0
  -rwxr-xr-x 1 jthomas swdev  6954844 2010-03-06 17:10 libcommonc++.so.8.0.0

  /home/jthomas/work/libcommonc++-0.6.2/usr/include/commonc++

  $ ls *.h++ | wc -l
  158

  $ ls -l | head -n 5
  -rw-r--r-- 1 jthomas swdev  2603 2010-03-06 17:10 AbstractBuffer.h++
  -rw-r--r-- 1 jthomas swdev  1811 2010-03-06 17:10 AbstractBufferImpl.h++
  -rw-r--r-- 1 jthomas swdev  2358 2010-03-06 17:10 AllocationMap.h++
  -rw-r--r-- 1 jthomas swdev  7314 2010-03-06 17:10 Application.h++

  $ ls -l | tail -n 5
  -rw-r--r-- 1 jthomas swdev  1847 2010-03-06 17:10 UUID.h++
  -rw-r--r-- 1 jthomas swdev 17782 2010-03-06 17:10 Variant.h++
  -rw-r--r-- 1 jthomas swdev  6394 2010-03-06 17:10 Version.h++
  -rw-r--r-- 1 jthomas swdev  6182 2010-03-06 17:10 XDRDecoder.h++
  -rw-r--r-- 1 jthomas swdev  5864 2010-03-06 17:10 XDREncoder.h++

The build consumes:

  /home/jthomas/work/libcommonc++-0.6.2

  $ du -sh
  130M    .

Add to ~/.vimrc:

  au BufNewFile,BufRead *.h++ set filetype=cpp

The commonc++ cross-build for ARM was successful.

Need to build a hello world test program using commonc++ and execute it in the QEMU ARM VM.

Need to understand how to install the glibc libraries in the Buildroot RFS.  Add glibc to uClibc, or rebuild Buildroot with external toolchain and glibc only?

Need to coordinate toolchain build options between Buildroot and crosstools-NG for Buildroot package build compatibility.

Need to coordinate kernel headers version used by Buildroot and crosstools-NG.

Configure Buildroot and crosstools-NG to use the same tarball directory, external to both project directories.



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100307/6a15ced1/attachment-0001.htm>
