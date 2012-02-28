From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 28 Feb 2012 14:39:59 +0100
Subject: [Buildroot] [PATCH 2/4] libglib2: update to version 2.30.2
In-Reply-To: <87aa433l77.fsf@macbook.be.48ers.dk>
References: <1330346337-27342-1-git-send-email-s.neumann@raumfeld.com>
 <1330346337-27342-3-git-send-email-s.neumann@raumfeld.com>
 <87aa433l77.fsf@macbook.be.48ers.dk>
Message-ID: <1330436399.2274.39.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2012-02-28 at 00:34 +0100, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> Update to latest stable release and add a dependency on libffi which
>  Sven> is needed by GObject.
> 
> Looks like we'll need to fiddle with _CONF_ENV:
> 
> checking for qsort_r... yes
> checking if qsort_r uses glibc compatible argument order... configure: error: in `/home/peko/source/buildroot/output/build/libglib2-2.30.2':
> configure: error: cannot run test program while cross compiling
> See `config.log' for more details
> 
> This is default internal toolchain config, ARM A8.

I have just changed my buildroot environment to use the default uclibc
configuration and now the build of libglib2 fails (with your build fix
applied):

gqsort.c: In function 'g_qsort_with_data':
gqsort.c:65:3: warning: implicit declaration of function 'qsort_r' [-Wimplicit-function-declaration]


The problem is that you we pass glib_cv_have_qsort_r=yes to the
configure script now. This is supposed to be only of relevance if we are
building for glibc. But the glib configure script looks like this:


dnl don't use AC_CHECK_FUNCS here, otherwise HAVE_QSORT_R will
dnl be automatically defined, which we don't want to do
dnl until we have checked this function is actually usable
AC_CHECK_FUNC([qsort_r])

# BSD has a qsort_r with wrong argument order
if test x$ac_cv_func_qsort_r = xyes ; then
  AC_CACHE_CHECK([if qsort_r uses glibc compatible argument order],
glib_cv_have_qsort_r, [
  AC_RUN_IFELSE([AC_LANG_SOURCE([[
// [test program deleted]
  }]])],[glib_cv_have_qsort_r=yes],[glib_cv_have_qsort_r=no])])
fi

if test x$glib_cv_have_qsort_r = xyes ; then
  AC_DEFINE(HAVE_QSORT_R, 1, [Define to 1 if you have the 'qsort_r'
function])
fi


So in the end what is tested is the value of glib_cv_have_qsort_r. With
your fix this is now set even though uclibc does not provide qsort_r.


Regards,
Sven
