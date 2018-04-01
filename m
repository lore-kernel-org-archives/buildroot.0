From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 22:56:25 +0200
Subject: [Buildroot] [PATCH v4 07/11] package/clang: new host package
In-Reply-To: <20180329113346.10367-8-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-8-valentin.korenblit@smile.fr>
Message-ID: <20180401225625.462fda1f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Mar 2018 13:33:42 +0200, Valentin Korenblit wrote:

> diff --git a/package/clang/Config.in.host b/package/clang/Config.in.host
> new file mode 100644
> index 0000000000..61a7ed59f0
> --- /dev/null
> +++ b/package/clang/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_CLANG
> +	bool "host clang"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	help
> +	  Clang is a C/C++, Objective C/C++ and OpenCL C front-end
> +	  for the LLVM compiler.
> +
> +	  http://clang.llvm.org/

Do we need a visible Config.in.host option ? I don't think we need it,
since host-clang is merely a build dependency of clang.

> +# Use "Unix Makefiles" generator for generating make-compatible parallel makefiles.
> +HOST_CLANG_CONF_OPTS += -G "Unix Makefiles"

Why do we need this ? No other CMake package has that.

> +# Select Release build
> +HOST_CLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

Do we need to do that in the cmake-package infrastructure instead ?

> +# Build tools enabled
> +HOST_CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
> +
> +# Don't build examples
> +HOST_CLANG_CONF_OPTS += -DCLANG_BUILD_EXAMPLES=OFF
> +
> +# Don't build doc
> +HOST_CLANG_CONF_OPTS += -DCLANG_INCLUDE_DOCS=OFF
> +
> +# Don't build tests
> +HOST_CLANG_CONF_OPTS += -DCLANG_INCLUDE_TESTS=OFF
> +
> +# Specify path to host's llvm-config
> +HOST_CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(HOST_DIR)/bin/llvm-config

All that stuff it too verbose, the comments are not useful at all, just
do a single HOST_CLANG_CONF_OPTS assignment.

> +# Install clang in  HOST_DIR/usr
> +HOST_CLANG_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(HOST_DIR)/usr

Like for LLVM, this is not needed as it is passed by the cmake-package
infrastructure, and the correct value is $(HOST_DIR), not
$(HOST_DIR)/usr.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
