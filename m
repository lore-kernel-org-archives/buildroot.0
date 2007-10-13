From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 13 Oct 2007 18:53:57 +0300
Subject: [Buildroot] buildroot testing for ARM
Message-ID: <4710EA15.3030403@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I performed some testing for ARM by selecting all packages except ones in Graphical libs category.
Here are results: 39 "compile/file not found" errors.
I'll try fix most obvious bugs - the rest will go to the bugtracking.

1) asterisk:

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t  -o asterisk -Wl,-E  io.o sched.o logger.o frame.o loader.o config.o channel.o translate.o
file.o say.o pbx.o cli.o md5.o term.o ulaw.o alaw.o callerid.o fskmodem.o image.o app.o cdr.o tdd.o acl.o rtp.o manager.o asterisk.o dsp.o chanvars.o indications.o autoservice.o db.o privacy.o astmm.o
enum.o srv.o dns.o aescrypt.o aestab.o aeskey.o utils.o config_old.o plc.o jitterbuf.o dnsmgr.o devicestate.o netsock.o slinfactory.o ast_expr2.o ast_expr2f.o editline/libedit.a db1-ast/libdb1.a
stdtime/libtime.a -ldl -lpthread -lncurses -lm -lresolv   -lssl
dns.o: In function `ast_search_dns':
dns.c:(.text+0x2c4): undefined reference to `__res_close'
collect2: ld returned 1 exit status
make[1]: *** [asterisk] Error 1
make[1]: Leaving directory `/opt/buildroot/build_arm/asterisk-1.2.0-beta1'


2) bind

/../lib/isc/.libs/libisc.so -lnsl
/opt/buildroot/build_arm/bind-9.3.2/lib/isc/.libs/libisc.so: undefined reference to `index'
collect2: ld returned 1 exit status
make[3]: *** [named] Error 1
make[3]: Leaving directory `/opt/buildroot/build_arm/bind-9.3.2/bin/named'

3) curl

cp -dpf /opt/buildroot/build_arm/bsdiff-4.3/bspatch /opt/buildroot/project_build_arm/uclibc/root/usr/bin/.
wget --passive-ftp  -P /sources http://curl.haxx.se/download//curl-7.13.1.tar.bz2
--04:23:14--  http://curl.haxx.se/download//curl-7.13.1.tar.bz2
Resolving curl.haxx.se... 91.191.140.28
Connecting to curl.haxx.se|91.191.140.28|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
04:23:15 ERROR 404: Not Found.


4) dbus-glib:

make[5]: Entering directory `/opt/buildroot/build_arm/dbus-glib-0.72/dbus'
if /bin/sh ../libtool --tag=CC --mode=compile /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include
-I/opt/buildroot/build_arm/staging_dir/include --sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -DHAVE_CONFIG_H -I. -I. -I.. -I.. -I..
-I/opt/buildroot/build_arm/staging_dir/usr/include/dbus-1.0 -I/opt/buildroot/build_arm/staging_dir/usr/lib/dbus-1.0/include -I/opt/buildroot/build_arm/staging_dir/usr/include/glib-2.0
-I/opt/buildroot/build_arm/staging_dir/usr/lib/glib-2.0/include  -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"/usr/share/locale\"   -DDBUS_API_SUBJECT_TO_CHANGE=1   -g -O2 -Wall -Wchar-subscripts
-Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal -Wsign-compare -MT dbus-glib.lo -MD -MP -MF ".deps/dbus-glib.Tpo" -c -o dbus-glib.lo dbus-glib.c; \
        then mv -f ".deps/dbus-glib.Tpo" ".deps/dbus-glib.Plo"; else rm -f ".deps/dbus-glib.Tpo"; exit 1; fi
mkdir .libs
 /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -DHAVE_CONFIG_H -I. -I. -I.. -I.. -I..
-I/opt/buildroot/build_arm/staging_dir/usr/include/dbus-1.0 -I/opt/buildroot/build_arm/staging_dir/usr/lib/dbus-1.0/include -I/opt/buildroot/build_arm/staging_dir/usr/include/glib-2.0
-I/opt/buildroot/build_arm/staging_dir/usr/lib/glib-2.0/include -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"/usr/share/locale\" -DDBUS_API_SUBJECT_TO_CHANGE=1 -g -O2 -Wall -Wchar-subscripts
-Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal -Wsign-compare -MT dbus-glib.lo -MD -MP -MF .deps/dbus-glib.Tpo -c dbus-glib.c  -fPIC -DPIC -o
.libs/dbus-glib.o
In file included from dbus-glib.c:25:
dbus-glib.h:27:25: error: glib-object.h: No such file or directory
In file included from dbus-glib.c:25:
dbus-glib.h:38: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'typedef'
dbus-glib.h:47: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'dbus_g_connection_get_g_type'
dbus-glib.h:48: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'dbus_g_message_get_g_type'
dbus-glib.h:51: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
dbus-glib.h:52: error: expected ')' before '*' token
dbus-glib.h:56: error: expected ')' before '*' token
dbus-glib.h:58: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'dbus_g_error_quark'
In file included from dbus-glib.c:25:


