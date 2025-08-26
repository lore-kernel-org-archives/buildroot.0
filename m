Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E19CA0FED
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 23:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7608140531;
	Tue, 26 Aug 2025 23:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7kkvBOD4DeD; Tue, 26 Aug 2025 23:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC5C40523
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC5C40523;
	Tue, 26 Aug 2025 23:11:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DBAC5B8C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 23:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C22524035E
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 23:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VaTjN7OMlZS for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 23:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0EE54008C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0EE54008C
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0EE54008C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 23:11:38 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2487a60d649so11632735ad.2
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 16:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756249898; x=1756854698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qyaLbjcJPWg2snzfIrNa4444b2CkKsjL6x2OkOIXZ8g=;
 b=hA8GWDyRkK5zaXzHqD7RHqvE7o8tuCQjG5xbAkW1zf/1tymqRg5lv1gPZjCtRbJSNN
 kT7CQYQN6L9INoRaz2Y91gLzaFbRlFCxR2EemIGZuFmGW5oggxvhAH8Lh6Xh0UC1KSCa
 fkgzJdmBqzVsb5QiN6A6oshUXHx2nqmEhsjdmQqw67d+pAVKL4/4z1zhNf6qhBjfMwxW
 /aHc7AmH97cI8SdCAHyRA0Z934/1JCrsmQRhc7UsufI5KrIRlVjM21FSYqhwq71SXOpb
 Ujd9fSB/6ozFZYKkxHRTYYqqqJuF9Os8J2nodsYmpB1UGpny4Ey72Iavv3p02TXP4BRk
 aQUg==
X-Gm-Message-State: AOJu0YxpBCxFIMuNrRGFuwqgrPZ01vtTjoDyy8znuU+y+2KieTzUkVve
 4xbcRkROBFW0OS9QXI+dfgnBPslV6fGcJpWVkujQZ0qwQq9cNr5sG++VShMvJA==
X-Gm-Gg: ASbGncsHSIp1bvglkABNGdk+2Nv4qcF9ma8vlqU7tBpa5nIttWnzKn+/fqxzCQeGFYt
 qPNegwTGx4I/CUpXDccyTCK8IclvdUxnz0OhQYr5VSghahPQQaRqz0nly7SqV4QXut+LJOy47gv
 X2RrUrxc4hegN0vKosVIdhbR5R3pWChepB1IhUAdLXSHSRCyo22O+P4+NUlfyx7Yw1+3I21gugR
 4IHakk8towVuVmhxUMISqHD8xQJzPfnbv6G46Ytx5GDmFEn1AwUKKKspMwikSl5/pFURZ/RBxJ5
 P5lDpGAkVd9jUEsqtTFRrxh/qeS2L2eqzkkG5Lf+iHFpV5Q1FgR/IJeuN77yMzBP6TnINjEwJTo
 VOilAbEfx5NgpO0Cems4kxz/Qz6zobp4jnn4M
X-Google-Smtp-Source: AGHT+IFU8+ldwQMsN5D7epOvAnC1XNwlgQagr0jAv4+xQtvox+emIihonQUd8hMX37jrR1FFplglCw==
X-Received: by 2002:a17:902:d2c7:b0:248:9429:3641 with SMTP id
 d9443c01a7336-24894293aa4mr13440305ad.48.1756249898131; 
 Tue, 26 Aug 2025 16:11:38 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466889e11csm105522605ad.155.2025.08.26.16.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 16:11:37 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Aug 2025 01:11:20 +0200
Message-ID: <20250826231121.135117-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756249898; x=1756854698; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qyaLbjcJPWg2snzfIrNa4444b2CkKsjL6x2OkOIXZ8g=;
 b=g5W/BEp3+aGAFqexAcCXeHEGTgqIIOHoxoHwVboFaysvXlZl2ZGOnHBD/FFdIgxGAJ
 wVRaha9lCNjPKTtr3S5RGv08+YnPSNm7pxdFiBuPEMnQlPqfEkv6C6GmolmwA8WmrLqu
 2Ogu8iosKAabq/3WJ2LXjzK2lhZ4FMmmwe+aZmHyZURw1BqZECmxljQoqcNtsCeAMpvX
 59DW9Sq8ROfINe+xynah21jEF/Y8FQI8WUFiPAOlXkNSfIYi8U3Z0jpD8uTvdA6Mud49
 VQCCVsFbx68iYhPKOTTH+Z05kMwschfNCneoDFt+VpgsEXdS1kttz69aY1ifjezBMWAm
 /v2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g5W/BEp3
Subject: [Buildroot] [PATCH 1/1] package/nftables: Bump version to 1.1.4
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/nftables/nftables.hash | 5 +++--
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index ef635cd3c3..b7c65777ca 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,8 +1,9 @@
 # From https://netfilter.org/projects/nftables/downloads.html
 # Checked pgp signature:
-# https://netfilter.org/projects/nftables/files/nftables-1.1.0.tar.xz.sig
+# https://netfilter.org/projects/nftables/files/nftables-1.1.4.tar.xz.sig
 # with key:
 # https://netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-sha256  ef3373294886c5b607ee7be82c56a25bc04e75f802f8e8adcd55aac91eb0aa24  nftables-1.1.0.tar.xz
+# https://www.netfilter.org/projects/nftables/files/nftables-1.1.4.tar.xz.sha256sum
+sha256  3444f0012af0472399eeae89a758b9c6dc5f311f6c67a48988fa1600fc4bac86  nftables-1.1.4.tar.xz
 # Locally computed:
 sha256  4ee1e51baf5f3166712fa0c3e01338c7257e50ddef245d28bb14ad68f6070ba5  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index f6e6a64efd..94bf977725 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.1.0
+NFTABLES_VERSION = 1.1.4
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.xz
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
