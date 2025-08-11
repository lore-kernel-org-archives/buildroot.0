Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AADECA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D56AC41708;
	Mon, 11 Aug 2025 16:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLSuCGOpp4Th; Mon, 11 Aug 2025 16:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EAA9416EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EAA9416EC;
	Mon, 11 Aug 2025 16:56:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB8DD138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 910B1416DB
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mee6wkquq_bO for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:55:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6352B416CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6352B416CA
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6352B416CA
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:56 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af946c07c84so64099166b.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931354; x=1755536154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dtQhKibWL8XUb0DIk/kE1Yy3zn5lOgUtjOKKlMz38QU=;
 b=tqDl1WeGoVD03zyniXJiuItbICXid9GxMtCEkaEda+1RMtvCb92TAjxmBwhN+cS9bQ
 O5Xi/eQ3ujdS7mRS1zaSXHGHmpoyYqM0uzYrfH+uP2pBD6Rm3QgGAVkrQGqjyKF61hGO
 xNRYXlOX0gNp3o2NgK9mRJh1rxG8ti1CiemhMcXQBs/RedYChiRDEbY+Eo0nfmO8AoeO
 CuNBa/E2uzm0mPxyKJx54krMkxJnHRbgbSLWa+pE6JF13Unx5EtTwSMQx+1EH7JTXZej
 suQ1Pyu9obtTpz6dSga2aam094nYldHt2qZ9PBXNE3Tkr2UbjDmnLe5W9chwae4+D2HC
 yihA==
X-Gm-Message-State: AOJu0Yy+pxasS/ZIQdcTwiTZIGdXIhoXSydVjFt/snNRtqYC1rzwYXW9
 7oneBqjEe+DDHXI9+y9opFGr0kn+zkXInYBKRQlD9Pm4+bvEzo4jhvmWH3GEkw==
X-Gm-Gg: ASbGncvX5h+I9KBxqTGKzV/zULc1Rz+uFmTcvnN/4f02cKHTUWYwn4YcA584GEFevcP
 8d84gi4575zBjewKtRrtheWVKibPvW1NT/20FzM3r8Zo2pbCkiIvq2/05KvTZQs0csvhQtECKu8
 CfP9qsBHy/4vivjiyvY+9AkJn2DSR0fqSwPlH7H1K93JYCq2QiCmx7BWsUPFjtvX8KMCZ6SfPic
 n1PbWxh2lDkzxXm6WDNK1XGKO7qewxcdxYcheCz2zTY2HVI0uj51klujCAyi9FN0VXTx+Vy41KD
 HjGleeWpEBRdmJ8QJe5HOOYqCRxAEZi/MHGd39CaV5CYOwAbCwdCU2NR/AsAqT/Uu+9Fac1jJyF
 jsVva+XWYgc2TETHvkIw=
X-Google-Smtp-Source: AGHT+IHkTXB8Q70GuVdQFtUJKgvww+SaRs8M32sfvwesuywCiS6sXtgpj6ABAs+GNWW1x0+W5rjTXA==
X-Received: by 2002:a17:906:c114:b0:ae0:bb1a:8c4 with SMTP id
 a640c23a62f3a-af9deaae559mr373296066b.1.1754931353885; 
 Mon, 11 Aug 2025 09:55:53 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:55:52 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:25 +0300
Message-ID: <20250811165531.1533913-6-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931354; x=1755536154; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dtQhKibWL8XUb0DIk/kE1Yy3zn5lOgUtjOKKlMz38QU=;
 b=RZYD/lASp/P6UVE+vfwEN5oTY/wWpPhNwKvpZ/p2ZWdwvDQDGRLvur2IeO6FvHyAEf
 cUbRXvh/AOXfwYeog03XOjVKqjBQTGeal5JwZVdglRhaT6gVqSd2V2srqp3GwoAXNfPf
 K3TSylpPBLysRCbJTyqKf5xndA5bTzYFZmfOL7tYYy+wzL6sws8gcIaW7cdFIejR29YU
 D7K+usg2FJCazKvBu9Yk7rPNeAwiS22jZCut6Ul5j8IzA9QdKt/Aw+K1b6f+dnNcQeV0
 0Z5X2s2cJImK/TUEB9MnkrSaINRGdUo9tbiy/3PAUf+mUA5lB/5cgWH68ud1s3iWJvBV
 wDcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RZYD/lAS
Subject: [Buildroot] [PATCH v3 05/11] package/qoriq-ddr-phy-binary: bump
 version to lf-6.12.20-2.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No change.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: patch is new

 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash | 2 +-
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
index 7a689d42a5ad..439d8e3a8fcc 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  475bca55d8b05463e75f6d47a8ea7e3def8505a614170b0a3976bd342ca3d759  qoriq-ddr-phy-binary-lf-6.12.3-1.0.0.tar.gz
+sha256  0837d5752a89ae7b9779cceac4aa758aad89688154a6a110a53fe16cbe6adca4  qoriq-ddr-phy-binary-lf-6.12.20-2.0.0.tar.gz
 sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
index 5ce990b75b76..665b653d202d 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.3-1.0.0
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.20-2.0.0
 QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
 QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
 QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
