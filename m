Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE8CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 20:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5613782D0F;
	Tue, 12 Apr 2022 20:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbVMdhfRnI57; Tue, 12 Apr 2022 20:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7532D82C99;
	Tue, 12 Apr 2022 20:51:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9711C1BF346
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84AA860E50
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 20:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fl16sjX__WUG for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 20:51:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8508C60E2A
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 20:51:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m14so5040510wrb.6
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kShfBannqBgVQ0iZPWkDpd+cjmG9v3FuDR1oN/R0WkM=;
 b=jof1YQXC6Q2XcwGhxJ6Lo/hW0se9joQfjXh8OTNeq9LSuaRLXLAqOe4rJu7gGFAROD
 KL3tcRKXAdxfJOb4RW5TFZXbkmd+t/k/OnORP919s5ruMR/GWQTFFPMS7+fE+yfyYCGv
 GCBnft/SeAiE0X8gL/d65AK3zBkJTNAafY0qqjObicHIA6Q7jEdcoSqt9m2vzcZka4u0
 1YSvOYMLn73xMVdLZnhw+jspZyQE2xXWRyXUDakXN0frpUoEnIk+mehrcLG+sLHp9de8
 R9WoKwsClDdQFX9olPR5qqyfXloFilLlFYWR/F850nYphtRc/Q+K96ZLDBtnZQ/VfG+z
 z/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kShfBannqBgVQ0iZPWkDpd+cjmG9v3FuDR1oN/R0WkM=;
 b=1fwL6xx0RBmAsoBJyN4yOK+2UtTiQiFRF3ppmP+ovz9h0f/bw04+5ZpHVx9NXYSEkw
 hBT+Pu/l9slj9cs694fquPzQFl/52IeTOSwSJFVYQ92LWp5dFvxDdHDnrrQ7tzuaQzne
 koc7UDiK5SUuxV8L03c86Tu/AN3UkJG6qNqvJYYM2J5tJRRQvUQXbYNh7VZx3P9Mwpgj
 65hXmIxMal+HiZdJfBFwvz/k4u7QF7liIxDlB2evX1PKNKburRpNPFhUfn7pidRjT89e
 /N7Pd/Y7Np4hRmMk/SstFPaKur8T2LLaNF/8peml89u4hAhLR7/YPXs3oJIukiOT3xyl
 Wgrg==
X-Gm-Message-State: AOAM532oIaLdgKw3mAqsIitipc3Uqu7QZZIVSKeg7A6Ranm/liBpfutb
 YbY7veRH0MCVmFkBxL2v5q2wLCfNi1w=
X-Google-Smtp-Source: ABdhPJzBLEpxLMyeAbDzWQZPQT1e0dUWfJDzLnNGJ3/HtWwguLeixWmAPtV7vzTHkPHkwrz/Q4J3UA==
X-Received: by 2002:a05:6000:137a:b0:207:9a8f:59b7 with SMTP id
 q26-20020a056000137a00b002079a8f59b7mr17449078wrz.431.1649796678467; 
 Tue, 12 Apr 2022 13:51:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm576699wmp.13.2022.04.12.13.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 13:51:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 22:49:26 +0200
Message-Id: <20220412204926.24281-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbpf: needs __sync_*_4 intrisics
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libbpf needs __sync_*_4 intrisics since bump to version 0.7.0 in commit
4b1003855b02f6d9c77de634c9d0f636470e7388 and
https://github.com/libbpf/libbpf/commit/b0c3d7133faa55fbcbc19f76f9cc9e183e178c97

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbpf/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
index 3aa6679b3a..b3d6e44c6a 100644
--- a/package/libbpf/Config.in
+++ b/package/libbpf/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBBPF
 	bool "libbpf"
 	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
@@ -27,6 +28,7 @@ config BR2_PACKAGE_LIBBPF
 
 comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
 	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
