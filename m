From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:37:13 +0200
Subject: [Buildroot] [PATCH] buildroot: adding perftest and necessary
 libraries
In-Reply-To: <68a54f3789b2b633f39c532cac87f87949368c4f.1493049330.git.jpinto@synopsys.com>
References: <68a54f3789b2b633f39c532cac87f87949368c4f.1493049330.git.jpinto@synopsys.com>
Message-ID: <20170429153713.2d079b97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Apr 2017 12:00:42 +0100, Joao Pinto wrote:
> This patch adds the tool perftest, which a collection of tests
> written using Infiniband verbs intended for use as a performance
> micro-benchmark. The tests can measure the latency and bandwidth
> of Infiniband fabrics. It also adds 3 necessary libraries:
> 
> a) libibverbs (library that allows userspace processes to use RDMA "verbs")
> b) librdmacm (library that allows applications to set up reliable connected
> and unreliable datagram transfers when using RDMA adapters)
> c) libibumad (library that provides userspace Infiniband Management Datagram
> (uMAD) functions which sit on top of the uMAD modules in the kernel)
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>

Thanks for this, but it should be split in four patches, one for each
package you're adding. Patches should be in the right order, so that if
we apply only the first patches, nothing breaks.

Also, please add yourself for those packages in the DEVELOPERS file.

> +diff --git a/Makefile.in b/Makefile.in
> +index 2b50610..eb38dec 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in

Please patch Makefile.am instead and use LIBIBUMAD_AUTORECONF = YES.

Also, please submit this patch to the upstream project, having
-I$(includedir) is always wrong.

> --- /dev/null
> +++ b/package/libibumad/libibumad.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# LIBIBUMAD

Should be lower-case.

> diff --git a/package/libibverbs/libibverbs.mk b/package/libibverbs/libibverbs.mk
> new file mode 100644
> index 0000000..859e1f3
> --- /dev/null
> +++ b/package/libibverbs/libibverbs.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# LIBIBVERBS

Should be lower-case.

> +#
> +################################################################################
> +
> +LIBIBVERBS_VERSION = 1.1.7
> +LIBIBVERBS_SOURCE = libibverbs-$(LIBIBVERBS_VERSION).tar.gz
> +LIBIBVERBS_SITE = https://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git/snapshot
> +LIBIBVERBS_INSTALL_STAGING = YES

Are you sure about this?

First, the latest version of libibverbs is 1.2.1. Second, libibverbs is
no longer maintained, see
https://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git/tree/README. 

https://github.com/linux-rdma/rdma-core now contains libibverbs and
libibumad.

> +# autogen.sh is because autotools stuff lives in other directories and
> +# even AUTORECONF with _OPTS doesn't do it properly.
> +define LIBIBVERBS_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh

This doesn't work, because it doesn't add the dependency on
host-autoconf, host-automake and host-libtool. So AUTORECONF=YES should
really be used.

> diff --git a/package/librdmacm/Config.in b/package/librdmacm/Config.in
> new file mode 100644
> index 0000000..4c8a1dc
> --- /dev/null
> +++ b/package/librdmacm/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBRDMACM
> +	bool "librdmacm"

This library is now also part of rdma-core,
https://github.com/linux-rdma/rdma-core.

> --- /dev/null
> +++ b/package/librdmacm/librdmacm.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# LIBRDMACM

Lower case.

> diff --git a/package/perftest/Config.in b/package/perftest/Config.in
> new file mode 100644
> index 0000000..6273cf3
> --- /dev/null
> +++ b/package/perftest/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PERFTEST
> +	bool "perftest"

I know it's the upstream name, but it sounds very generic for something
that is in fact very, very specific. Maybe ofed-perftest ? Or
rdma-perftest ? Do you have some suggestion ?

> +++ b/package/perftest/perftest.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# PERFTEST

Lower case.

> +#
> +################################################################################
> +
> +PERFTEST_VERSION = 3.4-0.9.g98a9a17
> +PERFTEST_SOURCE = perftest-$(PERFTEST_VERSION).tar.gz
> +PERFTEST_SITE = https://www.openfabrics.org/downloads/perftest
> +PERFTEST_INSTALL_STAGING = YES
> +
> +# autogen.sh is because autotools stuff lives in other directories and
> +# even AUTORECONF with _OPTS doesn't do it properly.
> +define PERFTEST_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +PERFTEST_POST_PATCH_HOOKS += PERFTEST_RUN_AUTOGEN

Same comment as above: this doesn't work, because there is no
dependency on host-autoconf, host-automake and host-libtool. In
addition, the tarball you are downloading already contains the
configure script pre-generated, so it doesn't seem really useful to
autoreconf this package.

Could you fix the above issues and submit an updated patch series?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
