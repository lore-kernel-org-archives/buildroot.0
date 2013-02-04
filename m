From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Feb 2013 23:56:13 +0100
Subject: [Buildroot] [PATCH 5/7] package/ceph: new package
In-Reply-To: <2c2dba5f2433d9f8cb2da88b89d131072eb8f3df.1359993560.git.yann.morin.1998@free.fr>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <2c2dba5f2433d9f8cb2da88b89d131072eb8f3df.1359993560.git.yann.morin.1998@free.fr>
Message-ID: <51103C8D.3060202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/13 17:01, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> ---
>   package/Config.in                          |    1 +
>   package/ceph/Config.in                     |   25 +++++++++++
>   package/ceph/ceph-no-envz.patch            |   63 ++++++++++++++++++++++++++++
>   package/ceph/ceph-no-getloadavg.patch      |   61 +++++++++++++++++++++++++++
>   package/ceph/ceph-no-posix_fallocate.patch |   50 ++++++++++++++++++++++
>   package/ceph/ceph.mk                       |   57 +++++++++++++++++++++++++
>   6 files changed, 257 insertions(+), 0 deletions(-)
>   create mode 100644 package/ceph/Config.in
>   create mode 100644 package/ceph/ceph-no-envz.patch
>   create mode 100644 package/ceph/ceph-no-getloadavg.patch
>   create mode 100644 package/ceph/ceph-no-posix_fallocate.patch
>   create mode 100644 package/ceph/ceph.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index a609a11..a071a5f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -623,6 +623,7 @@ source "package/bind/Config.in"
>   source "package/bmon/Config.in"
>   source "package/bridge-utils/Config.in"
>   source "package/can-utils/Config.in"
> +source "package/ceph/Config.in"
>   source "package/connman/Config.in"
>   source "package/ctorrent/Config.in"
>   source "package/conntrack-tools/Config.in"
> diff --git a/package/ceph/Config.in b/package/ceph/Config.in
> new file mode 100644
> index 0000000..f7e2721
> --- /dev/null
> +++ b/package/ceph/Config.in
> @@ -0,0 +1,25 @@
> +comment "ceph requires C++, largefiles, threads, wide chars"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +	depends on !BR2_avr2 && !BR2_microblaze

  avr32

> +
> +config BR2_PACKAGE_CEPH
> +	bool "ceph"
> +	depends on BR2_INSTALL_LIBSTDCPP            # boost
> +	depends on BR2_LARGEFILE                    # boost, libnss, util-linux
> +	depends on BR2_TOOLCHAIN_HAS_THREADS        # boost, libnss
> +	depends on BR2_USE_WCHAR                    # util-linux
> +	depends on !BR2_avr32 && !BR2_microblaze    # keyutils
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_SYSTEM
> +	select BR2_PACKAGE_BOOST_THREAD
> +	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_KEYUTILS
> +	select BR2_PACKAGE_LIBEDIT2
> +	select BR2_PACKAGE_LIBNSS
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	help
> +	  Ceph is a distributed object store and file system designed to
> +	  provide excellent performance, reliability and scalability.
> +	
> +	  http://ceph.com/
> diff --git a/package/ceph/ceph-no-envz.patch b/package/ceph/ceph-no-envz.patch
> new file mode 100644
> index 0000000..c0369ba
> --- /dev/null
> +++ b/package/ceph/ceph-no-envz.patch
> @@ -0,0 +1,63 @@
> +tools+base: do not include envz.h on uClibc
> +
> +uClibc does not have envz, and no envz function is in fact used.
> +So, simply do not include it under uClibc.

  If it's not used, why not just remove the header (and upstream the patch)?

> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +--- ceph-0.51.orig/src/tools/common.cc	2012-09-09 00:13:32.128838177 +0200
> ++++ ceph-0.51/src/tools/common.cc	2012-09-09 00:13:59.432064556 +0200
> +@@ -17,9 +17,9 @@
> + #include <string>
> + using namespace std;
> +
> +-#if !defined(DARWIN) && !defined(__FreeBSD__)
> ++#if !defined(DARWIN) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
> + #include <envz.h>
> +-#endif // DARWIN
> ++#endif // DARWIN || __UCLIBC__
> +
> + #include <memory>
> + #include <sys/types.h>
[snip]
> diff --git a/package/ceph/ceph.mk b/package/ceph/ceph.mk
> new file mode 100644
> index 0000000..33cee8c
> --- /dev/null
> +++ b/package/ceph/ceph.mk
> @@ -0,0 +1,57 @@
> +#############################################################
> +#
> +# ceph
> +#
> +#############################################################
> +
> +CEPH_VERSION         = 0.56.2
> +CEPH_SOURCE          = ceph-$(CEPH_VERSION).tar.bz2
> +CEPH_SITE            = http://ceph.com/download/
> +CEPH_LICENSE         = LGPLv2.1 CC-BY-SA Apache-2.0 GPLv2 LGPLv2+ BSD-3c MIT PD

  I'm not sure if PD is a generally accepted abbreviation. And I also 
don't think it is necessary to mention it in the first place (it the 
entire package is public domain, yes it makes sense, but if it's just 
part of it then no).

> +CEPH_LICENSE_FILES   = COPYING
> +CEPH_INSTALL_STAGING = YES
> +
> +# Bundled ./configure and Makefile.in file are not in sync
> +# with the correposnding configure.ac and Makefile.am

  corresponding


  Regards,
  Arnout

> +CEPH_AUTORECONF      = YES
> +
> +CEPH_DEPENDENCIES    = \
> +    boost              \
> +    expat              \
> +    keyutils           \
> +    libedit2           \
> +    libnss             \
> +    util-linux         \
> +
> +# We disable everything for now, because the dependency tree can become
> +# quite deep if we try to enable some features, and I have not tested that.
> +# We need at least one crypto lib, and the currently only one available in
> +# BR, that ceph can use, is libnss
> +CEPH_CONF_OPT =                     \
> +    --with-nss                      \
> +    --without-profiler              \
> +    --without-debug                 \
> +    --without-tcmalloc              \
> +    --without-hadoop                \
> +    --without-libatomic-ops         \
> +    --without-system-leveldb        \
> +    --without-system-libs3          \
> +    --without-rest-bench            \
> +    --without-cryptopp              \
> +    --with-ocf                      \
> +
> +ifeq ($(BR2_PACKAGE_LIBFUSE),y)
> +CEPH_DEPENDENCIES += libfuse
> +CEPH_CONF_OPT     += --with-fuse
> +else
> +CEPH_CONF_OPT     += --without-fuse
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBAIO),y)
> +CEPH_DEPENDENCIES += libaio
> +CEPH_CONF_OPT     += --with-libaio
> +else
> +CEPH_CONF_OPT     += --without-libaio
> +endif
> +
> +$(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
