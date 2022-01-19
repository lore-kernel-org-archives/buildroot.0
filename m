Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81364C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 23:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E966C4011C;
	Wed, 19 Jan 2022 23:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VNWbZ8NJufb; Wed, 19 Jan 2022 23:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF33940182;
	Wed, 19 Jan 2022 23:11:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF8151BF2B8
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 23:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB6A540991
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 23:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="Nx2rIZC8";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="LDXEAXv6"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCK038q_swWa for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 23:10:58 +0000 (UTC)
X-Greylist: delayed 00:07:12 by SQLgrey-1.8.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5793D4094C
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 23:10:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 88DFD32022A3
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 18:03:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 19 Jan 2022 18:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=date
 :from:to:subject:message-id:in-reply-to:references:mime-version
 :content-type:content-transfer-encoding; s=fm1; bh=h7zao5uv9OBOn
 cG9MEUZPLwyQSYpFBUpabvY7z3Ry+M=; b=Nx2rIZC8aaY+//D2oSglpYlxB+HU0
 /InEeSH1aJW04yRteb+VYwCcAsVW2tKEkDm/QToVFpc++4g0kMkDFZGXAYPZVhs1
 NuRCA/JhqRzklcay6Xv1D1CYAcN8GSZigkIDQ267HiD/UAj3mFhvovS6fvWjGI+n
 pcefEQpitr987OnOvaXU42wDaaUYx43Vq6gB0T7oqRUu0BSt23XMXeJW00qsN3zX
 LRcECju3Q4MlnL+JTS6XsSkxYjOefYwA4CTJvgQln4l3R8aqfv+aFGJocA36sooL
 faNzeCg8KZMd/lfO8Y7X1NGxakJxybK42c3eu2bUgnLasURBng51vACLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=h7zao5uv9OBOncG9MEUZPLwyQSYpFBUpabvY7z3Ry
 +M=; b=LDXEAXv6khmPPNL3EW8tTTgsKlovIjMDNORI61qNPTYiDl+aJTMScJ8X8
 msUVZ9IrUiDv+VtuNseVbq0JZU1SBUtpY3o/jxFlQV5k2XrwBwpUwR6kfV8E9azc
 N+b6WWSd9CspI/mHvVUKl1H2OksR4x2f94neqlqf8Vof+8TJ0KCmJ85atwQHJlSf
 rGhHLcSCmfHkadhtG9RF1riLgIMitlQ7uaoTkV/vtIplUu0xKIe4VeYL52O+nlso
 6qjj5e/qQDSvzrXC/jeoBnr7vqkFsc1a0Wh8t3VUjxvXEP6az/VQgt8szqShrfMP
 7JwEb+f+55H3lhdPkASwZjxtGc0ag==
X-ME-Sender: <xms:zZjoYQAPP2DXk-S1RO7TByEP0ybydeHAycRHcN8gzd9ll2RQSQgq0g>
 <xme:zZjoYSh_Sb5cF5p90B42Xpt1GeGm_J-4-X7pSLgMObZkyfwSGvO4cupGzLo9CEVyi
 hoVHCPZvln-P1eZ>
X-ME-Received: <xmr:zZjoYTlsye0d0t4sYS0zNEGImrjhfb0wLU-2QMjsOEgvJdcm7BCI4G_41XJMgM-kwHuQ8BCmf0WZlkVrkO2HdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejfe
 dtredtvdenucfhrhhomhepffgrnhhilhhouceurghrghgvnhcuoehmrghilhesuggsrhhg
 nhdrtghhqeenucggtffrrghtthgvrhhnpeeifedviedtveejgffhjedvgfevgeehheegte
 evfffgteehhedvteejueffteevhfenucffohhmrghinhepghhithhlrggsrdgtohhmpdgs
 uhhilhgurhhoohhtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepmhgrihhlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:zZjoYWy2ba1PNexqUQ--N7zx_kjnek2_VSw4nriuIs1sWyOwBZ75OA>
 <xmx:zZjoYVR4b3mD-GWZd670eh_mVqy3WqRWlMSknK2m6Mj7F4E7fW2c8Q>
 <xmx:zZjoYRZQ6CC9sTkjB6TotN75Ef7v4P_YaOUNmJ64HY-QvZ44RVe1aw>
 <xmx:zpjoYUKjZAzSFQAgh2NdXWIfu1F0sjWsjxX5p0_Yy-_mg0cS39YbHw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@buildroot.org>; Wed, 19 Jan 2022 18:03:41 -0500 (EST)
Date: Thu, 20 Jan 2022 00:03:30 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: buildroot@buildroot.org
Message-ID: <20220120000330.29552850@c3po>
In-Reply-To: <44c15385-c790-6867-fc1f-b24c922b7e40@benettiengineering.com>
References: <20220116211557.71866ff6@c3po>
 <44c15385-c790-6867-fc1f-b24c922b7e40@benettiengineering.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] configs/pcengines_apu2_defconfig: bump
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

This fixes the compile errors that were present with the previous
kernel version (4.19):

https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084022

Additionally, the defconfig file was refactored: Configuration
values are now grouped logically, thus increasing readability and
maintainability.

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>

---
Changes v1 -> v2:
  - improved commit message

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
---
 configs/pcengines_apu2_defconfig | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/configs/pcengines_apu2_defconfig b/configs/pcengines_apu2_defconfig
index 68cebb8f6a..eb30f6aee7 100644
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