5) gadgetfs-test

touch /opt/buildroot/build_arm/gadgetfs-test/.unpacked
/usr/bin/make -j1 -C /opt/buildroot/build_arm/gadgetfs-test CC=/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc CFLAGS="-Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include
-I/opt/buildroot/build_arm/staging_dir/include --sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t"
LDFLAGS="-L/opt/buildroot/build_arm/staging_dir/lib -L/opt/buildroot/build_arm/staging_dir/usr/lib --sysroot=/opt/buildroot/build_arm/staging_dir/" USE_AIO=y
make[1]: Entering directory `/opt/buildroot/build_arm/gadgetfs-test'
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -c usb.c -o usb.o -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t
usb.c:37:32: error: linux/usb/gadgetfs.h: No such file or directory
usb.c: In function 'close_fd':
usb.c:644: error: 'GADGETFS_FIFO_STATUS' undeclared (first use in this function)
usb.c:644: error: (Each undeclared identifier is reported only once
usb.c:644: error: for each function it appears in.)
usb.c:653: error: 'GADGETFS_FIFO_FLUSH' undeclared (first use in this function)
usb.c: In function 'handle_control':
usb.c:1397: error: 'GADGETFS_CLEAR_HALT' undeclared (first use in this function)
usb.c: In function 'ep0_thread':
usb.c:1494: error: array type has incomplete element type
usb.c:1537: error: 'GADGETFS_NOP' undeclared (first use in this function)
usb.c:1541: error: 'GADGETFS_CONNECT' undeclared (first use in this function)
usb.c:1549: error: 'GADGETFS_SETUP' undeclared (first use in this function)
usb.c:1553: error: 'GADGETFS_DISCONNECT' undeclared (first use in this function)
usb.c:1560: error: 'GADGETFS_SUSPEND' undeclared (first use in this function)
make[1]: *** [usb.o] Error 1
make[1]: Leaving directory `/opt/buildroot/build_arm/gadgetfs-test'

6) pcmcia

make: *** No rule to make target `linux26', needed by `pcmcia'.  Stop.

7) hostap is not buildable because depends on pcmcia

8) irda-utils:

make: *** No rule to make target `/opt/buildroot/build_arm/irda-utils-0.9.18/.installed', needed by `irda-utils'.  Stop.

9) kexec-tools:

mkdir -p /opt/buildroot/build_arm/kexec-tools-1.101/objdir-arm-linux/kexec/arch/arm
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -Wall -g -fno-strict-aliasing -I./include -I./util_lib/include -DVERSION='"1.101"'
-DRELEASE_DATE='"15 February 2005"' -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1
-DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_ZLIB_H=1   -Ikexec/arch/arm/include -o
/opt/buildroot/build_arm/kexec-tools-1.101/objdir-arm-linux/kexec/arch/arm/kexec-zImage-arm.o -c kexec/arch/arm/kexec-zImage-arm.c
mkdir -p /opt/buildroot/build_arm/kexec-tools-1.101/objdir-arm-linux/kexec/arch/arm
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -Wall -g -fno-strict-aliasing -I./include -I./util_lib/include -DVERSION='"1.101"'
-DRELEASE_DATE='"15 February 2005"' -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1
-DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_ZLIB_H=1   -Ikexec/arch/arm/include -o
/opt/buildroot/build_arm/kexec-tools-1.101/objdir-arm-linux/kexec/arch/arm/kexec-arm.o -c kexec/arch/arm/kexec-arm.c
In file included from kexec/arch/arm/kexec-arm.c:17:
kexec/arch/arm/../../kexec-syscall.h:47:1: warning: "__NR_kexec_load" redefined
In file included from /opt/buildroot/build_arm/staging_dir/usr/include/sys/syscall.h:32,
                 from /opt/buildroot/build_arm/staging_dir/usr/include/syscall.h:1,
                 from kexec/arch/arm/../../kexec-syscall.h:5,
                 from kexec/arch/arm/kexec-arm.c:17:
