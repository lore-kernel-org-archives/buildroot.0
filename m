Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F179CAC5AC
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 09:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD73684AE5;
	Fri, 26 Sep 2025 09:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJLG7lhLkuUZ; Fri, 26 Sep 2025 09:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0244184ADD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0244184ADD;
	Fri, 26 Sep 2025 09:12:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80A80177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6708F61BEE
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EBRARmMcgKT for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 09:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67E9661BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67E9661BED
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67E9661BED
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 09:12:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b38e5c2e055so38993266b.0
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 02:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758877955; x=1759482755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWqu6upLepRYdGfDTDgLwXEQEgfoVigcpOj1lJjDzc8=;
 b=ToDehL9FpcwEwT9iACNTkY0olRDNJG7CHRp6AgYew8pcqMoFhqH2s2gZhxR9tDw/QY
 xGB0foj1p7AYnrIqcT69HnETIGA0aiBjhBvuMrRROYL7OpnxK4e/67Z+lTVIz4eUeYPp
 k/NNM136O+jXsBiMc+wG93eeezKAWDFkxOfoCqzRW8lq/Tw8RNHxQ82AbJoaX3xHVH2i
 +qh9mKzLAwQqZx5jjHMQzRbeE2CIXSuYHC6Z4te4cf48M1xU536p7bVuK4+pm1JQcQwF
 J6Kv6ZkKKeStcjlhbZVY0XkXZlZiCCj7G6Ns4L3co+K9J0hBETTWUS1iZAmLONoUsJGy
 7CpQ==
X-Gm-Message-State: AOJu0YxoJe2x2NIuGU5/oMYq8g/yszeGuCuGbArbuw1h5/H/qPgOEW6Q
 pEFxLSFPG3+2Xs4Zdlpc8pPEol+8kaOGXQmUO6/u0gGIsgRgKyAU6WpLySt8dTcphYU=
X-Gm-Gg: ASbGnctxN6ftE+Fxi4uHBKzlEM+tRGRX/ppJ+FrVRlGQwqo9C1TxbCnMxYzfPzHqB1m
 lLFINf8TH3IShFuU9clYdE8xGXbKwu7bKxXTiZMLfoGHJxqhpLauBJXofdO2AW35vdUqRk2xDHR
 pXzAlXuOxFszWlfo2vU+28MBtQ5AzUaunh60CqjT4wHwQbKSS63+em7IJkM3YVLSJD8eLpytkz/
 xBQxZaANMFOUAIldl6xU/PK/OtghSmcwNlmjRrYwcbfVnpk57rTIvPqWy7/SwQq1atdRnBg0lAp
 5KFrrPNzdAlKkJWQG66tL4uejRsxJAwGQk29O0oAbc456OrTpLhTkL7MN/Nx6RJZWGf3jatDA0h
 dWFV42pUgTDUk
X-Google-Smtp-Source: AGHT+IG+CaVlnA6QJ7IwaIJMhvDmE6EsaS7rBCR/Ey43PnWkRdidnzO4XFXwy1vD7KBiTGXechJbCg==
X-Received: by 2002:a17:907:7f04:b0:b04:626e:f435 with SMTP id
 a640c23a62f3a-b34bb22baf2mr685647266b.22.1758877955042; 
 Fri, 26 Sep 2025 02:12:35 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3545c8510bsm328256466b.108.2025.09.26.02.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 02:12:34 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri, 26 Sep 2025 11:11:19 +0000
Message-ID: <20250926111120.357053-3-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926111120.357053-1-raphael.pavlidis@gmail.com>
References: <20250926111120.357053-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758877955; x=1759482755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWqu6upLepRYdGfDTDgLwXEQEgfoVigcpOj1lJjDzc8=;
 b=iu9/xAzPHC3+KoQlASs/fLWmchB8SxXoWEF7IaYogABZ+OARqbos+pi47l31F5Kr7z
 MOb/uW+5Gzl1csT4QRNbwx3STBwMK1ZX1fjFJeIezGEs6Q6WnbLdEMPLceZ7wPargKmM
 7qFf1VmFffHLzZNO1cDDckz+sJhea1dKqJHByDtHAxlQmu2t06z1aMIbmY7QFemJ3sCc
 TLEGhisExtyjMCd/XYr7FIk5kdnV0g9j/v5M+gBS9wx0JT+v5a4mPwarvUGM/VKsIvCI
 TXwUz8flCrFCSS0Xt4p8nW9mu6SyTV5tyrhf7va8nbS+d9TNbMx6eoCxJqvsiCUvBXrU
 TUqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iu9/xAzP
Subject: [Buildroot] [PATCH v2 3/4] package/cage: bump to version
 2e593fe5a8a2186a558ceb414674775e4ba5d2b1
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

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/cage/cage.hash | 6 ++----
 package/cage/cage.mk   | 5 +++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index e7c971ea26..895031ecf8 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,7 +1,5 @@
-# Locally calculated after checking pgp signature
-# https://github.com/cage-kiosk/cage/releases/download/v0.2.0/cage-0.2.0.tar.gz.sig
-# with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  557c194d18af7202a9ec2e8be6dd7129f6c16d0f4528f4079ba26ccd57b6ef88  cage-0.2.0.tar.gz
+# Locally computed
+sha256  f920e4be3522bfb8fe7e5d3c21e490c59de5ab8db3ae2818d7ea9ef1733f8243  cage-2e593fe5a8a2186a558ceb414674775e4ba5d2b1-git4.tar.gz
 
 # Hashes for license files:
 sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 6fa39122ee..d739fce65b 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-CAGE_VERSION = 0.2.0
-CAGE_SITE = https://github.com/cage-kiosk/cage/releases/download/v$(CAGE_VERSION)
+CAGE_VERSION = 2e593fe5a8a2186a558ceb414674775e4ba5d2b1
+CAGE_SITE = https://github.com/cage-kiosk/cage.git
+CAGE_SITE_METHOD = git
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
