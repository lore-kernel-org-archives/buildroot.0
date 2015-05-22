From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 22 May 2015 10:38:28 -0500
Subject: [Buildroot] [PATCH 1/1] package/cpupower: new package
In-Reply-To: <1432249380-5920-1-git-send-email-james.knight@rockwellcollins.com>
References: <1432249380-5920-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <CANQCQpb1FtMMi8zmmS8CiSOmCb7osBBKfG2M0YTp4H8bf=qwOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

On Thu, May 21, 2015 at 6:03 PM, James Knight
<james.knight@rockwellcollins.com> wrote:
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/Config.in            |  1 +
>  package/cpupower/Config.in   | 10 ++++++++++
>  package/cpupower/cpupower.mk | 37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 package/cpupower/Config.in
>  create mode 100644 package/cpupower/cpupower.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e0c2e2a..0bd6eb6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1378,6 +1378,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/coreutils/Config.in"
>  endif
>         source "package/cpuload/Config.in"
> +       source "package/cpupower/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/dcron/Config.in"
>         source "package/debianutils/Config.in"
> diff --git a/package/cpupower/Config.in b/package/cpupower/Config.in
> new file mode 100644
> index 0000000..745dd2b
> --- /dev/null
> +++ b/package/cpupower/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_CPUPOWER
> +       bool "cpupower"
> +       depends on BR2_LINUX_KERNEL
> +       select BR2_PACKAGE_PCIUTILS
> +       help
> +         cpupower is a collection of tools to examine and tune power
Extra space at end of the above line.

> +         saving related features of your processor.
> +
> +comment "cpupower needs a Linux kernel to be built"
> +       depends on !BR2_LINUX_KERNEL
> diff --git a/package/cpupower/cpupower.mk b/package/cpupower/cpupower.mk
> new file mode 100644
> index 0000000..cb1f938
> --- /dev/null
> +++ b/package/cpupower/cpupower.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# cpupower
> +#
> +################################################################################
> +
> +# Source taken from the Linux kernel tree
> +CPUPOWER_SOURCE =
> +CPUPOWER_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
> +
> +CPUPOWER_DEPENDENCIES = linux pciutils

Add license file and type...  In this case, probably just a
duplication of the kernel, but needed for license manifest generation.
The file has to be in your source folder, so maybe the _SOURCE needs
to be set to the LINUX_DIR....  Would have to think about this one.
Maybe look at the spidev-test which is also build from Linux kernel
source.
http://git.buildroot.net/buildroot/tree/package/spidev_test/spidev_test.mk

To test the license gathering, remove your build/cpupower folder and
then make legal-info.

LIBFOO has a good example here for how those variables are set (also
look at any other package).
http://buildroot.uclibc.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems

FYI, here's some background
http://buildroot.uclibc.org/downloads/manual/manual.html#legal-info

<snip>

The spidev_test might also shed light on another approach to adding cpupower.

Thanks, James for the submission!

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
