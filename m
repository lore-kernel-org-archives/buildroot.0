From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 15:16:00 +0100
Subject: [Buildroot] [PATCH 1/2] package/linux-tools: add hyperv
 integration services
In-Reply-To: <20191206131659.6646-1-p.debruijn@unilogic.nl>
References: <20191206131659.6646-1-p.debruijn@unilogic.nl>
Message-ID: <20191206151600.2ea6979e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal,

On Fri,  6 Dec 2019 14:16:59 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> includes: hv_vss_daemon, hv_kvp_daemon & hv_fcopy_daemon
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/linux-tools/Config.in                      | 40 +++++++++++++++++++++
>  .../linux-tools/linux-tool-hv_fcopy_daemon.init    | 24 +++++++++++++
>  .../linux-tools/linux-tool-hv_fcopy_daemon.mk.in   | 39 ++++++++++++++++++++
>  .../linux-tools/linux-tool-hv_fcopy_daemon.service | 11 ++++++
>  package/linux-tools/linux-tool-hv_kvp_daemon.init  | 24 +++++++++++++
>  package/linux-tools/linux-tool-hv_kvp_daemon.mk.in | 42 ++++++++++++++++++++++
>  .../linux-tools/linux-tool-hv_kvp_daemon.service   | 11 ++++++
>  package/linux-tools/linux-tool-hv_vss_daemon.init  | 24 +++++++++++++
>  package/linux-tools/linux-tool-hv_vss_daemon.mk.in | 38 ++++++++++++++++++++
>  .../linux-tools/linux-tool-hv_vss_daemon.service   | 11 ++++++
>  package/linux-tools/linux-tools.mk                 | 10 ++++++
>  11 files changed, 274 insertions(+)

I think it would be nice to add yourself to the DEVELOPERS file for
those new files.

> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index ab8cc38..bd6c987 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -116,4 +116,44 @@ config BR2_PACKAGE_LINUX_TOOLS_TMON
>  	  tmon is a terminal-based tool (using curses) that allows the
>  	  user to access thermal information about the system.
>  
> +menu "Microsoft HyperV Integration Services"
> +
> +config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
> +	bool "hv_vss_daemon"
> +        depends on BR2_i386 || BR2_x86_64

Indentation for this line is not correct.

> +	  Relevant kernel configuration options:
> +	  HYPERV (HYPERVISOR_GUEST X86_LOCAL_APIC ACPI X86)

It's not clear what are those options between parenthesis.

> +	  HYPERV_UTILS (CONNECTOR NLS)
> +
> +config BR2_PACKAGE_LINUX_TOOLS_HV_KVP_DAEMON
> +        bool "hv_kvp_daemon"
> +        depends on BR2_i386 || BR2_x86_64
> +        select BR2_PACKAGE_LINUX_TOOLS
> +        help

Indentation is not correct, you should use one tab. Please run "make
check-package" to verify the syntax of Config.in.


> diff --git a/package/linux-tools/linux-tool-hv_fcopy_daemon.init b/package/linux-tools/linux-tool-hv_fcopy_daemon.init
> new file mode 100644
> index 0000000..cb20241
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-hv_fcopy_daemon.init
> @@ -0,0 +1,24 @@
> +#!/bin/sh
> +
> +NAME="hv_fcopy_daemon"
> +DAEMON="/usr/sbin/${NAME}"
> +
> +case "$1" in
> +start)
> +        printf "Starting ${NAME}: "
> +        start-stop-daemon -S -x ${DAEMON}
> +        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
> +        ;;
> +stop)
> +        printf "Stopping ${NAME}: "
> +        start-stop-daemon -K -x ${DAEMON}
> +        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
> +        ;;
> +restart|reload)
> +        $0 stop
> +        $0 start
> +        ;;
> +*)
> +        echo "Usage: $0 {start|stop|restart|reload}"
> +        exit 1
> +esac

Make sure to use package/busybox/S01logging as a template for the init
scripts.


> +define HV_FCOPY_DAEMON_INSTALL_INIT_SYSTEMD
> +        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +        $(INSTALL) -m 0644 -D package/linux-tools/linux-tool-hv_fcopy_daemon.service \
> +                $(TARGET_DIR)/usr/lib/systemd/system/hv_fcopy_daemon.service
> +	ln -sf ../../../../usr/lib/systemd/system/hv_fcopy_daemon.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/hv_fcopy_daemon.service
> +endef
> +
> +define HV_FCOPY_DAEMON_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/linux-tools/linux-tool-hv_fcopy_daemon.init \
> +		$(TARGET_DIR)/etc/init.d/S10hv_fcopy_daemon
> +endef

Did you see my reply on your previous version of the patch, which says
that these two variables will never be used, because HV_FCOPY_DAEMON is
not a Buildroot package ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
