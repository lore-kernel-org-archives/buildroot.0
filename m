From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 18:51:28 +0200
Subject: [Buildroot] [PATCH 30/49 v2] package/libqb: new package
In-Reply-To: <c5a9ad9b87390d6b6b0a16d1f647ce7c4f2fd92e.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <c5a9ad9b87390d6b6b0a16d1f647ce7c4f2fd92e.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <627dd05c-f4e7-990a-50d0-a167bf81bdfa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-17 23:39, Yann E. MORIN wrote:
[snip]
> +From f9857721bfe5c47253bc2cf487d9dcc94cbce3c2 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Mon, 26 Dec 2016 19:38:45 +0100
> +Subject: [PATCH] bconfigure: fix CLOCK_MONOTONIC check for cross-compilation

 Upstream status?

> +
> +In cross-compilation, we can't run test programs, so configure just
> +bails out. Since there is no cache variable (e.g. ac_cv_blabla, we can't
> +even provide the correct result.
> +
> +But in thise case, we don't really need to run to start with; we just
> +need to check if the toolchain headers know about CLOCK_MONOTONIC.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 560b330..6972213 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -179,7 +179,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
> +                  )
> + 
> + AC_MSG_CHECKING(for a working clock_getres(CLOCK_MONOTONIC, &ts))
> +-AC_RUN_IFELSE([AC_LANG_PROGRAM(
> ++AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
> + [[#include <time.h>]],
> + [[struct timespec ts; if(clock_getres(CLOCK_MONOTONIC, &ts)) return -1;]])> +                     [
> +-- 
> +2.7.4
> +
> diff --git a/package/libqb/Config.in b/package/libqb/Config.in
> new file mode 100644
> index 0000000000..1bfea8b210
> --- /dev/null
> +++ b/package/libqb/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LIBQB
> +	bool "libqb"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  libqb is a library with the primary purpose of providing high
> +	  performance client server reusable features. It provides high
> +	  performance logging, tracing, ipc, and poll.
> +
> +	  https://github.com/clusterlabs/libqb/wiki
> +
> +comment "libqb needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
> new file mode 100644
> index 0000000000..b1a93201b9
> --- /dev/null
> +++ b/package/libqb/libqb.hash
> @@ -0,0 +1,2 @@
> +# sha256 locally computed
> +sha256  98a6f8d7b83013747788ff7f1aace387ec532a8e7fbecc354ad9260f426dd518  libqb-v1.0.1.tar.gz
> diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
> new file mode 100644
> index 0000000000..5ca2480b03
> --- /dev/null
> +++ b/package/libqb/libqb.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# libqb
> +#
> +################################################################################
> +
> +LIBQB_VERSION = v1.0.1
> +LIBQB_SITE = $(call github,ClusterLabs,libqb,$(LIBQB_VERSION))

 There is an uploaded tarball (which probably contains a configure script).

 There's also a 1.0.2 now.

> +
> +LIBQB_LICENSE = LGPLv2.1+
> +LIBQB_LICENSE_FILES = COPYING

 SPDX + license hash.


> +
> +LIBQB_DEPENDENCIES = host-pkgconf
> +
> +# Straight out of the repository, no configure present. Also, we do patch
> +# configure.ac.
> +LIBQB_AUTORECONF = YES
> +
> +LIBQB_INSTALL_STAGING = YES
> +
> +define LIBQB_M4
> +	$(INSTALL) -d -m 0755 $(@D)/m4

 We use mkdir -p everywhere else.

> +endef
> +LIBQB_POST_EXTRACT_HOOKS += LIBQB_M4
> +
> +# Don't build docs

 We don't usually have these comments, do we?


 Regards,
 Arnout

> +LIBQB_CONF_ENV = ac_cv_prog_DOXYGEN=
> +
> +# Don't use -Werror
> +LIBQB_CONF_OPTS = --disable-fatal-warnings
> +
> +$(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
