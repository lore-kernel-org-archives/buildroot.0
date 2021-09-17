Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39F8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 13:26:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EAF4611C4
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 13:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EAF4611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=open-music-kontrollers.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E955E84073;
	Fri, 17 Sep 2021 13:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMwR8JAe2_ae; Fri, 17 Sep 2021 13:26:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E6F284071;
	Fri, 17 Sep 2021 13:26:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F6221BF369
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 13:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F27C94073F
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 13:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=open-music-kontrollers.ch
 header.b="U98XT4Es"; dkim=pass (2048-bit key)
 header.d=messagingengine.com header.b="SqL7XJ4R"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00uIYUC-SLHZ for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 13:26:07 +0000 (UTC)
X-Greylist: delayed 00:07:11 by SQLgrey-1.8.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9502740104
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 13:26:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 07E1832008FB
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 09:18:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 17 Sep 2021 09:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 open-music-kontrollers.ch; h=from:to:subject:date:message-id
 :mime-version:content-transfer-encoding; s=fm1; bh=UHL9R33tGz2oq
 +kw2lrzbkSP6syCcp4o1HuCW9lmb+0=; b=U98XT4Es4ftFGiRa5AhIfRYVLiXwP
 M8tz6NP04mF83KUofu5KupqWVd1994wTslFySSxFEtyooDVAog7sypvwsyF2BXB5
 IvV78PrM8KUVvFI023eat5ZmdE7lc6/l/zwYSIUQaP6T049EwJeQFqGDtQ5ODy8R
 K+s1B2KRFV5uvf7EUdFstRKKAD389bG2DoVzjeSttQXc5RhC1x9oAOBegLJ0Uw3h
 vzZAKw5t/uN9OhWkKTHwrigHYdZzkEynxT88BIZZoIwZIMV6G/IfVC3gwjo4hiPs
 GOwLbj+ke6BO3jWuWOoyC5k1bhGsn1Ii7MeN3R/hXPXh/pSyh7siri9dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UHL9R33tGz2oq+kw2
 lrzbkSP6syCcp4o1HuCW9lmb+0=; b=SqL7XJ4ROGyGo6QBENGOstlzXkW/S3qnU
 8NPfIN8cVdmHEzIcTLt9vqt0WvWojNZ+Z4+eOHAAVSMKyvjT0bPS0qXuAwZ5ja7o
 7FfyN+pyCnNzizh2fjHY2lRMtMSOlbvPj8kIELM6W7I+2LHgnE7UcRzFM0dFshJ6
 /7vh1pbUWldZd0YYRkqftDok73o0Il+uWqj06Rdx/1xcQMxjYAIqyN59d2r2368w
 F8ZA1qlnYO4g/Kmu1PUm18iPD+I1wYTf0UDFMtJF/Q3vyCx6X9eO2A88lIoFxz5C
 v6mtF4aSgitpsfaDNCJ4QAIch/5bDFeB1N+TttYlyg+Nrre01GavQ==
X-ME-Sender: <xms:vpVEYUQL5qZY5D1SFFOiFUF-KEIPWF-5-Q9vZjCrjX3IDLjwoUGeng>
 <xme:vpVEYRwAuGAByvdjYNYAW5MP6QmhyJtR564O2Iid-DrGeAIh38RWmz5hOesDtspUy
 RQDagqF1qxIoOA>
X-ME-Received: <xmr:vpVEYR2ModeTVv1c4raenz9ByAVkt3AKM8g24FiYsdmLMJXLZfLo2jE5SoDUT9wzjt9oXaPe8eG_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehiedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepjfgrnhhsphgvthgvrhcurfhorhhtnhgvrhcuoeguvghvsehophgv
 nhdqmhhushhitgdqkhhonhhtrhholhhlvghrshdrtghhqeenucggtffrrghtthgvrhhnpe
 dvheeuleeiieevgffhhfdtheelffeifeduudfhgeekteehvefgtdfhleeikeegieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghvsehoph
 gvnhdqmhhushhitgdqkhhonhhtrhholhhlvghrshdrtghh
