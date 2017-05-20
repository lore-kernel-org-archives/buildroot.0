From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 20 May 2017 12:10:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-18
In-Reply-To: <20170519214454.08c259df@free-electrons.com>
References: <20170519063157.2654320766@mail.free-electrons.com>
 <20170519214454.08c259df@free-electrons.com>
Message-ID: <f06fc6ce-e57e-370c-ec10-3a6703a5bc97@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 19/05/2017 ? 21:44, Thomas Petazzoni a ?crit :
> Hello,
> 

[...]

> 
>> microblazeel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/b8c18a2cc5e7170695c273e8017a4771096167b6 |     
> 
> Issue when linking against gnutls, itself linked against libunistring.
> Romain and I have already identified an issue in gnutls .pc file while
> investigating a ffmpeg build failure. It might be the same issue here.
> 

Indeed, see ffmpeg build issue [1].

gnutls.pc contain the full path to libunistring library which trigger an issue
when compiling with "gcc -c" (Compile and assemble, but do not link). When
compiling with "gcc -c", a full path is not accepted, while -lfoo is.

gnutls.pc for static libraries build:
Libs.private:  -lintl      -lgmp [...]sysroot/usr/lib/libunistring.a

gnutls.pc for shared libraries build:
Libs.private:        -lgmp [...]/sysroot/usr/lib/libunistring.so

That's because gnutls use AC_LIB_HAVE_LINKFLAGS [2] witch return the full
library path in LIBUNISTRING. If LTLIBUNISTRING is used in gnutls.pc.in then the
issue is "fixed":

Libs.private:  -lintl      -lgmp -lunistring

But it's probably a hack...

We don't have a problem with zlib since gnutls build system use zlib.pc thanks
to pkg-config (otherwise we have the same issue with zlib...).

For LIBINTL the AM_GNU_GETTEXT macro is used and return LIBINTL='-lintl'.
GMP_LIBS is set from LIBGNUTLS_HOOKS (m4/hooks.m4) which use AC_CHECK_LIB and
return -lgmp.

The remaining libraries LIBSOCKET, LIBNSL, LIBPTHREAD, LIB_SELECT, TSS_LIBS and
LIBIDN2_LIBS are empty.

We can't use PKG_CHECK_MODULES for libunistring since it doesn't provide a .pc
file. The remaining solution is AC_CHECK_LIB() instead of AC_LIB_HAVE_LINKFLAGS,
it could work since libunistring doesn't link with other libraries (-lunistring
is enough). But we have to do an "invasive" change in the build system.

So I would suggest s/LIBUNISTRING/LTLIBUNISTRING/ in gnutls.pc.

Also having a full path is a .pc file is a problem for relocatable SDK [3] if
you move your HOST_DIR (which contain the STAGING_DIR).

Best regards,
Romain

[1]
http://autobuild.buildroot.net/results/6cf/6cf90177a444882ad37017bccf41dea6bf752d31/ffmpeg-3.3.1/config.log

[2]
https://www.gnu.org/software/gnulib/manual/html_node/Searching-for-Libraries.html

[3] http://lists.busybox.net/pipermail/buildroot/2017-March/187695.html

> 
> Best regards,
> 
> Thomas
> 
