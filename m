From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 16 Oct 2014 21:21:54 +0200
Subject: [Buildroot] [PATCH v3 1/2] pps-tools: new package
In-Reply-To: <1413480654-59217-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1413480654-59217-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <54401AD2.2080308@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

> From: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
>
> Added pps-tools package to add support to the ntpd for a
> pps source (requires timepps.h from pps-tools as part of ntpd
> build).
>
> Signed-off-by: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> ---
> Changes v2 -> v3
>   - Cleaned up make env/opts (Suggested Thomas P)
>
> Changes v1 -> v2
>   - Adjusted newlines (Suggested Thomas P)
>   - Updated license to GPLv2+ (Suggested Thomas P)
>   - Build cmd to use config opts env (Suggested Thomas P)
>   - Install step to use pkg install (Suggested Thomas P)
>   - Github helper for download (Suggested Ryan B)
>
>   package/Config.in              |  1 +
>   package/pps-tools/Config.in    |  6 ++++++
>   package/pps-tools/pps-tools.mk | 27 +++++++++++++++++++++++++++
>   3 files changed, 34 insertions(+)
>   create mode 100644 package/pps-tools/Config.in
>   create mode 100644 package/pps-tools/pps-tools.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 93e148d..8c109a5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -351,6 +351,7 @@ endif
>   	source "package/parted/Config.in"
>   	source "package/pciutils/Config.in"
>   	source "package/picocom/Config.in"
> +	source "package/pps-tools/Config.in"

This should be alphabetically ordered.

Regards,
Jerzy

>   	source "package/pifmrds/Config.in"
>   	source "package/read-edid/Config.in"
>   	source "package/rng-tools/Config.in"
> diff --git a/package/pps-tools/Config.in b/package/pps-tools/Config.in
> new file mode 100644
> index 0000000..83308f4
> --- /dev/null
> +++ b/package/pps-tools/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PPS_TOOLS
> +	bool "pps-tools"
> +	help
> +	  Pulse per second tools. Provides timepps.h and other PPS utilities.
> +
> +	  https://github.com/ago/pps-tools/
> diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
> new file mode 100644
> index 0000000..7c09e6a
> --- /dev/null
> +++ b/package/pps-tools/pps-tools.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# pps-tools
> +#
> +################################################################################
> +
> +PPS_TOOLS_VERSION = 0deb9c7e135e9380a6d09e9d2e938a146bb698c8
> +PPS_TOOLS_SITE = $(call github,ago,pps-tools,$(PPS_TOOLS_VERSION))
> +PPS_TOOLS_INSTALL_STAGING = YES
> +PPS_TOOLS_LICENSE = GPLv2+
> +PPS_TOOLS_LICENSE_FILES = COPYING
> +
> +define PPS_TOOLS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> +endef
> +
> +define PPS_TOOLS_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/include/sys $(STAGING_DIR)/usr/bin
> +	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
> +endef
> +
> +define PPS_TOOLS_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/include/sys $(TARGET_DIR)/usr/bin
> +	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
