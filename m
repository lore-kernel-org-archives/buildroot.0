Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A371C282C6
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 19:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3C7880B61;
	Mon,  3 Mar 2025 19:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSOyhWg5pusN; Mon,  3 Mar 2025 19:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1BAF80F16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1BAF80F16;
	Mon,  3 Mar 2025 19:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2DEE182
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88BAF404C7
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WCFOnFkILPr for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 19:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=pargue@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E295400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E295400AB
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E295400AB
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:38:21 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-472180fec01so49702101cf.0
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 11:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741030700; x=1741635500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=guPtm5WTkcowuhkAmgSxqRQIFmKX3iVwbR4JLN5Jj0g=;
 b=kOHxnOmz/nGoFKsidbBnmdiHlQ9OmDCqisjk3LLXj8WpIviHHxOFZ1uzj9+ZZSzFJg
 gIk2k7Py+fh0u0VYV1/Ftku9oxLS9KR1DOD0IMLbebgCbrWwNC56x/2zfehL3PjKCUBp
 u2qHNzHUa9OpeuseKPYKsF9ElMUu5wGyDR94AH8ckc2OqmVF5FyJ8akjPfCzNe1iyNYQ
 MMV6zgrONCopUNPLql8ho3R0TsbpWcswvwV+8YClYgapcU9Bvg+2nsIEI/PGxO78j70n
 phCWyf4p2lKzdnfT4JbBUIW6eMBRJM3RJZJJuEi5dOya6DadmqZ5DGAWGNDagTg/OLEJ
 McTQ==
X-Gm-Message-State: AOJu0YwzS4DRqjPkk0OoFhpLx4NJIImFKk3/Jg6n6650wSxPFSVa5ykb
 OrPjaTCEEUutKgU2vm4KljisD6PsdWfegoDQ7rlQKl4BS3AGlSgBiOc9FFAu
X-Gm-Gg: ASbGncsGYc9P7sTpH+iGzaC1HH1X4rmQcd3jwcvoAhI1UDl3QP7oD86GR7y+H3aONXD
 311AiLR6NhkF2Rk/rAyf9Qtj+FNVjrbtE5mHWqgZVad4M1fTX1ju6nt3+RDo/O9J+8/yfqTj5XD
 PVsdPbaL6vF9C50lixg95G4cqlWoHDeadjLqH+A+jLPsDfEH48dwPY+KHIzD4pDhhDjG+3Vn1Iy
 mT2kIfjSTkszysMjHMgLAuMpLK9eQdkXlPEso2SC51bCKldaSYcwb51NE4qBX+cnMLQc9f0ILP5
 F+uPxzBbEz1RcvlAkIqWjsGXxokxVdmKHi+Xh95dm2s=
X-Google-Smtp-Source: AGHT+IGhmMPk1dH6UlluzzzGff924k4wMOiUPnC80o/UNaU3F+97TPj9MjBkm6/LWxcFc3JCHd5LiA==
X-Received: by 2002:a05:622a:390:b0:471:d415:cd75 with SMTP id
 d75a77b69052e-474bc08cbfcmr184075191cf.25.1741030699954; 
 Mon, 03 Mar 2025 11:38:19 -0800 (PST)
Received: from US38Q1RG3.. ([2601:249:4480:40b0:111e:4a69:d9c2:f00d])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-474de7bf0a3sm20572381cf.35.2025.03.03.11.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 11:38:19 -0800 (PST)
From: Paul Argue <pargue@gmail.com>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Paul Argue <pargue@gmail.com>
Date: Mon,  3 Mar 2025 14:38:10 -0500
Message-ID: <20250303193812.2501444-1-pargue@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741030700; x=1741635500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=guPtm5WTkcowuhkAmgSxqRQIFmKX3iVwbR4JLN5Jj0g=;
 b=QVe668v1fLTerDT9LetY7pYO+v3ytzlJolml1cdqpY3ENsu+8Sr1QxrNhSqsPbyZx1
 LWHux/wMvNB/N+dlYqpog4sZPdP6+k8wQvcVPdL8ULDi2eCHom9CWa/g29RFFKaQ7oHD
 144AmqnuQVQC6RwlBFhSveXnEPJFivMlwK733mWEeD+z6YW20pZ6Dz47kqJRPfvG04Ip
 FGXkgtpKgEMflz4pDsVHHu1F8V7gqrcl8ILDqAtB8eA+3xfstx7RIBLRH6IrgYmoc7gY
 BiVj9VHimPrFQaDHLy9hi/UPj1+ywdZxeAL1pzxe/o/PIbeq9n/UTOvtyOTCABHOO112
 HUyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QVe668v1
Subject: [Buildroot] [PATCH 2024.02.x 1/3] package/libxcrypt: support host
 package build
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

From: James Hilliard <james.hilliard1@gmail.com>

This is needed by host-systemd.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: set the host _CONF_OPTS]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Paul Argue <pargue@gmail.com>
---
 package/libxcrypt/libxcrypt.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 3a3d808a38..7f6c31fb02 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -13,8 +13,11 @@ LIBXCRYPT_AUTORECONF = YES
 
 # Some warnings turn into errors with some sensitive compilers
 LIBXCRYPT_CONF_OPTS = --disable-werror
+HOST_LIBXCRYPT_CONF_OPTS = --disable-werror
 
 # Disable obsolete and insecure API
 LIBXCRYPT_CONF_OPTS += --disable-obsolete_api
+HOST_LIBXCRYPT_CONF_OPTS += --disable-obsolete_api
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
