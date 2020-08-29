From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Aug 2020 21:00:00 +0200
Subject: [Buildroot] [PATCH v2 01/12] package/clang: help host-clang to
 find our external toolchain
In-Reply-To: <20190907094027.9537-2-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
 <20190907094027.9537-2-romain.naour@smile.fr>
Message-ID: <d554437b-20cc-e205-0fcb-21a83199be5d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/09/2019 11:40, Romain Naour wrote:
[snip]
> diff --git a/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
> new file mode 100644
> index 0000000000..63ddbaf35f
> --- /dev/null
> +++ b/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
> @@ -0,0 +1,76 @@
> +From fe21cede3939a435d62efbd5799547fab6af1b0a Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@smile.fr>
> +Date: Mon, 5 Aug 2019 16:06:48 +0200
> +Subject: [PATCH] lib/Driver/ToolChains/Gnu: Use GCC_INSTALL_PREFIX in the set
> + of prefixes for searching the gcc toolchain
> +
> +By default, the Gnu Toolchains driver is looking at the parent
> +directory while looking for the gcc toolchain when clang is installed
> +at "D.InstalledDir"
> +
> +But this doesn't work with Buildroot since the external
> +toolchain is installed in host/opt/ext-toolchain and the sysroot is
> +moved to host/<arch>-buildroot-linux-gnu/sysroot/ directory.
> +
> +We tried by setting GCC_INSTALL_PREFIX in clang.mk for host-clang
> +but it doesn't work since we already provide a sysroot [1].
> +
> +Help the Gnu Toolchains driver by using GCC_INSTALL_PREFIX path.
> +
> +Since we want to be able to relocate the clang toolchain,
> +allow to use a relative path with GCC_INSTALL_PREFIX.

 Well, that's only true for a downloaded toolchain. A preinstalled toolchain is
assumed not to relocate when you relocate the SDK, so it should be an absolute
path. (Actually, we probably should use a relative path if the path given in the
.config is relative, but an absolute path if it is absolute...)

> +
> +Buildroot will provide such relative path by using:
> +HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
> +
> +Doing so allow to use clang without providing additional search
> +paths with -B option on the clang's command line.
> +
> +[1] https://reviews.llvm.org/D49244
> +[2] http://lists.busybox.net/pipermail/buildroot/2019-August/256204.html
> +
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> +This issue needs to be reported and discussed with upstream.

 Did you do that in the end?

[snip]
> +# Help host-clang to find our external toolchain, use a relative path from the clang
> +# installation directory to the external toolchain installation directory in order to
> +# not hardcode the toolchain absolute path.
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> +HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`

 ... so I changed this to use a relative path only for the downloaded toolchain,
which removes the need for realpath because we can just set ../opt/ext-toolchain

 Also, the :PATH part isn't needed - it's typically added for variables that
aren't defined in the CMakeLists.txt to make sure that they have the correct
type, but this option is defined so setting type is not needed.


 Regards,
 Arnout

> +endif
> +
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> 
