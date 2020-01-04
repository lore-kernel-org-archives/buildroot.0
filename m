From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 16:20:16 +0100
Subject: [Buildroot] [PATCH 2/2] package/linux-tools: add hyperv
 integration services
In-Reply-To: <07a3e4666570e40666cc8dd518ffce582bbf7f38.1578081397.git.yann.morin.1998@free.fr>
References: <cover.1578081397.git.yann.morin.1998@free.fr>
 <07a3e4666570e40666cc8dd518ffce582bbf7f38.1578081397.git.yann.morin.1998@free.fr>
Message-ID: <20200104162016.6ed7f3a2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jan 2020 20:57:05 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> From: Pascal de Bruijn <p.debruijn@unilogic.nl>
> 
> The hyperv integration services offer convenience features for guest
> operating systems running on the microsoft hyperv virtualization
> platform. They roughly are for HyperV what openvmtools are for VMWare.
> 
> The installed binary names are derived from what seems common in large
> distros like RedHat:
> 
>   linux kernel source name -> installed binary name
>              hv_vss_daemon -> hypervvssd
>              hv_kvp_daemon -> hypervkvpd
>            hv_fcopy_daemon -> hypervfcopyd
> 
> Each tool was introduced at different points in the kernel history, so
> we need to check each of them.
> 
> We provide a single init script that is responsible for starting all
> enabled programs. The global status will be the status of the last
> program to fail to start, or empty (i.e. success) if they all started
> successfuly.
> 
> However, we provide one systemd unit per program, because it is not easy
> to use a single unit to start (and monitor) more than one executable.
> Additionally, we do not provide a template that is filled at tinstall
> time either, because it does not gain much (three simple units vs. a
> template and some replacement code in the .mk).
> 
> Finally, the key-value daemon uses a few helper scripts to get/set the
> network config. All are optional (their presence is checked before
> running them), but one, hv_set_ifconfig. However, it is not strictly
> speaking required either, so we just symlink it to /bin/true to avoid
> any warning at runtime. Providing actual helpers is left to the end
> user, to adapt to their own environment.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> [yann.morin.1998 at free.fr:
>   - aggregate all three tools in a single sub-package
>   - introduce the main HV option, use a sub-option for each tool
>   - aggregate the three init scripts into one
>   - don't install the helpers; symlink the mandatory one
>   - don't create symlinks for systemd units (systemctl preset-all does
>     it for us now)
>   - expand commit log
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks applied to master, with just one very minor change.

> +config BR2_PACKAGE_LINUX_TOOLS_HV
> +	bool "hv"
> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_LINUX_TOOLS
> +	select BR2_PACKAGE_LINUX_TOOLS_HV_KVP_DAEMON if !BR2_PACKAGE_LINUX_TOOLS_HV_HAS_ONE
> +	help
> +	  Microsoft HyperV integration services
> +
> +	  Relevant kernel configuration options: HYPERV, HYPERV_UTILS

Changed to CONFIG_HYPERV and CONFIG_HYPERV_UTILS, as we generally point
to kernel options including their CONFIG_ prefix.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
