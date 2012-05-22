From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 22 May 2012 06:23:43 +0200
Subject: [Buildroot] [PATCH 1/3] lttng-libust: bump to version 2.0.2
In-Reply-To: <1336484514-17578-1-git-send-email-s.martin49@gmail.com>
References: <87vckmamle.fsf@macbook.be.48ers.dk>
 <1336484514-17578-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHXCMML-gnFtRxrWxBH0D0Jzt_WpRfCcZPES=unZ_OQJn2e6Qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping?

2012/5/8 Samuel Martin <s.martin49@gmail.com>:
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
> ?...t-dont-build-cxx-tests-when-not-available.patch | ? 45 ++++++++++++--------
> ?.../lttng-libust-fix-overflow-32-bits.patch ? ? ? ?| ? 26 -----------
> ?package/lttng-libust/lttng-libust.mk ? ? ? ? ? ? ? | ? 11 +++--
> ?3 files changed, 36 insertions(+), 46 deletions(-)
> ?delete mode 100644 package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch
>
> diff --git a/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch b/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch
> index d7be22d..437ccca 100644
> --- a/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch
> +++ b/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch
> @@ -1,19 +1,27 @@
> -Do not build C++ example if a C++ compiler isn't available
> +From 01dfa6e944d083db994f0a1165d3124bb6875437 Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Tue, 8 May 2012 15:13:21 +0200
> +Subject: [PATCH 1/1] don't build C++ example if a C++ compiler isn't
> + available
>
> ?By default lttng-ust builds a hello.cxx C++ example that demonstrates
> -the usage of the userspace tracing library in a C++
> -program. Unfortunately, when no C++ support is available, the build
> -of lttng-ust fails just because of this example code. So we make the
> -compilation of this code conditional on whether a working C++ compiler
> -was found.
> +the usage of the userspace tracing library in a C++ program.
> +Unfortunately, when no C++ support is available, the build of lttng-ust
> +fails just because of this example code. So we make the compilation of
> +this code conditional on whether a working C++ compiler was found.
>
> ?Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +---
> + configure.ac ? ? ?| ? 12 ++++++++++++
> + tests/Makefile.am | ? ?6 +++++-
> + 2 files changed, 17 insertions(+), 1 deletion(-)
>
> -Index: lttng-ust-1.9.2/configure.ac
> -===================================================================
> ---- lttng-ust-1.9.2.orig/configure.ac ?2012-02-04 14:49:45.387325814 +0100
> -+++ lttng-ust-1.9.2/configure.ac ? ? ? 2012-02-04 14:50:08.156920117 +0100
> -@@ -38,6 +38,18 @@
> +diff --git a/configure.ac b/configure.ac
> +index 26227cb..56d84db 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -45,6 +45,18 @@ AC_PROG_CXX
> ?AC_PROG_MAKE_SET
> ?LT_INIT
>
> @@ -32,13 +40,13 @@ Index: lttng-ust-1.9.2/configure.ac
> ?## Checks for libraries.
> ?AC_CHECK_LIB([dl], [dlopen])
> ?AC_CHECK_LIB([pthread], [pthread_create])
> -Index: lttng-ust-1.9.2/tests/Makefile.am
> -===================================================================
> ---- lttng-ust-1.9.2.orig/tests/Makefile.am ? ? 2012-02-04 14:49:49.157258640 +0100
> -+++ lttng-ust-1.9.2/tests/Makefile.am ?2012-02-04 14:50:15.096796474 +0100
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index e79ab7c..1a8b795 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> ?@@ -1,6 +1,10 @@
> --SUBDIRS = . hello fork ust-basic-tracing ust-multi-test demo hello.cxx
> -+SUBDIRS = . hello fork ust-basic-tracing ust-multi-test demo
> +-SUBDIRS = . hello hello-static-lib fork ust-basic-tracing ust-multi-test demo hello.cxx
> ++SUBDIRS = . hello hello-static-lib fork ust-basic-tracing ust-multi-test demo
> ?#SUBDIRS = . hello2 basic basic_long simple_include snprintf test-nevents test-libustinstr-malloc dlopen same_line_marker trace_event register_test tracepoint libustctl_function_tests exit-fast
>
> ?+if CXX_WORKS
> @@ -48,3 +56,6 @@ Index: lttng-ust-1.9.2/tests/Makefile.am
> ?dist_noinst_SCRIPTS = test_loop runtests trace_matches
>
> ?noinst_LIBRARIES = libtap.a
> +--
> +1.7.10.1
> +
> diff --git a/package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch b/package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch
> deleted file mode 100644
> index c2a4dd2..0000000
> --- a/package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From dc190cc1f8ddccfa7b0b8323ed157afb29a0ebb7 Mon Sep 17 00:00:00 2001
> -From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> -Date: Wed, 21 Dec 2011 16:24:48 -0500
> -Subject: [PATCH] Fix clock source overflow on 32-bit archs
> -
> -Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ----
> - liblttng-ust/clock.h | ? ?2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/liblttng-ust/clock.h b/liblttng-ust/clock.h
> -index b5d3e77..23294d2 100644
> ---- a/liblttng-ust/clock.h
> -+++ b/liblttng-ust/clock.h
> -@@ -39,7 +39,7 @@ static __inline__ uint64_t trace_clock_read64(void)
> - ? ? ? struct timespec ts;
> -
> - ? ? ? clock_gettime(CLOCK_MONOTONIC, &ts);
> -- ? ? ?return (ts.tv_sec * 1000000000) + ts.tv_nsec;
> -+ ? ? ?return ((uint64_t) ts.tv_sec * 1000000000ULL) + ts.tv_nsec;
> - }
> -
> - static __inline__ uint32_t trace_clock_freq_scale(void)
> ---
> -1.7.2.5
> -
> diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
> index f54999e..81bffe9 100644
> --- a/package/lttng-libust/lttng-libust.mk
> +++ b/package/lttng-libust/lttng-libust.mk
> @@ -1,6 +1,11 @@
> -LTTNG_LIBUST_SITE ? ?= http://lttng.org/files/bundles/20111214/
> -LTTNG_LIBUST_VERSION = 1.9.2
> -LTTNG_LIBUST_SOURCE ?= lttng-ust-$(LTTNG_LIBUST_VERSION).tar.gz
> +#############################################################
> +#
> +# LTTng-UST: the userspace tracing library
> +#
> +#############################################################
> +LTTNG_LIBUST_SITE ? ?= http://lttng.org/files/lttng-ust/
> +LTTNG_LIBUST_VERSION = 2.0.2
> +LTTNG_LIBUST_SOURCE ?= lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
>
> ?LTTNG_LIBUST_INSTALL_STAGING = YES
> ?LTTNG_LIBUST_DEPENDENCIES ? ?= liburcu util-linux
> --
> 1.7.10.1
>