X-ME-Proxy: <xmx:vpVEYYAiSomfaxWkiKG4_QaQ4cbbfvu9Pvnz90O76BpBGd7GTJvxmQ>
 <xmx:vpVEYdh00xmCHTxZv-BlMP37CUeEb-08TiuZV7fQvgBLetZ0Zo34KA>
 <xmx:vpVEYUpsCYJMc-SXdym3vnHCd5_MIBbyw8WRzv-bDm3s8WlTnG0urQ>
 <xmx:vpVEYXeamZcydXhC5PhomKzYMhH5ojflvL4XPvL2Yh9MTJb1uZJDfQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@buildroot.org>; Fri, 17 Sep 2021 09:18:53 -0400 (EDT)
From: Hanspeter Portner <dev@open-music-kontrollers.ch>
To: buildroot@buildroot.org
Date: Fri, 17 Sep 2021 15:18:51 +0200
Message-Id: <20210917131851.31717-1-dev@open-music-kontrollers.ch>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] linux: add compressions for appended
 initramfs
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This changes take effect in the case of BR2_TARGET_ROOTFS_INITRAMFS=y
and one of BR2_LINUX_KERNEL_{GZIP,LZ4,LZMA,LZO,XZ}=y.

Instead of using the kernel's default compression (gzip) for appended initramfs,
this changes set initramfs compression explicitely to the same compression as
the kernel itself, which seems a sensible thing to do, imho.

Apart from these kernel config parameters ...

* CONFIG_KERNEL_GZIP
* CONFIG_KERNEL_LZ4
* CONFIG_KERNEL_LZMA
* CONFIG_KERNEL_LZO
* CONFIG_KERNEL_XZ
* CONFIG_KERNEL_ZSTD
* CONFIG_KERNEL_UNCOMPRESSED

... we now also set these new kernel config parameters, as without those,
the appended initramfs seems to always be compressed with gzip:

* CONFIG_INITRAMFS_COMPRESSION_GZIP
* CONFIG_INITRAMFS_COMPRESSION_LZ4
* CONFIG_INITRAMFS_COMPRESSION_LZMA
* CONFIG_INITRAMFS_COMPRESSION_LZO
* CONFIG_INITRAMFS_COMPRESSION_XZ
* CONFIG_INITRAMFS_COMPRESSION_NONE

The former are automatically set depending on whether one of the
following buildroot config parameters is set analogously to how it is done
for CONFIG_KERNEL_{GZIP,LZ4,LZMA,LZO,XZ,ZSTD,UNCOMPRESSED}:

* BR2_LINUX_KERNEL_GZIP
* BR2_LINUX_KERNEL_LZ4
* BR2_LINUX_KERNEL_LZMA
* BR2_LINUX_KERNEL_LZO
* BR2_LINUX_KERNEL_XZ
* BR2_LINUX_KERNEL_UNCOMPRESSED

Signed-off-by: Hanspeter Portner <dev@open-music-kontrollers.ch>
---
 linux/linux.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 61fdc0c76c..f192341a32 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -106,6 +106,15 @@ LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
 LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_KERNEL_UNCOMPRESSED
 
+INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_GZIP) += CONFIG_INITRAMFS_COMPRESSION_GZIP
+INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZ4) += CONFIG_INITRAMFS_COMPRESSION_LZ4
+INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) += CONFIG_INITRAMFS_COMPRESSION_LZMA
+INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) += CONFIG_INITRAMFS_COMPRESSION_LZO
+INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_INITRAMFS_COMPRESSION_XZ
+# zstd compression seems not supported, yet
+#INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_INITRAMFS_COMPRESSION_ZSTD
+INITRAMFS_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_INITRAMFS_COMPRESSION_NONE
+
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
 LINUX_DEPENDENCIES += host-openssl
 endif
@@ -352,6 +361,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio")
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0)
 		$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0))
+		$(call KCONFIG_ENABLE_OPT,$(strip $(INITRAMFS_COMPRESSION_OPT_y)))
+		$(foreach opt, $(INITRAMFS_COMPRESSION_OPT_),
+			$(call KCONFIG_DISABLE_OPT,$(opt))
+		)
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
