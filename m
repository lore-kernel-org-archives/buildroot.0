From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:24:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/valgrind: Fix musl build
In-Reply-To: <1453837585-4799-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453837585-4799-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126212434.1e2af98b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 26 Jan 2016 20:46:25 +0100, Bernd Kuhls wrote:

> diff --git a/package/valgrind/0004-musl.patch b/package/valgrind/0004-musl.patch
> new file mode 100644
> index 0000000..e1eb0a9
> --- /dev/null
> +++ b/package/valgrind/0004-musl.patch
> @@ -0,0 +1,51 @@
> +Fix musl build
> +
> +Patch suggested by Thomas: http://patchwork.ozlabs.org/patch/538683/

Did I ? I don't think I suggested this patch, only pointed some
existing ones.

> +diff -upr valgrind-3.11.0.orig/include/pub_tool_redir.h valgrind-3.11.0/include/pub_tool_redir.h
> +--- valgrind-3.11.0.orig/include/pub_tool_redir.h	2015-10-03 02:28:18.304309107 +0200
> ++++ valgrind-3.11.0/include/pub_tool_redir.h	2015-10-03 02:28:37.745672152 +0200
> +@@ -242,7 +242,7 @@
> + /* --- Soname of the standard C library. --- */
> + 
> + #if defined(VGO_linux) || defined(VGO_solaris)
> +-#  define  VG_Z_LIBC_SONAME  libcZdsoZa              // libc.so*
> ++#  define  VG_Z_LIBC_SONAME  libcZdZa                // libc.*
> + 
> + #elif defined(VGO_darwin) && (DARWIN_VERS <= DARWIN_10_6)
> + #  define  VG_Z_LIBC_SONAME  libSystemZdZaZddylib    // libSystem.*.dylib
> +@@ -274,7 +274,7 @@
> + /* --- Soname of the pthreads library. --- */
> + 
> + #if defined(VGO_linux)
> +-#  define  VG_Z_LIBPTHREAD_SONAME  libpthreadZdsoZd0     // libpthread.so.0
> ++#  define  VG_Z_LIBPTHREAD_SONAME  libcZdZa              // libc.*

I don't quite understand this one. While indeed with musl everything is
in libc.so, it's not the case for glibc and uClibc. Doesn't this break
stuff for glibc and uClibc ?

Any chance to submit this upstream so that we get some kind of review
from the valgrind maintainers ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
