From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 11:09:30 +0200
Subject: [Buildroot] [Patch v2 1/3] jemalloc: new package
In-Reply-To: <1466797592-5565-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466797592-5565-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466797592-5565-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <dab29f40-27b6-1b2a-54af-5b2163ef7846@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

Le 24/06/2016 ? 21:46, Eric Le Bihan a ?crit :
> This new package provides jemalloc, a malloc(3) implementation that
> emphasizes fragmentation avoidance and scalable concurrency support.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in              |  1 +
>  package/jemalloc/Config.in     |  7 +++++++
>  package/jemalloc/jemalloc.hash |  2 ++
>  package/jemalloc/jemalloc.mk   | 15 +++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/jemalloc/Config.in
>  create mode 100644 package/jemalloc/jemalloc.hash
>  create mode 100644 package/jemalloc/jemalloc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a2a02a8..38734f3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1242,6 +1242,7 @@ menu "Other"
>  	source "package/gmp/Config.in"
>  	source "package/gsl/Config.in"
>  	source "package/gtest/Config.in"
> +	source "package/jemalloc/Config.in"
>  	source "package/libargtable2/Config.in"
>  	source "package/libatomic_ops/Config.in"
>  	source "package/libbsd/Config.in"
> diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
> new file mode 100644
> index 0000000..86bafbf
> --- /dev/null
> +++ b/package/jemalloc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_JEMALLOC
> +	bool "jemalloc"

Can you check the jemalloc dependency ?

Since it try to build libjemalloc.so.2, jmalloc should be disabled for static
only build.

jemalloc build fine with uclibc-ng and musl.

> +	help
> +	 This library providing a malloc(3) implementation that emphasizes
> +	 fragmentation avoidance and scalable concurrency support.
> +
> +	 http://www.canonware.com/jemalloc/
> diff --git a/package/jemalloc/jemalloc.hash b/package/jemalloc/jemalloc.hash
> new file mode 100644
> index 0000000..c24a273
> --- /dev/null
> +++ b/package/jemalloc/jemalloc.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 b216ddaeb901697fe38bd30ea02d7505a4b60e8979092009f95cfda860d46acb jemalloc-4.2.0.tar.bz2
> diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
> new file mode 100644
> index 0000000..4c76a21
> --- /dev/null
> +++ b/package/jemalloc/jemalloc.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# jemalloc
> +#
> +################################################################################
> +
> +JEMALLOC_VERSION = 4.2.0
> +JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
> +JEMALLOC_SITE = http://www.canonware.com/download/jemalloc/

Remove the trailing stash:
package/jemalloc/jemalloc.mk:14: *** JEMALLOC_SITE
(http://www.canonware.com/download/jemalloc/) cannot have a trailing slash. Stop.

Otherwise:
  Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> +JEMALLOC_LICENSE = BSD-2c
> +JEMALLOC_LICENSE_FILES = COPYING
> +JEMALLOC_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> 
