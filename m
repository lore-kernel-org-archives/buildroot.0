From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Aug 2018 12:45:19 +0200
Subject: [Buildroot] [PATCH v2 1/1] boot/uboot: missing dtc build
 dependency
In-Reply-To: <20180801143336.25420-1-david.degrave@mind.be>
References: <20180801143336.25420-1-david.degrave@mind.be>
Message-ID: <af3ceed9-cf95-a656-9df4-c6a0cf50fa82@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi David,

On 01-08-18 16:33, David De Grave (Essensium/Mind) wrote:
> When trying to include multiple DTBs in a FIT image for u-boot, the
> device tree compiler (dtc) is not build as expected and fails with the
> following error:
> 
>   DTC     arch/arm/dts/foo.dtb
> /bin/sh: ./scripts/dtc/dtc: No such file or directory
> make[4]: *** [scripts/Makefile.lib:329: arch/arm/dts/foo.dtb] Error 127
> 
> Using host-dtc instead leads to more problems than it solves and is
> kept to support older versions of u-boot where dtc support were not
> provided.
> 
> So better to keep using the U-Boot provided dtc and add a patch to fix
> this issue by adding a dependency on OF_CONTROL for OF_LIST and
> by selecting DTC for MULTI_DTB_FIT in dts/Kconfig.

 Unfortunately, since the U-Boot version is user-selectable, adding patches for
some random version doesn't make a whole lot of sense.

 In this particular case, it's easily solvable by adding CONFIG_OF_CONTROL=y to
your custom config fragment. Still, it would be good to send the patch below
upstream to U-Boot itself, because it's still not fixed in the latest version
AFAICS.

> 
> Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
> 
> ---
>  v2: Add patch to fix the dependencies in Kconfig as noticed by Arnout
>  v1: Tried to use HOST_DTC
> ---
>  .../0001-missing-dtc-dependency-in-kconfig.patch      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch
> 
> diff --git a/boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch b/boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch
> new file mode 100644
> index 0000000000..28ebf50185
> --- /dev/null
> +++ b/boot/uboot/2018.01/0001-missing-dtc-dependency-in-kconfig.patch
> @@ -0,0 +1,19 @@

 You should use a git-formatted patch, i.e. clone the U-Boot git repo, check out
the particular version you want to patch, commit your modification, and make
sure there is a proper commit message + SoB.

 For sure, the patch *must* have a description and a SoB line.

 Regards,
 Arnout

> +diff -ru a/dts/Kconfig b/dts/Kconfig
> +--- a/dts/Kconfig	2018-01-09 02:25:29.000000000 +0100
> ++++ b/dts/Kconfig	2018-08-01 15:35:57.676153869 +0200
> +@@ -113,6 +113,7 @@
> + 
> + config OF_LIST
> + 	string "List of device tree files to include for DT control"
> ++	depends on OF_CONTROL
> + 	depends on SPL_LOAD_FIT || MULTI_DTB_FIT
> + 	default DEFAULT_DEVICE_TREE
> + 	help
> +@@ -135,6 +136,7 @@
> + 
> + config MULTI_DTB_FIT
> + 	bool "Support embedding several DTBs in a FIT image for u-boot"
> ++	select DTC
> + 	help
> + 	  This option provides hooks to allow U-boot to parse an
> + 	  appended FIT image and enable board specific code to then select
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
