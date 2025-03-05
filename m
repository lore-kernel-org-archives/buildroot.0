Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FA9C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 20:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B3D40BFC;
	Wed,  5 Mar 2025 20:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeJuIpkFg29e; Wed,  5 Mar 2025 20:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CD0240953
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CD0240953;
	Wed,  5 Mar 2025 20:02:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E760E2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A56840805
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-LSE_Gzbsjb for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 20:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CFD14080F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CFD14080F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEEEB87EF1; Wed,  5 Mar 2025 20:02:28 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Mar 2025 20:07:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d1deb3d191972e1e17a8b7f415f6e5653438580
X-Git-Newrev: 290f6bb45a247e3b5d1718d29dc5ec4e9ea774f4
X-Patchwork-Hint: ignore
Message-Id: <20250305200228.EEEEB87EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: introduce
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3024093607600209242=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3024093607600209242==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=290f6bb45a247e3b5d1718d29dc5ec4e9ea774f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Linux 6.12, the Buildroot option BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
does not work as expected on arm, arm64, mips and riscv[1]. These are
the architectures that store the in-tree DTS files in vendor-specific
subdirectories of arch/$ARCH/boot/dts/.

BR2_LINUX_KERNEL_CUSTOM_DTS_PATH was introduced in Buildroot 2012.08
(commit 69fc497df0ae "Rework support for the device tree"). At the time,
the kernel kept all in-tree DTS files directly in arch/$ARCH/boot/dts/,
and this is where Buildroot drops the user's custom DTS. Vendor-specific
subdirectories appeared in Linux v3.19 for the arm64 architecture, and
this scheme was later adopted by mips, riscv and arm.

