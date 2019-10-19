From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:39:11 +0200
Subject: [Buildroot] [RFC PATCH v2 06/30] lld: new package
In-Reply-To: <20191017152929.49153-7-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-7-michael.drake@codethink.co.uk>
Message-ID: <86e76345-b5eb-76b1-ed81-ccaa36b205de@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/10/2019 17:29, Michael Drake wrote:
> From: Joseph Kogut <joseph.kogut@gmail.com>
> 

 For lld, I completely agree that a Config.in.host option is needed - not for a
post-build script, but rather to use lld in external packages.

> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in.host     |  1 +
>  package/lld/Config.in.host | 16 ++++++++++++++++
>  package/lld/lld.hash       |  2 ++
>  package/lld/lld.mk         | 15 +++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/lld/Config.in.host
>  create mode 100644 package/lld/lld.hash
>  create mode 100644 package/lld/lld.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 4ab4e36593..bdc98edd12 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1221,6 +1221,7 @@ F:	package/at-spi2-core/
>  F:	package/clang/
>  F:	package/gconf/
>  F:	package/libnss/
> +F:	package/lld/
>  F:	package/llvm/
>  F:	package/python-cython/
>  F:	package/python-raven/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 3122f5abca..18074ae1a7 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -34,6 +34,7 @@ menu "Host utilities"
>  	source "package/jq/Config.in.host"
>  	source "package/jsmin/Config.in.host"
>  	source "package/libp11/Config.in.host"
> +	source "package/lld/Config.in.host"
>  	source "package/llvm/Config.in.host"
>  	source "package/lpc3250loader/Config.in.host"
>  	source "package/lttng-babeltrace/Config.in.host"
> diff --git a/package/lld/Config.in.host b/package/lld/Config.in.host
> new file mode 100644
> index 0000000000..c04b7924fa
> --- /dev/null
> +++ b/package/lld/Config.in.host
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_HOST_LLD
> +	bool "host lld"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8 # llvm
> +	select BR2_PACKAGE_HOST_LLVM

 I'm confused now... I thought the previous patch would be needed to support
lld, but you don't select BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH here, so the
option introduced in the previous patch is not used at all... Why is that patch
needed then?


 Also, in Joseph's original submission, [1] was included. Now it is no longer
there. Was it not needed after all?

 Anyway, I think I'll apply Joseph's original patch now.


 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/1136469/



> +	help
> +	  LLD is a linker from the LLVM project that is a drop-in
> +	  replacement for system linkers, and runs much faster than
> +	  them. It also provides features that are useful for
> +	  toolchain developers.
> +
> +	  https://lld.llvm.org/
> +
> +comment "lld needs a toolchain w/ host gcc >= 4.8"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on !BR2_HOST_GCC_AT_LEAST_4_8
> diff --git a/package/lld/lld.hash b/package/lld/lld.hash
> new file mode 100644
> index 0000000000..ebec212041
> --- /dev/null
> +++ b/package/lld/lld.hash
> @@ -0,0 +1,2 @@
> +sha256 9caec8ec922e32ffa130f0fb08e4c5a242d7e68ce757631e425e9eba2e1a6e37  lld-8.0.0.src.tar.xz
> +sha256 a6c2a7ad246b567fd1828561ee8c244e35f73f164f031c82a7f28eff9634d23d  LICENSE.TXT
> diff --git a/package/lld/lld.mk b/package/lld/lld.mk
> new file mode 100644
> index 0000000000..6c3b10a667
> --- /dev/null
> +++ b/package/lld/lld.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# lld
> +#
> +################################################################################
> +
> +LLD_VERSION = 8.0.0
> +LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
> +LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
> +LLD_LICENSE = NCSA
> +LLD_LICENSE_FILES = LICENSE.TXT
> +LLD_SUPPORTS_IN_SOURCE_BUILD = NO
> +HOST_LLD_DEPENDENCIES = host-llvm
> +
> +$(eval $(host-cmake-package))
> 
