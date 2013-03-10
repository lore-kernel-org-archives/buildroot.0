From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 10:27:11 +0100
Subject: [Buildroot] moving package divine from autotools-package to
 generic-package
In-Reply-To: <513C4B87.40805@googlemail.com>
References: <513A5360.8080707@googlemail.com> <20130309101325.7b8352e8@skate>
 <513C4B87.40805@googlemail.com>
Message-ID: <20130310102711.7b1a6479@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sun, 10 Mar 2013 09:59:51 +0100, Carsten Schoenert wrote:

> Am 09.03.2013 10:13, schrieb Thomas Petazzoni:
> > No, no, it should continue to be an autotools-package. It has a
> > configure.in, and Makefile.am, it is autotools based, so it should
> > remain an autotools-package.
> 
> O.K. In short, if a package is comprised a file 'autogen.sh' and this
> generate the whole autotool stuff the package has to be a autotools-package.

Yes, unless there are some specific issues, all packages that use
autoconf/automake should use the autotools-package infrastructure.


> Yes this works, but I get some warnings! Maybe the AUTORECONF things has
> to be a little reworked. I don't know there to look to solve thees
> warnings. The package divine doesn't have a macro AC_LANG_CONFTEST in use.
> > carsten at wheezy:~/gitprojects/buildroot [ubi-arm-directfb] $ make divine-dirclean
> > rm -Rf /home/carsten/gitprojects/buildroot/output/build/divine-83cafc257a42b9465cd9d6185bf66b8c1b7ed704
> > carsten at wheezy:~/gitprojects/buildroot [ubi-arm-directfb] $ make divine
> >>>> divine 83cafc257a42b9465cd9d6185bf66b8c1b7ed704 Extracting
> > gzip -d -c /home/carsten/gitprojects/buildroot/dl/divine-83cafc257a42b9465cd9d6185bf66b8c1b7ed704.tar.gz | tar --strip-components=1 -C /home/carsten/gitprojects/buildroot/output/build/divine-83cafc257a42b9465cd9d6185bf66b8c1b7ed704  -xf -
> >>>> divine 83cafc257a42b9465cd9d6185bf66b8c1b7ed704 Patching package//divine
> >>>> divine 83cafc257a42b9465cd9d6185bf66b8c1b7ed704  Updating config.sub and config.guess
> > for file in config.guess config.sub; do for i in $(find /home/carsten/gitprojects/buildroot/output/build/divine-83cafc257a42b9465cd9d6185bf66b8c1b7ed704 -name $file); do cp support/gnuconfig/$file $i; done; done
> >>>> divine 83cafc257a42b9465cd9d6185bf66b8c1b7ed704 Patching libtool
> >>>> divine 83cafc257a42b9465cd9d6185bf66b8c1b7ed704 Autoreconfiguring
> > configure.in:56: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call detected in body
> > ../../lib/autoconf/lang.m4:194: AC_LANG_CONFTEST is expanded from...
> > ../../lib/autoconf/general.m4:2662: _AC_LINK_IFELSE is expanded from...
> > ../../lib/autoconf/general.m4:2679: AC_LINK_IFELSE is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:1084: _LT_SYS_MODULE_PATH_AIX is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:4207: _LT_LINKER_SHLIBS is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:5339: _LT_LANG_C_CONFIG is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:143: _LT_SETUP is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:69: LT_INIT is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:108: AM_PROG_LIBTOOL is expanded from...
> > configure.in:56: the top level
> > configure.in:56: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call detected in body
> > ../../lib/autoconf/lang.m4:194: AC_LANG_CONFTEST is expanded from...
> > ../../lib/autoconf/general.m4:2662: _AC_LINK_IFELSE is expanded from...
> > ../../lib/autoconf/general.m4:2679: AC_LINK_IFELSE is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:4207: _LT_LINKER_SHLIBS is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:5339: _LT_LANG_C_CONFIG is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:143: _LT_SETUP is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:69: LT_INIT is expanded from...
> > /home/carsten/gitprojects/buildroot/output/host/usr/share/aclocal/libtool.m4:108: AM_PROG_LIBTOOL is expanded from...
> > configure.in:56: the top level
> > configure.in:56: warning: AC_LANG_CONFTEST: no AC_LANG_SOURCE call detected in body
> > ../../lib/autoconf/lang.m4:194: AC_LANG_CONFTEST is expanded from...
> > ../../lib/autoconf/general.m4:2662: _AC_LINK_IFELSE is expanded from...
> > ../../lib/autoconf/general.m4:2679: AC_LINK_IFELSE is expanded from...
> ...

Yes. I am not an expert in autoconf/automake, but there are often some
warnings due to slight changes in the autoconf/automake languages, and
the corresponding configure.ac/Makefile.am in the project not being
updated accordingly.

> > But clearly, converting to generic-package is the wrong way to go.
> 
> I understand, maybe this can be more precise highlighted in the manual.

Hum, ok. About the generic-package infrastructure, the manual says:

   By packages with specific build systems we mean all the packages
   whose build system is not one of the standard ones, such as
   autotools or CMake. This typically includes packages whose build
   system is based on hand-written Makefiles or shell scripts.

Maybe this wording is not explicit enough?

> So now I will rework my work to prepare some patches. Thanks for reviewing!

You're welcome, thanks for contributing!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
