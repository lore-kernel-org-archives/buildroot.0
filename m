Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E227CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 20:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2DE94151C;
	Sun,  7 Apr 2024 20:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtdmXIWu5Lrg; Sun,  7 Apr 2024 20:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D888E41520
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D888E41520;
	Sun,  7 Apr 2024 20:30:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 515521BF3F6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68D23414EB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBU6AWXSMxok for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 20:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75EB3414E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75EB3414E9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 20:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F14085D04; Sun,  7 Apr 2024 20:30:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 22:01:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 182756a0328d677a215551bfb2b5b22849c2d85e
X-Git-Newrev: 8a4c3c91e7af89397438bcf329954b1503b03a5e
X-Patchwork-Hint: ignore
Message-Id: <20240407203020.6F14085D04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-r5-loader: add
 BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a4c3c91e7af89397438bcf329954b1503b03a5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

This tool uses additional host python modules that must be provided by
Buildroot. So introduce a new option
BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN to add additional host packages
in U-Boot build dependency to use binman.

When BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is set, BINMAN_INDIRS
environment variable to provide the directory to search for binary
blobs and select the packages required by binman. Make sure that
ti-k3-boot-firmware package has been installed before building
ti-k3-r5-loader in order to provide such firmwares.

The BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option is currently needed
since we are in the middle of the process to switch TI AM62 and AM64
board defconfig to binman. Keep BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
disabled for them until the u-boot/ti-k3-r5-loader version bump to
2024.01.

The dependency of binman is not really easy to follow. First we have
the packages list from binman.rst [1] then we have to install
additional python modules [2]. Maybe in the future it will be
necessary to add host-lzma and host-lz4 in the dependencies list.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/binman/binman.rst?plain=1#L377
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 boot/ti-k3-r5-loader/Config.in          |  9 +++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 5f86c045c9..5f4f33b220 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -93,4 +93,13 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
+config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
+	bool "ti-k3-r5-loader use binman"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
+	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
+	help
+	  Use binman tool for generation and signing of boot images.
+
+	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
+
 endif
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0ffcb8235f..cf18b43871 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -60,6 +60,21 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN),y)
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+TI_K3_R5_LOADER_DEPENDENCIES += \
+	host-python-jsonschema \
+	host-python-pyyaml \
+	ti-k3-boot-firmware
+# Make sure that all binman requirements are build before ti-k3-r5-loader.
+TI_K3_R5_LOADER_DEPENDENCIES += \
+	host-python3 \
+	host-python-pyelftools \
+	host-python-pylibfdt \
+	host-python-setuptools
+TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+endif
+
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
