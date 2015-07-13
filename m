From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 Jul 2015 01:10:02 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/perf: migrate perf to use
 the new linux-tools infrastructure
In-Reply-To: <1436822225-29591-4-git-send-email-romain.naour@openwide.fr>
References: <1436822225-29591-1-git-send-email-romain.naour@openwide.fr>
 <1436822225-29591-4-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAHXCMMKpWZZaxDfrK33cExJAex_kipXtuRMejeKuMsVxO9U9=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, all,

On Mon, Jul 13, 2015 at 11:17 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> Remove perf package and add legacy handling.
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v2: remove LINUX_TOOL prefix
>     use $(D) instead of $(LINUX_DIR)
>     fix title style
>     remove useless O=$(@D)
> ---
>  Config.in.legacy         |  7 +++++
>  linux/Config.tools.in    | 18 +++++++++++++
>  linux/linux-tool-perf.mk | 63 ++++++++++++++++++++++++++++++++++++++++++++
>  package/Config.in        |  1 -
>  package/perf/Config.in   | 21 ---------------
>  package/perf/perf.mk     | 68 ------------------------------------------------
>  6 files changed, 88 insertions(+), 90 deletions(-)
>  create mode 100644 linux/linux-tool-perf.mk
>  delete mode 100644 package/perf/Config.in
>  delete mode 100644 package/perf/perf.mk
Tips:
  git format-patch -M ...
or (persistent settings):
  git config --global diff.renames copy
  git config --global diff.renameLimit 5000

>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 0a8d0a6..c0f3a10 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -107,6 +107,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2015.08"
>
> +config BR2_PACKAGE_PERF
> +       bool "perf"
Extend the prompt telling what has changed, e.g.:
  bool "perf option has been renamed"

> +       select BR2_LEGACY
> +       select BR2_LINUX_KERNEL_TOOL_PERF
> +       help
> +         Perf package has been moved to linux tools package.
> +
>  config BR2_BINUTILS_VERSION_2_22
>         bool "binutils 2.22 removed"
>         select BR2_LEGACY
> diff --git a/linux/Config.tools.in b/linux/Config.tools.in
> index 008e68c..0c94d55 100644
> --- a/linux/Config.tools.in
> +++ b/linux/Config.tools.in
> @@ -8,4 +8,22 @@ config BR2_LINUX_KERNEL_TOOL_CPUPOWER
>           cpupower is a collection of tools to examine and tune power
>           saving related features of your processor.
>
> +config BR2_LINUX_KERNEL_TOOL_PERF
> +       bool "perf"
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
s/This package/This will/
s/install/installs/

> +         command. It is up to the user to ensure that the kernel
> +         configuration has all the suitable options enabled to allow a
> +         proper operation of 'perf'.
> +
> +         https://perf.wiki.kernel.org/
> +
>  endmenu
[...]

Regards,


-- 
Samuel
