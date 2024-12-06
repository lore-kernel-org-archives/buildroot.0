Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011FBE7716E
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 02:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A47B68134D;
	Fri,  6 Dec 2024 02:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usXd0fEdBHki; Fri,  6 Dec 2024 02:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3CF481359
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3CF481359;
	Fri,  6 Dec 2024 02:57:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C70BAE8
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 02:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96B504132D
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 02:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duNrJJIfevD8 for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 02:57:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA05041315
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA05041315
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA05041315
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 02:57:24 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-725a84ff55dso942279b3a.3
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 18:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733453843; x=1734058643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B8bVvnw4TTMdjjKTkajw3QWJkm1bdJnWI6141l9KOu0=;
 b=TjIdNT/INH9sPMukFbjqnMRbDTNDkdpTHeOjF4SlEPaOmm0gSoLt6I0NzKfEIufyaq
 6NXkBEN14t1jHFvPhs5T+T5LpEplxEjmLAdIX4a+7+1ogO/TRM8ZRKbbx56uMWhgImpO
 8fVcOsHEvfFpWcevQRzMEjPEOABD0PcTfOZ+FA+dI/zAvCdPJxizspZa17f+Dda2v191
 D+I6N+zR6scqezdWpHMd2Qq+hX2jL1vJonEaKnQbCJsTrHXQZ25bdsSK3uqTGLIiy1OB
 mnBcCPsoujfL7TKKdYZDDxdvWRaz01p5khCyIvpXFI0IzVVqqIJriNkNS0ZXrjmM2YR+
 29Ew==
X-Gm-Message-State: AOJu0Yx2R1ZYdSaCYby+Fxp1BHuJQFWDKVz2nJOzTW21RNX6rVsmKCC0
 yXM0MHxJNvASKoPW/44W3IvuUSMCc7yHnj0D9npPbq8wezykKSA/yvaezA==
X-Gm-Gg: ASbGncsViFcb4exZHsEBtOZA1d4La079nfPf9AU0jzfCrdVtYQmbp1nFzdiliCMaWgx
 CTxfKkLbyI8X3vYX9sQlkMMfZJdiBdwwAZEdrlCoNypOKdCILBMUTiXlK5aWYwTs72gKqXAGbOM
 v9x5m7sy2FEqU4eHPgx9mFyUVcL6QnRVBT4McywYoAbzIni5ThnCbVBepByHF87VATa/7jJw+NI
 PSnhraw6p/AJQGz/vBmjJeSTEgyEreqVgN0Dr3lgHIZ3po=
X-Google-Smtp-Source: AGHT+IEnI3ploWVYxpQkZMrzTjMElgh1b7lZTavabUsSkJECMSYXJaKEDt9QtKE+LSTQVO/b7yStiA==
X-Received: by 2002:a05:6a00:4f81:b0:724:e75b:22d1 with SMTP id
 d2e1a72fcca58-725b8177c4cmr2602887b3a.16.1733453843109; 
 Thu, 05 Dec 2024 18:57:23 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a29c6018sm1961363b3a.16.2024.12.05.18.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 18:57:22 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Fri,  6 Dec 2024 10:56:50 +0800
Message-ID: <20241206025708.235064-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206025708.235064-1-fancp2007@gmail.com>
References: <20241206025708.235064-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733453843; x=1734058643; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8bVvnw4TTMdjjKTkajw3QWJkm1bdJnWI6141l9KOu0=;
 b=Hht6cstvYwVocTDqrdDq3vQDONXxgY2/nAS6FZo3GzUZvI+koySKJZiGeTMWfeYLyv
 OjRYdO9UmQPm5ea881hZwS6LzTgt/Og6MYefUyebfCrfoUvwnORExtDK5EzvkMxh0RsX
 pUQFxyx0rG7dkXhtPMlivPJq/bzdcpO3z7P2Js7Yr3Ojqtj+slMF3vXWb6+/4N32FGR/
 5AmM3fqyX7gUs+SgMaan56yMzxjDAalM57Pn/2KvnOLpgIgM805C3fAPbOeVbW3DOSbQ
 OZ1Z6J4bJcYk5JqsWB4vkZqnUTyLaxETgMkPTdUo787rOep2Ih1Bp5qthgQDzKO3+h7H
 JdSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hht6cstv
Subject: [Buildroot] [PATCH v2 2/2] configs/cubieboard1: bump Linux version
 to 6.11.11
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - bump linux to 6.11.11

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 configs/cubieboard1_defconfig                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 42d02c9f78..4759f8354e 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
+sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index c3dede47b8..6d189bcf95 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
