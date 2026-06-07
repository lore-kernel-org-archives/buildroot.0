Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B66CD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 21:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBFB56111B;
	Sun,  7 Jun 2026 21:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iYkT5M-QjzE; Sun,  7 Jun 2026 21:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2473C610EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780867841;
	bh=nqbSc13AUDoZ5WCNcGKwtYJlWYc1TvOJcf2SK3gfWLY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=crZGrAdCTnh1tu+NOzUJk6OwAH+CmxKfcWEAYgDRzljsCFJEh4iRXukP1xHZgjqhK
	 zWvlo0VHQsLhUH6gwUErhWjmnzHQi9mcSqWVFe7jvQsX3QT3OIxEfZZGayYiSRW1aS
	 O5YfIFfHnXzllCCRyZmW+9zL0XChh2nF6kKVgRhc4+Xy40V9zRG5lkGjVbsOiaoAvl
	 y6rbMmvG7lZb/ggMXw5XisgMhSIVWqlokxAOtfdPhyQV+JT2X8H8Aq+Tzqfa+ULiXA
	 eWHF1L26eeyVB/oy9/1Uhg0Z0pxOyqB8t9TgtnQuG2dGoAwLfSWe+KOsbWWBvoO04i
	 yEmMx/tvgPJEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2473C610EE;
	Sun,  7 Jun 2026 21:30:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A072F2C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBA4084992
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPrmr6eEMEMT for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 21:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1FCE84993
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1FCE84993
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1FCE84993
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:30:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so46000305e9.2
 for <buildroot@buildroot.org>; Sun, 07 Jun 2026 14:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780867836; x=1781472636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oQsYXDjr9njwb0VxmvBPhD9E8w64UexIjIpsl+vFQU8=;
 b=Yn2wfdhM4dlK9PrHKY8Si+HO4yoHveMzice2+IQOOnNer7IPWn8Cpo+zhcftR8bVX0
 jV/FVMT7SAGgK/vKGuppy0/PBcwRz2SFuS5i4B8xIde4EuodYJO+zgFwncWP4N61WVxa
 5UTjx4r/6oCjQE6t0mGKfcaKlplGH27spSXy/E0GHAmE+NVMhw8y72WTySIqO8LcjsAx
 FEd05Iv0oZJHBHaFF8DIxFwHNgEX+IuVv+nwNMjqH6ubZJ9eGBgysl8zmK91Udo5XGSO
 dS6jayQj9K/m8QHgqRqPgNpAsrr5DkSboVX1wL/LURhHdo4XX8C/bwsvnQMnZkSORfYd
 W7GA==
X-Gm-Message-State: AOJu0Yxet4AEF0vhe/N28Ucpo5fK3iXqtNyk+RlaZiAwakofSLByi71n
 0K0qtiMOANq5Rcyf7je5A+zvNTGve75DWpADsqbkKaRlCtQjRiONewak54Q0JIcbk+UN/m+DmIm
 PQk03
X-Gm-Gg: Acq92OEO1n7uTXiodXJoZM/y+mM/pu1XhcfrfePDjjrG8iPmAi0xf0FR3390jB09XKr
 7XI3huZIeia6JyRu+SYbDFLqIZBt3aRhJ2VCmHYnVO7doXOejq2UsAlMf+JmVjijqtLTcaYXqA5
 wl1ZrJpLEzjXLvC//kVinHFA90xCneJVcGhhrznsTjlDBkURicWL0k5KAIo8bxR3JEfiNAdvmk1
 k2iLf1k2uBWPXEThFsyPa/ZxsepTmoTEUl1vyyq7lbsMSltZfRXV0Ln44AayitY6/GpKbdAd6aJ
 IzTQxotONNGTn3S+iBb25hqxiCdQGHMOA0k4ojiA5Fdjnu+5W9L8c34k/0kUz2VgTo8ao385fwX
 VdNVW8CN7zslypsWi2o4ToXcD4pBedVpKkRWgqWLIPNRs+IyxIWr+VkfvQu5D1q5nal5je8WFIz
 zDzEkL8KuxDSUgCkhIqAs+pQM/Wqxrk0Gbrsv0IFqsGgJIAdz8YWJLZ4+YdxC01NmOmGdKStQK4
 wgtfTpugwEkA2WSsyB0nNObi0mPggPKJF8f
X-Received: by 2002:a05:600c:620b:b0:48a:53ea:140b with SMTP id
 5b1f17b1804b1-490c25cf45bmr223417375e9.28.1780867835973; 
 Sun, 07 Jun 2026 14:30:35 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344762sm50290131f8f.23.2026.06.07.14.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 14:30:35 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  7 Jun 2026 23:30:30 +0200
Message-ID: <20260607213030.1509913-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607213030.1509913-1-romain.naour@smile.fr>
References: <20260607213030.1509913-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780867836; x=1781472636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQsYXDjr9njwb0VxmvBPhD9E8w64UexIjIpsl+vFQU8=;
 b=RsQ+q5xGNUhUp38+DKTkKv06E4TJmuMjRftASVnqi4bKDZpRGZIpNK0IEJCWKVVYET
 kCBUiByHyw+HW11d5LnkBbkn1IMI/3D0vDTX8k4cN/B6hyAHkEizuK6usgp6esigRfEX
 YK8Ue2j+Rd2ymk1i3TLue/W/YgyU8Ooj6sShU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=RsQ+q5xG
Subject: [Buildroot] [PATCH 2/2] package/glibc: riscv w/ ISA RVV needs gcc
 >= 15
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The sipeed_licheepi_4a defconfig doesn't build since the glibc version
bump to 2.43 [1]. Glibc increased the minimal gcc version for riscv
w/ ISA RVV in commit [2].

Add a new glibc dependency on gcc 15 when ISA RVV is enabled.

[1] 227378b5930b681c79a13476ae60a98753a98a03
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=47975914fb106b83c42bc0baf6435a0944a23d30

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/glibc/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 2bf44bb70b..8e5b08ab7f 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -27,6 +27,9 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	# glibc needs atomic instructions, and does not support
 	# single-precision floating point ABIs (ilp32f and lp64f)
 	depends on (BR2_RISCV_ISA_RVA && !BR2_RISCV_ABI_ILP32F && !BR2_RISCV_ABI_LP64F) || !BR2_riscv
+	# glibc >= 2.43 needs at gcc >= 15 when Vector
+	# Instructions (V) are enabled.
+	depends on (BR2_RISCV_ISA_RVV && BR2_TOOLCHAIN_GCC_AT_LEAST_15) || !BR2_riscv
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_GLIBC_SUPPORTS
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
