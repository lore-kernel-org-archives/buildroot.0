Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7365BC55164
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 15:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B1A480F58;
	Thu, 30 Jul 2026 15:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPkvbx1U4Ipi; Thu, 30 Jul 2026 15:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318A4810F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785426405;
	bh=F6dqpV6yYLVdI1Bomy6f17PA0/B1lUvOoqlzsnDgVdQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L0Tp0UWPaxJQxDb/jqxW2Q2xfY9nwzUTO0K6Xkz8oc4vLN45g4mtHVGjZpo7hMgsa
	 BqyKQcvpWU8VCudCjXij4O6HjgWI7ytkbgdAHHW6wr9l1yFmrevx38HQovbiftKbs1
	 2hDynH8FZGrUhv0ivgrwWElRBFuQ/zfE5oJGZos4T9oo45d3zF6Yqw71j+oynqJH9C
	 +VFIyRIKlXtJzrattFzmfbDXh/E64jBtkCuWZHt4IaufoV+19CtcOKM0oM9Ms+YM6A
	 OWsuRurlQ9O8sRzx8eQmYKNCyNDpgWT3kjycOwvyuf3E5LtRRGQDF8tJrqQ8FEhAIF
	 uW0hdm5wYZJ2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 318A4810F8;
	Thu, 30 Jul 2026 15:46:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF60A2CE
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 15:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C128840BF8
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 15:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjUTJB6HpfAT for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 15:46:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=philippemontcho@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A508040B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A508040B97
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A508040B97
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 15:46:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso27469885e9.1
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 08:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785426400; x=1786031200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OarriMSC42tkJkj8QAHTLsXxNyEFZfvpvknoMGjpP/Y=;
 b=T/1kh86ihBya2tkRC6FOCntJTr+Az6NpkfMybmm4lY8xd9dfTOzoTsnAnM3A2XHePy
 atoH9/QU+he99zZek8fBjzLNgA5gyGpURxl5uMPn2n80hydEEbS/VRTyPhTmfh2v00in
 xPYnHo/oUv6gV7SuKikVeJhkVsIXhoGoG+lrMiA1UlfovPqjgjZPdnkgsd0l5i28dOQr
 V/T4v5jUE58rIO+ZmcKY23IMt+TG6JRAl4cFImTCUCX6eaN8y4pm3E3rJ52faAsw99gs
 1drSqLrSkui0M8TYJNyqhCadFReLAjeZjsfaPNQsdMKrK0eYJmU6U6BaTD2vvbIzHSXi
 YLfg==
X-Gm-Message-State: AOJu0YzRm/rIqKsg6+d9ddZ0iFtRyjSHDd0hsgCDaY7kULu4fctqkM46
 48WZpL/+PuES0WTj2ZKd5KSxovOfijbSQlmulJ0S4gr0At1BU9vOJ+PHZKYD8A==
X-Gm-Gg: AR+sD10zuziyi+zI0IQ1MKrgCsCR9hpYMeKhcv27UjbJ8FB6qhWph5JtKDnWIGFiWcZ
 yyzL72fydJ8RrPV76afzLOLQl2XRzWl5EtPXqYpc0ZfA89RcuoX92MegscetTC06W8mOONsSkhc
 Expc//QgdkeefauXjqfBy+xXzFyQBpQZNXI0Msa2ria21K/4XAK3ASV/Stano5iTbWNapP6d3Cd
 HEbwrKtax7J8aL/Y6T1ClzpPSX8XHPpoNCByJN++CTdAoHvZ4yLrkrES4PS5sXwZW4nD6bM6jMv
 mWr5uwCG1PI3kwA6sueBxHfKERf+T0CHcftiTXgOZlB8OaewKMZ7FZaKzroPWoSks85tH8CjoIx
 d4cQMLoObP5CVp0FIy869Nl+r8xmSK4LFIerht4PxJX8QKzUXB2CIUWziyyoCSJd46WZbSpOi7Q
 vj/TD91fdx94RMPUfpyzt9DoSnW2nVM24OMiElvEQFtn0o4+1s93wRidw2LzVz/w6nl43xniAbm
 MzkM2XI5ZHxRvummgVI0SlWsjHg9mfHnlTrsFdLdClPAw5JMlAuW7czF7VMC3HgErxnR9gtR6tE
 9pB3ZZxHfshuMsPYMF/ZzzLpxDIYiz5DqS2yAv5aB24=
X-Received: by 2002:a05:600c:a49:b0:493:c845:bc20 with SMTP id
 5b1f17b1804b1-49800e6ab7fmr45489985e9.4.1785426400480; 
 Thu, 30 Jul 2026 08:46:40 -0700 (PDT)
Received: from Phil-Pictz.home
 (2a01cb0000b3fe00e5c6968d2096bcd0.ipv6.abo.wanadoo.fr.
 [2a01:cb00:b3:fe00:e5c6:968d:2096:bcd0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980120b64asm73602625e9.12.2026.07.30.08.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 08:46:39 -0700 (PDT)
From: Philippe MONTCHO <philippemontcho@gmail.com>
To: buildroot@buildroot.org
Cc: Philippe MONTCHO <philippemontcho@gmail.com>
Date: Thu, 30 Jul 2026 17:46:31 +0200
Message-ID: <20260730154631.41203-1-philippemontcho@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785426400; x=1786031200; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OarriMSC42tkJkj8QAHTLsXxNyEFZfvpvknoMGjpP/Y=;
 b=seSojgHUOyW2bm0l2Vwdr/YvU3Jggt5G2xn1UAq+0BnKwgwLb5gtbkJZfvGraR2kJf
 d0nGXPCOW67iZuGWmoSmZl+6h5xiUObgPBIW9sxuDRsVaMcjAciXmo6kOoT3w8bB6tV9
 f4pObPsWeOxWH3j6i7BnEcrERxF4KQLcZ1rua83knKWQfkolUQ9uaa3a14iZV1fuPBb5
 xSR4jOG38knqTD4iJhGhsefZWpmnpuL6XzJ2mzLVsykFBiJ7nJNr2OwBWfLdG1y88bd1
 buj7Pr/UxrKilvUx9t/m77XFTXYXhQ9B3MTbtFM8L9tA+OWVO+qa954/g68yzmAOXNSN
 CCpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=seSojgHU
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: bump version to 2026.07
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

Release:
https://git.u-boot-project.org/u-boot/u-boot/-/releases/v2026.07

Signed-off-by: Philippe MONTCHO <philippemontcho@gmail.com>
---
 package/uboot-tools/uboot-tools.hash | 2 +-
 package/uboot-tools/uboot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 6916498256..e992835582 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 6b5554da9b..23062beefe 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2026.04
+UBOOT_TOOLS_VERSION = 2026.07
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