/opt/buildroot/build_arm/staging_dir/usr/include/bits/sysnum.h:953:1: warning: this is the location of the previous definition
kexec/arch/arm/kexec-arm.c:27: error: conflicting types for 'get_memory_ranges'
kexec/arch/arm/../../kexec.h:132: error: previous declaration of 'get_memory_ranges' was here
make[1]: *** [/opt/buildroot/build_arm/kexec-tools-1.101/objdir-arm-linux/kexec/arch/arm/kexec-arm.o] Error 1
make[1]: Leaving directory `/opt/buildroot/build_arm/kexec-tools-1.101'

10) l2tpd:

wget --passive-ftp  -P /sources ftp://ftp.debian.org/debian/pool/main/l/l2tpd//l2tpd_0.70-pre20031121-2.1.diff.gz
--05:41:57--  ftp://ftp.debian.org/debian/pool/main/l/l2tpd//l2tpd_0.70-pre20031121-2.1.diff.gz
           => `/sources/l2tpd_0.70-pre20031121-2.1.diff.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /debian/pool/main/l/l2tpd/ ... done.
==> PASV ... done.    ==> RETR l2tpd_0.70-pre20031121-2.1.diff.gz ...
No such file `l2tpd_0.70-pre20031121-2.1.diff.gz'.


11) cgicc:

wget --passive-ftp  -P /sources http://www.cgicc.org/files/cgicc-3.2.3.tar.bz2
--15:30:01--  http://www.cgicc.org/files/cgicc-3.2.3.tar.bz2
           => `/sources/cgicc-3.2.3.tar.bz2'
Resolving www.cgicc.org... 66.39.116.185
Connecting to www.cgicc.org|66.39.116.185|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://www.gnu.org/software/cgiccfiles/cgicc-3.2.3.tar.bz2 [following]
--15:30:02--  http://www.gnu.org/software/cgiccfiles/cgicc-3.2.3.tar.bz2
           => `/sources/cgicc-3.2.3.tar.bz2'
Resolving www.gnu.org... 199.232.41.10
Connecting to www.gnu.org|199.232.41.10|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
15:30:03 ERROR 404: Not Found.

12) libraw1394:

make: *** No rule to make target `/opt/buildroot/build_arm/staging_dir/lib/libraw1394.so', needed by `/opt/buildroot/project_build_arm/uclibc/root/usr/lib/libraw1394.so'.  Stop.

13) libvorbis:

/sources/Tremor--svn-20071013.tar.bz2 | tar -C /opt/buildroot/build_arm   -xf -
/bin/sh: /sources/Tremor--svn-20071013.tar.bz2: Permission denied
touch /opt/buildroot/build_arm/Tremor--svn-20071013/.source
touch: cannot touch `/opt/buildroot/build_arm/Tremor--svn-20071013/.source': No such file or directory
make: *** [/opt/buildroot/build_arm/Tremor--svn-20071013/.source] Error 1

14) libxml2 target headers:

cp -af /opt/buildroot/build_arm/libxml2-2.6.29/usr/include/libxml2 /opt/buildroot/project_build_arm/uclibc/root/usr/include/libxml2
cp: cannot stat `/opt/buildroot/build_arm/libxml2-2.6.29/usr/include/libxml2': No such file or directory
make: *** [/opt/buildroot/project_build_arm/uclibc/root/usr/include/libxml2] Error 1

15) lm-sensors:

http://ftp.debian.org/debian/pool/main/l/lm-sensors//lm-sensors_2.10.4-1.diff.gz
           => `/sources/lm-sensors_2.10.4-1.diff.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
15:59:11 ERROR 404: Not Found.

16) lockfiles-progs:

lockfile-progs.o: In function `parse_arguments':
/opt/buildroot/build_arm/lockfile-progs-0.1.10/lockfile-progs.c:73: undefined reference to `rindex'
collect2: ld returned 1 exit status
make[1]: *** [lockfile-create] Error 1

17) lsof:

wget --passive-ftp  -P /sources ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof//lsof_4.78.tar.bz2
--16:03:29--  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof//lsof_4.78.tar.bz2
           => `/sources/lsof_4.78.tar.bz2'
Resolving lsof.itap.purdue.edu... 128.210.7.20
Connecting to lsof.itap.purdue.edu|128.210.7.20|:21... connected.
Logging in as anonymous ...
Error in server greeting.
Retrying.

