From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 21:55:48 +0100
Subject: [Buildroot] [PATCH] package/linux-tools: add hv_vss_daemon
In-Reply-To: <20191205154428.7547-1-p.debruijn@unilogic.nl>
References: <20191205154428.7547-1-p.debruijn@unilogic.nl>
Message-ID: <20191205215548.374faeed@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal,

On Thu,  5 Dec 2019 16:44:28 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> hyperv integration services for snapshotting a running vm
> 
> hv_vss_daemon facilitates a FIFREEZE initiated from the hypervisor
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Thanks for the patch, but I believe it was insufficiently tested :-/

> diff --git a/package/linux-tools/linux-tool-hv_vss_daemon.mk.in b/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
> new file mode 100644
> index 0000000..2de13a7
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-hv_vss_daemon.mk.in
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# hv_vss_daemon
> +#
> +################################################################################
> +
> +LINUX_TOOLS += hv_vss_daemon
> +
> +HV_VSS_DAEMON_MAKE_OPTS = CROSS=$(TARGET_CROSS)

This is not sufficient, with just this, the user-space program is
compiled with the host compiler, and therefore the build fails with:

ERROR: architecture for "/usr/sbin/hv_vss_daemon" is "Advanced Micro Devices X86-64", should be "ARM"

To fix this, don't pass CROSS=, but just pass $(LINUX_MAKE_FLAGS), just
like most other linux-tools makefiles are doing.

> +define HV_VSS_DAEMON_INSTALL_INIT_SYSTEMD

This cannot work, as it will never be called: hv-vss-daemon is not a
package from the point of view of Buildroot. What is a package is
"linux-tools".

The reason why HV_VSS_DAEMON_INSTALL_TARGET_CMDS works is because we
have some special logic in package/linux-tools/linux-tools.mk:

LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
        $(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
                $(call UPPERCASE,$(tool))_INSTALL_TARGET_CMDS))

but there is nothing like this for _INSTALL_INIT_SYSTEMD, so I don't
see how this variable could have ever been called.

Did you actually test this, and verified that the systemd unit was
installed as expected ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
