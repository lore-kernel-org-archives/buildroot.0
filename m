From: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
Date: Fri, 4 Jan 2013 11:35:56 +0530
Subject: [Buildroot] [PATCH] perf: new package
In-Reply-To: <1357225671-18101-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1357225671-18101-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAPDLWs_+GNS6EtzWVt98wwDiDwnqVc+BvAQm31+5ib62-bGQ4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Great work! ..of course :)

Just checking / asking:
1. what about the kernel patch to be applied such that kernel build
for perf is successful (i sent in the patch yesterday)

2. In my patch (linux.mk), I make a validity check to confirm that the
kernel version is >= 2.6.31 (as perf is only supported from that ver
onward). Should we keep that check?

3. You mention :
> the NO_LIBELF variable, which allows to get rid of the libelf dependency,
> has only been introduced between 3.6 and 3.7.
I did test my patches on the 3.2.21 vanilla kernel and it seems to work okay..

Thanks,
Kaiwan.

On Thu, Jan 3, 2013 at 8:37 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This patch adds a new package that allows to build the 'perf'
> userspace tool that comes in the tools/perf directory of the kernel
> sources.
>
> It is an alternative proposal to the one done by Kaiwan Billimoria
> <kaiwan.billimoria@gmail.com>, in that it creates the package in
> package/perf/. It therefore properly integrates with the Buildroot
> package infrastructure.
>
> Of course, the package depends on the Linux kernel to be built by
> Buildroot, in order to get Perf sources matching the version of the
> kernel that will be executed.
>
> One remaining issue is that this package only builds properly with
> kernel >= v3.7 (but it was the same with Kaiwan proposal) : the
> NO_LIBELF variable, which allows to get rid of the libelf dependency,
> has only been introduced between 3.6 and 3.7. If we want to support
> older kernel versions, we'll have to create a package for libelf.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Config.in      |    1 +
>  package/perf/Config.in |   22 ++++++++++++++++++++++
>  package/perf/perf.mk   |   38 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 package/perf/Config.in
>  create mode 100644 package/perf/perf.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 7860f3f..9e392d8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -35,6 +35,7 @@ source "package/ltrace/Config.in"
>  source "package/memstat/Config.in"
>  source "package/netperf/Config.in"
>  source "package/oprofile/Config.in"
> +source "package/perf/Config.in"
>  source "package/ramspeed/Config.in"
>  source "package/rt-tests/Config.in"
>  source "package/strace/Config.in"
> diff --git a/package/perf/Config.in b/package/perf/Config.in
> new file mode 100644
> index 0000000..54b24fe
> --- /dev/null
> +++ b/package/perf/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_PERF
> +       bool "perf"
> +       depends on BR2_LINUX_KERNEL
> +       depends on BR2_LARGEFILE
> +       help
> +         perf (sometimes "Perf Events" or perf tools, originally
> +         "Performance Counters for Linux") - is a performance
> +         analyzing tool in Linux, available from kernel version
> +         2.6.31. User-space controlling utility, called 'perf' has
> +         git-like interface with subcommands. It is capable of
> +         statistical profiling of entire system (both kernel and user
> +         code), single CPU or severals threads.
> +
> +         This package builds and install the userspace 'perf'
> +         command. It is up to the user to ensure that the kernel
> +         configuration has all suitable options enable to allow a
> +         proper operation of 'perf'.
> +
> +         https://perf.wiki.kernel.org/
> +
> +comment "perf only available if Linux kernel is enabled, and requires largefile support"
> +       depends on !BR2_LINUX_KERNEL || !BR2_LARGEFILE
> diff --git a/package/perf/perf.mk b/package/perf/perf.mk
> new file mode 100644
> index 0000000..7774dae
> --- /dev/null
> +++ b/package/perf/perf.mk
> @@ -0,0 +1,38 @@
> +#############################################################
> +#
> +# perf
> +#
> +#############################################################
> +
> +# Source taken from the Linux kernel tree
> +PERF_SOURCE =
> +PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
> +
> +PERF_DEPENDENCIES = linux
> +
> +PERF_MAKE_FLAGS = \
> +       $(LINUX_MAKE_FLAGS) \
> +       NO_LIBELF=1 \
> +       NO_DWARF=1 \
> +       NO_LIBAUDIT=1 \
> +       NO_NEWT=1 \
> +       NO_GTK2=1 \
> +       NO_LIBPERL=1 \
> +       NO_LIBPYTHON=1 \
> +       DESTDIR=$(TARGET_DIR) \
> +       prefix=/usr
> +
> +define PERF_BUILD_CMDS
> +       $(MAKE) -C $(LINUX_DIR)/tools/perf \
> +               $(PERF_MAKE_FLAGS) O=$(@D)
> +endef
> +
> +# After installation, we remove the Perl and Python scripts from the
> +# target.
> +define PERF_INSTALL_TARGET_CMDS
> +       $(MAKE) -C $(LINUX_DIR)/tools/perf \
> +               $(PERF_MAKE_FLAGS) O=$(@D) install
> +       $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
> +endef
> +
> +$(eval $(generic-package))
> --
> 1.7.9.5
>
