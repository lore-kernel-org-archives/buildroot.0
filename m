From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 20 Oct 2018 21:02:21 +0100
Subject: [Buildroot] [PATCH v2 1/2] libfuzzer: compiler-rt integ
In-Reply-To: <1540064574-54964-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1540064574-54964-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpZMG6VUqRb9XHvsgownkEO1MmoPK83Jh1yoC4gM=QSETg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ignore this one.
On Sat, Oct 20, 2018 at 8:42 PM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> Conflicts:
>         package/Config.in
> ---
>  package/Config.in                    |  1 +
>  package/compiler-rt/Config.in        | 13 +++++++++++++
>  package/compiler-rt/compiler-rt.hash |  3 +++
>  package/compiler-rt/compiler-rt.mk   | 32 ++++++++++++++++++++++++++++++++
>  4 files changed, 49 insertions(+)
>  create mode 100644 package/compiler-rt/Config.in
>  create mode 100644 package/compiler-rt/compiler-rt.hash
>  create mode 100644 package/compiler-rt/compiler-rt.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 8d53c72..2f799ee 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1592,6 +1592,7 @@ menu "Other"
>         source "package/clapack/Config.in"
>         source "package/classpath/Config.in"
>         source "package/cmocka/Config.in"
> +       source "package/compiler-rt/Config.in"
>         source "package/cppcms/Config.in"
>         source "package/cracklib/Config.in"
>         source "package/dawgdic/Config.in"
> diff --git a/package/compiler-rt/Config.in b/package/compiler-rt/Config.in
> new file mode 100644
> index 0000000..4233668
> --- /dev/null
> +++ b/package/compiler-rt/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_COMPILER_RT
> +       bool "compiler-rt"
> +       depends on BR2_PACKAGE_CLANG
> +# Need to add libfuzzer as a sub option and a dependency on arch supported.  aarch64 doesn't seem to work
> +       help
> +         A collection of runtime libraries primarily used by clang and
> +         llvm to provide builtins, sanitizer runtimes, profiling and
> +         blocks runtime.
> +
> +         https://compiler-rt.llvm.org/
> +
> +comment "compiler-rt requires clang to be enabled"
> +       depends on !BR2_PACKAGE_CLANG
> diff --git a/package/compiler-rt/compiler-rt.hash b/package/compiler-rt/compiler-rt.hash
> new file mode 100644
> index 0000000..7acc879
> --- /dev/null
> +++ b/package/compiler-rt/compiler-rt.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256 d0cc1342cf57e9a8d52f5498da47a3b28d24ac0d39cbc92308781b3ee0cea79a  compiler-rt-6.0.0.src.tar.xz
> +sha256 bdec7fe3cf2c85f55656c07dfb0bd93ae46f2b3dd8f33ff3ad6e7586f4c670d6  compiler-rt-7.0.0.src.tar.xz
> diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
> new file mode 100644
> index 0000000..9853eca
> --- /dev/null
> +++ b/package/compiler-rt/compiler-rt.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# compiler-rt
> +#
> +################################################################################
> +
> +COMPILER_RT_VERSION = 7.0.0
> +COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
> +COMPILER_RT_SITE = http://llvm.org/releases/$(COMPILER_RT_VERSION)
> +COMPILER_RT_LICENSE = NCSA MIT
> +COMPILER_RT_LICENSE_FILES = LICENSE.TXT
> +COMPILER_RT_DEPENDENCIES = host-cmake clang
> +
> +COMPILER_RT_INSTALL_STAGING = YES
> +COMPILER_RT_INSTALL_TARGET = NO
> +
> +#ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> +#COMPILER_RT_TARGET_LDFLAGS += --target=aarch64-linux-gnu
> +#--gcc-toolchain=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
> +#else
> +#COMPILER_RT_TARGET_LDFLAGS += --target=aarch64-linux-gnu --gcc-toolchain=$(HOST_DIR)
> +#endif
> +
> +COMPILER_RT_CONF_ENV = TARGET_CC="clang" \
> +         TARGET_CXX="clang++" \
> +         TARGET_CFLAGS="$(CHROMIUM_TARGET_CFLAGS)" \
> +         TARGET_CXXFLAGS="$(CHROMIUM_TARGET_CXXFLAGS)" \
> +         TARGET_LDFLAGS="$(CHROMIUM_TARGET_LDFLAGS)"
> +
> +COMPILER_RT_CONF_OPTS= -DCOMPILER_RT_INCLUDE_TESTS=ON
> +
> +$(eval $(cmake-package))
> --
> 1.9.1
>


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
