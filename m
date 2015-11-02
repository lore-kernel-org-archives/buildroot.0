From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 2 Nov 2015 15:04:41 -0300
Subject: [Buildroot] [PATCH 0/4 RFC] xorg: fix installation paths
 (branch yem/xorg)
In-Reply-To: <20151102181902.33e379e9@gmx.net>
References: <cover.1446416019.git.yann.morin.1998@free.fr>
 <20151102003607.1fa9f695@gmx.net> <56373D19.6080303@zacarias.com.ar>
 <20151102181902.33e379e9@gmx.net>
Message-ID: <5637A5B9.70201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/11/15 14:19, Peter Seiderer wrote:

> Hello Gustavo,

Hi Peter.

> Both fail with a wrong path for moc (not double sysroot but one time sysroot is one to much):
>
> /bin/bash: /home/buildroot/buildroot-test/scripts/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/home/buildroot/buildroot-test/scripts/instance-1/output/host/usr/bin/moc: No such file or directory
>
>
> /bin/sh: /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/home/buildroot/build/instance-0/output/host/usr/bin/moc: No such file or directory
> Makefile:1154: recipe for target 'moc_qv4l2.cpp' failed
>
>
> Or for my test build:
>
> 	$ ./host/usr/bin/pkg-config --variable=moc_location QtCore
> /home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/x86_64-buildroot-linux-gnu/sysroot/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/moc
>
> 	$ cat cat ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/QtCore.pc
> prefix=/usr
> exec_prefix=${prefix}
> libdir=${prefix}/lib
> includedir=${prefix}/include/QtCore
> qt_config=lex yacc warn_on uic resources qt warn_on release incremental link_prl cross_compile shared def_files_disabled no_mocdepend release qt_no_framework silent cross_compile release embedded largefile mmx 3dnow sse sse2 sse3 ssse3 sse4_1 sse4_2 avx exceptions_off dylib create_prl link_prl depend_includepath QTDIR_build qt_install_headers qt warn_on depend_includepath qmake_cache target_qt hide_symbols create_pc create_libtool explicitlib moc thread dll shared
> moc_location=/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/moc
> uic_location=/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/uic
> rcc_location=/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/rcc
> lupdate_location=/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/lupdate
> lrelease_location=/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/lrelease
>
> Name: Qtcore
> Description: Qtcore Library
> Version: 4.8.7
> Libs: -L${libdir} -lQtCore
> Libs.private: -L/usr/lib  -lpthread -lm -ldl -lrt
> Cflags: -DQT_SHARED -I/usr/include -I${includedir}
>
>> The problem is two-fold as we discussed with Yann last night.
>> On one side the pkg-config manpage says:
>>
>>    PKG_CONFIG_SYSROOT_DIR
>>     Modify  -I  and -L to use the directories located in target sys?
>>     root.  this option is useful when cross-compiling packages  that
>>     use  pkg-config  to  determine CFLAGS and LDFLAGS. -I and -L are
>>     modified to point to the new system  root.  this  means  that  a
>>     -I/usr/include/libfoo will become -I/var/target/usr/include/lib?
>>     foo with a PKG_CONFIG_SYSROOT_DIR  equal  to  /var/target  (same
>>     rule apply to -L)
>>
>> So pkgconf is being "too happy" in applying the sysroot prefix to all
>> directories it finds in any variable.

Point 1 is what's happening, the *_location variables contain a HOST_DIR 
prepended to them, hence it's not a sysroot (STAGING_DIR), so it doesn't 
detect it as a duplicate because it's different, PKG_CONFIG_SYSROOT_DIR 
is setting the sysroot (in the pkgconfig wrapper script), hence pkgconf 
is prepending the sysroot to those.
This is a violation of the "only sysroot the -I/-L entries alone" spec.
However xorg depends on mapdir/sdkdir being prepended as well, which is 
a grey rule - though that's a different problem.
First things first would be to make pkgconf pkgconfig conformant.
Regards.