18) ltp-full-20070228

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -DLINUX -DMMAP -DSTDARG -DHAVE_SOCKLEN_T -o pmaptst pmaptst.c -lnsl
/tmp/ccpZiqp1.o: In function `main':
pmaptst.c:(.text+0x40): undefined reference to `pmap_set'
pmaptst.c:(.text+0x9c): undefined reference to `pmap_set'
pmaptst.c:(.text+0xe8): undefined reference to `pmap_unset'
collect2: ld returned 1 exit status
make[6]: *** [pmaptst] Error 1
make[6]: Leaving directory `/opt/buildroot/project_build_arm/uclibc/root/root/ltp-full-20070228/testcases/network/nfs/cthon04/tools'

19) TraceToolkit-0.9.5:

/bin/sh ../libtool --mode=compile gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../Include         -DSUPP_RTAI=1   -DTARGET_NATIVE=0     -DLTT_UNPACKED_STRUCTS=0    -Wall -O2 -c EventOptions.c
gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../Include -DSUPP_RTAI=1 -DTARGET_NATIVE=0 -DLTT_UNPACKED_STRUCTS=0 -Wall -O2 -Wp,-MD,.deps/EventOptions.pp -c  -fPIC -DPIC EventOptions.c -o EventOptions.lo
/bin/sh ../libtool --mode=compile gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../Include         -DSUPP_RTAI=1   -DTARGET_NATIVE=0     -DLTT_UNPACKED_STRUCTS=0    -Wall -O2 -c RTAITables.c
gcc -DHAVE_CONFIG_H -I. -I. -I.. -I../Include -DSUPP_RTAI=1 -DTARGET_NATIVE=0 -DLTT_UNPACKED_STRUCTS=0 -Wall -O2 -Wp,-MD,.deps/RTAITables.pp -c  -fPIC -DPIC RTAITables.c -o RTAITables.lo
RTAITables.c:23:46: error: linux/sys.h: No such file or directory
make[1]: *** [RTAITables.lo] Error 1
make[1]: Leaving directory `/opt/buildroot/toolchain_build_arm/TraceToolkit-0.9.5/LibLTT'

20) lvm
wget --passive-ftp  -P /sources ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.26.tgz
--16:17:47--  ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.26.tgz
           => `/sources/LVM2.2.02.26.tgz'
Resolving sources.redhat.com... 209.132.176.174
Connecting to sources.redhat.com|209.132.176.174|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /pub/lvm2 ... done.
==> PASV ... done.    ==> RETR LVM2.2.02.26.tgz ...
No such file `LVM2.2.02.26.tgz'.

21) madplay

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -Wall -pipe -I/opt/buildroot/build_arm/staging_dir/usr/include
-I/opt/buildroot/build_arm/staging_dir/include --sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -Os
--sysroot=/opt/buildroot/build_arm/staging_dir/ -o madplay madplay.o getopt.o getopt1.o version.o resample.o filter.o tag.o crc.o rgain.o player.o audio.o audio_aiff.o audio_cdda.o audio_hex.o
audio_null.o audio_raw.o audio_snd.o audio_wave.o audio_alsa.o  -L/opt/buildroot/build_arm/staging_dir/lib -L/opt/buildroot/build_arm/staging_dir/usr/lib
/opt/buildroot/build_arm/staging_dir/usr/lib/libasound.so -ldl -lpthread ./intl/.libs/libintl.a -lc /usr/lib/libmad.so /opt/buildroot/build_arm/staging_dir/usr/lib/libid3tag.so -lz -lm -Wl,--rpath
-Wl,/opt/buildroot/build_arm/staging_dir/usr/lib -Wl,--rpath -Wl,/opt/buildroot/build_arm/staging_dir/usr/lib
/usr/lib/libmad.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[3]: *** [madplay] Error 1
make[3]: Leaving directory `/opt/buildroot/build_arm/madplay-0.15.2b'

22) mdadm:


http://ftp.debian.org/debian/pool/main/m/mdadm/mdadm_2.6.2-1.diff.gz
           => `/sources/mdadm_2.6.2-1.diff.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
16:21:53 ERROR 404: Not Found.

23) microperl:

