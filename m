Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FC4C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3297460EFF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3297460EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02B0083A99;
	Tue,  3 Aug 2021 22:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rHdru6Hs3B0r; Tue,  3 Aug 2021 22:20:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A2D783145;
	Tue,  3 Aug 2021 22:20:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19BBD1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2C2F40520
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4DknCmZBKG5 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 519AA404C9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9719183875; Tue,  3 Aug 2021 21:09:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 May 2021 22:36:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0e429b176b459e1050203cafe435d6749c38741e
X-Git-Newrev: 02a0b30b2c666ebe55829373fad547ebe13e82e6
X-Patchwork-Hint: ignore
Message-Id: <20210803210941.9719183875@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/rpi: properly fix
 defconfigs after upstream rebased
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=02a0b30b2c666ebe55829373fad547ebe13e82e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 8c3f281626fb (configs/rpi: fix defconfigs after upstream rebased)
attempted to point the raspberrypi defconfigs to an existing commit in
the linux rpi repository.

However, in doing so, only a partial replacement was done: the version
string in the tarball filename was not replaced (missing 'g' to the sed
expression).

Fix that now.

Reported-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/raspberrypi0_defconfig       | 2 +-
 configs/raspberrypi0w_defconfig      | 2 +-
 configs/raspberrypi2_defconfig       | 2 +-
 configs/raspberrypi3_64_defconfig    | 2 +-
 configs/raspberrypi3_defconfig       | 2 +-
 configs/raspberrypi3_qt5we_defconfig | 2 +-
 configs/raspberrypi4_64_defconfig    | 2 +-
 configs/raspberrypi4_defconfig       | 2 +-
 configs/raspberrypi_defconfig        | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 4cccad83f7..5ca003cbec 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 9833571e9e..bced6c5d4a 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index ca65ba5259..47807688da 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index de50bdf550..3be53b6c8d 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 2bf96ca4c5..74f5a23682 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 69c02daf3d..1e9061435c 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index eeaece49eb..16777bcef1 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 85ba477d9f..139bed0c3f 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 8921faf56f..de1248f36b 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-96110e96f1a82e236afb9a248258f1ef917766e9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
