From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 22:43:53 +0100
Subject: [Buildroot] [PATCH] libdrm: disable drivers for sparcv8
In-Reply-To: <20160118210041.GA19430@waldemar-brodkorb.de>
References: <20160118210041.GA19430@waldemar-brodkorb.de>
Message-ID: <20160118224353.2e02cf1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Mon, 18 Jan 2016 22:00:42 +0100, Waldemar Brodkorb wrote:
> The drivers use atomic ops as CAS, which fails
> to compile for sparcv8, but works fine for leon3.
> 
> Fixes following autobuild error:
> http://autobuild.buildroot.net/results/fa0ac44d3c7953b2e2afa03cd7570d8a5d49fcc4/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libdrm/Config.in |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
> index 445a85b..bacbeac 100644
> --- a/package/libdrm/Config.in
> +++ b/package/libdrm/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
>  	  This option allows to install the libdrm test programs.
>  
>  menu "DRM Drivers"
> +depends on !BR2_sparc_v8 # drivers need atomic ops

What about the packages that select some libdrm drivers? I'm thinking
for example of:

config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
        bool "DRI nouveau driver"
        select BR2_PACKAGE_MESA3D_DRI_DRIVER
        select BR2_PACKAGE_LIBDRM_NOUVEAU
        help
          Support for Nvidia-based GPUs.

config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
        bool "DRI radeon driver"
        select BR2_PACKAGE_MESA3D_DRI_DRIVER
        select BR2_PACKAGE_LIBDRM_RADEON
        help
          Legacy Radeon driver for R100 series GPUs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
