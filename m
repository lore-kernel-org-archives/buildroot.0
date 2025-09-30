Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFC0CCA468
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 12:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC20C60F15;
	Tue, 30 Sep 2025 12:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWKzOPeh_qPr; Tue, 30 Sep 2025 12:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1391660EBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1391660EBA;
	Tue, 30 Sep 2025 12:22:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3024FCF
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 12:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2208E4096D
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 12:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUlc2D1f05oH for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 12:22:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C2E940AEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C2E940AEA
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C2E940AEA
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 12:22:46 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-77f1f29a551so7837342b3a.3
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 05:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759234965; x=1759839765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ng0XUr6cmQoFLCALiDhGUqJ/++5NCj3QxY+UqRjiNg=;
 b=mpt23xNdRUtetrldY6R3jrc0uaXcQEPgZR4uVTdqIUOI9TtbjBniImWxhtIyQhH2kw
 81TBFpBn0dA6cAAppkAP1rcTqbPhIFpibKSt/DTybydGs3jiLg8Qkch4iNE3IIilECA6
 8VYb3enBVOniC7pqIcT8S1KrQ65hzPpWp0fTvmnhk2jITL8av+928vqXMTh7s8dfus+1
 zQhajYwHO1TYeH/1zvdwL+WccoC8/yi1WZ4G2g92aiCbHeXimf8M5HaLkWLVNciERP0l
 zo6J93ZBkJ0CQi9NubLUhM+0BlhId9tPE0/nr8pECUiZVW8WwMpK13IhtCNncZ+Y/WLO
 XM6Q==
X-Gm-Message-State: AOJu0YzfTsVjaIhjISdS5as0TVLJUYpmWftW4cbZgnixKZUq7SodG8br
 ea+7PfGiS7NJkFoCPyT5XlzCynnL4Fj2mx6sDw0kyGWVoSFqK7Gz1Neo3qlrsQ==
X-Gm-Gg: ASbGnctO6PE5+R9kCGgvF/L0riiYq66tN1GTXYEjgtHVfRGSjkXPdZzEUUXJn64QPML
 wgK8zTY/cCbtgNkAxlRsdjzDNI4qXuFBrLXHOYZK63lu+04yo0M2uQno6Pzp6UtJO406C8C3AjR
 H55h//sUqazGqhqCmnEqWGQ9d306m0LtzXJeq8c6C5j48pzSDHZ0wlGPMnmb/O0NsV4Kg9ZFp1e
 0/GcPDgjZIaDjla7/m0lwOH62K8rCGZdJcN7ZZeg5M6jKbQGhcjxKGK0YpMc9NtHvcI2aPo3TG/
 FHYNcK77r0somHTnjbl05RoAz+T6n/B3tkA7nmOGpAQxWmn50nfG5xLFR/bee/8buPYbTdsSm5C
 ByArcDbJyobD8WZg6/K88T09ZLBrjsCNARzUxoPTRACYre79SJse1yAlhSNV3
X-Google-Smtp-Source: AGHT+IHboQw2fA0oEb5AVKP+Q926URWKHDwp8ulkHIxUA+K9kgLqxkXcv9iwguiKQyXrsTwRKAH7lA==
X-Received: by 2002:a05:6a00:919a:b0:77f:11bd:749a with SMTP id
 d2e1a72fcca58-780fcec5f67mr18437241b3a.20.1759234965328; 
 Tue, 30 Sep 2025 05:22:45 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f0e7:b322:50a0:9290])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102b25b01sm13651510b3a.48.2025.09.30.05.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 05:22:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 Sep 2025 09:22:37 -0300
Message-Id: <20250930122237.2005049-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759234965; x=1759839765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1ng0XUr6cmQoFLCALiDhGUqJ/++5NCj3QxY+UqRjiNg=;
 b=TuYp2fJnvemL1uiqCLhhCUlj/sZwzldOqkbQEnpbpDliBbNWq5Qd3BJw4qqaOBrD4E
 6rSF1WbD3pvcT+Bs4tgkt0WWiuoZ/Z/n5bU77/B7a7wlr4rMnzQpG6axObIhEIe8TcMG
 Ju4OXFF9ZgR5r5t933sjbY4oo8sjcO40Be0oG2ZInE0KDQ2EOv/OnD02s6iL3cxj9ryI
 gPUK+nQcKFf9xN3B0LNf5DzVJgbghTKA8JT5JnA7S2OWB1RP/rMhiKy4wgGmtzLSi9/F
 wrEh8fk4Q78hRIA5q7FpF5PiFZQ3jM6W6FqINXAeq7yPJqVdAuCZDeH3oPXISxVvA/BF
 ddew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TuYp2fJn
Subject: [Buildroot] [PATCH] package/crucible: bump to version 2025.05.28
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

Bump to version 2025.05.28.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/crucible/crucible.hash | 2 +-
 package/crucible/crucible.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index 959dc8928624..0ec297c49d17 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
-sha256  466b7b0be8b5085d669d63cca2a80f04c6dcbdd887a51333532ecb804a6b74ca  crucible-2023.11.02-go2.tar.gz
+sha256  6912697626baf47b21ceb620eb2885bf0fea8a1657a9d0046d11c148289109e2  crucible-2025.05.28-go2.tar.gz
 sha256  a89c50d83be30fe7ec75be69a07f6c1b5dfaae0a6b94a678d2394fff34acb69c  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index 5eedbca8eeae..9b34cc52d950 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUCIBLE_VERSION = 2023.11.02
+CRUCIBLE_VERSION = 2025.05.28
 CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
 CRUCIBLE_LICENSE = BSD-3-Clause
 CRUCIBLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
