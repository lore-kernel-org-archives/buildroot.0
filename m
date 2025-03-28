Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E162C36016
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F1D180C9F;
	Fri, 28 Mar 2025 18:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNhiuHS6Kqsi; Fri, 28 Mar 2025 18:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 727DE80A54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 727DE80A54;
	Fri, 28 Mar 2025 18:05:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB09012A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD7C1707C5
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_Mt5Gcryp9F for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B9B370451
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B9B370451
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B9B370451
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d4ff56136so2071495e9.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185092; x=1743789892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A01rH2+MpYRChiw7OjsrOURH8LTgMxMWBrN9pdCw4a8=;
 b=pi8WIxb193alY3LJtUmpJutZZIoaerNOCAVXiljuzpBNRydUcdjmREoplEzi5I/j9b
 EarEVbpRnkxsxMhQ613HEkVhXGTHTfzNyNxLGm5E+c+9M1aFvpTyK+GBcQi0wP3m9QxQ
 mWw7n5HWAzso9NVMMBe2/O418Kzn+agXmuiSwzQJyQwJbtVcu03Fcq01GBGJceG5VR9y
 3ntF0jqDV0nBTQenD5qZibErNkABuMg2Yebz5yVE4BL7ds7VAjzl4EjHSkiSOq1uXaQN
 kzdRHaEgVDq6XjkeuNRk5VBd/VMAXQ56lpno5OgabMnmtSVfGfOZLdH+GGLMAvvSE0yk
 y31g==
X-Gm-Message-State: AOJu0Yw1QuSjI3ir+gfZcG8+Qi/cDkKkNxAuovJaMf1bmu5Pdt3YqSMV
 lpdAqPo9k2cKM8SBNho1CU1PIjdhngepm3dLKteAYCCsdNXso7YzfpGvvTJs
X-Gm-Gg: ASbGnctM3pWFpY27ylZJn2ABrZNxkmY0XpsZ/zZsdux+eXWxka/Z+JBPPx75q0eEqmu
 TXnp6ttHomolqIVsFXhBtZWx1X7GgBVfHqDc2lz2LSRgk+yEgAlCaA7CbKlyzg5egxSJ1OoIqbt
 DQDxC/IljZ20/1aXfnxqO8uSY/Wktyh9XoAhi4Am5Qa8B1U1wUT6WxxYyM3Xa27Hrs+OdU35Aj0
 jVFMZQB+3SQ2QQ5krOp0AYKzulZ6XaKRU1rVQL/v/ng52hDVCItPIpUbOnnkMT6uRuRJ5QlWnXi
 ZSPldeHfj4y4iZ8DJYJNk/+uhn63GrtIzux+Lg==
X-Google-Smtp-Source: AGHT+IGUqKReU5dkpXIhsLxONFmwP5xol2UVGX+B5mOrPvnElmF2ALgo6UhA54TwXVJQiJtB+9k9uw==
X-Received: by 2002:a05:600c:3c93:b0:439:a30f:2e49 with SMTP id
 5b1f17b1804b1-43db8524f65mr1125225e9.5.1743185091682; 
 Fri, 28 Mar 2025 11:04:51 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:50 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:19 +0200
Message-ID: <20250328180427.3434693-12-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185092; x=1743789892; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A01rH2+MpYRChiw7OjsrOURH8LTgMxMWBrN9pdCw4a8=;
 b=NSbjycaIeFOKSEhQvVrgpYAS84jZXgKasso8HZSSHLDTXag2IfM6tHx8w9WZz64xcF
 nO03K3Kp5r92XQdYF+5U/nLYaZe3UCjMSyCE+GHM2cMGDj/+LJYw+EgmFb4SyUxK128i
 fHRtOngyRUKcT+m4LDUg+bI1RSJRxR/FZXMNB0yLqMRB8uCV5Ts2oP4vWr37+y9aLL3I
 3vIPNPlbAjE25xNZdG79yJffnqLYVO1NWar+igfvuKRjXYaaDS+BwsdeZsq504dRv5uN
 4/69Ctjg039qvOi+qlgyVzosUGosoD+hy6xGT8hU8XnA6tiffsgPpM2dREaTWXMqMyxS
 kM5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NSbjycaI
Subject: [Buildroot] [PATCH v2 11/18] package/fmc: uprev to lf-6.12
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Concretely, no change. But prevents people from going to Github and
checking whether the package is up to date.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: update to what is now the latest BSP tag

 package/fmc/fmc.hash | 2 +-
 package/fmc/fmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index 8f59c94e6a52..c3197fa1af28 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  13a5e327ef1d727946187fbd021513194981e42681c73e56933109af8a5889e7  fmc-lf-6.6.52-2.2.0.tar.gz
+sha256  fa16eaece5744af1523e563dc1cc5af6cd1c448aa828bdfd86137be555760abc  fmc-lf-6.12.3-1.0.0.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  LICENSE
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index c6d36f14a00b..26282313ba73 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMC_VERSION = lf-6.6.52-2.2.0
+FMC_VERSION = lf-6.12.3-1.0.0
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
