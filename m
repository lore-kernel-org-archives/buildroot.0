Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950A0EFCE49
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5835681773;
	Wed,  4 Mar 2026 21:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9lkiwnhmgt8; Wed,  4 Mar 2026 21:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC9181776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772660146;
	bh=RHb+jAQQ5asX9GmrSluTnP2WXxeTxMrC6TLnt379B88=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=J8vPnpO/txE8/PDllagBL4iwnJVI0Qm7o1spW+GjdESzb8HG244gO5NHdn0WhhiYg
	 qyBLzNQSO1fn4Kz0zeDGtSJz3Dd79b9xgxC0jm3pLhnBtVJVdFEH3JGu9o8tQy0i4q
	 YvuKekbr8ZI0ZqPKm/r9VxxfdP8xDJtbxbBUicPjLWOPfuMbFvxyOdpjnohIXScOjU
	 Px0OwrUWw1sGq19hftl/L4Bj8z/3G2ovsPejaEObKEKNaUpZTJqL6pPjEbZu3f17td
	 BIuMB+kz9qoMZeB77v5uCZDAA4iwWYM+m2HBsdvNTZcUMfkO3/uoglCkDl/F8HQlF7
	 V+abr8Fwsf4Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CC9181776;
	Wed,  4 Mar 2026 21:35:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D75B734F
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD80981776
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbhwVQzOLax9 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77D5C810F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77D5C810F3
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77D5C810F3
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:35:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso3651843f8f.2
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 13:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772660140; x=1773264940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RzjbBDXEyWRGszFQN1fjYnZMZovpTKiyQa8/kGyFjt4=;
 b=pgCXgTGmCV0p8iOfb0dMFBjf4dE532IMjmO9XMoEeomAkGnw9Ou+1PzJuMxpYCW3sr
 EMrKz0ieCMVSHmGy1aE5PlBib8rsXKtTMIoidcQYVa+UB5V5d5nziUnNd6DI0/taFvnN
 aphavRIj7ZpttW8Fih1Ql7fXvBRBkNYk60b5YblLVeZ/O9wwWui3PrnvIqrw0ePVxisv
 F0wuXVe68NjSPblsPGiZblvDExduKRK29NXsVNP57Q/wK1fwEeQYlP2e3l5Y7RC2zn6n
 G5zqBt+ly0YZky+irJMQzmzhdOnLcJaJzBokuLBafGc4zrRy6xGxXqA9Yy5zZPhiI1zr
 OwwA==
X-Gm-Message-State: AOJu0Yx9UIZyKfQBoLXL350Fj/oj6hF7onNbvP6ulK9SMqRufp/r1W+9
 ACTy/Pfwz6bBdqcq3/UJm2sySxmGbN7glP3E1V2XILZCLxNWf8GyBHEyuuPVG0z8NgnEpCEBPqb
 YCS0t
X-Gm-Gg: ATEYQzzyk3F4CsDj/AvYpmHSKFwGx6k7N+4k+2Pb3W++bxJXUqbOqf+H3r7TbCw6p0D
 ruJhwwPFhO63a7dSrpG9uZOOCWIJJ78Sj2Q0X+eK11DCrV6IWevWWGuEGcnPvKcVvKPlkY0W6Ek
 tokzIJl+8HQ6UTLzv9K8LJHziuxUswdcEjJfB3miy7WQIBGBMZpyky2L5dJTZ8kVCe51rI610Rd
 DlH+Ef8rqNWJRzhq7wULxu6+gRFFZ6YbHZIo0Ynv+uQBSX6ZxCNgcpeCJB8XYiUXx1xMtGRksYp
 X9tyJmQdKORz6oEm9AtlLDsn596Mz1gF37/O+LvGEHGTWAFl660Q+q5xCUtPWEBLgGn07O5NoUm
 mBKvpxTOZj/uo/zP/tD3rAgKr6audZfVyMsJeJhMfNTCGtwJG1PGXWKSX/Kxw6Z0nQIhtKGVxNJ
 nYI1nFzqQTD+9hEz5nMJH5TRdeSgVvL7bSTOUBHwybLTt+S3aIje+j4ydRbbBAGevHM3ztrfz/Z
 FTqSGsxa+EJjHUh2xZi8ldV9Q==
X-Received: by 2002:a05:6000:26c1:b0:439:b8e5:5c36 with SMTP id
 ffacd0b85a97d-439c7fba2cemr6423584f8f.24.1772660139963; 
 Wed, 04 Mar 2026 13:35:39 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b59723fesm27668606f8f.38.2026.03.04.13.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 13:35:39 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  4 Mar 2026 22:35:26 +0100
Message-ID: <20260304213528.1380898-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772660140; x=1773264940; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RzjbBDXEyWRGszFQN1fjYnZMZovpTKiyQa8/kGyFjt4=;
 b=2V7jj2IMDsuLBaFtiCT8VhGpi4KkOuUsCqstrl6hTlI5/4e6jKrpEJM1D3qo0NndfO
 sBhlx4lVLJGSXn/5zbahvOJowjIPXOHqjJU2g/V7C/weNkto8JGyNtHklHBjVc/NQxz+
 cyGwOJ+xO8QxUrPwjiBdYn5XwMqAE8hfazqUk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=2V7jj2IM
Subject: [Buildroot] [PATCH 1/3] boot/uboot: improve U-Boot OP-TEE TEE
 format options help text
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

OP-TEE generates a few binaries that can be used by u-boot on some
platforms (Rockchip, Texas Instruments K3) using TEE variable.

Add a link to the OP-TEE documentation were we can find easily the
desciption for each TEE format that can be used by u-boot.

For convenience, copy tee.elf and tee.bin description in each option
choice help text.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/uboot/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 47ce24ee76..17b7f95f50 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -295,15 +295,23 @@ choice
 	  Since this version, the TEE in binary format must be used as
 	  it contains important meta-data.
 
+	  https://optee.readthedocs.io/en/4.9.0/architecture/porting_guidelines.html#binaries
+
 config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_ELF
 	bool "tee.elf"
 	help
+	  The main OP-TEE ELF file. All other OP-TEE binaries are
+	  created with this as input.
+
 	  ELF format may be used only for OP-TEE versions before
 	  3.8.0.
 
 config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_BIN
 	bool "tee.bin"
 	help
+	  The original OP-TEE binary with a header (v1) and combined
+	  init, paged, and unpaged parts.
+
 	  Binary format must be used for OP-TEE versions since 3.8.0.
 
 endchoice
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
