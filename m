From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:37:33 +0100
Subject: [Buildroot] [PATCH v3] package: add hwloc 1.10.1
In-Reply-To: <1426742959-1220-1-git-send-email-steven@uplinklabs.net>
References: <1426742959-1220-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20150320213733.312a1cb0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Wed, 18 Mar 2015 22:29:19 -0700, Steven Noonan wrote:

> diff --git a/package/hwloc/Config.in b/package/hwloc/Config.in
> new file mode 100644
> index 0000000..332536b
> --- /dev/null
> +++ b/package/hwloc/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_HWLOC
> +	bool "hwloc"
> +	# libpciaccess dependency
> +	depends on BR2_LARGEFILE
> +	# numactl dependency
> +	depends on BR2_i386 || BR2_mips || BR2_mipsel || \
> +	    BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
> +	select BR2_PACKAGE_LIBPCIACCESS
> +	select BR2_PACKAGE_NUMACTL

The dependencies on libpciaccess and numactl are optional, so I removed
them.

However, there was a missing dependency on BR2_TOOLCHAIN_HAS_THREADS,
since hwloc uses pthread.

> +	help
> +	  Portable Hardware Locality
> +
> +	  Provides a portable abstraction (across OS, versions, architectures, ...)
> +	  of the hierarchical topology of modern architectures, including NUMA
> +	  memory nodes, sockets, shared caches, cores and simultaneous
> +	  multithreading.

Lines slightly too long, so I rewrapped.

> +################################################################################
> +#
> +# hwloc
> +#
> +################################################################################
> +
> +HWLOC_VERSION = 1.10.1

I declared HWLOC_VERSION_MAJOR here..

> +HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
> +HWLOC_SITE = http://www.open-mpi.org/software/hwloc/v1.10/downloads

... so it can be re-used here.

> +HWLOC_DEPENDENCIES = libpciaccess numactl

As I said, those dependencies are optional, so I made them as such, and
also used explicit --enable/--disable options. This allowed me to
discover that the numa support was never enabled with your submission:
the numactl package was not installing its library/header file in
$(STAGING_DIR). With an explicit --enable-libnuma, hwloc configure
script bailed out since it couldn't find the libnuma library.

So I committed a patch that installs libnuma to the staging directory
as well.

Also, I added some explicit --disable options for the things that we
don't support for now.

Committed with those issues fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
