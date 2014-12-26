From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 15:31:07 +0100
Subject: [Buildroot] AC_CHECK_LIB doesn't work for cross-compiling
In-Reply-To: <549C0B06.60808@infipwr.com>
References: <549B93F3.7020602@infipwr.com> <20141225044759.GE6400@tarshish>
 <549BAE5C.409@infipwr.com> <20141225064950.GG6400@tarshish>
 <549C0B06.60808@infipwr.com>
Message-ID: <20141226153107.6402246e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Jiang,

On Thu, 25 Dec 2014 22:03:02 +0900, Adam Jiang wrote:

> > 	AC_CHECK_LIB([fcgi], [FCGX_InitRequest], [LIBS="$LIBS -lfcgi],
> > 		[AC_MSG_WARN("unable to find the FCGX_InitRequest() function")],
> > 		[-lm])
> 
> Em...I can understand the issue now. However, would it be possible for 
> libfcgi to resolve its dependency somehow?

For dynamic linking, this should happen automatically, provided libfcgi
is properly linked against libm. But indeed, after a quick look, it
turns out that libfcgi uses frexp() but isn't linked against libm:

$ readelf -a libfcgi.so.0.0.0
[...]
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libnsl.so.0]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]
 0x0000000e (SONAME)                     Library soname: [libfcgi.so.0]
[...]
   176: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND frexp

To me, this looks like a bug in libfcgi build system.

However, even if libfcgi is linked against libm, this will not solve
the case of static linking. In this case, the only proper solution
would be to extend libfcgi to install a .pc (pkg-config) file, and have
your package use PKG_CHECK_MODULES() instead of AC_CHECK_LIB().

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
