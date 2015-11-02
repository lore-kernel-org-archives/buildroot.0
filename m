From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 2 Nov 2015 18:19:02 +0100
Subject: [Buildroot] [PATCH 0/4 RFC] xorg: fix installation paths
 (branch yem/xorg)
In-Reply-To: <56373D19.6080303@zacarias.com.ar>
References: <cover.1446416019.git.yann.morin.1998@free.fr>
 <20151102003607.1fa9f695@gmx.net>
 <56373D19.6080303@zacarias.com.ar>
Message-ID: <20151102181902.33e379e9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

On Mon, 2 Nov 2015 07:38:17 -0300, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> On 01/11/15 20:36, Peter Seiderer wrote:
> 
> >> The new pkconf bumped in d7f6d320 introduced a change in behaviour: all
> >> path variables returned by pkgconf are now prefixed with the sysroot
> >> directory.
> >>
> >
> > ...this commit breaks some other packages too, see [1] for libv4l example.
> >
> > This commit removed a patch named '0002-fix-double-sysroot.patch', I think
> > this patch should somehow be forward ported to the new pkconf packet...
> >
> > Regards,
> > Peter
> 
> Hi Peter.
> That's wrong, double-sysroot is natively removed by the newer versions 
> of pkgconf, if you have this:
> 
> ./usr/lib/pkgconfig/libxslt.pc:Libs: -L${libdir} -lxslt  -lxml2 
> -L/home/gustavoz/b/midx11/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib 
> -lz -lm -ldl -lm
> 
> And do this:
> 
> $ ./pkg-config --libs libxslt
> -L/home/gustavoz/b/midx11/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib 
> -lxslt  -lz -ldl -lm -lxml2
> 
> The output is as expected.
> 

But not correct for Qt, eg. for 'moc' while building lib4l, see eg. [1]:

Build statistics for 2015-11-01
===============================
[...]
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/4ecf6d074a608a58d56e3567727028c0ca8dbe2b/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/d5198d50c2df194138aaf72a1b90bd8d2e272ea1/
[...]

Both fail with a wrong path for moc (not double sysroot but one time sysroot is one to much):

/bin/bash: /home/buildroot/buildroot-test/scripts/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/home/buildroot/buildroot-test/scripts/instance-1/output/host/usr/bin/moc: No such file or directory


/bin/sh: /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/home/buildroot/build/instance-0/output/host/usr/bin/moc: No such file or directory
Makefile:1154: recipe for target 'moc_qv4l2.cpp' failed


Or for my test build:

	$ ./host/usr/bin/pkg-config --variable=moc_location QtCore
/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/x86_64-buildroot-linux-gnu/sysroot/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/moc

	$ cat cat ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/QtCore.pc
prefix=/usr
exec_prefix=${prefix}
libdir=${prefix}/lib
includedir=${prefix}/include/QtCore
qt_config=lex yacc warn_on uic resources qt warn_on release incremental link_prl cross_compile shared def_files_disabled no_mocdepend release qt_no_framework silent cross_compile release embedded largefile mmx 3dnow sse sse2 sse3 ssse3 sse4_1 sse4_2 avx exceptions_off dylib create_prl link_prl depend_includepath QTDIR_build qt_install_headers qt warn_on depend_includepath qmake_cache target_qt hide_symbols create_pc create_libtool explicitlib moc thread dll shared
moc_location=/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/moc
uic_location=/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/uic
rcc_location=/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/rcc
lupdate_location=/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/lupdate
lrelease_location=/home/seiderer/Work/build_i686_qt_v4l_utils/host/usr/bin/lrelease

Name: Qtcore
Description: Qtcore Library
Version: 4.8.7
Libs: -L${libdir} -lQtCore 
Libs.private: -L/usr/lib  -lpthread -lm -ldl -lrt  
Cflags: -DQT_SHARED -I/usr/include -I${includedir}

> The problem is two-fold as we discussed with Yann last night.
> On one side the pkg-config manpage says:
> 
>   PKG_CONFIG_SYSROOT_DIR
>    Modify  -I  and -L to use the directories located in target sys?
>    root.  this option is useful when cross-compiling packages  that
>    use  pkg-config  to  determine CFLAGS and LDFLAGS. -I and -L are
>    modified to point to the new system  root.  this  means  that  a
>    -I/usr/include/libfoo will become -I/var/target/usr/include/lib?
>    foo with a PKG_CONFIG_SYSROOT_DIR  equal  to  /var/target  (same
>    rule apply to -L)
> 
> So pkgconf is being "too happy" in applying the sysroot prefix to all 
> directories it finds in any variable.
> 
> On the other hand on the previous 0001-fix-variable.patch it did:
> 
> if ( !strcmp(req.variable, "includedir") ||
>          !strcmp(req.variable, "mapdir") ||
>          !strcmp(req.variable, "sdkdir") ||
>          !strcmp(req.variable, "libdir"))
>                printf("%s%s\n", sysroot_dir, req.buf);
>        else
>                printf("%s\n", req.buf);
> 
> So it was adding the sysroot prefix for mapdir & sdkdir as well, very 
> much out of specification (we'll call the manpage a spec), catering for 
> package abuse.
> 
> In the end our previous pkgconf was working out of spec, which may be 
> ok, but poses the question, how many of these variables should be 
> patched/prefixed as well? Because in the future other packages with 
> their $nonstandard variable may need this as well, and patching and 
> patching pkgconf for eternity doesn't sound so great.
> 
> First pkgconf should be patched to fix the out-of-spec functionality and 
> send that upstream, but variable exceptions won't roll.
> 
> For the second problem i think mangling the .pc files would be best for 
> the special variables, based on a per-package definition where you can 
> say which other variables should be prefixed.

Any suggestion how to fix the lib4vl case?

Regards,
Peter

> 
> Regards.
