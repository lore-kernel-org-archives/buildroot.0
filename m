Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD91CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C800661397;
	Wed,  1 Oct 2025 16:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXDFpx-MZ5RD; Wed,  1 Oct 2025 16:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDF1C613A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF1C613A3;
	Wed,  1 Oct 2025 16:57:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C3A593C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E76740143
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FYtGaS-K_aV for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FC2B40D32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC2B40D32
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FC2B40D32
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:57:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso20342f8f.1
 for <buildroot@buildroot.org>; Wed, 01 Oct 2025 09:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759337838; x=1759942638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XjQ1mca9sBW2bhJr7AULmCFt2zaKA+QLFyXpvspMv0Y=;
 b=GwBVAia8fiahHvXPmxLbGRNB4xAzq8JWMlr2HzQZIQabnzPPOVhURhLwYjZP+NgUNI
 khXlrB7J6QFZEsUkFIiXS7HXIVXsK8FtCD63CaEp2nutL0MT7NbWeuHNKMBOzoYcFFz0
 UdX0m10C7okMTGw/6OE35aKmfPfcfLTSOX0wC6q5dJeF5Cl415qBCMGpqjWiGfw4lblZ
 Wlyu3I0cCUY+VJZaVIh9JWl0lRc89fpday0ILTnyfx1cQbghCGi62noTReom/1nGjDar
 Nz7ns8MnH1EflV61977W6gftjZjMPiKb+R43sEuKfevxNNga3xeI+xBXVpKpPcLG+Ar/
 rOCg==
X-Gm-Message-State: AOJu0YxRDQXZNoO8SFYowDoWI5t6sO0UHa7CS8B4H4ip66dLxgCdxiXS
 d44eoGlt0ocXSRrMw9oYn9xBTW1kT5bWmtofq++HVpbU3OmGuayUgoawidegYjPaYzRg1e2f0Ap
 jWquHlug=
X-Gm-Gg: ASbGncsl5mZyEL+sClERCIsN09McskypdqUFFK8vS3dWrTjLm9kq5e5041fHFXx45O9
 78fqIpItncZhdYyomwbPfCJxbkaSGpljRkqgZl/WUpBcN2WNpomYz0YO9DiS4lPz9s5+qLH+WEv
 oaqokPB3+iFZqNWQZOWTY4GaUrVjTvH3pOQ3bg8QI1k/FnsbqTTZlUSSXxtzY4EUljPdyafn/0D
 9KhWhmqZLIbHmJ0/mugEUGegHR3tlaze1qmB9ucKaQkXiYfh3lFBmH4Q9CiDPPkW2wjwwHcUgwh
 BoR7m4S+FzUFrYN+ERQ62ca+4rYGYiE61SRnsoOMJaqBJobW8y0mvh5LiaGbhfUPulZOFPYyA0r
 7LtoYbcIKVdVRttgK5u1h4BJsjmO4aYIm4MoPsDe9Kb35piL0ZL9QkAvVTXtoszuo1SmdFZPm65
 K3wBdgIzvQLTgTF9T7k/m99opUigKRaGmq0TIw41AEjLfjxg==
X-Google-Smtp-Source: AGHT+IH4PJX6fhtbC/nstjk3R33Ab5J/s1KJ/dRAAU8WMU/KTmfAQLd8MdNqJllmUJyZxIFGiFX5Ww==
X-Received: by 2002:a05:6000:2dc9:b0:3ec:8c8:7b69 with SMTP id
 ffacd0b85a97d-4255780bdaamr2881696f8f.41.1759337838142; 
 Wed, 01 Oct 2025 09:57:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.238])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6199193dsm47475265e9.1.2025.10.01.09.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 09:57:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed,  1 Oct 2025 18:57:14 +0200
Message-ID: <20251001165714.3844047-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759337838; x=1759942638;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XjQ1mca9sBW2bhJr7AULmCFt2zaKA+QLFyXpvspMv0Y=;
 b=fWFyDopLl+5/bduWPflkKzfqUuM3JNgRbcK1+U6jN0PiAkaZ/CqWGfXNUh/WT1g5b8
 uSNLDG+DsrD904EFP34gTeNPxQ7MRTg5SNRjsb6jhbt+aQHxiJMhAfy/uLKF34+43I+Q
 y2oW50lN+kAnyov8a8oDjmcBczn6O5+bgFfiQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fWFyDopL
Subject: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.7.3
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

Release notes:
https://github.com/libexpat/libexpat/blob/R_2_7_2/expat/Changes
https://github.com/libexpat/libexpat/blob/R_2_7_3/expat/Changes

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/expat/expat.hash | 2 +-
 package/expat/expat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 87bbf86e1aaa..9d99c38a451b 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  354552544b8f99012e5062f7d570ec77f14b412a3ff5c7d8d0dae62c0d217c30  expat-2.7.1.tar.xz
+sha256  71df8f40706a7bb0a80a5367079ea75d91da4f8c65c58ec59bcdfbf7decdab9f  expat-2.7.3.tar.xz
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 51b45b01bb15..07aba205cfd0 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.7.1
+EXPAT_VERSION = 2.7.3
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
