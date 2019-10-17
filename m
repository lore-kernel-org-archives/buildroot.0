From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 17 Oct 2019 14:17:57 -0500
Subject: [Buildroot] [RFC PATCH v2 10/30] package/compiler-rt: new
 package
In-Reply-To: <20191017152929.49153-11-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-11-michael.drake@codethink.co.uk>
Message-ID: <CANQCQpb=YZNK3a8fHUczUcJReiiJjDrO=Q6tY3w6fS_XOxbsMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 17, 2019 at 10:30 AM Michael Drake
<michael.drake@codethink.co.uk> wrote:
>
> From: Matt Weber <matthew.weber@rockwellcollins.com>
>
> This patch adds support for the compiler-rt (CLANG runtime) library.
> It builds a set of static libraries and installs them into the
> CLANG/LLVM toolchain resource folder.
>

FYI, I plan to publish (soon) a cleaned up version of my original
series which add the compiler-rt feature.  That refreshed patchset
would have the feedback from my last series that's missing here.


> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Romain Naour <romain.naour@smile.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/clang/clang.mk               |  2 +-
>  package/compiler-rt/Config.in        | 14 +++++++++++
>  package/compiler-rt/compiler-rt.hash |  2 ++
>  package/compiler-rt/compiler-rt.mk   | 36 ++++++++++++++++++++++++++++
>  package/llvm/llvm.mk                 |  2 +-
>  7 files changed, 56 insertions(+), 2 deletions(-)
>  create mode 100644 package/compiler-rt/Config.in
>  create mode 100644 package/compiler-rt/compiler-rt.hash
>  create mode 100644 package/compiler-rt/compiler-rt.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index bdc98edd12..abaa710ccb 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1476,6 +1476,7 @@ F:        package/bridge-utils/
>  F:     package/checkpolicy/
>  F:     package/checksec/
>  F:     package/cgroupfs-mount/
> +F:     package/compiler-rt/
>  F:     package/crda/
>  F:     package/cunit/
>  F:     package/dacapo/
> diff --git a/package/Config.in b/package/Config.in
> index 90dddfd346..ab9335a055 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1666,6 +1666,7 @@ menu "Other"
>         source "package/clapack/Config.in"
>         source "package/classpath/Config.in"
>         source "package/cmocka/Config.in"
> +       source "package/compiler-rt/Config.in"
>         source "package/cppcms/Config.in"
>         source "package/cracklib/Config.in"
>         source "package/dawgdic/Config.in"
> diff --git a/package/clang/clang.mk b/package/clang/clang.mk
> index 07e7fced2a..87a80ab258 100644
> --- a/package/clang/clang.mk
> +++ b/package/clang/clang.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -# LLVM and Clang should be version bumped together
> +# LLVM, Compiler-rt and Clang should be version bumped together
>  CLANG_VERSION = 8.0.0
>  CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
>  CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
> diff --git a/package/compiler-rt/Config.in b/package/compiler-rt/Config.in
> new file mode 100644
> index 0000000000..9afc0d9d60
> --- /dev/null
> +++ b/package/compiler-rt/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_COMPILER_RT
> +       bool "compiler-rt"
> +       depends on BR2_PACKAGE_LLVM
> +       depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
> +       help
> +         A collection of runtime libraries primarily used by clang and
> +         llvm to provide builtins, sanitizer runtimes, and profiling
> +         at runtime.
> +
> +         https://compiler-rt.llvm.org/
> +
> +comment "compiler-rt requires llvm to be enabled and a glibc toolchain"
> +       depends on !BR2_PACKAGE_LLVM
> +       depends on !BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/compiler-rt/compiler-rt.hash b/package/compiler-rt/compiler-rt.hash
> new file mode 100644
> index 0000000000..24ebdf206b
> --- /dev/null
> +++ b/package/compiler-rt/compiler-rt.hash
> @@ -0,0 +1,2 @@
> +sha256 b435c7474f459e71b2831f1a4e3f1d21203cb9c0172e94e9d9b69f50354f21b1  compiler-rt-8.0.0.src.tar.xz
> +sha256 dd27f8c290bcdc8368549cd7cd98710a9dbdc34122f2e096a1edb97824ed4148  LICENSE.TXT
> diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
> new file mode 100644
> index 0000000000..7eda3bc4fe
> --- /dev/null
> +++ b/package/compiler-rt/compiler-rt.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# compiler-rt
> +#
> +################################################################################
> +
> +# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
> +# tied to the version of those tools
> +COMPILER_RT_VERSION = 8.0.0
> +COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
> +COMPILER_RT_SITE = http://llvm.org/releases/$(COMPILER_RT_VERSION)
> +COMPILER_RT_LICENSE = NCSA MIT
> +COMPILER_RT_LICENSE_FILES = LICENSE.TXT
> +COMPILER_RT_DEPENDENCIES = host-clang llvm
> +
> +COMPILER_RT_INSTALL_STAGING = YES
> +COMPILER_RT_INSTALL_TARGET = NO
> +
> +COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
> +       -DCOMPILER_RT_STANDALONE_BUILD=ON \
> +       -DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
> +       -DLLVM_CONFIG_PATH=$(HOST_DIR)/usr/bin/llvm-config
> +
> +# The installation of the target runtime libraries defaults to DESTDIR, however
> +# host-clang resources directory needs a link so Clang can find the runtime
> +# libraries in the same location they would be if built as part of the Clang
> +# build. The "resources" directory is loosely documented and seems to be
> +# assumed, as compiler-rt is usually build at the same time as Clang and not
> +# standalone.
> +define COMPILER_RT_SETUP_RUNTIME_LIBS
> +       mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib
> +       ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib/linux
> +endef
> +COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
> +
> +$(eval $(cmake-package))
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 44882d39a6..4fce59b95b 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -# LLVM and Clang should be version bumped together
> +# LLVM, Compiler-rt and Clang should be version bumped together
>  LLVM_VERSION = 8.0.0
>  LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
>  LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
> --
> 2.20.1
>


-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
