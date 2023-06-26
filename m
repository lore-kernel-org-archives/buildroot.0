Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F64EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 462F541AEF;
	Mon, 26 Jun 2023 16:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 462F541AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3L_a09OLIFaI; Mon, 26 Jun 2023 16:02:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC1241B19;
	Mon, 26 Jun 2023 16:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC1241B19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A92C01BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82017612EC
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82017612EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e98d0z2inq6r for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:01:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFE086137C
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFE086137C
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:01:06 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b7f68f1c9eso15083315ad.2
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795266; x=1690387266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OHJC1lXxtoeGUt9eZ1AUuHWSIqQY4zsGzHcxk0oGL1U=;
 b=Jc9Y9cAY2txLZNSyfKVZOPE81npntjqTSjTXqMGNP1dKbslsJ/sOCwr0aT3js7b8Te
 vqCyS/HKzOXB/falLoosOo6dDOQxu2G+O5TNNtWGWtzpeDTv//330+YqdSyXS6i0PEpg
 5oFqoKKBFhwnq7NbzbTRdoxfyZwct/ncgseNO8/TZz+yGkqvvKAS4RPPaDdWdCuG3PYv
 M3E+EVxwbB4GhCEyl+HX6STQz3Q2q8mPzGozdFRbHrWLyhiLdoAWQ/oVoaqXjFdX1j57
 cdYHXmQB4BVjbT0XE8rk2zIQ7EeuTXzcoA0jzbCkzDQXIR25HasFSjlZaLN/5VFVYECD
 1f0g==
X-Gm-Message-State: AC+VfDwB4r86RDZJETIkdidppg69O5i3McMf+QjtlcBMfDFY7WPRe5WE
 gYNoZZuWyHsI0PrQpuXYh9mvT7qsW7oJZA==
X-Google-Smtp-Source: ACHHUZ6XLEMAL8Lzg0i0Wxem2i/VRJenTJZiNAvuiomG0Mr3TT0SOc53OVnxVf4GBdOChpaUuRy+6g==
X-Received: by 2002:a17:902:8c8e:b0:1b5:694:b1a9 with SMTP id
 t14-20020a1709028c8e00b001b50694b1a9mr7227755plo.32.1687795264250; 
 Mon, 26 Jun 2023 09:01:04 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:01:03 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:27 +0800
Message-Id: <20230626160030.93063-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795266; x=1690387266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OHJC1lXxtoeGUt9eZ1AUuHWSIqQY4zsGzHcxk0oGL1U=;
 b=U4LYZILYCIYQyDrgyNAaIxdKiPf0CjT07VrkJU9J3OekuFCeJKtjrIexAYCaSZ7GtB
 dSTD5if7jTLZqU5sG4yOG61JzYn/z9vDVkgWxcQ4v7qDZfYfDGKLD1QlHmZtMMoPOizv
 aHG+VzCGssfssixuEVvHsoL1FYyBlPzPLPizGNszRfx+r3PVIpa/6Kvha0omb6p+eROI
 clt++eqIyex1n3hibMXP2IAMusjqXzP+eUpkiJFAebJKBhdBx1eMe4GQvTrDQjzi+8H1
 4v3mwNvPlUQO1/F12W0cyL4wWa8haQHCjR5nXsomK1nHbmdPmfAvSi+STYFQ/JGpXGCw
 +qnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=U4LYZILY
Subject: [Buildroot] [PATCH 07/10] boot/opensbi: Config.in: Cosmetic style
 fix
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bin Meng <bmeng@tinylab.org>

Use space intead of tab before 'if'.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 boot/opensbi/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 5e6b8d158e..99c4989479 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -57,10 +57,10 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "1.2"	if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.2" if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
-	default "custom"	if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
+	default "custom" if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
 	default BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_OPENSBI_CUSTOM_GIT
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
