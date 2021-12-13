Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EE0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59448404C4;
	Mon, 13 Dec 2021 21:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZR5cdQ8TDJfu; Mon, 13 Dec 2021 21:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66508404C3;
	Mon, 13 Dec 2021 21:34:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1327A1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFE9240292
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MOEViCUC6Z49 for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D21D40216
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:34:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d24so29418123wra.0
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 13:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQJn5OE477dLrjNZ1WaW41cY/kBajflLOJPeP1IrKPE=;
 b=aT1xu6z8gXTutTeHpVVIi3mDZj4tQdZpw9Vkkcnr4rTU06BcQh9zT79tKLzf4etBGo
 3/Ne60KbdDp61/CIt2dcfHA/pba2hCzg6uVhk8VreKxVICpd2v/iWW5AFwv25gHYLGo1
 KLdB2gQsayC9iKfKTug7vAQRqkcTs6/5Sq1EDFjA68V9fvB5Jw40S6gWmXXVeO2n6zHP
 S+BWZV3U5NCzBhZbKOKEBxXkxmwpmDNDukTyl/m83xrGtP/A9GrcTEqOIEsqL6qGTDmi
 XWfo8vdeatCfQnbWY9vduqpIF4+EErx0SXcxuBmqOKFczz8VjhoHtVSQ2tsloKqm6uZ1
 slig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQJn5OE477dLrjNZ1WaW41cY/kBajflLOJPeP1IrKPE=;
 b=w7lS+/9+qBVlcKCWUpyijGX3XUTfMeg332UPv6klVHUOZ01KdQxQxlzzqbTqFrKrSa
 qj/oGCsG1xovZBFLlnei9QOqQk/Xb6txZFH0cUAb3cGYGMIEJoB7aP7ST1V+W4KNbEXc
 PbnO7gWLUkbaZOAwkN7O7uLS57UJtzau1ESf43UK1LPflDIELMD7V85+4QZljIiv0wyo
 RYYC1wncG+U0AHjNt5iX3EUQlinH+Yd1rEmrIc9I7I/ZZxsufFjdTnqnVSWoUYsPAHRz
 U5NZ2vb1rCvc0ahXDgtyVJAczFU25Nz9ShJIW93kSD4CQxzDel14doytl/HV4xJKI3W+
 AUSA==
X-Gm-Message-State: AOAM531mcaVWmH73gvtuTPHBOWQLjNBnB3UvrU6eGMuAGYSGzqK29kh3
 WmiRmNgmHkuq+tc3xD1TDM57P4DJpHEucg==
X-Google-Smtp-Source: ABdhPJx4ENVmca/i0g0f9M0AMm6aqQJJXkPHq3jrME7p3gFc5hevl2quvb/NP7zPD9PVilG/Ak8ZPw==
X-Received: by 2002:a5d:64a2:: with SMTP id m2mr1147427wrp.248.1639431240983; 
 Mon, 13 Dec 2021 13:34:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id f19sm169198wmq.34.2021.12.13.13.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 13:34:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 22:33:36 +0100
Message-Id: <20211213213337.1775232-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/moarvm: enable on sparc and sparc64
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

sparc and sparc64 are supported since version 2020.09 and
https://github.com/MoarVM/MoarVM/commit/87ad486f30ecdf28b4abbcf40139467f626f8548
https://github.com/MoarVM/MoarVM/commit/34e0fb55e33482fe09083627eb54003bde07d8a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/moarvm/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index acef8f5d61..ec38047b2d 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -4,8 +4,6 @@ config BR2_PACKAGE_MOARVM
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # libatomic_ops
-	# needs AO_fetch_compare_and_swap, not implemented for sparcv8/sparcv9
-	depends on !BR2_sparc64 && !BR2_sparc
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBTOMMATH
@@ -26,5 +24,4 @@ comment "moarvm needs a toolchain w/ NPTL, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
-	depends on !BR2_sparc64 && !BR2_sparc
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
