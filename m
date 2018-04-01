From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 23:25:43 +0200
Subject: [Buildroot] [PATCH v4 08/11] package/clang: enable target
 variant
In-Reply-To: <20180329113346.10367-9-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-9-valentin.korenblit@smile.fr>
Message-ID: <20180401232543.3fca4303@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Mar 2018 13:33:43 +0200, Valentin Korenblit wrote:
> This patch provides Clang for the target, tools and libraries.
> 
> In this package we have to deal with the same kind of problem we encountered
> when building mesa3d with llvm support: llvm-config (host-version) had to be
> copied to STAGING_DIR/usr/bin.

I don't see why it's a problem in mesa3d and in this package. Having
the <foo>-config stuff in $(STAGING_DIR) is the standard thing in
Buildroot, so there's nothing crazy or unusual about it.

> In this case, we need llvm-tblgen from host
> to be installed in STAGING_DIR/usr/bin for cross-compiling clang.

This is however a bit unusual, and perhaps we should keep llvm-tlbgen
only in $(HOST_DIR).

> We need libclang for the target because it is used by all OpenCL implementations.

I find this assertion a bit affirmative. Do *all* OpenCL
implementations in the world need clang ? Probably not.

> In this series, Clover is provided.

Perhaps a better wording is needed:

We need libclang to build a number of OpenCL implementations. A later
patch in this series will enable Clover, the OpenCL implementation part
of Mesa3D, which requires libclang.

> diff --git a/package/clang/clang.mk b/package/clang/clang.mk
> index 5ea0bb05f9..c2b83a8e60 100644
> --- a/package/clang/clang.mk
> +++ b/package/clang/clang.mk
> @@ -10,31 +10,61 @@ CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
>  CLANG_LICENSE = NCSA
>  CLANG_LICENSE_FILES = LICENSE.TXT
>  CLANG_SUPPORTS_IN_SOURCE_BUILD = NO
> +CLANG_INSTALL_STAGING = YES
>  
>  HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
> +CLANG_DEPENDENCIES = host-clang llvm
>  
>  # Use "Unix Makefiles" generator for generating make-compatible parallel makefiles.
>  HOST_CLANG_CONF_OPTS += -G "Unix Makefiles"
> +CLANG_CONF_OPTS += -G "Unix Makefiles"
> +
> +# This option is needed. Otherwise multiple shared libs (libclangAST.so,
> +# libclangBasic.so, libclangFrontend.so, etc.) will generated. As a final

will *be* generated

> +# shared lib containing all these components (libclang.so) is also generated, this
> +# resulted in the following error when trying to use tools that use libclang:
> +# $ CommandLine Error: Option 'track-memory' registered more than once!
> +# $ LLVM ERROR: inconsistency in registered CommandLine options
> +# By setting BUILD_SHARED_LIBS to OFF, we generate multiple static libraries
> +# (the same way as host's clang build) and finally libclang.so to be installed on the
> +# target.
> +CLANG_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
> +
> +# Copy llvm-tblgen (host variant) to STAGING_DIR
> +define CLANG_COPY_LLVM_TBLGEN_TO_STAGING_DIR
> +	$(INSTALL) -D -m 0755 $(HOST_DIR)/bin/llvm-tblgen $(STAGING_DIR)/usr/bin/llvm-tblgen
> +endef
> +CLANG_PRE_CONFIGURE_HOOKS = CLANG_COPY_LLVM_TBLGEN_TO_STAGING_DIR

Why does llvm-tblgen *has* to be in STAGING_DIR ?

>  # Select Release build
>  HOST_CLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
> +CLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

Not needed, it's passed by the package infrastructure.

> +
> +# Make it explicit that we are cross-compiling
> +CLANG_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
>  
>  # Build tools enabled
>  HOST_CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
> +CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
>  
>  # Don't build examples
>  HOST_CLANG_CONF_OPTS += -DCLANG_BUILD_EXAMPLES=OFF
> +CLANG_CONF_OPTS += -DCLANG_BUILD_EXAMPLES=OFF
>  
>  # Don't build doc
>  HOST_CLANG_CONF_OPTS += -DCLANG_INCLUDE_DOCS=OFF
> +CLANG_CONF_OPTS += -DCLANG_INCLUDE_DOCS=OFF
>  
>  # Don't build tests
>  HOST_CLANG_CONF_OPTS += -DCLANG_INCLUDE_TESTS=OFF
> +CLANG_CONF_OPTS += -DCLANG_INCLUDE_TESTS=OFF

This is also too verbose.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
