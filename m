From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 May 2013 15:39:30 +0200
Subject: [Buildroot] [PATCH 18/20] gpu-viv-bin-mx6q: new package
In-Reply-To: <1369606110-8088-19-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:28 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-19-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v2x7vn1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
 Thomas> This patch adds a new package for the OpenGL, OpenVG and EGL
 Thomas> proprietary implementations specific to the Vivante GPU of i.MX6
 Thomas> processors.

 Thomas> Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/freescale-imx/Config.in                    |    1 +
 Thomas>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in   |   30 ++++++++
 Thomas>  ...gpu-viv-bin-mx6q-0001-correct-HAL-include.patch |   16 ++++
 Thomas>  .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |   79 ++++++++++++++++++++
 Thomas>  4 files changed, 126 insertions(+)
 Thomas>  create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/Config.in
 Thomas>  create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-0001-correct-HAL-include.patch
 Thomas>  create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk

 Thomas> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
 Thomas> index 840b83b..7c22f79 100644
 Thomas> --- a/package/freescale-imx/Config.in
 Thomas> +++ b/package/freescale-imx/Config.in
 Thomas> @@ -3,5 +3,6 @@ menu "Freescale i.MX libraries"
 
 Thomas>  source "package/freescale-imx/imx-lib/Config.in"
 Thomas>  source "package/freescale-imx/firmware-imx/Config.in"
 Thomas> +source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
 
 Thomas>  endmenu
 Thomas> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..37f8e03
 Thomas> --- /dev/null
 Thomas> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
 Thomas> @@ -0,0 +1,30 @@
 Thomas> +config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 Thomas> +	bool "gpu-viv-bin-mx6q"
 Thomas> +	select BR2_PACKAGE_HAS_OPENGL_EGL
 Thomas> +	select BR2_PACKAGE_HAS_OPENGL_ES
 Thomas> +	depends on BR2_arm # Only relevant for i.MX6
 Thomas> +	 # Library binaries are linked against libc.so.6
 Thomas> +	depends on BR2_TOOLCHAIN_CTNG_glibc || \
 Thomas> +		BR2_TOOLCHAIN_CTNG_eglibc || \
 Thomas> +		BR2_TOOLCHAIN_EXTERNAL_GLIBC

We should also inform the user about this, so I've added a comment
option, similar to how we handle to other toolchain options.

 Thomas> +	help
 Thomas> +	  Userspace libraries for Vivante GPU on i.MX6 platforms
 Thomas> +
 Thomas> +	  It contains libraries and headers for GLES, OpenCL, and
 Thomas> +	  OpenVG.  It also contains a DRI plugin for X11. It also
 Thomas> +	  contains a plugin for DirectFB-1.4.0, but that doesn't work
 Thomas> +	  together with buildroot's DirectFB-1.4.16.

This is already outdated, so I changed this to 'buildroot's DirectFB
version'.

Committed to next, thanks - But I don't see it hooked up with the
opengl/* virtual packages, so it doesn't seem really useful yet.

What kind of kernel dependencies does this package have?

-- 
Bye, Peter Korsgaard
