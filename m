From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 23:01:06 +0200
Subject: [Buildroot] [RFC PATCH v4 8/9] lld: new package
In-Reply-To: <20180614224820.27126-9-joseph.kogut@gmail.com>
References: <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180614224820.27126-1-joseph.kogut@gmail.com>
 <20180614224820.27126-9-joseph.kogut@gmail.com>
Message-ID: <20180615230106.0bebcbb3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jun 2018 15:48:19 -0700, Joseph Kogut wrote:

> diff --git a/package/lld/Config.in b/package/lld/Config.in
> new file mode 100644
> index 0000000000..0ad50fd608
> --- /dev/null
> +++ b/package/lld/Config.in
> @@ -0,0 +1,3 @@
> +config BR2_PACKAGE_LLD
> +	bool "lld"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS

This is a bit short. No help text, no upstream URL.

> diff --git a/package/lld/lld.hash b/package/lld/lld.hash
> new file mode 100644
> index 0000000000..ce81c7baca
> --- /dev/null
> +++ b/package/lld/lld.hash
> @@ -0,0 +1,3 @@
> +# locally calculated
> +sha256 6b8c4a833cf30230c0213d78dbac01af21387b298225de90ab56032ca79c0e0b  lld-6.0.0.src.tar.xz
> +sha256 f0502d2d0e19748c534ee95ea486c092273303dbef76404c8b17dc8bf6ca441b  LICENSE.TXT
> diff --git a/package/lld/lld.mk b/package/lld/lld.mk
> new file mode 100644
> index 0000000000..cfaf3dbd29
> --- /dev/null
> +++ b/package/lld/lld.mk
> @@ -0,0 +1,19 @@
> +###############################################################################
> +#
> +# lld
> +#
> +###############################################################################
> +
> +LLD_VERSION = 6.0.0
> +LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
> +LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
> +LLD_LICENSE = NCSA
> +LLD_LICENSE_FILES = LICENSE.TXT
> +LLD_SUPPORTS_IN_SOURCE_BUILD = NO

No dependencies really ? Have you tried a configuration with *just* lld
enabled ?

If I build just the lld package, I get:

CMake Error at CMakeLists.txt:11 (message):
  llvm-config not found: specify LLVM_CONFIG_PATH

When you submit new packages, please make sure that they build in a
configuration that has *just* this new package enabled and nothing else.

> +HOST_LLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
> +LLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

For target packages, CMAKE_BUILD_TYPE is already passed by the
cmake-package infrastructure.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
