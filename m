Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1B8C36010
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 08:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 239D54F0F7;
	Fri, 28 Mar 2025 08:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kT1nfy2ddfe; Fri, 28 Mar 2025 08:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 507BD4F0DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 507BD4F0DA;
	Fri, 28 Mar 2025 08:47:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A524D1B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96BCA40567
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UIBNiKCvplmD for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 08:47:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B072B40142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B072B40142
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B072B40142
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 08:47:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so17862575e9.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 01:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743151670; x=1743756470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q85KqY5yGmtzHP8SWoo0O+RxKN1qfcQCzVXv+UdXmgw=;
 b=FeIlGUYd127whYq2Vk5xBxm0hjxws0qF0/41vgz6dJuREjlaGHD2AUyNppkDM4+zEN
 9EOszuhSpQij+byb0O/KWGKOFUC2g8Gjr2QDig3N2g78BFIWN5pLfcs2bosT7LUYTsKw
 pF2xwTWcs//OmUCk1Rf5rr/X61rA8mruSpgUShSdhBFpyOZyTVu4KxAK6UKCKmcwgoSo
 Ofivu+fj+3xdMnkYfiDuIOO4MSgas/wsp4wsxUxlMMk9DSye/4rRylICYYMWYU+4F6Ku
 nSd3BxQPOGvhtOOJVj28qr/1t3z99CB+BIwp0pLizbOvAzw7KclDENOb444jRAPThaSn
 4Zfw==
X-Gm-Message-State: AOJu0YwwzCP+Zy2RMUbrCSa+1KpAFK59xKE2wPJ3bf1t2hCmk4J7WR9f
 zlNyRN2eIGkjCcP/O5I5dvWQgBUU/wCK2laFXILkImCXuvgrQ38K88y6x9RX99M=
X-Gm-Gg: ASbGncvkZ2WLFAUhfqH6csr86X+d4j46pqKW9tV/Jw0k9OGJDVZ9ojh9aNx5yOUEElg
 9TWnohrMlZS/hfPgliGzlF6nWB9aWEhE8LfZEE6M5hXlbVEvEyXYKSIW+3CXJ1XK97jQ3fNI8SD
 HJ7LxgGo/1YQC7SaJvb77I7JiJ9IKFaFX1bqAoYsBtuWF4YysUHnd5UvVIj9gmdw+eMMOsJAs75
 ak0wMqEWsC2U3BfOlunT3L9sL9/zhPusTOYxDtUVcB8GgXWRNEaeXtVbZ0+lfbojYId/qs6xucD
 rt49nB/iS6m9DkOzxmheeKcFnl353ZUb64tmM52weH/1hZ9WX8M1dq4NUWAisWHknHi4pJPDiA=
 =
X-Google-Smtp-Source: AGHT+IGA1a1j+y/n7bFQPBCpbmvJhojbyiLoB2R68dwC4oDsm5d+j46zoDMfnBh3Mg7gXMUtal7aRg==
X-Received: by 2002:a5d:64ee:0:b0:391:2d76:baaa with SMTP id
 ffacd0b85a97d-39ad17891c4mr5462540f8f.46.1743151669658; 
 Fri, 28 Mar 2025 01:47:49 -0700 (PDT)
Received: from freepad.iliad.local (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e12bsm1964481f8f.62.2025.03.28.01.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 01:47:49 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Fri, 28 Mar 2025 09:47:41 +0100
Message-ID: <20250328084743.8759-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328084743.8759-1-maxime@leroys.fr>
References: <20250326132655.35729-1-maxime@leroys.fr>
 <20250328084743.8759-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743151670; x=1743756470; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q85KqY5yGmtzHP8SWoo0O+RxKN1qfcQCzVXv+UdXmgw=;
 b=NhGswL8FKp+2PncPVAXg51YktPrwoFWTyAIQbtcCdzQ09sOL/xI3ekk8oIMnX0vlkz
 hxssID6OgylRkPaMSyBN9kceMvHxUk9E+C8Fo7VXEAI5mVuNzA+oci75tjERMHdpBfsL
 kSb3tVNaQ2RBIGMVVzdup0puEn14SceKqtTsr6wsgE03licPE31jtfuQDO3ecI2kLwQk
 WRPI2+Tm8tP7mYVd0/DIgO3gRnTuwwscO7sMO87Fe8atAPi0/VwljV9kPpZmC917ihQr
 nDIp3rpPIRvKrkh5OoPm2ZLlYiohGwP7rZwRO3lsnAJLnoAN9+E0JrJYixKj/XTXCEUQ
 h3KQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NhGswL8F
Subject: [Buildroot] [PATCH v3 1/3] package/libecoli: bump version to 0.5.0
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

This new version is required to compile grout v8.4.0.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index 433550f91b..f973b6f254 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e66a85a35bae644b0baf9a4e6d084ff926ebaa12023f9df9f34e8f7a46834da8  libecoli-0.3.0.tar.gz
+sha256  bc9ca742f32dc7787146de4cbc3997b28356adaf219049304bbc3368d25b7395  libecoli-0.5.0.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index f260467d1f..f989e7b9cd 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.3.0
+LIBECOLI_VERSION = 0.5.0
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
