From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Nov 2014 23:58:23 +0100
Subject: [Buildroot] [PATCH 1/1] nvidia-tegra23: new package
In-Reply-To: <1415202733-13295-1-git-send-email-nicolas.serafini@sensefly.com>
References: <1415202733-13295-1-git-send-email-nicolas.serafini@sensefly.com>
Message-ID: <20141119225823.GL3779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2014-11-05 16:52 +0100, Nicolas Serafini spake thusly:
> This patch adds a new package for all libraries, drivers and codecs
> provided by Nvidia Linux 4 Tegra release 16.4.0.
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

A quick quesytion about Tegra 2 support:

[--SNIP--]
> diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
> new file mode 100644
> index 0000000..a5a0681
> --- /dev/null
> +++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
> @@ -0,0 +1,119 @@
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
> +	bool "nvidia-tegra23"
> +	depends on BR2_arm && BR2_cortex_a9
> +	depends on BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXT
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXV
> +	select BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_HAS_LIBOPENMAX
> +	help
> +	  Those packages provide libraries, drivers and firmware that comes from
> +	  NVIDIA Linux For Tegra.
> +
> +	  https://developer.nvidia.com/linux-tegra
> +
> +if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
[--SNIP--]
> +choice
> +	prompt "Tegra platform"
> +	help
> +	  Select the SOC platform.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA2
> +	bool "Tegra 2"
> +	depends on !BR2_ARM_CPU_HAS_NEON

Usually, we require _presence_ of a feature, not _abscence_ of it.

Surely, if the CPU has NEON, it won't be used by the driver, but the
driver won't break.

Yes, Tegra-2 does not have NEON. But that's not the way NEON was meant
to be used for.

Also, see below...

> +	help
> +	  NVIDIA Tegra 2 is a dual cores Cortex-A9 without NEON.
> +
> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA3
> +	bool "Tegra 3"

Here, you do not have a "depends on HAS_NEON", while it would make much
more sense to only display Tegra-3 is NEON is enabled, because otherwise
I'd expect the driver to fail on a CPU without NEON.

So, here's what I'm gonna do:
  - Tegra-2 always visible, NEON or not
  - Tegra-3 only visible if NEON enabled

Does that make sense for you?

Regards,
Yann E. MORIN.

PS. Hey! I did not forget to trim the reply, this time! :-)
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
