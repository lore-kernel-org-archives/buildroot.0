From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 28 Oct 2018 12:16:55 +0100
Subject: [Buildroot] [PATCH v1] valgrind: fix uclibc c99 support
 detection
In-Reply-To: <20181028104450.39b76b65@windsurf>
References: <20181028093957.20543-1-ps.report@gmx.net>
 <20181028104450.39b76b65@windsurf>
Message-ID: <20181028121655.2c01ecd6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 28 Oct 2018 10:44:50 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Sun, 28 Oct 2018 10:39:57 +0100, Peter Seiderer wrote:
> > Fixes [1]:
> > 
> >   checking for /home/peko/autobuild/instance-0/output/host/bin/powerpc-linux-gcc option to accept ISO C99... unsupported
> >   configure: error: Valgrind relies on a C compiler supporting C99
> > 
> > with the following in the valgrind-3.14.0/config.log:
> > 
> >   configure:5517: checking for .../host/bin/powerpc-linux-gcc option to accept ISO C99
> >   configure:5666: .../host/bin/powerpc-linux-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-stack-protector -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
> >   conftest.c:55:9: error: unknown type name 'wchar_t'
> >      const wchar_t *name;
> >            ^~~~~~~
> > 
> > [1] http://autobuild.buildroot.net/results/b25013f785a11f07e8da3735741b96036712f42a  
> 
> So the autoconf test verifies that WCHAR support is available, which is
> not (the toolchain doesn't provide it), but in practice, Valgrind does
> not need WCHAR support ?

The difference in the configure.ac files is:

	$ diff -u build/valgrind-3.13.0/configure.ac build/valgrind-3.14.0/configure.ac
[...]
@@ -100,6 +113,11 @@
 fi
 rm $tmpfile
 
+# Make sure we can compile in C99 mode.
+AC_PROG_CC_C99
+if test "$ac_cv_prog_cc_c99" == "no"; then
+    AC_MSG_ERROR([Valgrind relies on a C compiler supporting C99])
+fi
[...]

But the check seems to fail in case of uclibc without WCHAR support
(but valgrind compiles fine in case the check is circumvented),
maybe the same problem as for libv4l fixed with commit
'libv4l: fix uclibc-ng configure/compile' (see [2])...

Regards,
Peter

[2] https://git.buildroot.net/buildroot/commit/package/libv4l?id=f01396a158f14c53b781c35f7ff29da0bea8c8d6

> 
> Best regards,
> 
> Thomas
