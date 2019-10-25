From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 25 Oct 2019 09:44:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/lld: fix build with gcc < 5.1
In-Reply-To: <20191024231818.988900-1-joseph.kogut@gmail.com>
References: <20191024231818.988900-1-joseph.kogut@gmail.com>
Message-ID: <bfe223d1-f0b6-2f20-956c-677e74f78941@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

Le 25/10/2019 ? 01:18, Joseph Kogut a ?crit?:
> This fix is based on commit 2a17fb6 used for llvm.
> 
> Fixes:
> http://autobuild.buildroot.net/results/76310241a335a99a4ff2726edb517b067367fd41
> http://autobuild.buildroot.net/results/88cbfae219fd4475be376c9558b5760cebd2148f
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/lld/lld.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/lld/lld.mk b/package/lld/lld.mk
> index cd76c724ce..c284d6df7f 100644
> --- a/package/lld/lld.mk
> +++ b/package/lld/lld.mk
> @@ -13,6 +13,12 @@ LLD_LICENSE_FILES = LICENSE.TXT
>  LLD_SUPPORTS_IN_SOURCE_BUILD = NO
>  HOST_LLD_DEPENDENCIES = host-llvm
>  
> +# LLVM >= 9.0 will soon require C++14 support, building llvm 8.x using a
> +# toolchain using gcc < 5.1 gives an error but actually still works. Setting
> +# this option makes it still build with gcc >= 4.8.
> +# https://reviews.llvm.org/D57264

At the time this comment was written, I supposed that llvm >= 9.0 will require
C++14. But llvm 9.0 was released with this option, so in practice we can still
use gcc < 5.1 to build llvm. Maybe this comment should be updated.

Otherwise:
Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> +HOST_LLD_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
> +
>  # GCC looks for tools in a different path from LLD's default installation path
>  define HOST_LLD_CREATE_SYMLINKS
>  	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
> 
