Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1353C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 14:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B07C61104;
	Wed,  5 Jun 2024 14:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moFGwSU7X0dM; Wed,  5 Jun 2024 14:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAEDE61155
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAEDE61155;
	Wed,  5 Jun 2024 14:18:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B4F11BF23C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 300C86112C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbR3U396oTmy for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 486DC61104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 486DC61104
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 486DC61104
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eaccc0979eso7577291fa.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 07:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717597099; x=1718201899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wZRiPMZlVwmxtnXwUijT/mthL0SRbNxRqfZesBf4o4o=;
 b=st3fQU2/IVhqS93MKxHO/SxdP9SpwbwQtGkh/9gYgGjM9SORDuYfojqnsv6mrs8jiM
 j7lmCUoVQCwpWtHNLqVWl1CjiMCGnx52vI1R1CcfelqfafJ0NFYRiGZzM2S3B2h3auW7
 yax8TplPUhc2OXG5i8SsN2l5qwbwyj65/pxGqJBO0Qi7c44PcdTQfcI6/i3E1btWgwWj
 4q91vEB6f8MuVQ6eStc02M4XqcXMIKY8HIhjU23yfqUMYq7/MPznQxEtbuW30WWbNv9r
 rsgyK6iCL5NYgeoQVDQ6s0ZlvO8E9oI65cfJLzqSYHNtO7Ihmxd7BG/Zr4tNm8FM7tQ/
 HvVw==
X-Gm-Message-State: AOJu0YwTEtRuGfHRUsV7M+p00L8yypwRmJIDcsZvWrIwALuWFuqFV/z0
 DX/YfEsdpEA3zRnY7SF/fgA0F/hi414hVSj9eqy3i0xiGltyK2LPMLHM6w==
X-Google-Smtp-Source: AGHT+IFeJdcpm89UE/XMPuGq1VLy/fgYrtN3MTxXD6FblOgkEVqNogAGH1IbNtSdmbp6wOjS61OnHw==
X-Received: by 2002:a05:651c:103c:b0:2ea:81b9:e153 with SMTP id
 38308e7fff4ca-2eac79ba8a3mr14359131fa.2.1717597098725; 
 Wed, 05 Jun 2024 07:18:18 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149057sm24253925e9.36.2024.06.05.07.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:18:18 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 16:18:10 +0200
Message-ID: <06b95cc03f7f9e53d4fdce511d4bcd1b01ecb7f2.1717597094.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717597094.git.yann.morin.1998@free.fr>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717597099; x=1718201899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZRiPMZlVwmxtnXwUijT/mthL0SRbNxRqfZesBf4o4o=;
 b=JkY7/gXyTAUftc/DuqM32h2/w0tEkUcfa8swZ66+F6RygeTAsEpoD1iNRha+LA/Qwn
 z+O/WOGoNiQoXul6X6DjWKDHPwpTbZFr/pd83SPaxXd1MXmspVxgOzj9akktUnMFqLS2
 O7/F6GbZno8VM/z/rNngBm63kz11H1UwwY+CFolH/JlECq1lxpLLjs3MuCEv0OynaesY
 vjgFNq4XETZav6vHT+kwqtIAjRRKPDTVEpSBQE6vy8hAt99j9RESQotaMxRabgtN5jQ0
 Pudo7g+wb4DiyWmKfcTfXS4vDNyKZ6rs0qAwqQt9Rca9eZqwBYt+cEtg93pcOSqaRBl2
 npvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JkY7/gXy
Subject: [Buildroot] [PATCH 2/9] package/cvs: use appropriate TAR
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cvs/cvs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 64c15f16fe..cf9127fc3a 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -31,7 +31,7 @@ CVS_CONF_OPTS += --with-external-zlib
 endif
 
 define CVS_BZIP_UNPACK
-	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | $(TAR) -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
 endef
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
