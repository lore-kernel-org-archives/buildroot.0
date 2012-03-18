From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 15:34:05 +0100
Subject: [Buildroot] [PATCH v2] Add dtc (device tree compiler) as host
	tool
In-Reply-To: <7116d9f7fb52cdabaa12.1331744452@beantl019720>
References: <7116d9f7fb52cdabaa12.1331744452@beantl019720>
Message-ID: <201203181534.06235.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 14 March 2012 18:00:52 Thomas De Schampheleire wrote:
> The dtc is taken from the Linux kernel sources and simply copied to the host
> directory.
> Having dtc as a separate host tool can be useful for users that have a custom
> boot scenario where the device tree is not embedded in the kernel.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> v2: remove old parameters to GENTARGETS call, sorry.
> 
>  package/Config.in.host |   1 +
>  package/dtc/Config.in  |   4 ++++
>  package/dtc/dtc.mk     |  15 +++++++++++++++
>  3 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -1,5 +1,6 @@
>  menu "Host utilities"
>  
> +source "package/dtc/Config.in"
>  source "package/openocd/Config.in.host"
>  source "package/sam-ba/Config.in.host"
>  source "package/uboot-tools/Config.in.host"
> diff --git a/package/dtc/Config.in b/package/dtc/Config.in

 The file should be called Config.in.host, like the other host tools.

> new file mode 100644
> --- /dev/null
> +++ b/package/dtc/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_HOST_DTC
> +	bool "Device Tree Compiler (dtc)"
> +	help
> +	  Device Tree Compiler for flattened-device trees.

 This should depend on BR2_LINUX_KERNEL, including the appropriate 
comment.

> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> new file mode 100644
> --- /dev/null
> +++ b/package/dtc/dtc.mk
> @@ -0,0 +1,14 @@
> +#############################################################
> +#
> +# dtc
> +#
> +#############################################################
> +
> +HOST_DTC_SOURCE =
> +HOST_DTC_DEPENDENCIES = linux
> +
> +define HOST_DTC_INSTALL_CMDS
> +    $(INSTALL) -D -m 0755 $(LINUX_DIR)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc
> +endef
> +
> +$(eval $(call GENTARGETS,host))


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
