From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 29 Jul 2007 15:12:08 +0200 (CEST)
Subject: [Buildroot] latest svn trunk build saga
In-Reply-To: <0707282336490.8510@somehost>
References: <0707282336490.8510@somehost>
Message-ID: <0707291433290.8510@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replying to myself again.

On Sat, 28 Jul 2007, Cristian Ionescu-Idbohrn wrote:

> Any of the below will fail when enabled on top of the attached .config :(
>
> --------------------------------------------------------------------------
> touch buildroot/build_i486/gawk-3.1.5/.unpacked
> ...
> checking for C compiler default output file name...
> configure: error: C compiler cannot create executables
> See `config.log' for more details.
> make: *** [buildroot/build_i486/gawk-3.1.5/.configured] Error 77

gawk still doesn't build:

,----
| /usr/bin/make -j1 CC=buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc -C buildroot/build_i486/gawk-3.1.5
| make[1]: Entering directory `buildroot/build_i486/gawk-3.1.5'
| /usr/bin/make 'CFLAGS=-g -O2' 'LDFLAGS=-export-dynamic' all-recursive
| make[2]: Entering directory `buildroot/build_i486/gawk-3.1.5'
| Making all in .
| make[3]: Entering directory `buildroot/build_i486/gawk-3.1.5'
| if buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc -DDEFPATH="\".:/usr/share/awk\"" -DHAVE_CONFIG_H -DGAWK -DLOCALEDIR="\"/usr/share/locale\"" -I. -I. -I.     -g -O2 -MT regex.o -MD -MP -MF ".deps/regex.Tpo" -c -o regex.o regex.c; \
|        then mv -f ".deps/regex.Tpo" ".deps/regex.Po"; else rm -f ".deps/regex.Tpo"; exit 1; fi
| In file included from regex.c:66:
| regex_internal.h:744: error: expected specifier-qualifier-list before 'wchar_t'
| make[3]: *** [regex.o] Error 1
| make[3]: Leaving directory `buildroot/build_i486/gawk-3.1.5'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory `buildroot/build_i486/gawk-3.1.5'
| make[1]: *** [all] Error 2
| make[1]: Leaving directory `buildroot/build_i486/gawk-3.1.5'
| make: *** [buildroot/build_i486/gawk-3.1.5/gawk] Error 2
`----

But commenting out one line in build_i486/gawk-3.1.5/regex_internal.h:

    //    wchar_t wch;

helps.

> --------------------------------------------------------------------------
> touch buildroot/build_i486/strace-4.5.15/.unpacked
> ...
> checking for C compiler default output file name... configure: error: C compiler cannot create executables
> See `config.log' for more details.
> make: *** [buildroot/build_i486/strace-4.5.15/.configured] Error 77

strace failed to build because of the slang build problem (a header
file copied to build_i486/staging_dir/include).

> --------------------------------------------------------------------------
> touch buildroot/build_i486/libpcap-0.9.5/.unpacked
> ...
> checking for C compiler default output file name... configure: error: C compiler cannot create executables
> See `config.log' for more details.
> make: *** [buildroot/build_i486/libpcap-0.9.5/.configured] Error 77

libpcap failed to build because of the slang build problem (a header
file copied to build_i486/staging_dir/include).

> --------------------------------------------------------------------------
> touch buildroot/build_i486/tcpdump-3.9.5/.unpacked
> ...
> checking for C compiler default output file name... configure: error: C compiler cannot create executables
> See `config.log' for more details.
> make: *** [buildroot/build_i486/tcpdump-3.9.5/.configured] Error 77

tcpdump failed to build because of the slang build problem (a header
file copied to build_i486/staging_dir/include).

> --------------------------------------------------------------------------
> Applying uemacs-4.0.15-lt.02.patch using plaintext:
> patching file lock.c
> touch buildroot/build_i486/em-4.0.15-lt/.unpacked
> ...
> cc1: error: buildroot/build_i486/staging_dir/include: not a directory
> cc1: error: buildroot/build_i486/staging_dir/include: not a directory
> make[1]: *** [basic.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: *** [ansi.o] Error 1

uemacs failed to build because of the slang build problem (a header
file copied to build_i486/staging_dir/include).

> --------------------------------------------------------------------------
> touch buildroot/build_i486/util-linux-2.12r/.configured
> ...
> cc1: error: buildroot/build_i486/staging_dir/include: not a directory
> make[2]: *** [err.o] Error 1
> make[2]: Leaving directory `buildroot/build_i486/util-linux-2.12r/lib'

util-linux failed to build because of the slang build problem (a
header file copied to build_i486/staging_dir/include); now it still
fails, but later on with:

,----
| make[2]: Entering directory `buildroot/build_i486/util-linux-2.12r/fdisk'
| buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc -Os -pipe -Ibuildroot/build_i486/staging_dir/usr/include -Ibuildroot/build_i486/staging_dir/include --sysroot=buildroot/build_i486/staging_dir/ -isysroot buildroot/build_i486/staging_dir -mtune=i486 -march=i486 -c -O2 -fomit-frame-pointer -I../lib -Wall -Wmissing-prototypes -Wstrict-prototypes -DNCH=1   -D_FILE_OFFSET_BITS=64 -DSBINDIR=\"/sbin\" -DUSRSBINDIR=\"/usr/sbin\" -DLOGDIR=\"/var/log\" -DVARPATH=\"/var\" -DLOCALEDIR=\"/usr/share/locale\" -O2 llseek.c -o llseek.o
| llseek.c:34: error: expected declaration specifiers or '...' before '_llseek'
| llseek.c:34: error: expected declaration specifiers or '...' before 'fd'
| llseek.c:34: error: expected declaration specifiers or '...' before 'offset_high'
| llseek.c:35: error: expected declaration specifiers or '...' before 'offset_low'
| llseek.c:35: error: expected declaration specifiers or '...' before 'result'
| llseek.c:36: error: expected declaration specifiers or '...' before 'origin'
| llseek.c:50: warning: return type defaults to 'int'
| llseek.c: In function '_syscall5':
| llseek.c:52: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
| llseek.c:68: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
| llseek.c:34: error: parameter name omitted
| llseek.c:34: error: parameter name omitted
| llseek.c:34: error: parameter name omitted
| llseek.c:35: error: parameter name omitted
| llseek.c:35: error: parameter name omitted
| llseek.c:36: error: parameter name omitted
| llseek.c:93: error: expected '{' at end of input
| make[2]: *** [llseek.o] Error 1
| make[2]: Leaving directory `buildroot/build_i486/util-linux-2.12r/fdisk'
| make[1]: *** [install] Error 1
`----

> --------------------------------------------------------------------------
> touch buildroot/build_i486/wget-1.10.2/.unpacked
> ...
> checking for C compiler default output file name... configure: error: C compiler cannot create executables
> See `config.log' for more details.
> make: *** [buildroot/build_i486/wget-1.10.2/.configured] Error 77

wget failed to build because of the slang build problem (a header
file copied to build_i486/staging_dir/include).

> --------------------------------------------------------------------------
> touch buildroot/build_i486/which-2.16/.unpacked
> ...
> checking for C compiler default output... configure: error: C compiler cannot create executables
> See `config.log' for more details.
> make: *** [buildroot/build_i486/which-2.16/.configured] Error 77

which failed to build because of the slang build problem (a header
file copied to build_i486/staging_dir/include).

> --------------------------------------------------------------------------
> buildroot/build_i486/staging_dir/usr/bin/fakeroot -- buildroot/build_i486/staging_dir/_fakeroot.rootfs.i486.ext2
> rootdir=buildroot/project_build_i486/uclibc/root
> table='target/generic/mini_device_table.txt'
> makedevs: line 53: regular file 'buildroot/project_build_i486/uclibc/root/usr/share/udhcpc/default.script' does not exist: No such file or directory

This occurs because:

	buildroot/build_i486/staging_dir/bin/makedevs \
		-d target/generic/mini_device_table.txt \
		buildroot/project_build_i486/uclibc/root

does not find /usr/share/udhcpc/default.script pointed out by
target/generic/mini_device_table.txt (on line 53); and that is because
busybox-1.6.1 I use does not include that file.


Cheers,

-- 
Cristian
