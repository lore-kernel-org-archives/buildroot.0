From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 11:42:50 +0200
Subject: [Buildroot] [PATCH 12/14] openipmi: no need to check for
 clock_gettime
In-Reply-To: <90a050c99718b5448c574ffc491aac7c76130c87.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <90a050c99718b5448c574ffc491aac7c76130c87.1497583686.git.baruch@tkos.co.il>
Message-ID: <20170618094250.GN2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-06-16 06:32 +0300, Baruch Siach spake thusly:
> Buildroot no longer supports toolchains with glibc older than 2.17, so there
> is no need to check whether librt is required for clock_* system calls.

To be noted: upstream has fixed that recently:
    https://sourceforge.net/p/openipmi/code/ci/488c5dbfe54cb0da26a61c0b892a4106ac87a878/

Sad that they waited two years to fix it, and that they did not use your
patch... :-(

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...c-detect-lrt-requirement-for-clock_gettim.patch | 57 ----------------------
>  1 file changed, 57 deletions(-)
>  delete mode 100644 package/openipmi/0002-configure.ac-detect-lrt-requirement-for-clock_gettim.patch
> 
> diff --git a/package/openipmi/0002-configure.ac-detect-lrt-requirement-for-clock_gettim.patch b/package/openipmi/0002-configure.ac-detect-lrt-requirement-for-clock_gettim.patch
> deleted file mode 100644
> index d58ffd7caf26..000000000000
> --- a/package/openipmi/0002-configure.ac-detect-lrt-requirement-for-clock_gettim.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From d3be03464be7fa3844dfe0837a7e2c920c107836 Mon Sep 17 00:00:00 2001
> -From: Baruch Siach <baruch@tkos.co.il>
> -Date: Thu, 23 Jul 2015 13:35:35 +0300
> -Subject: [PATCH] configure.ac: detect -lrt requirement for clock_gettime
> -
> -glibc versions before 2.17 require link with -lrt.
> -
> -Upstream status: sent, stuck in moderator's queue
> -
> -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ----
> - configure.ac     | 8 ++++++++
> - unix/Makefile.am | 4 ++--
> - 2 files changed, 10 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 18401f161d45..6b350a41a916 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -854,6 +854,14 @@ OPENIPMI_SWIG_SO="${PYTHON_POSIX_SO}:\$(top_builddir)/lib/.libs/libOpenIPMI.so:\
> - AC_SUBST(OPENIPMI_SWIG_LIBS)
> - AC_SUBST(OPENIPMI_SWIG_SO)
> - 
> -+LIB_CLOCK_GETTIME=
> -+clk_saved_libs=$LIBS
> -+AC_SEARCH_LIBS([clock_gettime], [rt],
> -+	       [test "$ac_cv_search_clock_gettime" = "none required" ||
> -+		LIB_CLOCK_GETTIME=$ac_cv_search_clock_gettime])
> -+AC_SUBST([LIB_CLOCK_GETTIME])
> -+LIBS=$clk_saved_libs
> -+
> - # Everything from here to AC_OUTPUT is for libedit
> - 
> - # AC_PROG_LIBTOOL runs AC_CANONICAL_HOST
> -diff --git a/unix/Makefile.am b/unix/Makefile.am
> -index a108bc679c9a..fb60242d5d3b 100644
> ---- a/unix/Makefile.am
> -+++ b/unix/Makefile.am
> -@@ -9,13 +9,13 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
> - 
> - libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
> - libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
> --	$(top_builddir)/utils/libOpenIPMIutils.la
> -+	$(top_builddir)/utils/libOpenIPMIutils.la $(LIB_CLOCK_GETTIME)
> - libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
> - 	-Wl,-Map -Wl,libOpenIPMIpthread.map
> - 
> - libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
> - libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
> --	$(GDBM_LIB)
> -+	$(GDBM_LIB) $(LIB_CLOCK_GETTIME)
> - libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
> - 	-Wl,-Map -Wl,libOpenIPMIposix.map
> - 
> --- 
> -2.1.4
> -
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
