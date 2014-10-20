From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 18:48:27 +0200
Subject: [Buildroot] [PATCH v4] libevent: Use github call & fix patch
In-Reply-To: <1413739261-3675-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413739261-3675-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141020164827.GB3742@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-19 19:21 +0200, Maxime Hadjinlian spake thusly:
> We want to use the github helper since there is not a specific releases
> tarball that we can download, as specified in the manual.
> 
> This tarball is generated from the tag, which doesn't contains the
> autotools generated files, we then need to use AUTORECONF.
> 
> We want to use the github helper anyway as the current URL use an old
> GitHub feature which was called 'Download' where you could upload files
> along your repositories, theses files were not related to your tags.
> 
> This features has been replaced with the 'Release' option where you can
> create a release from a git tag. But these tarball are generated from
> the sources and they don't contains all the generated autotools file.
> 
> Since the old URL scheme can be deprecated at any time, we want to
> switch to the new URL scheme, which in the case of libevent, implies
>     having to do an AUTORECONF.

Stray leading space.

Otherwise, this commit log is much more explicit, and extensively
describes the reason for the change. Thanks! :-)

> The patch that was already present is updated to apply against
> Makefile.am instead of Makefile.in
> 
> The second patch is backported from upstream to remove the use of
> $(top_src_dirs) which makes current autotools error out.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v3 -> v4:
>    - Update commit log to explain necessity of the patch
> v2 -> v3:
>    - Fix grammar in commit log (Yann E. Morin)
>    - Change version to reflect the whole tag name (Yann E. Morin)
> v1 -> v2:
>    - Fix the added patches so they have correct SoB (Thomas Petazzoni)
>    - Add SoB (Thomas Petazzoni)
>    - Add comment for autoreconf (Yann E. Morin)
> ---
>  .../0001-Disable-building-test-programs.patch      | 30 +++++++++
>  .../0002-Avoid-using-top_srcdir-in-TESTS.patch     | 71 ++++++++++++++++++++++
>  .../libevent-disable-building-test-programs.patch  | 30 ---------
>  package/libevent/libevent.mk                       |  7 ++-
>  4 files changed, 105 insertions(+), 33 deletions(-)
>  create mode 100644 package/libevent/0001-Disable-building-test-programs.patch
>  create mode 100644 package/libevent/0002-Avoid-using-top_srcdir-in-TESTS.patch
>  delete mode 100644 package/libevent/libevent-disable-building-test-programs.patch
> 
> diff --git a/package/libevent/0001-Disable-building-test-programs.patch b/package/libevent/0001-Disable-building-test-programs.patch
> new file mode 100644
> index 0000000..eb1acfd
> --- /dev/null
> +++ b/package/libevent/0001-Disable-building-test-programs.patch
> @@ -0,0 +1,30 @@
> +From 4b5a135fa681e85eb6988a379f59f3c7a41cc48c Mon Sep 17 00:00:00 2001
> +From: Gilles Talis <gilles.talis@gmail.com>
> +Date: Fri, 21 Jun 2013 15:25:11 -0700
> +Subject: [PATCH 1/2] Disable building test programs
> +
> +We are not really interested in building test programs.
> +Moreover, these programs use fork() function that is
> +not available on MMU-less architectures.
> +
> +Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 42879a3..dc90359 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -126,7 +126,7 @@ else
> + noinst_LTLIBRARIES =  $(LIBEVENT_LIBS_LA)
> + endif
> + 
> +-SUBDIRS = . include sample test
> ++SUBDIRS = . include sample
> + 
> + if BUILD_WIN32
> + 
> +-- 
> +2.1.1
> +
> diff --git a/package/libevent/0002-Avoid-using-top_srcdir-in-TESTS.patch b/package/libevent/0002-Avoid-using-top_srcdir-in-TESTS.patch
> new file mode 100644
> index 0000000..54f03cc
> --- /dev/null
> +++ b/package/libevent/0002-Avoid-using-top_srcdir-in-TESTS.patch
> @@ -0,0 +1,71 @@
> +From 366165fc19e862d08ff51ee2bbbff253fc234dd1 Mon Sep 17 00:00:00 2001
> +From: Nick Mathewson <nickm@torproject.org>
> +Date: Fri, 8 Feb 2013 22:10:05 -0500
> +Subject: [PATCH 2/2] Avoid using $(top_srcdir) in TESTS.
> +
> +Newer automakes don't like this.
> +
> +Signed-off-by: Nick Mathewson <nickm@torproject.org>
> +----
> +Patch backported from upstream:
> +https://github.com/libevent/libevent/commit/2863c837007c9f28ae542663a6098c91e704b3ca.patch
> +
> +Slight modifications to test/Makefile.am
> +
> +Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> +---
> + Makefile.am      |  4 +++-
> + test/Makefile.am | 10 +++++++++-
> + 2 files changed, 12 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index dc90359..c34576d 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -128,6 +128,8 @@ endif
> + 
> + SUBDIRS = . include sample
> + 
> ++DISTCLEANFILES=
> ++
> + if BUILD_WIN32
> + 
> + SYS_LIBS = -lws2_32 -lshell32 -ladvapi32
> +@@ -239,5 +241,5 @@ doxygen: FORCE
> + 	doxygen $(srcdir)/Doxyfile
> + FORCE:
> + 
> +-DISTCLEANFILES = *~ libevent.pc ./include/event2/event-config.h
> ++DISTCLEANFILES += *~ libevent.pc ./include/event2/event-config.h
> + 
> +diff --git a/test/Makefile.am b/test/Makefile.am
> +index b10c41a..e2f4f4e 100644
> +--- a/test/Makefile.am
> ++++ b/test/Makefile.am
> +@@ -5,6 +5,7 @@
> + # See LICENSE for copying information.
> + 
> + AUTOMAKE_OPTIONS = foreign
> ++DISTCLEANFILES=
> + 
> + AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/compat -I$(top_srcdir)/include -I../include -DTINYTEST_LOCAL
> + 
> +@@ -19,7 +20,14 @@ endif
> + EXTRA_PROGRAMS = regress
> + noinst_HEADERS = tinytest.h tinytest_macros.h regress.h tinytest_local.h
> + 
> +-TESTS = $(top_srcdir)/test/test.sh
> ++# We need to copy this file, since automake doesn't want us to use top_srcdir
> ++# in TESTS.
> ++TESTS = test/test-script.sh
> ++
> ++test/test-script.sh: test/test.sh
> ++ cp $< $@
> ++
> ++DISTCLEANFILES += test/test-script.s
> + 
> + BUILT_SOURCES =
> + if BUILD_REGRESS
> +-- 
> +2.1.1
> +
> diff --git a/package/libevent/libevent-disable-building-test-programs.patch b/package/libevent/libevent-disable-building-test-programs.patch
> deleted file mode 100644
> index 4b0f0d9..0000000
> --- a/package/libevent/libevent-disable-building-test-programs.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From e932c8864e1bb8b6a7901d4b049a1100c4becba5 Mon Sep 17 00:00:00 2001
> -From: Gilles Talis <gilles.talis@gmail.com>
> -Date: Fri, 21 Jun 2013 15:25:11 -0700
> -Subject: [PATCH] Disable building test programs
> -
> -We are not really interested in building test programs.
> -Moreover, these programs use fork() function that is
> -not available on MMU-less architectures.
> -
> -Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ----
> - Makefile.in |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 2ebefa2..4fba1ff 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -487,7 +487,7 @@ LIBEVENT_LIBS_LA = libevent.la libevent_core.la libevent_extra.la \
> - @INSTALL_LIBEVENT_TRUE at lib_LTLIBRARIES = $(LIBEVENT_LIBS_LA)
> - @INSTALL_LIBEVENT_TRUE at pkgconfig_DATA = $(LIBEVENT_PKGCONFIG)
> - @INSTALL_LIBEVENT_FALSE at noinst_LTLIBRARIES = $(LIBEVENT_LIBS_LA)
> --SUBDIRS = . include sample test
> -+SUBDIRS = . include sample
> - @BUILD_WIN32_FALSE at SYS_LIBS = 
> - @BUILD_WIN32_TRUE at SYS_LIBS = -lws2_32 -lshell32 -ladvapi32
> - @BUILD_WIN32_FALSE at SYS_SRC = $(am__append_5) $(am__append_6) \
> --- 
> -1.7.4.1
> -
> diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
> index 73be502..607b7b2 100644
> --- a/package/libevent/libevent.mk
> +++ b/package/libevent/libevent.mk
> @@ -4,12 +4,13 @@
>  #
>  ################################################################################
>  
> -LIBEVENT_VERSION = 2.0.21
> -LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
> -LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
> +LIBEVENT_VERSION = release-2.0.21-stable
> +LIBEVENT_SITE = $(call github,libevent,libevent,$(LIBEVENT_VERSION))
>  LIBEVENT_INSTALL_STAGING = YES
>  LIBEVENT_LICENSE = BSD-3c, OpenBSD
>  LIBEVENT_LICENSE_FILES = LICENSE
> +# Straight from the repository, need to generate autotools files
> +LIBEVENT_AUTORECONF = YES
>  
>  define LIBEVENT_REMOVE_PYSCRIPT
>  	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
> -- 
> 2.1.1
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
