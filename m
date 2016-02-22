From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Feb 2016 15:40:59 +0100
Subject: [Buildroot] [PATCH] msr-tools: new package
In-Reply-To: <1454087465-23445-1-git-send-email-vincent.stehle@intel.com>
References: <1454087465-23445-1-git-send-email-vincent.stehle@intel.com>
Message-ID: <CAGm1_kuNhAYrMRf_T3FU5gCoYYT72nEm=MeTRWkdo9FrYjK9-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Fri, Jan 29, 2016 at 6:11 PM, Vincent Stehl?
<vincent.stehle@intel.com> wrote:
> The MSR Tools project provides utilities to access x86 processor MSRs
> and CPU ID directly.
>
> https://01.org/msr-tools
>
> Signed-off-by: Vincent Stehl? <vincent.stehle@intel.com>
> ---
>  package/Config.in                |  1 +
>  package/msr-tools/Config.in      | 12 ++++++++++++
>  package/msr-tools/msr-tools.hash |  2 ++
>  package/msr-tools/msr-tools.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/msr-tools/Config.in
>  create mode 100644 package/msr-tools/msr-tools.hash
>  create mode 100644 package/msr-tools/msr-tools.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 09c2b40..5e2451c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -402,6 +402,7 @@ endif
>         source "package/memtest86/Config.in"
>         source "package/memtester/Config.in"
>         source "package/minicom/Config.in"
> +       source "package/msr-tools/Config.in"
>         source "package/nanocom/Config.in"
>         source "package/neard/Config.in"
>         source "package/nvidia-driver/Config.in"
> diff --git a/package/msr-tools/Config.in b/package/msr-tools/Config.in
> new file mode 100644
> index 0000000..cc7ac2d
> --- /dev/null
> +++ b/package/msr-tools/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_MSR_TOOLS
> +       bool "msr-tools"
> +       depends on BR2_i386 || BR2_x86_64
> +       help
> +         The MSR Tools project provides utilities to access x86 processor MSRs
> +         and CPU ID directly.
> +
> +         Those tools access the hardware through the /dev/cpu/<cpu#>/msr and
> +         /dev/cpu/<cpu#>/cpuid devices. This necessitates msr and cpuid
> +         support in the kernel.
> +
> +         https://01.org/msr-tools

Config.in is missing a depends message like this:

comment "msr-tools runs only on x86 CPUs"
        depends on !BR2_i386 && !BR2_x86_64

> diff --git a/package/msr-tools/msr-tools.hash b/package/msr-tools/msr-tools.hash
> new file mode 100644
> index 0000000..18146df
> --- /dev/null
> +++ b/package/msr-tools/msr-tools.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 9b87245ee091a798184e447066e9e0d7709b7c81f5e6ad55f2b958c1aa50c4a3 msr-tools-1.3.tar.gz
> diff --git a/package/msr-tools/msr-tools.mk b/package/msr-tools/msr-tools.mk
> new file mode 100644
> index 0000000..91a783a
> --- /dev/null
> +++ b/package/msr-tools/msr-tools.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# msr-tools
> +#
> +################################################################################
> +
> +MSR_TOOLS_VERSION = 1.3
> +MSR_TOOLS_SITE = $(call github,01org,msr-tools,msr-tools-$(MSR_TOOLS_VERSION))
> +MSR_TOOLS_SOURCE = msr-tools-$(MSR_TOOLS_VERSION).tar.gz

Do you really need MSR_TOOLS_SOURCE?

Other than that looks good to me.

Yegor

> +MSR_TOOLS_LICENSE = GPLv2+
> +
> +define MSR_TOOLS_BUILD_CMDS
> +       $(TARGET_CONFIGURE_OPTS) \
> +       $(MAKE) -C $(@D) CC="$(CCACHE) $(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
> +endef
> +
> +define MSR_TOOLS_INSTALL_TARGET_CMDS
> +       $(TARGET_CONFIGURE_OPTS) \
> +       $(MAKE) -C $(@D) install sbindir="$(TARGET_DIR)/usr/sbin"
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.7.0.rc3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
