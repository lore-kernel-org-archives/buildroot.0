From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 22:25:29 +0200
Subject: [Buildroot] [1/1] package/rtl8723bs: Wi-Fi driver is now a
 Linux staging driver
In-Reply-To: <4ea4dce5-c4ac-29af-616a-b134a198770b@wanadoo.fr>
References: <4ea4dce5-c4ac-29af-616a-b134a198770b@wanadoo.fr>
Message-ID: <20180326222529.4ea91d7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Sat, 17 Mar 2018 10:45:26 +0100, Michel Stempin wrote:
> From 7cb67b022d1dbdbbac2ec06dbd7f7fdf3fd09fd3 Mon Sep 17 00:00:00 2001
> From: Michel Stempin <michel.stempin@wanadoo.fr>
> Date: Sat, 17 Mar 2018 10:02:34 +0100
> Subject: [PATCH 1/1] The rtl8723bs is now a Linux staging driver since kernel
>  4.12.

Could you send your patches with "git send-email" ? This way they would
have the proper format.

> The old git commit is used for kernel < 4.12 with patches applied, but
> for kernel >= 4.12, the newest commit featuring only binary firmwares
> is fetched and only the firmwares are installed into the target
> directory.
> 
> Getting the kernel version this early in the post-patch hook is only
> possible from the configuration, as the kernel is not yet configured
> and cannot be probed for the actual version.
> 
> Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
> ---
>  ...tl8723bs-add-debug-level-modparam.patch.conditional} |  0
>  package/rtl8723bs/rtl8723bs.mk                          | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+)
>  rename package/rtl8723bs/{0001-rtl8723bs-add-debug-level-modparam.patch => 0001-rtl8723bs-add-debug-level-modparam.patch.conditional} (100%)
> 
> diff --git a/package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch b/package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch.conditional
> similarity index 100%
> rename from package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch
> rename to package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch.conditional
> diff --git a/package/rtl8723bs/rtl8723bs.mk b/package/rtl8723bs/rtl8723bs.mk
> index 4c6303c..bc6dd4f 100644
> --- a/package/rtl8723bs/rtl8723bs.mk
> +++ b/package/rtl8723bs/rtl8723bs.mk
> @@ -4,7 +4,16 @@
>  #
>  ################################################################################
>  
> +RTL8723BS_NEEDS_SOURCES=$(shell read -r MAJ MIN \
> +	<<< $$(echo "$(BR2_LINUX_KERNEL_VERSION)" | \
> +	sed -nr 's/[^0-9]*([0-9]+)\.([0-9]+).*/\1 \2/p') && \
> +	[ "0$$MAJ" -lt 4 -o "0$$MAJ" -eq 4 -a "0$$MIN" -lt 12 ] && echo 1 ||echo 0)

Unfortunately, this doesn't work, because BR2_LINUX_KERNEL_VERSION does
not necessarily have the form x.y.z. It can be a Git commit, a Git tag,
etc.

It's in fact not possible to know the kernel version from the Buildroot
configuration, i.e without extracting/patching the kernel.

Therefore, I believe the only solution is to add a sub-option to the
rtl9723bs package to allow the user to explicitly indicate if he wants
to use the version suitable for < 4.12 or the version suitable for >=
4.12.

> +ifeq ($(RTL8723BS_NEEDS_SOURCES),1)
>  RTL8723BS_VERSION = 11ab92d8ccd71c80f0102828366b14ef6b676fb2
> +else
> +RTL8723BS_VERSION = cc77e7b6092c54500058cd027b679421b9399905
> +endif
> +
>  RTL8723BS_SITE = $(call github,hadess,rtl8723bs,$(RTL8723BS_VERSION))
>  RTL8723BS_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
>  
> @@ -16,6 +25,14 @@ RTL8723BS_MODULE_MAKE_OPTS = \
>  RTL8723BS_BINS = rtl8723bs_ap_wowlan.bin rtl8723bs_wowlan.bin \
>  	rtl8723bs_bt.bin rtl8723bs_nic.bin
>  
> +define RTL8723BS_CONDITIONAL_PATCH
> +	if [ $(RTL8723BS_NEEDS_SOURCES) -eq 1 ]; then \
> +		$(APPLY_PATCHES) $(@D) package/rtl8723bs 0001-rtl8723bs-add-debug-level-modparam.patch.conditional; \
> +	fi;
> +endef

This patch could simply go in
package/rtl8723bs/11ab92d8ccd71c80f0102828366b14ef6b676fb2/, and it
will automatically be applied only if the current version is
11ab92d8ccd71c80f0102828366b14ef6b676fb2.

Could you rework this according to those comments and submit an updated
version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
