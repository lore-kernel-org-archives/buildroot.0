From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 13:51:18 +0200
Subject: [Buildroot] Correct way to check for clock_gettime()
Message-ID: <20100730135118.45adcc67@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a build problem related to the fact that I build two seperate
packages (ctorrent and libglib) while sharing a configure cache (using
the --cache-file ./configure option) [*]

The issue is that CTorrent first does:

AC_SEARCH_LIBS([clock_gettime],[rt posix4])

Which tests if clock_gettime() can be found with no special library
argument (which fails), and then tests if it can be found using "-lrt",
which works. So 

Then, CTorrent does:

AC_CHECK_FUNCS([clock_gettime])

Which works too, because the test program gets compiled with
"-lrt" (which is strange, because I thought that only AC_CHECK_LIB was
adding the matching library to LIBS, and that AC_SEARCH_LIBS was not
doing that). But anyway, the test works, so CTorrent configure.ac adds:

 ac_cv_func_clock_gettime=${ac_cv_func_clock_gettime=yes}
 ac_cv_search_clock_gettime=${ac_cv_search_clock_gettime=-lrt}

to the configure cache.

Then later on, the ./configure script of libglib is executed. And it
does:

AC_CHECK_FUNCS(clock_gettime, [], [
  AC_CHECK_LIB(rt, clock_gettime, [
    AC_DEFINE(HAVE_CLOCK_GETTIME, 1)
    G_THREAD_LIBS="$G_THREAD_LIBS -lrt"
    G_THREAD_LIBS_FOR_GTHREAD="$G_THREAD_LIBS_FOR_GTHREAD -lrt"
  ])
])

The AC_CHECK_FUNCS test sees that ac_cv_func_clock_gettime is "yes" in
the cache (as inserted by CTorrent), so it assumes that clock_gettime()
is available without making any compilation test. So it doesn't know
that "-lrt" should be appended to the set of libraries to link with,
and the libglib build process fails later on because "-lrt" is missing
on the command line.

So the question is, which of CTorrent and libglib is wrong in its
configure.{ac,in} ?

I've attached the CTorrent configure.ac and libglib configure.in to
this e-mail (renamed ctorrent-configure.ac and libglib-configure.in).

Thanks !

Thomas

[*] For those who wonder, we're doing this kind of builds in Buildroot,
    which is an embedded Linux build system. As we repeatedly configure
    and build several dozens of packages, sharing the configure cache
    greatly speeds up the build... but raises some issues such as the
    one described in this e-mail.
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ctorrent-configure.ac
Type: application/octet-stream
Size: 4655 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100730/37c64fe7/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libglib-configure.in
Type: application/octet-stream
Size: 104463 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100730/37c64fe7/attachment-0003.obj>
