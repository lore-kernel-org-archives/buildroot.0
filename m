Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530BFC02181
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 08:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152AA405B9;
	Mon, 13 Jan 2025 08:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNZ3AcodAfm4; Mon, 13 Jan 2025 08:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6ACF406C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6ACF406C1;
	Mon, 13 Jan 2025 08:24:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79E4A940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 08:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 725844011D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 08:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O58e8665cCdh for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 08:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36A814011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A814011C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36A814011C
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 08:23:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4A442240008;
 Mon, 13 Jan 2025 08:23:56 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Jan 2025 09:23:49 +0100
Message-ID: <20250113082350.241613-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113082350.241613-1-thomas.petazzoni@bootlin.com>
References: <20250113082350.241613-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736756636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEDPORV3u4674aRUCt0FXYZjiVDo6le4hsfZFfuCld4=;
 b=DoBRYLPvq+1aQOpWTCdFRaKXKj5ycg7J9wTPS5xUK7e1my8mNez9hUg96/VVOI82R+Q4Nb
 zyPHA4NzGsSILRFIe0g57LQGfpB1st4N03pzTmNRlog2CWcQS7+ZqS5NAVbi+3Ku3zBUQy
 w0sHDYXrBuUJyYWpK4N7fULuC/MyUo5YZRE+0jAS/IYdHgjir1c71Mxhhhzbtpzhcyausu
 tTy1Jb18G+ouEkFhLxjhhN1Gvgd+i53Dja88VLNLyWWNMR6z6+MLlsBwuwmzihZrSsfR83
 9qqu6NOG1sl8RJwapD2eN0xCHm2QakTvg8YWqmFE5FhA5PEPX9XsirEilAkXOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DoBRYLPv
Subject: [Buildroot] [PATCH 2/2]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: mark as
 broken
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ARC toolchains from Synopsys unfortunately are not "pure"
toolchains: their sysroot no only contains the C library, but also
additional libraries, most notably libncurses and libexpat.

This confuses Buildroot, and causes build issues, and is anyway not a
supported situation. Until the toolchains get fixed, let's mark them
as broken.

Fixes:

  http://autobuild.buildroot.net/results/38766332c391ce97a566c6e2255a947e6074152b/
  (and possibly a number of others)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-synopsys-arc/Config.in                 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index 98bfc2513c..07688a1416 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -5,6 +5,10 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 		BR2_archs4x_rel31 || BR2_archs4x
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	# The toolchains have libncurses and libexpat in their
+	# sysroot, confusing Buildroot and causing build
+	# issues. Disable until the toolchains get fixed.
+	depends on BR2_BROKEN
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
