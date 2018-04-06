From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri, 6 Apr 2018 11:36:26 +0200
Subject: [Buildroot] [PATCH 1/2] llvm: add dependency on
 !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
In-Reply-To: <20180406090013.20187-1-thomas.petazzoni@bootlin.com>
References: <20180406090013.20187-1-thomas.petazzoni@bootlin.com>
Message-ID: <a8703b32-9442-95d3-4ea6-b008cd791cf8@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 06/04/2018 11:00, Thomas Petazzoni wrote:
> LLVM uses std::shared_future, which until gcc 7.x isn't available on
> architectures that don't provide lock-free atomics, see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735.
>
> Buildroot already has a BR2_TOOLCHAIN_HAS_GCC_BUG_64735 option to
> handle such a case, so simply add this new dependency to LLVM. It will
> make sure LLVM doesn't get built on ARMv5 platforms using a gcc older
> than 7.x.
>
> Fixes:
>
>    http://autobuild.buildroot.net/results/ada497f6a8d20fa1a9adb2b17a138d7b726a6cdc/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

The three autotests crashed because of std::shared_future,

I've found the following in: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=820535

"This looks like the kind of failure you get when your host toolchain
doesn't support C++11 properly (specifically lock-free atomics in this
case).  When I've seen it before GCC was defaulting to a CPU that's
too old to do atomics properly, and that configuration is very
unlikely to be supported by LLVM ever (any more)."

I was about to send a patch to blacklist ARMv4 and ARMv5 but this should
be a more appropriate solution (I was not aware of BUG_64735).
I'll try to build with the defconfigs from the autobuilder applying the
patch and adding a dependency on !BR2_STATIC_LIBS.

Acked-by: Valentin Korenblit <valentin.korenblit@smile.fr>

> ---
>   package/llvm/Config.in | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/package/llvm/Config.in b/package/llvm/Config.in
> index 70f73f4858..15f2507ef2 100644
> --- a/package/llvm/Config.in
> +++ b/package/llvm/Config.in
> @@ -18,6 +18,7 @@ config BR2_PACKAGE_LLVM
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
>   	help
>   	  The LLVM Project is a collection of modular and reusable
>   	  compiler and toolchain technologies.
> @@ -38,3 +39,7 @@ comment "llvm needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8"
>   	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
>   		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
> +comment "llvm needs a toolchain not affected by GCC bug 64735"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
