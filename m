From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 20 Jun 2011 17:01:27 +0200
Subject: [Buildroot] [PATCH 24/26] Improve TARGETS handling for
 bootloaders and kernel
In-Reply-To: <c1adbad069c35089a9ff5d9c8fc930e483b4b3d4.1306782275.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
 <c1adbad069c35089a9ff5d9c8fc930e483b4b3d4.1306782275.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4DFF60C7.3010802@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> As the kernel and bootloaders do not use the normal BR2_PACKAGE_*
> Kconfig options, their target name was not automatically added to the
> global TARGETS variable. Each bootloader .mk and the linux.mk had to
> add their own target manually to TARGETS, and the package
> infrastructure was making tests on non-existing Kconfig variables.
>
> This commit improves the package infrastructure so that it looks at
> BR2_PACKAGE_<pkg>  for packages, BR2_BOOT_<pkg>  for bootloaders and at
> the special BR2_LINUX_KERNEL for the linux package.
>
> This allows to simplify a little bit the bootloaders and linux .mk
> files.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
[...snip...]
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -522,10 +522,20 @@ $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
>   $$($(2)_TARGET_CLEAN):			PKG=$(2)
>   $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
>
> +# Compute the name of the Kconfig option that correspond to the
> +# package being enabled. We handle three cases: the special Linux
> +# kernel case, the bootloaders case, and the normal packages case.
> +ifeq ($(1),linux)
> +$(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
> +else ifeq ($(4),boot)
> +$(2)_KCONFIG_VAR = BR2_BOOT_$(2)
> +else ifeq ($(4),package)
> +$(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
> +endif

This breaks all packages in subdirectories, such as
package/multimedia/ffmpeg, for which $(4) == "package/multimedia".

This can be fixed as:

-else ifeq ($(4),package)
+else ifeq ($(firstword $(subst /, ,$(4))),package)

or, even more simply:

-else ifeq ($(4),package)
+else

Luca
