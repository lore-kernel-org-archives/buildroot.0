From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Aug 2013 16:13:13 +0200
Subject: [Buildroot] PATCH Add c-ares
In-Reply-To: <20130830133330.GB6739@gpr.nnz-home.ru>
References: <20130830133330.GB6739@gpr.nnz-home.ru>
Message-ID: <20130830161313.73fc49b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gennady Proskurin,

On Fri, 30 Aug 2013 17:33:30 +0400, Gennady Proskurin wrote:
> c-ares is a C library for asynchronous DNS requests (including name resolves)
> http://c-ares.haxx.se/

Thanks. Normally, we expect patches to be sent inline instead of as		
attachments, so that we can more easily review the patch. I'm quoting
your patch below for review.

> From 484339bbb6c11bcb5d5068bd2ab7395682ebebbf Mon Sep 17 00:00:00 2001
> From: Gennady Proskurin <gpr@mail.ru>
> Date: Fri, 30 Aug 2013 16:26:42 +0400
> Subject: [PATCH] Add c-ares

For new packages, we generally like the title to be:

c-ares: new package

> c-ares is a C library for asynchronous DNS requests (including name resolves)

I believe this line is slightly too long, should be wrapped.

> 
> Signed-off-by: Gennady Proskurin <gpr@mail.ru>
> ---
>  package/Config.in        |    1 +
>  package/c-ares/Config.in |    6 ++++++
>  package/c-ares/c-ares.mk |   12 ++++++++++++
>  3 files changed, 19 insertions(+)
>  create mode 100644 package/c-ares/Config.in
>  create mode 100644 package/c-ares/c-ares.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 97cd7da..eb4c8d7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -551,6 +551,7 @@ source "package/mediastreamer/Config.in"
>  endmenu
>  
>  menu "Networking"
> +source "package/c-ares/Config.in"
>  source "package/czmq/Config.in"
>  source "package/cppzmq/Config.in"
>  source "package/filemq/Config.in"
> diff --git a/package/c-ares/Config.in b/package/c-ares/Config.in
> new file mode 100644
> index 0000000..351e4db
> --- /dev/null
> +++ b/package/c-ares/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_C_ARES
> +	bool "c-ares"
> +	help
> +	  c-ares is a C library for asynchronous DNS requests (including name resolves) 

This should be wrapped to ~72 columns.

> +
> +	  http://c-ares.haxx.se/
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> new file mode 100644
> index 0000000..e6e4dd2
> --- /dev/null
> +++ b/package/c-ares/c-ares.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# c-ares
> +#
> +################################################################################

There should be one empty line here.

> +C_ARES_VERSION = 1.9.1
> +C_ARES_SOURCE = c-ares-$(C_ARES_VERSION).tar.gz

This line is not needed, as it is the default value.

> +C_ARES_SITE = http://c-ares.haxx.se/download
> +C_ARES_LICENSE = MIT

Is there a file containing the license, to be used for
C_ARES_LICENSE_FILES ?

> +C_ARES_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))

Did you check that this package indeed builds with a minimal uClibc
toolchain (i.e no IPv6, no thread, no nothing?). You can use the
pre-built toolchain at
http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2013.05-1.tar.bz2
for a minimal toolchain with thread support, and
http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2013.05-1.tar.bz2
for a toolchain with everything except thread support. Testing with
both should give you a good idea of what your package might be using in
terms of toolchain features.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