make[1]: Leaving directory `/opt/buildroot/build_arm/perl-5.8.8'
Now you must run 'make'.

If you compile perl5 on a different machine or from a different object
directory, copy the Policy.sh file from this object directory to the
new one before you run Configure -- this will help you with most of
the policy defaults.

make[1]: Entering directory `/opt/buildroot/build_arm/perl-5.8.8'
make[1]: *** No rule to make target `<command-line>', needed by `miniperlmain.o'.  Stop.
make[1]: Leaving directory `/opt/buildroot/build_arm/perl-5.8.8'

        Making Errno (nonxs)
ext/util/make_ext: line 122: ../../miniperl: No such file or directory
Warning: No Makefile!
make[1]: Entering directory `/opt/buildroot/build_arm/perl-5.8.8/ext/Errno'
make[1]: *** No rule to make target `config'.  Stop.
make[1]: Leaving directory `/opt/buildroot/build_arm/perl-5.8.8/ext/Errno'
/usr/bin/make config failed, continuing anyway...
make[1]: Entering directory `/opt/buildroot/build_arm/perl-5.8.8/ext/Errno'
make[1]: *** No rule to make target `all'.  Stop.

24) mrouted:
http://ftp.debian.org/debian/pool/non-free/m/mrouted/mrouted_3.9-beta3.orig.tar.gz
           => `/sources/mrouted_3.9-beta3.orig.tar.gz'
Resolving ftp.debian.org... 128.101.240.212
Connecting to ftp.debian.org|128.101.240.212|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
16:39:28 ERROR 404: Not Found.

25) ncftp

ftp://ftp.ncftp.com/ncftp/ncftp-3.2.0-src.tar.bz2
           => `/home/vano/poky/poky/sources/ncftp-3.2.0-src.tar.bz2'
Resolving ftp.ncftp.com... 209.197.102.38
Connecting to ftp.ncftp.com|209.197.102.38|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /ncftp ... done.
==> PASV ... done.    ==> RETR ncftp-3.2.0-src.tar.bz2 ...
No such file `ncftp-3.2.0-src.tar.bz2'.

26) netkit-base:

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc  inetd.o servtab.o builtins.o sig.o daemon.o setproctitle.o mysleep.o  -o inetd
inetd.o: In function `unregister_rpc':
inetd.c:(.text+0x70): undefined reference to `pmap_unset'
inetd.c:(.text+0xb8): undefined reference to `pmap_unset'
inetd.o: In function `register_rpc':
inetd.c:(.text+0x158): undefined reference to `pmap_unset'
inetd.c:(.text+0x174): undefined reference to `pmap_set'
servtab.o: In function `loadconfigent':
servtab.c:(.text+0xddc): undefined reference to `getrpcbyname'
collect2: ld returned 1 exit status
make[2]: *** [inetd] Error 1
make[2]: Leaving directory `/opt/buildroot/build_arm/netkit-base-0.17/inetd'

27) netplug:

/usr/bin/make -j1 CC=/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -C /opt/buildroot/build_arm/netplug-1.2.9
make[1]: bk: Command not found
make[1]: Entering directory `/opt/buildroot/build_arm/netplug-1.2.9'
make[1]: bk: Command not found
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Wall -Werror -std=gnu99 -DNP_ETC_DIR='"/etc/netplug"' -DNP_SCRIPT_DIR='"/etc/netplug.d"' -ggdb3 -O3 -DNP_VERSION='"1.2.9"'   -c -o
netlink.o netlink.c
cc1: warnings being treated as errors
netlink.c: In function 'netlink_open':
netlink.c:289: warning: pointer targets in passing argument 3 of 'getsockname' differ in signedness
make[1]: *** [netlink.o] Error 1

28) nfs-utils

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Wall -pipe -Os -pipe -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -DUTS_RELEASE=\"2.6.22.10\" -o mountd mountd-mountd.o mountd-mount_dispatch.o
mountd-auth.o mountd-rmtab.o mountd-cache.o mountd-svc_run.o  ../../support/export/libexport.a ../../support/nfs/libnfs.a ../../support/misc/libmisc.a -lnsl
mountd-mountd.o: In function `unregister_services':
mountd.c:(.text+0xd4): undefined reference to `pmap_unset'
mountd.c:(.text+0xe8): undefined reference to `pmap_unset'
mountd.c:(.text+0x104): undefined reference to `pmap_unset'

29) portage

http://dev.gentoo.org/~azarah/sandbox//sandbox-1.2.18.1.tar.bz2
           => `/sources/sandbox-1.2.18.1.tar.bz2'
Resolving dev.gentoo.org... 140.211.166.183
Connecting to dev.gentoo.org|140.211.166.183|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
17:24:18 ERROR 404: Not Found.

