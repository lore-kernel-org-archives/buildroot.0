From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 18 Jul 2014 22:21:00 +0200
Subject: [Buildroot] [PATCH v2] pixman: do not build demos or tests
In-Reply-To: <1390859507-31670-7-git-send-email-spenser@gillilanding.com>
References: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
 <1390859507-31670-7-git-send-email-spenser@gillilanding.com>
Message-ID: <CAAXf6LXzvY24_SEi_sD2jVcgbLu9ZNAOtaj_xbXawLPXrU9R3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Spenser,

On Mon, Jan 27, 2014 at 10:51 PM, Spenser Gilliland
<spenser@gillilanding.com> wrote:
> Test code does not compile correctly on microblaze architecture.  Disable both
> tests and demos from being built to reduce failures and decrease build time.
>
> Fixes autobuild failures
>
> http://autobuild.buildroot.net/results/a4b/a4b0ce0621701df55c146609388c3e529ea3411e/build-end.log
> http://autobuild.buildroot.net/results/e2f/e2f6e4750d8b93320681abf09157917d131c8de0/build-end.log
> http://autobuild.buildroot.net/results/878/878f0665c1b3e0c8895912c3a5a3078f937a9c75/build-end.log
> http://autobuild.buildroot.net/results/018/01869b49eb1d305cec98d4d9ecf046427e88c2f3/build-end.log
> http://autobuild.buildroot.net/results/0e8/0e8a2f5fc1425e153c112f87083e8a93f726e3df/build-end.log
> http://autobuild.buildroot.net/results/980/980e03c5f8a7678f3343439dc37636855f637f9e/build-end.log
> http://autobuild.buildroot.net/results/e1c/e1c86da68e012dfbff345436b0967d7774c9d9c5/build-end.log
> http://autobuild.buildroot.net/results/63c/63c4cc230fb0c1b359f2ca15721e20deaa0eecc9/build-end.log
> http://autobuild.buildroot.net/results/db7/db7785da51133d9874857731de6e7ff19e13527b/build-end.log
> http://autobuild.buildroot.net/results/af6/af6a646e560b9a743d909966a1243b1ee8dcb15f/build-end.log
> http://autobuild.buildroot.net/results/e36/e360e979fbafa5add49dba4ae3f6972220966e0d/build-end.log
> http://autobuild.buildroot.net/results/79e/79e4e0c94b833c247457d4839a46ff92a524f0bb/build-end.log
> http://autobuild.buildroot.net/results/b67/b671f57bbfe3609d59d30281c7ee931b5ebf3df1/build-end.log
>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  .../pixman-0001-disable-tests-and-demos.patch      | 54 ++++++++++++++++++++++
>  package/pixman/pixman.mk                           |  2 +-
>  2 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 package/pixman/pixman-0001-disable-tests-and-demos.patch
>
> diff --git a/package/pixman/pixman-0001-disable-tests-and-demos.patch b/package/pixman/pixman-0001-disable-tests-and-demos.patch
> new file mode 100644
> index 0000000..44528ef
> --- /dev/null
> +++ b/package/pixman/pixman-0001-disable-tests-and-demos.patch
> @@ -0,0 +1,54 @@
> +Index: pixman-0.30.0/Makefile.am
> +===================================================================
> +--- pixman-0.30.0.orig/Makefile.am     2013-04-18 00:03:32.000000000 -0500
> ++++ pixman-0.30.0/Makefile.am  2014-01-10 16:54:05.146255371 -0600
> +@@ -1,4 +1,12 @@
> +-SUBDIRS = pixman demos test
> ++SUBDIRS = pixman
> ++
> ++if ENABLE_DEMOS
> ++SUBDIRS += demos
> ++endif
> ++
> ++if ENABLE_TESTS
> ++SUBDIRS += test
> ++endif
> +
> + pkgconfigdir=$(libdir)/pkgconfig
> + pkgconfig_DATA=pixman-1.pc
> +Index: pixman-0.30.0/configure.ac
> +===================================================================
> +--- pixman-0.30.0.orig/configure.ac    2014-01-10 16:51:50.482252913 -0600
> ++++ pixman-0.30.0/configure.ac 2014-01-10 16:52:32.178253674 -0600
> +@@ -268,6 +268,31 @@
> + ])
> +
> + dnl ===========================================================================
> ++dnl Enable tests/demos
> ++
> ++AC_ARG_ENABLE(tests,
> ++   [AC_HELP_STRING([--disable-tests],
> ++                   [disable building the test suite])],
> ++   [enable_tests=$enableval], [enable_tests=yes])
> ++
> ++if test $enable_tests = yes ; then
> ++   AC_DEFINE(ENABLE_TESTS, 1, "Enable building test suite")
> ++fi
> ++
> ++AM_CONDITIONAL(ENABLE_TESTS, test $enable_tests = yes)
> ++
> ++AC_ARG_ENABLE(demos,
> ++   [AC_HELP_STRING([--disable-demos],
> ++                   [disable building the demos])],
> ++   [enable_demos=$enableval], [enable_demos=yes])
> ++
> ++if test $enable_demos = yes ; then
> ++   AC_DEFINE(ENABLE_DEMOS, 1, "Enable building demos")
> ++fi
> ++
> ++AM_CONDITIONAL(ENABLE_DEMOS, test $enable_demos = yes)
> ++
> ++dnl ===========================================================================
> + dnl Check for Loongson Multimedia Instructions
> +
> + if test "x$LS_CFLAGS" = "x" ; then
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index 4f70ce5..7b3175f 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -14,7 +14,7 @@ PIXMAN_DEPENDENCIES = host-pkgconf
>  PIXMAN_AUTORECONF = YES
>
>  # don't build gtk based demos
> -PIXMAN_CONF_OPT = --disable-gtk
> +PIXMAN_CONF_OPT = --disable-gtk --disable-tests --disable-demos
>
>  # disable iwmmxt support for CPU's that don't have
>  # this feature


Another patch has been accepted to fix this type of autobuild failures:
http://git.buildroot.org/buildroot/commit/?id=cb7c12f58cb58b0ea14d2a49b009676ddefec98f

I will therefore mark this patch as Rejected in patchwork.
Do not hesitate to respond if you think this is not correct.

Thanks,
Thomas
