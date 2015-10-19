From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 19 Oct 2015 11:01:08 -0500
Subject: [Buildroot] [[PATCH v4] 1/1] nwipe: new package
In-Reply-To: <1445264296-24025-1-git-send-email-chaduffy@cisco.com>
References: <1445264296-24025-1-git-send-email-chaduffy@cisco.com>
Message-ID: <CAMQcK5JMGp6MJXGAtxeeR5-Fb=v31LB3C7iWREd+GeZhy1P3sA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 19, 2015 at 9:18 AM, Charles Duffy <charles@dyfis.net> wrote:
> Signed-off-by: Charles Duffy <chaduffy@cisco.com>
> ---
>  package/Config.in                                  |   1 +
>  ...off_t-to-off64_t-for-musl-libc-support-11.patch | 169 +++++++++++++++++++++
>  ...-libuuid-dependencies-to-allow-parted-sta.patch |  45 ++++++
>  package/nwipe/Config.in                            |  12 ++
>  package/nwipe/nwipe.hash                           |   1 +
>  package/nwipe/nwipe.mk                             |  16 ++
>  6 files changed, 244 insertions(+)
>  create mode 100644 package/nwipe/0001-Move-from-loff_t-to-off64_t-for-musl-libc-support-11.patch
>  create mode 100644 package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch
>  create mode 100644 package/nwipe/Config.in
>  create mode 100644 package/nwipe/nwipe.hash
>  create mode 100644 package/nwipe/nwipe.mk

[...]

> diff --git a/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch b/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch
> new file mode 100644
> index 0000000..1d04084
> --- /dev/null
> +++ b/package/nwipe/0002-Add-libintl-libuuid-dependencies-to-allow-parted-sta.patch
> @@ -0,0 +1,45 @@
> +From 7e0773c4738362f030f431a35b4e13cc2b4f36be Mon Sep 17 00:00:00 2001
> +From: Charles Duffy <charles@dyfis.net>
> +Date: Wed, 14 Oct 2015 16:24:01 -0500
> +Subject: [PATCH 2/2] Add libintl, libuuid dependencies to allow parted static
> + link (#12)
> +
> +libparted requires libuuid; both require libintl. Static builds currently fail
> +with link errors due to these missing dependencies.
> +
> +https://github.com/martijnvanbrummelen/nwipe/pull/13
> +
> +Signed-off-by: Charles Duffy <chaduffy@cisco.com>
> +---
> + configure.ac    | 4 +++-
> + src/Makefile.am | 2 ++
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 375c775..78f6624 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -42,7 +42,9 @@ PKG_CHECK_MODULES(
> +       )]
> + )
> +
> +-AC_CHECK_LIB([parted], [ped_device_probe_all], ,[AC_MSG_ERROR([parted development library not found])])
> ++AC_CHECK_LIB([intl], [libintl_dgettext]) # needed to statically link libparted, but not given in its pkgconfig file
> ++AC_CHECK_LIB([uuid], [uuid_generate])    # needed to statically link libparted, but not given in its pkgconfig file
> ++PKG_CHECK_MODULES([PARTED], [libparted])
> + AC_CHECK_LIB([pthread], [main], ,[AC_MSG_ERROR([pthread development library not found])])

It appears that this packages requires a toolchain with threads as per
the configure.ac. You should add an entry in the Config.in that
depends on BR2_TOOLCHAIN_HAS_THREADS. There are many packages that you
can use for examples of this.

> +
> + # Checks for header files.
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index c123372..a5f5740 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -7,3 +7,5 @@ AM_LDFLAGS =
> + # the previous manual Makefile
> + bin_PROGRAMS = nwipe
> + nwipe_SOURCES = context.h isaac_rand.c logging.h options.h prng.h nwipe.c gui.c isaac_rand.h method.h pass.c device.c gui.h isaac_standard.h mt19937ar-cok.c nwipe.h mt19937ar-cok.h pass.h device.h logging.c method.c options.c prng.c version.c version.h
> ++nwipe_CFLAGS = $(PARTED_CFLAGS)
> ++nwipe_LDADD = $(PARTED_LIBS)
> +--
> +2.0.0
> +
> diff --git a/package/nwipe/Config.in b/package/nwipe/Config.in
> new file mode 100644
> index 0000000..8a41015
> --- /dev/null
> +++ b/package/nwipe/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_NWIPE
> +       bool "nwipe"
> +       select BR2_PACKAGE_NCURSES
> +       select BR2_PACKAGE_PARTED

Should add a 'depends on BR2_TOOLCHAIN_HAS_THREADS' here

> +       help
> +         nwipe thoroughly overwrites block devices, forked from a component at
> +         the core of the venerable DBAN.
> +
> +         https://github.com/martijnvanbrummelen/nwipe
> +
> +comment "nwipe needs a toolchain w/ wchar"
> +       depends on !BR2_USE_WCHAR

Update the comment accordingly.

> diff --git a/package/nwipe/nwipe.hash b/package/nwipe/nwipe.hash
> new file mode 100644
> index 0000000..f66b5c3
> --- /dev/null
> +++ b/package/nwipe/nwipe.hash
> @@ -0,0 +1 @@
> +sha256 63a3f5fbcaf0c013790345ece2cf04c3d85a15c4505b9d92dc779465aafbd52f  nwipe-8a9a71822148cb9c82d971030dafd8d374fd1f48.tar.gz

I don't think we can have a hash file for packages that are pulled from github.

Yann - is this correct understanding of the hash file?

[...]

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
