From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 13 Sep 2017 21:21:03 +0200
Subject: [Buildroot] [PATCH v2 1/1] flex: Fix segfault of stage1flex
 when host has glibc 2.26 or newer
In-Reply-To: <20170913143524.24293-1-aperez@igalia.com>
References: <20170913143524.24293-1-aperez@igalia.com>
Message-ID: <1505330463.3138.12.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adrian,

On Wed, 2017-09-13 at 17:35 +0300, Adrian Perez de Castro wrote:
> When the host uses glibc 2.26 or newer, Flex will try to use the
> newly-introduced reallocarray() function, but as it would not define
> _GNU_SOURCE a segmentation fault would occur later on due to the
> compiler assumming that the function is implicitly defined.
> 
> This issue manifests itself due to a crash of "stage1flex" during the
> Flex bootstrap:
> 
>   ./stage1flex   -o stage1scan.c ./scan.l
>   make[2]: *** [Makefile:1725: stage1scan.c] Segmentation fault (core dumped)
> 
> This imports the patch from the upstream Git repository, and adds flags
> in the .mk file to rebuild the Autotools scripts and support files. Due
> to the latter, the patch to disable the documentation is changed so it
> modifies the .am file instead.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> ---
> Changes v1 -> v2:
>   - Modify the patch to disable building the documentation so it changes
>     Makefile.am instead of Makefile.in. This is needed because autoreconf
>     is being used.

I would prefer to have two seperate commits:
  1) changing the existing patch so autoreconf can be used
  2) adding the new patch

> ---
>  ...-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch | 32 ++++++++++++++++++++
>  package/flex/0001-flex-disable-documentation.patch | 23 --------------
>  package/flex/0002-flex-disable-documentation.patch | 35 ++++++++++++++++++++++
>  package/flex/flex.mk                               |  2 ++
>  4 files changed, 69 insertions(+), 23 deletions(-)
>  create mode 100644 package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
>  delete mode 100644 package/flex/0001-flex-disable-documentation.patch
>  create mode 100644 package/flex/0002-flex-disable-documentation.patch
> 
> diff --git a/package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch b/package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
> new file mode 100644
> index 0000000000..2151a15fc6
> --- /dev/null
> +++ b/package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
> @@ -0,0 +1,32 @@
> +From ffa886a580929f26fd5e5a40c9c5334955c48553 Mon Sep 17 00:00:00 2001
> +From: Explorer09 <explorer09@gmail.com>
> +Date: Mon, 4 Sep 2017 10:47:33 +0800
> +Subject: [PATCH] build: AC_USE_SYSTEM_EXTENSIONS in configure.ac.
> +
> +This would, e.g. define _GNU_SOURCE in config.h, enabling the
> +reallocarray() prototype in glibc 2.26+ on Linux systems with that
> +version of glibc.
> +
> +Fixes #241.

According to [1], please add:

Backported from: 24fd0551333e7eded87b64dd36062da3df2f6380

> +---
> + configure.ac | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 55e774b..c879fe1 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -25,8 +25,10 @@
> + # autoconf requirements and initialization
> + 
> + AC_INIT([the fast lexical analyser generator],[2.6.4],[flex-help at lists.sourceforge.net],[flex])
> ++AC_PREREQ([2.60])
> + AC_CONFIG_SRCDIR([src/scan.l])
> + AC_CONFIG_AUX_DIR([build-aux])
> ++AC_USE_SYSTEM_EXTENSIONS
> + LT_INIT
> + AM_INIT_AUTOMAKE([1.11.3 -Wno-portability foreign check-news std-options dist-lzip parallel-tests subdir-objects])
> + AC_CONFIG_HEADER([src/config.h])
> +-- 
> +2.14.1
> +
> diff --git a/package/flex/0001-flex-disable-documentation.patch b/package/flex/0001-flex-disable-documentation.patch
> deleted file mode 100644
> index 68bec128ee..0000000000
> --- a/package/flex/0001-flex-disable-documentation.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -flex: disable documentation
> -
> -Since we prevent the flex binary to be built, we also need to prevent
> -the documentation to be built, otherwise it will fail like this:
> -
> -Making all in doc
> -make[2]: Entering directory '/br/output/build/flex-2.6.4/doc'
> -make[2]: *** No rule to make target '../src/flex', needed by 'flex.1'.
> -Stop.
> -
> -Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> -
> -diff -rup a/Makefile.in b/Makefile.in
> ---- a/Makefile.in	2017-05-06 15:49:09.000000000 +0100
> -+++ b/Makefile.in	2017-05-10 14:35:20.152794902 +0100
> -@@ -450,7 +450,6 @@ EXTRA_DIST = \
> - 
> - SUBDIRS = \
> - 	src \
> --	doc \
> - 	examples \
> - 	po \
> - 	tests \
> diff --git a/package/flex/0002-flex-disable-documentation.patch b/package/flex/0002-flex-disable-documentation.patch
> new file mode 100644
> index 0000000000..a2e38d698a
> --- /dev/null
> +++ b/package/flex/0002-flex-disable-documentation.patch
> @@ -0,0 +1,35 @@
> +From a98443c6a72d5821d4e0152311e5c3eb4cdff25c Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Wed, 13 Sep 2017 17:26:48 +0300
> +Subject: [PATCH] flex: disable documentation
> +
> +Since we prevent the flex binary to be built, we also need to prevent
> +the documentation to be built, otherwise it will fail like this:
> +
> +Making all in doc
> +make[2]: Entering directory '/br/output/build/flex-2.6.4/doc'
> +make[2]: *** No rule to make target '../src/flex', needed by 'flex.1'.
> +Stop.
> +
> +Based on an patch by Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Please add a URL where you got the patch from.

> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +---
> + Makefile.am | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 638c549..9db3420 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -43,7 +43,6 @@ EXTRA_DIST = \
> + 
> + SUBDIRS = \
> + 	src \
> +-	doc \
> + 	examples \
> + 	po \
> + 	tests \
> +-- 
> +2.14.1
> +
> diff --git a/package/flex/flex.mk b/package/flex/flex.mk
> index b78269952e..b84732d383 100644
> --- a/package/flex/flex.mk
> +++ b/package/flex/flex.mk
> @@ -11,6 +11,8 @@ FLEX_LICENSE = FLEX
>  FLEX_LICENSE_FILES = COPYING
>  FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
>  FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
> +FLEX_AUTORECONF = YES
> +FLEX_GETTEXTIZE = YES

As the package also provides a host package, HOST_FLEX_AUTORECONF and
HOST_FLEX_GETTEXTIZE should be added.

Additionally, please add a comment why AUTORECONF and GETTEXTIZE are
necessary (because of patching configure.ac).

>  HOST_FLEX_DEPENDENCIES = host-m4
>  
>  define FLEX_DISABLE_PROGRAM

[1] https://buildroot.org/downloads/manual/manual.html#_integrating_pat
ches_found_on_the_web
