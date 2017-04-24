From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Mon, 24 Apr 2017 16:53:52 +0100
Subject: [Buildroot] [PATCH] buildroot: adding perftest and libraries
In-Reply-To: <194981fbebe0ffdfada0fedd65903b417b278a32.1493048575.git.jpinto@synopsys.com>
References: <194981fbebe0ffdfada0fedd65903b417b278a32.1493048575.git.jpinto@synopsys.com>
Message-ID: <b060d6c3-3f3d-dc74-eb74-2a69cd8bf918@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,
Sorry wrong patch, this one is my development one.
I will send you the right patch. Sorry for the inconvenience.

Best regards,
Joao

?s 4:48 PM de 4/24/2017, Joao Pinto escreveu:
> This patch adds perftest and some necessary libraries.
> This patch was made using Buildroot snapshot 2017.04.24.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> ---
>  package/Config.in                                  |  4 +++
>  .../0001-fix-cross-compilation-error.patch         | 29 ++++++++++++++++++++++
>  package/libibumad/Config.in                        |  9 +++++++
>  package/libibumad/libibumad.hash                   |  2 ++
>  package/libibumad/libibumad.mk                     | 12 +++++++++
>  package/libibverbs/Config.in                       |  8 ++++++
>  package/libibverbs/libibverbs.hash                 |  2 ++
>  package/libibverbs/libibverbs.mk                   | 19 ++++++++++++++
>  package/librdmacm/Config.in                        |  8 ++++++
>  package/librdmacm/librdmacm.hash                   |  2 ++
>  package/librdmacm/librdmacm.mk                     | 12 +++++++++
>  package/perftest/Config.in                         | 10 ++++++++
>  package/perftest/perftest.hash                     |  2 ++
>  package/perftest/perftest.mk                       | 19 ++++++++++++++
>  14 files changed, 138 insertions(+)
>  create mode 100644 package/libibumad/0001-fix-cross-compilation-error.patch
>  create mode 100644 package/libibumad/Config.in
>  create mode 100644 package/libibumad/libibumad.hash
>  create mode 100644 package/libibumad/libibumad.mk
>  create mode 100644 package/libibverbs/Config.in
>  create mode 100644 package/libibverbs/libibverbs.hash
>  create mode 100644 package/libibverbs/libibverbs.mk
>  create mode 100644 package/librdmacm/Config.in
>  create mode 100644 package/librdmacm/librdmacm.hash
>  create mode 100644 package/librdmacm/librdmacm.mk
>  create mode 100644 package/perftest/Config.in
>  create mode 100644 package/perftest/perftest.hash
>  create mode 100644 package/perftest/perftest.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index c12e5b5..c75eecd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1257,6 +1257,8 @@ menu "Networking"
>  	source "package/libfcgi/Config.in"
>  	source "package/libgsasl/Config.in"
>  	source "package/libhttpparser/Config.in"
> +	source "package/libibumad/Config.in"
> +	source "package/libibverbs/Config.in"
>  	source "package/libidn/Config.in"
>  	source "package/libiscsi/Config.in"
>  	source "package/libldns/Config.in"
> @@ -1285,6 +1287,7 @@ menu "Networking"
>  	source "package/libosip2/Config.in"
>  	source "package/libpcap/Config.in"
>  	source "package/libpjsip/Config.in"
> +	source "package/librdmacm/Config.in"
>  	source "package/librsync/Config.in"
>  	source "package/libshairplay/Config.in"
>  	source "package/libshout/Config.in"
> @@ -1638,6 +1641,7 @@ endif
>  	source "package/openswan/Config.in"
>  	source "package/openvpn/Config.in"
>  	source "package/p910nd/Config.in"
> +	source "package/perftest/Config.in"
>  	source "package/phidgetwebservice/Config.in"
>  	source "package/pound/Config.in"
>  	source "package/pppd/Config.in"
> diff --git a/package/libibumad/0001-fix-cross-compilation-error.patch b/package/libibumad/0001-fix-cross-compilation-error.patch
> new file mode 100644
> index 0000000..e137d01
> --- /dev/null
> +++ b/package/libibumad/0001-fix-cross-compilation-error.patch
> @@ -0,0 +1,29 @@
> +From bb999ab4e2529accfbde97165964074a1ace2389 Mon Sep 17 00:00:00 2001
> +Message-Id: <bb999ab4e2529accfbde97165964074a1ace2389.1492783647.git.jpinto@synopsys.com>
> +From: Joao Pinto <jpinto@synopsys.com>
> +Date: Fri, 21 Apr 2017 15:07:12 +0100
> +Subject: [PATCH] fix cross compilation error
> +
> +This patch fixes the cross-compilation error "ERROR: unsafe header/library path
> +used in cross-compilation: '-I/usr/include'".
> +
> +Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> +---
> + Makefile.in | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 2b50610..eb38dec 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -296,7 +296,6 @@ ACLOCAL_AMFLAGS = -I config
> + SUBDIRS = .
> + INCLUDES = -I$(srcdir)/include/infiniband \
> + 	   -I$(srcdir)/include \
> +-	   -I$(includedir)
> + 
> + man_MANS = man/umad_debug.3 man/umad_get_ca.3 \
> + 	   man/umad_get_ca_portguids.3 man/umad_get_cas_names.3 \
> +-- 
> +2.9.3
> +
> diff --git a/package/libibumad/Config.in b/package/libibumad/Config.in
> new file mode 100644
> index 0000000..bd981a2
> --- /dev/null
> +++ b/package/libibumad/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBIBUMAD
> +	bool "libibumad"
> +	select BR2_PACKAGE_LIBIBVERBS
> +	help
> +	  It is a library that provides userspace Infiniband Management
> +	  Datagram (uMAD) functions which sit on top of the uMAD modules in the
> +	  kernel. These are used by InfiniBand diagnostic and management tools.
> +
> +	  https://www.openfabrics.org
> diff --git a/package/libibumad/libibumad.hash b/package/libibumad/libibumad.hash
> new file mode 100644
> index 0000000..c01d477
> --- /dev/null
> +++ b/package/libibumad/libibumad.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 500f74e31bd9f3d6c32dea912de3a2d1b299f3f23d7abd893652dd45c77a7e2e libibumad-1.3.10.2.tar.gz
> diff --git a/package/libibumad/libibumad.mk b/package/libibumad/libibumad.mk
> new file mode 100644
> index 0000000..6379948
> --- /dev/null
> +++ b/package/libibumad/libibumad.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# LIBIBUMAD
> +#
> +################################################################################
> +
> +LIBIBUMAD_VERSION = 1.3.10.2
> +LIBIBUMAD_SOURCE = libibumad-$(LIBIBUMAD_VERSION).tar.gz
> +LIBIBUMAD_SITE = https://www.openfabrics.org/downloads/management
> +LIBIBUMAD_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> diff --git a/package/libibverbs/Config.in b/package/libibverbs/Config.in
> new file mode 100644
> index 0000000..dd47022
> --- /dev/null
> +++ b/package/libibverbs/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBIBVERBS
> +	bool "libibverbs"
> +	help
> +	  It is a library that allows userspace processes to use RDMA "verbs"
> +	  as described in the InfiniBand Architecture Specification and the
> +	  RDMA Protocol Verbs Specification.
> +
> +	  https://www.openfabrics.org
> diff --git a/package/libibverbs/libibverbs.hash b/package/libibverbs/libibverbs.hash
> new file mode 100644
> index 0000000..08773a9
> --- /dev/null
> +++ b/package/libibverbs/libibverbs.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 844b4d50d476ebbaaf601929641b0e3c51d58daf56c7269914c1edc32c8beeec libibverbs-1.1.7.tar.gz
> diff --git a/package/libibverbs/libibverbs.mk b/package/libibverbs/libibverbs.mk
> new file mode 100644
> index 0000000..859e1f3
> --- /dev/null
> +++ b/package/libibverbs/libibverbs.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# LIBIBVERBS
> +#
> +################################################################################
> +
> +LIBIBVERBS_VERSION = 1.1.7
> +LIBIBVERBS_SOURCE = libibverbs-$(LIBIBVERBS_VERSION).tar.gz
> +LIBIBVERBS_SITE = https://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git/snapshot
> +LIBIBVERBS_INSTALL_STAGING = YES
> +
> +# autogen.sh is because autotools stuff lives in other directories and
> +# even AUTORECONF with _OPTS doesn't do it properly.
> +define LIBIBVERBS_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +LIBIBVERBS_POST_PATCH_HOOKS += LIBIBVERBS_RUN_AUTOGEN
> +
> +$(eval $(autotools-package))
> diff --git a/package/librdmacm/Config.in b/package/librdmacm/Config.in
> new file mode 100644
> index 0000000..4c8a1dc
> --- /dev/null
> +++ b/package/librdmacm/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBRDMACM
> +	bool "librdmacm"
> +	select BR2_PACKAGE_LIBIBVERBS
> +	help
> +	  It is a library that allows applications to set up reliable connected
> +	  and unreliable datagram transfers when using RDMA adapters
> +
> +	  https://www.openfabrics.org
> diff --git a/package/librdmacm/librdmacm.hash b/package/librdmacm/librdmacm.hash
> new file mode 100644
> index 0000000..3351bc5
> --- /dev/null
> +++ b/package/librdmacm/librdmacm.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 b4a2a0a4f70c22611ca35aa8b9699420872803cba5af28ae3ca57dd90b60c6c6 librdmacm-1.0.15.tar.gz
> diff --git a/package/librdmacm/librdmacm.mk b/package/librdmacm/librdmacm.mk
> new file mode 100644
> index 0000000..ac37c1f
> --- /dev/null
> +++ b/package/librdmacm/librdmacm.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# LIBRDMACM
> +#
> +################################################################################
> +
> +LIBRDMACM_VERSION = 1.0.15
> +LIBRDMACM_SOURCE = librdmacm-$(LIBRDMACM_VERSION).tar.gz
> +LIBRDMACM_SITE = https://www.openfabrics.org/downloads/rdmacm
> +LIBRDMACM_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> diff --git a/package/perftest/Config.in b/package/perftest/Config.in
> new file mode 100644
> index 0000000..6273cf3
> --- /dev/null
> +++ b/package/perftest/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PERFTEST
> +	bool "perftest"
> +	select BR2_PACKAGE_LIBIBUMAD
> +	select BR2_PACKAGE_LIBRDMACM
> +	help
> +	  It is a collection of tests written using Infiniband verbs intended
> +	  for use as a performance micro-benchmark. The tests can measure the
> +	  latency and bandwidth of Infiniband fabrics.
> +
> +	  https://www.openfabrics.org
> diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
> new file mode 100644
> index 0000000..123330e
> --- /dev/null
> +++ b/package/perftest/perftest.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 6078dd4fc66d85ff1439ad8fe26cc0689ad18f24459fe3e7d20feda58c6d4609 perftest-3.4-0.9.g98a9a17.tar.gz
> diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
> new file mode 100644
> index 0000000..dc16e4b
> --- /dev/null
> +++ b/package/perftest/perftest.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# PERFTEST
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
> +
> +$(eval $(autotools-package))
> 
