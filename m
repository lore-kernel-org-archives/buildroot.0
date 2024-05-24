Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEE1C25B79
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 19:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4885C40441;
	Fri, 24 May 2024 19:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esTQhzPuU9wx; Fri, 24 May 2024 19:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 579F640437
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 579F640437;
	Fri, 24 May 2024 19:36:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 050C31CFD23
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E605240437
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grVuVql6IF4g for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 19:36:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.159;
 helo=fhigh8-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32334401B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32334401B7
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32334401B7
 for <buildroot@buildroot.org>; Fri, 24 May 2024 19:36:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 16103114014F;
 Fri, 24 May 2024 15:36:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 May 2024 15:36:43 -0400
X-ME-Sender: <xms:SuxQZgGQMijNViCmYzKAhrsotEQkw6cjewS-uzx2xw0ZYgWMIUSPzw>
 <xme:SuxQZpVSynEjeKYBc8CsBftgF1rVNNURAie7yCxpHcNwv-fj1xD8kLJvSJsHbl2UI
 ybBlbIZeTSDR_aROj4>
X-ME-Received: <xmr:SuxQZqJfE4hWUxQI4tbmBpKj_r2o9rOJfJk3amCS31eYK8MiQsSlOnc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeikedgudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpedufffffffhueehvefhgfelveekueegteefgeeiieejheefkeeh
 keevudevieegueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:SuxQZiGwZkJR8VwOuHvtHvI-H03KiKCLXenLC301GRAoyaV1FcZTUw>
 <xmx:SuxQZmVopsAIjT4FwrB3aQb4ECXg57LcmLtrkZ6l-KLWiAWwJYyMpw>
 <xmx:SuxQZlPNp9xLrv3icvBFnktHPogBGQYoXExTpJFlJu2UY4fXlwA-AQ>
 <xmx:SuxQZt2PDGteMOwkX5_q1sdGVxRznbgQ1fN4xkfdeQeEGTrbaK2JPw>
 <xmx:S-xQZof3kd2eaJJpxRf2TL-SO2J6EhZsaaREcXPh1HcXj2RBcScZHikU>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 May 2024 15:36:42 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 24 May 2024 20:36:34 +0100
Message-Id: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=kmwd0yN6T/116jASnXTxnK5K5J43TEaCsWKE2JgsFPM=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSAN16Js6MWRL1uPfnid/Jf1fR7m153cu95qMG/LEoqb
 dK2+oS/HaUsDGJcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjARV0NGhpsqj+61R3/Ml1sg
 841zyvsOw6liP9er59Tter/ckXGrxnaG/5Xveu4viuSpyXhWc8VVr+yeUtC5616n/PW9+9eoFTo
 ZMwIA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm2; t=1716579403; x=1716665803; bh=Vo
 K6kBNlEkxjDpuGvrSRrDD+pO5M/9vscSZ9SUpIDAw=; b=RwtCO4rZiBfUuijubk
 rkRwI0WOcTlwRDl0ffXAa4ohcMx4dY+Kzc2LnvidJAXsVuhSQ5b/kCR0yKbHAJO4
 gICCTwiGrj9HxjdhedTWQtALWUHqFI4CKRPJSkT3bq1YJ+rN2JpjNNPyBJXqx2b9
 ye+OWyp4QtjenKX2JgWUbT0UEryV9APXyBPwqTYr65bo1v69RXOvkFvGfmSdDSiJ
 2pjwKmAm4u+4xu3Z2elVd5YgiUIQRHwAUSwtnPCXygyNXrxgTEI/r/HS8WdQum7n
 ULoa7x//W8tWYiMk6SqHMsO0tHElYW9Nw2bbQyLaroMpkb4nxSoQ2f5CFzAwMhWj
 pJpQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1716579403; x=1716665803; bh=VoK6kBNlEkxjD
 puGvrSRrDD+pO5M/9vscSZ9SUpIDAw=; b=aYa1Bw2pkSdZ8ww+HONzdAERCm40u
 Pgs5DGRRv8Hycy2hzYonAVaUEnpd9pxfOsysc3+mOaW87Njz1m0WhpNx9NOJIhZO
 DvnaRWcU6zQjHQhVsdfbRW8YGK8ZLKcxh2adznhtdZFOsKu26udeEb4RKlCr+YUY
 zSWSzpS6G6j72O6E//XOKrXh1pG2yMi6rUu1q6mgWTApMzk5OC6bN+ZnrOBhNgjm
 GM3057J3DCGqU602PKxn/3yNzI/B5riOrY0rQMqsOPxqO0BfKDApcV+lQM2k85AZ
 It/NspbleIgEG4XUqKCuO3AmkuOvXb0QQq/xhhxoKdqhBfO7WaPN66WXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=RwtCO4rZ; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=aYa1Bw2p
Subject: [Buildroot] [PATCH RESEND 0/7] LoongArch64 initial support
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This series enabled LoongArch64 support to buildroot.

It added LoongArch bits to toolchain and kernel & grub packages
and then introduced new loongarch64-efi board as a generic target.

Please review.
Thanks!

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Jiaxun Yang (7):
      support/gnuconfig: Bump version to 2024-01-01
      package/gcc: Introduce BR2_GCC_TARGET_SIMD option
      arch: Introduce LoongArch64
      package/{glibc,musl}: Enable LoongArch64 support
      linux: Introduce {vmlinux,vmlinuz}.efi kernel binary format
      boot/grub2: Introduce loongarch64-efi target
      board/loongarch64-efi: Introduce the new board

 DEVELOPERS                                         |    5 +
 arch/Config.in                                     |   19 +
 arch/Config.in.loongarch                           |  127 ++
 arch/arch.mk                                       |    1 +
 board/loongarch64-efi/genimage-efi.cfg             |   33 +
 board/loongarch64-efi/grub.cfg                     |    6 +
 board/loongarch64-efi/post-image.sh                |    5 +
 board/loongarch64-efi/readme.txt                   |   34 +
 boot/grub2/Config.in                               |   10 +
 boot/grub2/grub2.mk                                |    9 +
 configs/loongarch64_efi_defconfig                  |   36 +
 linux/Config.in                                    |    8 +
 linux/linux.mk                                     |    4 +
 package/gcc/gcc.mk                                 |    4 +
 package/glibc/Config.in                            |    2 +
 package/musl/Config.in                             |    1 +
 support/gnuconfig/README.buildroot                 |    2 +-
 support/gnuconfig/config.guess                     | 1233 +++++++++++---------
 support/gnuconfig/config.sub                       |  302 +++--
 toolchain/toolchain-buildroot/Config.in            |    4 +
 .../toolchain-external/pkg-toolchain-external.mk   |    4 +
 21 files changed, 1206 insertions(+), 643 deletions(-)
---
base-commit: b37792f76880410726578b9080ba9649adf2c997
change-id: 20240524-loongarch64-8785f02d69a2

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
