From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 11 Nov 2020 10:14:11 -0600
Subject: [Buildroot] [PATCH 2/2] package/coremark-pro: new package
In-Reply-To: <20201111073415.814-2-judge.packham@gmail.com>
References: <20201111073415.814-1-judge.packham@gmail.com>
 <20201111073415.814-2-judge.packham@gmail.com>
Message-ID: <CANQCQpagEeyH1yCUPQLE0_q3Czxhg4AHyeqFGbaCc_QTqwnAbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Wed, Nov 11, 2020 at 1:35 AM Chris Packham <judge.packham@gmail.com> wrote:
>
> CoreMark-Pro is a comprehensive, advanced processor benchmark that
> works with and enhances the market-proven industry-standard EEMBC
> CoreMark benchmark.
>
> https://www.eembc.org/coremark-pro/
>
> Signed-off-by: Chris Packham <judge.packham@gmail.com>


./utils/check-package package/coremark-pro/*
52 lines processed
0 warnings generated

./utils/test-pkg -k  -d foo_coremarkpro -p coremark-pro
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: FAILED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

^^^^^^^^^^^^ Failed is fixed by adding the missing dependency mentioned below.

**Ran in QEMU to runtime test as follows**

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_COREMARK=y
BR2_PACKAGE_COREMARK_PRO=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set

# coremark-pro.sh
Verification run for cjpeg-rose7-preset
random: perl: uninitialized urandom read (4 bytes read)
Performance run for cjpeg-rose7-preset
random: perl: uninitialized urandom read (4 bytes read)
random: perl: uninitialized urandom read (4 bytes read)
random: perl: uninitialized urandom read (4 bytes read)
random: perl: uninitialized urandom read (4 bytes read)
Verification run for core
random: perl: uninitialized urandom read (4 bytes read)
Performance run for core
random: perl: uninitialized urandom read (4 bytes read)
random: perl: uninitialized urandom read (4 bytes read)
random: perl: uninitialized urandom read (4 bytes read)
Verification run for linear_alg-mid-100x100-sp
Performance run for linear_alg-mid-100x100-sp

Verification run for loops-all-mid-10k-sp
Performance run for loops-all-mid-10k-sp
<snip>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/coremark-pro/Config.in         |  7 +++++
>  package/coremark-pro/coremark-pro.hash |  3 ++
>  package/coremark-pro/coremark-pro.mk   | 42 ++++++++++++++++++++++++++
>  package/coremark-pro/coremark-pro.sh   | 36 ++++++++++++++++++++++
>  6 files changed, 90 insertions(+)
>  create mode 100644 package/coremark-pro/Config.in
>  create mode 100644 package/coremark-pro/coremark-pro.hash
>  create mode 100644 package/coremark-pro/coremark-pro.mk
>  create mode 100755 package/coremark-pro/coremark-pro.sh
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ff823a2e3d..291dd41286 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -491,6 +491,7 @@ F:  configs/orangepi_plus_defconfig
>
>  N:     Chris Packham <judge.packham@gmail.com>
>  F:     package/coremark/
> +F:     package/coremark-pro/
>  F:     package/gstreamer1/gst1-shark/
>  F:     package/micropython/
>  F:     package/micropython-lib/
> diff --git a/package/Config.in b/package/Config.in
> index 16fd95fe38..0011ccd684 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -88,6 +88,7 @@ menu "Debugging, profiling and benchmark"
>         source "package/cache-calibrator/Config.in"
>         source "package/clinfo/Config.in"
>         source "package/coremark/Config.in"
> +       source "package/coremark-pro/Config.in"
>         source "package/dacapo/Config.in"
>         source "package/dhrystone/Config.in"
>         source "package/dieharder/Config.in"
> diff --git a/package/coremark-pro/Config.in b/package/coremark-pro/Config.in
> new file mode 100644
> index 0000000000..86e0c1105c
> --- /dev/null
> +++ b/package/coremark-pro/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_COREMARK_PRO
> +       bool "coremark-pro"
> +       select BR2_PACKAGE_PERL

Take a look at package/perl/Config.in and you'll notice that it has a
"depends on" that you need to add here above your select.  See
package/dahdi-tools/Config.in for an example
