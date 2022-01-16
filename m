Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C2AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 20:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1278940322;
	Sun, 16 Jan 2022 20:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XmT5uYNO_pg6; Sun, 16 Jan 2022 20:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E43040325;
	Sun, 16 Jan 2022 20:25:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E26041BF2BC
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 20:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C77974033F
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 20:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="HXpR71/0";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="iVhh+PIG"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZmJ3gcmE7vC for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 20:25:53 +0000 (UTC)
X-Greylist: delayed 00:09:42 by SQLgrey-1.8.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87144401CC
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 20:25:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D80595C0049
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 15:16:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 16 Jan 2022 15:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=date
 :from:to:subject:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=+gc+lUpWXWcjsA4WUJ1JKd4/tC
 uTAFCPOG8J7+w0rxw=; b=HXpR71/0ilTnW3bi1QnGsdxDHUE399CuDHIyszPBX2
 cXQ/y2ipF0Ss7b4Ign4XmPtS3mPsmokWSTsj/yYKEsWzc0ovxOfN46B0ptoJQsfL
 3OBf4mI9xiibZC08OPTTaxb6z4fP0S3NOl704Lja6HvyuKqrx1NMwhrXVudi88Xx
 kAvw8fepV9LAsTM5bV/cGgmZRqc1i+PJ4s+7jHUyjsrglU92BO1c2KpxUpkgmWZx
 jti9SsIUOGLyWN6zKWYIUdCoj3795sG3QZC+xYlrPbLeeUEReWRQi/qkH0nFvpCx
 OxMcxHBT+RSQkt0lc7HcGMuevmo7JN0Q/MskFzwG993A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+gc+lU
 pWXWcjsA4WUJ1JKd4/tCuTAFCPOG8J7+w0rxw=; b=iVhh+PIG/3aeEZJdnx43+F
 DB0Tog5Ug9ynhslphMljFZS7Tekiy2Ui3NaXTWucwvswOAqrBCjOeMRupt6rur/B
 Uiif3U6gDUMRusA6jFHSwbB07gX5Pmh72LTTY7ZYboJ/mDZu7qGz2re0LRk/YGbG
 bYjpZDsGEi4l70Yf31sssHGES4CQBdr/frYZtmFrh9SeWLYhHaJHksR6Ma0euQQO
 QEjSZOHmPbbMtpG0k6MSqeiWf31WY2WNks2FSAOL454RrfyUycBqJbtWTb+LrxXf
 wTe3u0LmWBZ5KedS6TOa1yo8xaFkdxsHMMPx6ZCYOBzdGjPg/SWnSx9ax/oZYUNQ
 ==
X-ME-Sender: <xms:B33kYYTQBbam6Oa88tuP17Wn_aHylJVt2lA4jpGk0Z5V0RZe5qrJxg>
 <xme:B33kYVx8drMT56_H7ITzi8cUtDd_jdm0mlZ0aLZqI2aKWfC3jPhmfqjId4iOT5T2O
 89KuzNjXXRe_AR_>
X-ME-Received: <xmr:B33kYV3zXUHI-L3LhoKIrKRmw-ukTPSy-1Dc0-IlRLhlbK6sZT0WNaEXpyj3xgEBTk6uVtNVWLfnDulkfiIC8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdelgddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkofggtgfgsehtjeertd
 ertddvnecuhfhrohhmpeffrghnihhlohcuuegrrhhgvghnuceomhgrihhlsegusghrghhn
 rdgthheqnecuggftrfgrthhtvghrnhepueffuddtudfgtdduhedtjeeikeefgfektefhue
 efveefuedtffehveeujeefkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrihhlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:B33kYcCYRYJZS6J-RfsGPhV_KiCPu5WkDbIkixE_2CuS3xk8aEVu-w>
 <xmx:B33kYRhOIoyA2OEm9e33yxA1AP98l56RzpOAAUCNXi-Nsf1NL75dtA>
 <xmx:B33kYYpsy8t5_9gNB-UQwVNlHNGgAR1N-cOXhR7xk7f9fevhTI2SWQ>
 <xmx:B33kYRb87nMHYxeGevqFfkrzaweuzW5Yr9CxACsPaykKOlESKTeY8A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@buildroot.org>; Sun, 16 Jan 2022 15:16:06 -0500 (EST)
Date: Sun, 16 Jan 2022 21:15:57 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: buildroot@buildroot.org
Message-ID: <20220116211557.71866ff6@c3po>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/pcengines_apu2_defconfig: bump
 kernel to 5.16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the compile errors that were present with the previous kernel
version (4.19).

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
---
 configs/pcengines_apu2_defconfig | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/configs/pcengines_apu2_defconfig
b/configs/pcengines_apu2_defconfig index 68cebb8f6a..eb30f6aee7 100644
--- a/configs/pcengines_apu2_defconfig
+++ b/configs/pcengines_apu2_defconfig
@@ -1,16 +1,26 @@
+# Architecture
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_TARGET_GENERIC_HOSTNAME="apu2"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_SYSTEM_DHCP="eth0"
+
+# Kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pcengines/apu2/linux.config"
+
+# Default hostname and TTY
+BR2_TARGET_GENERIC_HOSTNAME="apu2"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Networking
+BR2_SYSTEM_DHCP="eth0"
+
+# Rootfs
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_ISO9660=y
 BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="board/pcengines/apu2/isolinux.cfg"
 BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
-# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloader
 BR2_TARGET_SYSLINUX=y
--
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
