Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC2FC43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 10:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67285608E0;
	Mon,  6 Jul 2026 10:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pk0sembsUujV; Mon,  6 Jul 2026 10:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F57C608CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783332188;
	bh=EbYyYkiwsMTUcr9J1tXyZPPPNVfUFoMSInMosQKBXQ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=rvclpJWZB91TvFAknhydi6mfwU8th/Y7mZ5ugksXDQ9WbQmaTNWMVr2vpVSH0kedX
	 3tNsb6aIENRe0IIxtXGZok8tWDN7oyyEq96moDIymttILVo/Gv5708mo8nMRHYpfzR
	 BtvFaCLA4n2upB9BkwimxFLfbj6/efTnLRHcTxqRn82h0zfms3cxsjo2oMQj876EwR
	 kZEtC4GiH0vhGOcObZ1sXOSseaTszYkjR7WzLKCxPMRiBu9SydVKi2+105XH7vTKnq
	 pFbb6dz1DzHScoF2UvT2h1XFue01mdPe8xyhyLEw+hkjFz+8rAZ6r4eS2+zEJGxhCP
	 EjuNuv5rtXBLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F57C608CC;
	Mon,  6 Jul 2026 10:03:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C7AF316
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 10:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E33B608CC
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 10:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k42kIOhj1kjM for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 10:03:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E75E7608AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E75E7608AE
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E75E7608AE
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 10:03:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-493d3135f62so8784215e9.2
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 03:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783332182; x=1783936982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SmU+mEbdxFaB6M5cYLO6e0UeujxYM6Wr+VH/64frUx0=;
 b=pq/7gy6YnJPbr4b5i+6PRgGoQkyaBlHYNVFxR2kcVzlw6HIM0CaT4GAavdbij5/Fxw
 VWYMa30NRI1A7lW42c4KX84Oa2eC6FD9yrR1GYMg3JnsPm8/YIZPoKz8iwQxhmvcRAqc
 g37mmCyeNCgk/gZ3Qt9fJdiPU62Lk6nrcpRpdKd09sKv09iVUKKU7TntW625+aOxLEgw
 AO6S4b9XmjFyoR6BL0owcc+yOfgu1L6zzJ33G7lHxO9p4P3yYvmr4Rbp0d5zBIF8oHzk
 li1TfFxuekqvswn48IJsmR6h5qqRJjGel98GJ8oDcXuJEX0TN3rgwPYFkifD3t5enyBG
 0oGg==
X-Gm-Message-State: AOJu0YyFsayWY30vqk7TZXds+XGDgzdpV4dRyrTlH26++k5dhDAmvETw
 V5/IRGynsfSTARVCqY7QhTc7oTILL2zcVli8e0fHnqkbFX3Wpn4iTq6a5dd43B64t7tYn/mx2RI
 ihb3U09s=
X-Gm-Gg: AfdE7clABC1jNY9dJplXPLCNOJC20S7Y1pccGv7QBPFpCkEJ6oVUY+zxfH3FKc839GT
 6o64L6fUOwAPt7ACMh0heDrM3whLrsb+Sm3E+UX6rnAy0eYsGTh2ssy37RVJJ0F4W4DkWzYern4
 wMjmYo4dupP3Mdl25YjU2E8cz6A+E7XaJTHUlqdiWuLy7FHzoj+/7V/XnH0Y8x8MmvZTP85E0cp
 6ykjiA98WzqZKM8m8VSNcRkiB+Qw3XaARy6eQl6mkusKqDOdZnmfAojt4CkLPKyTurc15ipJL7+
 WNQnHANFMJHoHql57/3roinphLGuJKtFGCwtGuln20p6wWhs2SPmcu2JIwGr1I7ttiLjSYnlebZ
 QlS+r4o3k9sBoiI5vd9hGuxHESoXTaZZxSrI+iD3v9SI8TMws/KIOUGbd6Bkobi1GFVc0O/WSFD
 RvZWXDPgnbeompWUYT
X-Received: by 2002:a05:600c:4f81:b0:493:c453:600f with SMTP id
 5b1f17b1804b1-493d11d4355mr100145445e9.6.1783332182386; 
 Mon, 06 Jul 2026 03:03:02 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccdb566csm260586845e9.7.2026.07.06.03.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 03:03:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  6 Jul 2026 12:02:59 +0200
Message-ID: <20260706100301.60854-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783332182; x=1783936982; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SmU+mEbdxFaB6M5cYLO6e0UeujxYM6Wr+VH/64frUx0=;
 b=D63er9x88V1YFXtM2TTvUrWk17to2AWAVyxs+HqvVo8Vqy9xQnuuHbDXlcIXkOjDmJ
 MH2YSV75LxFCSQneLDWrNAQwTARas8ChmX38Xf04oF0/riEcgN2tfa4dpgV/apXvrn7m
 ghJES+utpv5gqQ7W/t3xnVqtAszYTBZr9R3MtQWg7kf+NZNLda7YPJQQRhclJLajI6D1
 p9sumB6aYvyI2NFD9Y+4wAILHbgbAbZK+u0R4Xj/nHeCzq3BTcJO5CYIu/iP95l99nbp
 Xfs8jI7PaiQM7+NtVMZPDdwQnmrEOp8KAloHJwrVutEWwfirouHqCQmyRKNNoHr1DDJK
 a8Bw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=D63er9x8
Subject: [Buildroot] [PATCH 1/3] package/ogre: add CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vulnerabilities such as [1][2] are assigned to the ogre package with the
cpe: ogre3d:ogre.

To correctly match against those vulnerabilities the CPE_ID_VERSION uses
the version without the 'v' prepended.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-11014
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-11017

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ogre/ogre.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index f3e3fc1d8e..4f19b285be 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-OGRE_VERSION = v14.4.1
+OGRE_VERSION_UPSTREAM = 14.4.1
+OGRE_VERSION = v$(OGRE_VERSION_UPSTREAM)
 OGRE_SITE = https://github.com/OGRECave/ogre
 OGRE_SITE_METHOD = git
 OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins)
 OGRE_LICENSE_FILES = LICENSE
 OGRE_INSTALL_STAGING = YES
+OGRE_CPE_ID_VENDOR = ogre3d
+OGRE_CPE_ID_VERSION = $(OGRE_VERSION_UPSTREAM)
 
 # Download with imgui submodule (https://github.com/ocornut/imgui
 OGRE_GIT_SUBMODULES = YES
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
