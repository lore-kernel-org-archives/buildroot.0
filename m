From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 29 Sep 2008 11:05:52 +0200
Subject: [Buildroot] Standalone toolchain
In-Reply-To: <48E0969E.9090509@cetrtapot.si>
References: <48DA3D47.5060204@cetrtapot.si> <20080924134635.GA14882@mx.loc>
	<48E0969E.9090509@cetrtapot.si>
Message-ID: <48E09A70.5020801@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hinko Kocevar wrote:
> Bernhard Reutner-Fischer wrote:
>> On Wed, Sep 24, 2008 at 03:14:47PM +0200, Hinko Kocevar wrote:
>>> Hi,
>>>
>>> Is it possible to create a toolchain and then transfer it to another machine or just another folder, and have it work?
>> This is supposed to work, yes. The keyword is sysroot support.
>> Either configure your BR2_STAGING_DIR to e.g. /opt/my-target-tripplet
>> or just move the staging dir wherever you want and use the proper
>> --sysroot and -isysroot.
> 
> Like I posted earlier it works if I add --sysroot= to CFLAGS.
> But I can't seem to get libtool to pass --sysroot= variable to the final link command in tslib package:
> 
> 
> ...
> Making all in src
> make[3]: Entering directory `/work/git/sdk.git/cris-uclibc/build/tslib-trunk/src'
> /bin/sh ../libtool --tag=CC   --mode=link cris-linux-uclibc-gcc -DPLUGIN_DIR=\"/usr/lib/ts/\" -DTS_CONF=\"/etc/ts.conf\"  -DTSLIB_INTERNAL -fvisibility=hidden -DGCC_HASCLASSVISIBILITY -Os -pipe -funit-at-a-time -DLINUX -DLINUX_SYSTEM -D_REENTRANT -mno-mul-bug-workaround -Wall --sysroot=/work/git/sdk.git/toolchain -version-info 1:1:1 -release 0.0 -export-dynamic  -o libts.la -rpath /usr/lib ts_attach.lo ts_close.lo ts_config.lo ts_error.lo ts_fd.lo ts_load_module.lo ts_open.lo ts_parse_vars.lo ts_read.lo ts_read_raw.lo -ldl -ldl
> cris-linux-uclibc-gcc -shared  .libs/ts_attach.o .libs/ts_close.o .libs/ts_config.o .libs/ts_error.o .libs/ts_fd.o .libs/ts_load_module.o .libs/ts_open.o .libs/ts_parse_vars.o .libs/ts_read.o .libs/ts_read_raw.o  -ldl  -mno-mul-bug-workaround -Wl,-soname -Wl,libts-0.0.so.0 -o .libs/libts-0.0.so.0.1.1
> /work/git/sdk.git/toolchain/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/bin/ld: crti.o: No such file: No such file or directory
> collect2: ld returned 1 exit status
> make[3]: *** [libts.la] Error 1
> make[3]: Leaving directory `/work/git/sdk.git/cris-uclibc/build/tslib-trunk/src'
> 

Here is more info with -Wl-v switch:
/bin/sh ../libtool --tag=CC   --mode=link cris-linux-uclibc-gcc -DPLUGIN_DIR=\"/usr/lib/ts/\" -DTS_CONF=\"/etc/ts.conf\"  -DTSLIB_INTERNAL -fvisibility=hidden -DGCC_HASCLASSVISIBILITY -Os -pipe -funit-at-a-time -DLINUX -DLINUX_SYSTEM -D_REENTRANT -mno-mul-bug-workaround -Wall --sysroot=/work/git/sdk.git/toolchain -version-info 1:1:1 -release 0.0 -export-dynamic -Wl,--sysroot=/work/git/sdk.git/toolchain --sysroot=/work/git/sdk.git/toolchain -Wl,-v -o libts.la -rpath /usr/lib ts_attach.lo ts_close.lo ts_config.lo ts_error.lo ts_fd.lo ts_load_module.lo ts_open.lo ts_parse_vars.lo ts_read.lo ts_read_raw.lo -ldl -ldl 
cris-linux-uclibc-gcc -shared  .libs/ts_attach.o .libs/ts_close.o .libs/ts_config.o .libs/ts_error.o .libs/ts_fd.o .libs/ts_load_module.o .libs/ts_open.o .libs/ts_parse_vars.o .libs/ts_read.o .libs/ts_read_raw.o  -ldl  -mno-mul-bug-workaround -Wl,--sysroot=/work/git/sdk.git/toolchain -Wl,-v -Wl,-soname -Wl,libts-0.0.so.0 -o .libs/libts-0.0.so.0.1.1
collect2 version 4.3.1
/work/git/sdk.git/toolchain/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/bin/ld --sysroot=/work/buildroot/build_cris/staging_dir --eh-frame-hdr -mcrislinux -rpath-link include/asm/../.. -shared -o .libs/libts-0.0.so.0.1.1 crti.o /work/git/sdk.git/toolchain/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/crtbeginS.o -L/work/git/sdk.git/toolchain/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1 -L/work/git/sdk.git/toolchain/usr/bin/../lib/gcc -L/work/git/sdk.git/toolchain/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/lib .libs/ts_attach.o .libs/ts_close.o .libs/ts_config.o .libs/ts_error.o .libs/ts_fd.o .libs/ts_load_module.o .libs/ts_open.o .libs/ts_parse_vars.o .libs/ts_read.o .libs/ts_read_raw.o -ldl --sysroot=/work/git/sdk.git/toolchain -v -soname libts-0.0.so.0 -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /work/git/sdk.git/toolchain/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/crtendS.o crtn
.o
GNU ld (GNU Binutils) 2.18
/work/git/sdk.git/toolchain/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/bin/ld: crti.o: No such file: No such file or directory
collect2: ld returned 1 exit status

It can be seen that --sysroot argument is not applied to the linker command - it is using default sysroot (used when creating toolchain) '/work/buildroot/build_cris/staging_dir' instead of '/work/git/sdk.git/toolchain' I'm trying to set.

LD should indeed accept the argument (from the help):
hinkok at alala /work/git/sdk.git $ /work/git/sdk.git/toolchain/usr/bin/../lib/gcc/cris-linux-uclibc/4.3.1/../../../../cris-linux-uclibc/bin/ld --help|grep sysroot
  --sysroot=<DIRECTORY>       Override the default sysroot location

Thank you,
Hinko
-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
