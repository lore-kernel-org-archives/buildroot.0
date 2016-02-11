From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 11 Feb 2016 12:12:33 +0100
Subject: [Buildroot] [git commit] mpd: fix build on SPARC
In-Reply-To: <20160207210347.15B3B8033C@busybox.osuosl.org>
References: <20160207210347.15B3B8033C@busybox.osuosl.org>
Message-ID: <1455189153.8389.7.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On So, 2016-02-07 at 22:02 +0100, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=84533029c70a4d
> ffb2cd2e4f05e3903fd1b8fcd9
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/mas
> ter
> 
> mpd uses __atomic_*() built-ins, but forgets to link with -latomic
> when needed, so this commit adds a patch that ensures it will link
> with libatomic, and adds a dependency on BR2_TOOLCHAIN_HAS_ATOMIC.
> 
> Fixes:
> 
> ? http://autobuild.buildroot.net/results/e2207280f3a177e12dba502b1c01
> f5aeb431d04c/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> ?...configure.ac-check-if-libatomic-is-needed.patch | 40
> ++++++++++++++++++++++
> ?package/mpd/Config.in??????????????????????????????|??2 ++
> ?package/mpd/mpd.mk?????????????????????????????????|??1 +
> ?3 files changed, 43 insertions(+)
> 
> diff --git a/package/mpd/0005-configure.ac-check-if-libatomic-is-
> needed.patch b/package/mpd/0005-configure.ac-check-if-libatomic-is-
> needed.patch
> new file mode 100644
> index 0000000..a9873a7
> --- /dev/null
> +++ b/package/mpd/0005-configure.ac-check-if-libatomic-is-
> needed.patch
> @@ -0,0 +1,40 @@
> +From 8eaf14a17244aaf000b4d19e4fde4a637576939f Mon Sep 17 00:00:00
> 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Sun, 7 Feb 2016 21:40:47 +0100
> +Subject: [PATCH] configure.ac: check if libatomic is needed
> +
> +The mpd source code uses the C++11 <atomic> functionality, which
> +internally is implemented using the __atomic_*() gcc built-ins. On
> +certain architectures, the __atomic_*() built-ins are implemented in
> +the libatomic library that comes with the rest of the gcc runtime.
> Due
> +to this, code using <atomic> might need to link against libatomic,
> +otherwise one hits build issues such as:
> +
> +GlobalEvents.cxx:(.text._ZN12GlobalEvents4EmitENS_5EventE+0x14):
> undefined reference to `__atomic_fetch_or_4'
> +
> +on an architecture like SPARC.
> +
> +To solve this, a configure.ac check is added to know if we need to
> +link against libatomic or not.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com
> >
> +---
> + configure.ac | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 107b45a..8e6fab7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -233,6 +233,8 @@ if test x$have_pthread_setname_np = xyes; then
> +?	AC_DEFINE(HAVE_PTHREAD_SETNAME_NP, 1, [Is
> pthread_setname_np() available?])
> + fi
> +?
> ++AC_SEARCH_LIBS([__atomic_load_4], [atomic])
> ++
> + dnl -------------------------------------------------------------
> --------------
> + dnl Event loop selection
> + dnl -------------------------------------------------------------
> --------------
> +--?
> +2.6.4
> +
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index b368397..3ac806f 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -6,6 +6,7 @@ menuconfig BR2_PACKAGE_MPD
> ?	depends on BR2_USE_MMU # libglib2
> ?	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> ?	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> ?	select BR2_PACKAGE_BOOST
> ?	select BR2_PACKAGE_LIBGLIB2
> ?	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> @@ -312,5 +313,6 @@ endif
> ?comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.6"
> ?	depends on BR2_USE_MMU
> ?	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> ?	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> ?		!BR2_TOOLCHAIN_HAS_THREADS ||
> !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 7a265f4..d5d77a6 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -11,6 +11,7 @@ MPD_SITE = http://www.musicpd.org/download/mpd/$(MP
> D_VERSION_MAJOR)
> ?MPD_DEPENDENCIES = host-pkgconf boost libglib2
> ?MPD_LICENSE = GPLv2+
> ?MPD_LICENSE_FILES = COPYING
> +MPD_AUTORECONF = YES
> ?
> ?# Some options need an explicit --disable or --enable
> ?
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

With this commit mpd requires libatomic.so to be installed on the
target:

    $ output/host/usr/bin/arm-linux-readelf -d output/target/usr/bin/mpd
    | grep libatomic
    ?0x00000001 (NEEDED)?????????????????????Shared library:
    [libatomic.so.1]

Otherwise mpd fails with:
    "Error loading shared library libatomic.so.1: No such file or
    directory (needed by /usr/bin/mpd)".

However, with an external musl toolchain built with Buildroot no
libatomic.so will be installed on the target, it only exists in
sysroot:

    $ find output/ -type f -name "libatomic.so*"
    output/host/usr/arm-buildroot-linux-
    musleabi/sysroot/lib/libatomic.so.1.1.0

Best regards
J?rg Krause