30) portmap

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc  -Dperror=xperror -DCHECK_PORT  -DFACILITY=LOG_AUTH  -DIGNORE_SIGCHLD           -Os -pipe
-I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include --sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir
-mtune=arm920t  -o portmap portmap.o pmap_check.o from_local.o   -lutil
portmap.o: In function `reg_service':
portmap.c:(.text+0x120): undefined reference to `svc_sendreply'
portmap.c:(.text+0x23c): undefined reference to `svc_sendreply'
portmap.c:(.text+0x404): undefined reference to `svcerr_decode'
portmap.c:(.text+0x50c): undefined reference to `get_myaddress'
portmap.c:(.text+0x550): undefined reference to `clntudp_create'

31) quagga

wget --passive-ftp  -P /sources http://www.quagga.net/download/quagga-0.99.8.tar.gz
--17:41:17--  http://www.quagga.net/download/quagga-0.99.8.tar.gz
           => `/sources/quagga-0.99.8.tar.gz'
Resolving www.quagga.net... 64.39.15.246
Connecting to www.quagga.net|64.39.15.246|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
17:41:23 ERROR 404: Not Found.

32) ruby

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -g -O2   -I. -I.  -c main.c
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -g -O2    -rdynamic -Wl,-export-dynamic  main.o dmyext.o libruby-static.a -ldl -lcrypt -lm
  -o miniruby
can't find header files for ruby.
make[1]: *** [all] Error 1

33) stunnel

checking for broken poll() implementation... no
configure: **************************************** SSL
checking for SSL directory... Not found

Couldn't find your SSL library installation dir
Use --with-ssl option to fix this problem

make: *** [/opt/buildroot/build_arm/stunnel-4.16/.configured] Error 1

34) sudo

http://www.courtesan.com/sudo/dist/sudo-1.6.8p12.tar.gz
           => `/sources/sudo-1.6.8p12.tar.gz'
Resolving www.courtesan.com... 72.36.231.42
Connecting to www.courtesan.com|72.36.231.42|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
18:24:27 ERROR 404: Not Found.

35) ttcp

/opt/buildroot/build_arm/ttcp/ttcp.c:806: warning: passing argument 4 of 'select' from incompatible pointer type
/tmp/ccH0AmEY.o: In function `main':
ttcp.c:(.text+0x1504): undefined reference to `bcopy'
collect2: ld returned 1 exit status
make: *** [/opt/buildroot/build_arm/ttcp/ttcp] Error 1

36) vpnc

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -o cisco-decrypt cisco-decrypt.o config.o supp.o sysdep.o vpnc-debug.o -lgcrypt -lgpg-error
./makeman.pl
./vpnc: ./vpnc: cannot execute binary file
Can't close(GLOB(0x818c088)):  at (eval 2) line 3
        main::__ANON__('GLOB(0x818c088)') called at ./makeman.pl line 89
make[1]: *** [vpnc.8] Error 126
make[1]: Leaving directory `/opt/buildroot/build_arm/vpnc-0.5.1'
make: *** [/opt/buildroot/build_arm/vpnc-0.5.1/vpnc] Error 2

37) wireless-tools

iwpriv.c:387: warning: incompatible implicit declaration of built-in function 'index'
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc  -Wl,-s -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -MMD    -o iwmulticall iwmulticall.o -lm
iwmulticall.o: In function `iw_in_addr':
iwmulticall.c:(.text+0xbf4): undefined reference to `index'
iwmulticall.o: In function `set_private_cmd':
iwmulticall.c:(.text+0x481c): undefined reference to `index'

38) xerces

http://www.apache.org/dist/xerces/c/source//xerces-c-src_2_7_0.tar.gz [following]
--18:43:29--  http://www.apache.org/dist/xerces/c/source//xerces-c-src_2_7_0.tar.gz
           => `/home/vano/poky/poky/sources/xerces-c-src_2_7_0.tar.gz'
Reusing existing connection to www.apache.org:80.
HTTP request sent, awaiting response... 404 Not Found
18:43:29 ERROR 404: Not Found.

39) xfs-progs

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -o .libs/xfs_copy xfs_copy.o  -L/opt/buildroot/build_arm/e2fsprogs-1.39/lib
../libxfs/.libs/libxfs.so -luuid -lpthread
xfs_copy.o: In function `main':
/opt/buildroot/build_arm/xfsprogs-2.7.11/copy/xfs_copy.c:906: undefined reference to `bcopy'
collect2: ld returned 1 exit status
make[2]: *** [xfs_copy] Error 1




Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
