From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 15 Jan 2019 08:45:03 -0600
Subject: [Buildroot] [PATCH] package/rtc-tools: new package
In-Reply-To: <20190115093229.8772-1-thomas.petazzoni@bootlin.com>
References: <20190115093229.8772-1-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpY7qA8ZwsSRuqXwwHwv-FRDYUYXC1gLuBjgg=tE9VEWVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Alexandre,

On Tue, Jan 15, 2019 at 3:32 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This package contains a set of tools to manipulate RTC devices. They
> are written and maintained by the RTC subsystem Linux kernel
> maintainer, Alexandre Belloni.
>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/rtc-tools/Config.in      |  7 +++++++
>  package/rtc-tools/rtc-tools.hash |  3 +++
>  package/rtc-tools/rtc-tools.mk   | 26 ++++++++++++++++++++++++++
>  5 files changed, 38 insertions(+)
>  create mode 100644 package/rtc-tools/Config.in
>  create mode 100644 package/rtc-tools/rtc-tools.hash
>  create mode 100644 package/rtc-tools/rtc-tools.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index aa1bf325cb..c1950bb0f4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2130,6 +2130,7 @@ F:        package/python-serial/
>  F:     package/qextserialport/
>  F:     package/rpcbind/
>  F:     package/rt-tests/
> +F:     package/rtc-tools/
>  F:     package/sam-ba/
>  F:     package/scons/
>  F:     package/squashfs/
> diff --git a/package/Config.in b/package/Config.in
> index 0df9b73088..5036421a73 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -500,6 +500,7 @@ endmenu
>         source "package/rng-tools/Config.in"
>         source "package/rpi-userland/Config.in"
>         source "package/rs485conf/Config.in"
> +       source "package/rtc-tools/Config.in"
>         source "package/rtl8188eu/Config.in"
>         source "package/rtl8189fs/Config.in"
>         source "package/rtl8723bs/Config.in"
> diff --git a/package/rtc-tools/Config.in b/package/rtc-tools/Config.in
> new file mode 100644
> index 0000000000..78f5c06049
> --- /dev/null
> +++ b/package/rtc-tools/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_RTC_TOOLS
> +       bool "rtc-tools"
> +       help
> +         This package provide a set of user-space tools that can be
> +         used to manipulate Real Time Clock Devices.
> +
> +         https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/
> diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
> new file mode 100644
> index 0000000000..81be1afe4e
> --- /dev/null
> +++ b/package/rtc-tools/rtc-tools.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 152d8455bae5ad672e99bb91dfbed5b8b4bd8b0325146d1cf1c4d80b6e0d8a16 rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7.tar.gz
> +sha256 7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a COPYING
> diff --git a/package/rtc-tools/rtc-tools.mk b/package/rtc-tools/rtc-tools.mk
> new file mode 100644
> index 0000000000..5e9d040b27
> --- /dev/null
> +++ b/package/rtc-tools/rtc-tools.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# rtc-tools
> +#
> +################################################################################
> +
> +RTC_TOOLS_VERSION = 33ef4aa1c92b0c92a351284d93d1ac5570de9cc7
> +RTC_TOOLS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git
> +RTC_TOOLS_LICENSE = GPL-2.0
> +RTC_TOOLS_LICENSE_FILES = COPYING
> +
> +RTC_TOOLS_BINARIES = rtc rtc-sync rtc-range
> +
> +define RTC_TOOLS_BUILD_CMDS
> +       $(foreach bin,$(RTC_TOOLS_BINARIES),\
> +               $(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/$(bin) $(@D)/$(bin).c
> +       )
> +endef
> +
> +define RTC_TOOLS_INSTALL_TARGET_CMDS
> +       $(foreach bin,$(RTC_TOOLS_BINARIES),\
> +               $(INSTALL) -D -m0755 $(@D)/$(bin) $(TARGET_DIR)/usr/bin/$(bin)
> +       )
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
