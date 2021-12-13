Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F096C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1627260B4E;
	Mon, 13 Dec 2021 21:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jie_AtnTvHSs; Mon, 13 Dec 2021 21:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7304460B4A;
	Mon, 13 Dec 2021 21:34:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 913351BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E4B840574
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5YRAOTrmNCZ for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:34:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAF754067F
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:34:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q3so29276277wru.5
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 13:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qR1buI2ao5zIk7oCKo8glf1dwKJrSYDfbhCIltr3JBY=;
 b=GDQ8BXBxqs5OTzzph4EezYu+S8bEwCd/kdoCrsfRV9gCpefZkFfYvS4s0VpjJgReW5
 NwWKGibgnRLSY7l9eQ06zh9Q3UK0ZhLWStm/xOlLOcinlUE79oRblYh7KM9MYF6/f7Jq
 io87dEUCB0D97HqsPpTPb+/W/Df9AGUPc64DahzWlYI95x8oAxnj4HTJCkIpMPWoqBHc
 ZhR5oO2nhnUHi0zpp0D1Ci18Vllc0ZN0whjK1ANZorCEE/2ajrFRQxDHFGlmMFJrFTfR
 rBwsbHzIiR89CZ7qBNO3mNSYvhw+4XtLCHx1a/UjvCWAYneENIEWxPNphim8ROGUF/25
 cP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qR1buI2ao5zIk7oCKo8glf1dwKJrSYDfbhCIltr3JBY=;
 b=GVIFzqvjXfkdEoxlTT7USmpEkNP1BGGhte6UJu01DSCC6oHtp9UecudomXW+uJhmI3
 y37k9Sz/CeuO2M6AWAqtN/TgoZa8CTQn5bAE8Sro+Vrh0WJk7Rlu/LA6zezI6FsVDX7Q
 tjOQkwqzNdeKss7+ZpgxokV4tHJeCrDHoINkDZWNfBsl2Rp6gXfj9GPparG5jqSOxYH5
 rf1TOeB/ixbaye/u9kb44sQSj5s9VFN3TSSFUtbS61zWG1i1Yxy4h8ezFlzsDf5Yv16X
 StCR0TK9hZCFyX7MPV9KEH91LVrhzvA10v7IL8bMnUEAA6VyZ+5zmHGvXBy37F+mq7nd
 c9/g==
X-Gm-Message-State: AOAM532Li9t0eYUM7oMi+5OLPt0XdnEVfJA/x0vXPDTujkxWV4UNQ4hN
 3ac0oOTKFBVhys6mj2zn2D82S/0eMXTWgw==
X-Google-Smtp-Source: ABdhPJxnrYbnWdmQKuKmEY9jnUYU9oMRfuK7zQk89V31a6n6Bd/O2O5unN9YQV/O1HCpxzma0EZCWw==
X-Received: by 2002:a05:6000:2c7:: with SMTP id
 o7mr1221966wry.62.1639431245779; 
 Mon, 13 Dec 2021 13:34:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id f19sm169198wmq.34.2021.12.13.13.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 13:34:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 22:33:37 +0100
Message-Id: <20211213213337.1775232-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213213337.1775232-1-fontaine.fabrice@gmail.com>
References: <20211213213337.1775232-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/moarvm: fix libffi select
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

moarvm's dyncall supports powerpc64 since version 2020.05 and
https://github.com/MoarVM/MoarVM/commit/d2e84186764bd3c45e7e10547f87ffc5a06f9efd

moarvm's dyncall supports mips since version 2020.02 and
https://github.com/MoarVM/MoarVM/commit/657b536cf6e861ac0bb4bf550e8aea5042a950be

dyncall does not support RISC-V as stated in https://dyncall.org/index

Fixes:
 - http://autobuild.buildroot.org/results/027b7d15e6a6111409ed17bb29e001b6c6d9e0cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/moarvm/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index ec38047b2d..11d8ac7ebc 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -8,10 +8,8 @@ config BR2_PACKAGE_MOARVM
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBTOMMATH
 	select BR2_PACKAGE_LIBATOMIC_OPS
-	# dyncall does not work on MIPS; libffi needs to be used.
-	# See: https://github.com/MoarVM/MoarVM/issues/222
-	# dyncall does not work also on powerpc64 and powerpc64le
-	select BR2_PACKAGE_LIBFFI if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc64 || BR2_powerpc64le
+	# dyncall does not work on riscv
+	select BR2_PACKAGE_LIBFFI if BR2_riscv
 	select BR2_PACKAGE_ZSTD
 	help
 	  Short for "Metamodel On A Runtime", MoarVM is a virtual
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