For these architectures, Linux 6.12 (commit e7e2941300d2, "kbuild: split
device tree build rules into scripts/Makefile.dtbs") made the DTB build
infrastructure incompatible with the way
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH is implemented. This infrastructure now
expects all DTS files to be in vendor-specific subdirectories on the
architectures that use this scheme.

We can't update easily the current behavior of
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH since it expect a list of files but
can also be used "unexpectedly" with directories [2].

  BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp135f-dk-mx"
  BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="$(BR2_EXTERNAL_ST_PATH)/[...]/linux-dts/st"

In this case, the st directory is copied into the arch/$ARCH/boot/dts/
and BR2_LINUX_KERNEL_INTREE_DTS_NAME is used to build stm32mp135f-dk-mx dtb
as if it was intree.

Introduce BR2_LINUX_KERNEL_CUSTOM_DTS_DIR configuration
parameter to specify a list of directories that are copied as-is over
the arch/<arch>/boot/dts/ directory before building the device tree
blob:

  board/acmesystems/acqua-a5/dts/
  └── microchip
      └── at91-sama5d3_acqua.dts

defconfig:
  BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"

Each dts file found is automatically added to the list of devicetree
to build.

BR2_LINUX_KERNEL_CUSTOM_DTS_DIR can also be used for external
devicetree overlays files:

  board/ti/am574x-idk/dts/
  └── ti
      └── omap
          └── am57xx-evm.dtso

With this new option, BR2_LINUX_KERNEL_CUSTOM_DTS_PATH is now deprecated.

Note: We want to create a list of dts files (LINUX_DTS_LIST) present in
diectrories listed by BR2_LINUX_KERNEL_CUSTOM_DTS_DIR. But
LINUX_DTS_LIST must not contain BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
paths. Use GNU 'find' print format %P to print each dts file path
without their respective dts overlay directory path.
Do the same for LINUX_DTSO_LIST.

Thanks to Edgar Bonet for the initial contribution [3].

[1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
[2] https://github.com/bootlin/buildroot-external-st/blob/541ba7d96330cd7da5674b46806b549a7ccf9da8/configs/st_stm32mp135f_dk_demo_defconfig#L21
[3] https://lore.kernel.org/buildroot/93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr/

Cc: Michael Walle <michael@walle.cc>
Cc: Gaël PORTAY <gael.portay+rtone@gmail.com>
Reported-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
[Romain:
  - Rework the initial contribution by Edgar Bonet by
    BR2_LINUX_KERNEL_CUSTOM_DTS_DIR following
    Michael Walle comments and Gaël PORTAY review.
  - Reword the commit log accordingly.
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in | 29 +++++++++++++++++++++++++++++
 linux/linux.mk  | 17 +++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index d6a0ace6c0..ad9bb57439 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -435,6 +435,7 @@ config BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
 
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
+	depends on BR2_LINUX_KERNEL_CUSTOM_DTS_DIR = ""
 	help
 	  Paths to out-of-tree Device Tree Source (.dts), Device Tree
 	  Source Include (.dtsi) and Device Tree Overlay Source (.dtso)
@@ -442,6 +443,34 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	  kernel sources and the .dts files will
 	  be compiled from there.
 
+	  Due to a kernel build system changes in 6.12,
+	  BR2_LINUX_KERNEL_CUSTOM_DTS_PATH is now deprecated and
+	  replaced by BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
+
+config BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
+	string "Out-of-tree Device Tree Source overlay directories"
+	help
+	  Specify a list of directories that are copied as-is over the
+	  arch/<arch>/boot/dts/ directory before building the device
+	  tree blob.
+
+	  This overlay can contain dts, dtso and dtsi files.
+
+	  BR2_LINUX_KERNEL_CUSTOM_DTS_DIR should point to one or more
+	  directories containing a vendor subdirectory (e.g. rockchip)
+	  which contains the dts files. This vendor subdirectory should
+	  match the vendor subdirectory used by the board in the kernel
+	  (e.g. arch/arm64/boot/dts/rockchip/).
+
+	  While most architechtures make use of vendor subdirectories,
+	  like arm, arm64 and riscv, some architectures like powerpc
+	  and xtensa do not.
+	  In this case, BR2_LINUX_KERNEL_CUSTOM_DTS_DIR should point to
+	  a directory containing the dts files directly.
+
+	  Since the 6.12 release, each out-of-tree Device Tree Source
+	  file must be copied into their corresponding sub-directory.
+
 config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
 	bool "Keep the directory name of the Device Tree"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 9c621c18d5..f915823dcf 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -213,6 +213,22 @@ LINUX_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
 LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
 LINUX_DTSO_NAMES += $(basename $(filter %.dtso,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
 
+LINUX_KERNEL_CUSTOM_DTS_DIR = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_DIR))
+ifneq ($(LINUX_KERNEL_CUSTOM_DTS_DIR),)
+# Use evaluation-during-assignment using := to avoid any re-evaluation
+# of LINUX_DTS_LIST when LINUX_DTS_NAME is used.
+LINUX_DTS_LIST := $(shell find $(LINUX_KERNEL_CUSTOM_DTS_DIR) -name '*.dts' -printf '%P\n' 2>/dev/null)
+LINUX_DTSO_LIST := $(shell find $(LINUX_KERNEL_CUSTOM_DTS_DIR) -name '*.dtso' -printf '%P\n' 2>/dev/null)
+LINUX_DTS_NAME += $(basename $(LINUX_DTS_LIST))
+LINUX_DTSO_NAMES += $(basename $(LINUX_DTSO_LIST))
+
+define LINUX_COPY_CUSTOM_DTS_FILES
+	$(foreach d, $(LINUX_KERNEL_CUSTOM_DTS_DIR), \
+		@$(call MESSAGE,"Copying devicetree overlay $(d)")$(sep) \
+		$(Q)$(call SYSTEM_RSYNC,$(d),$(LINUX_ARCH_PATH)/boot/dts/)$(sep))
+endef
+endif
+
 LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
@@ -527,6 +543,7 @@ define LINUX_BUILD_CMDS
 	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
 		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
 	)
+	$(LINUX_COPY_CUSTOM_DTS_FILES)
 	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
 	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	$(LINUX_BUILD_DTB)

--===============3024093607600209242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3024093607600209242==--
