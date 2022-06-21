Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC7EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 21:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 956AB40BE6;
	Tue, 21 Jun 2022 21:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 956AB40BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3NiCwv9N7PO; Tue, 21 Jun 2022 21:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B06FF4059C;
	Tue, 21 Jun 2022 21:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B06FF4059C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFFCA1BF2F3
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 21:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99CD540BE7
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 21:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99CD540BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbGl8KZdKL1X for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 21:34:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6BA140BE6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6BA140BE6
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 21:34:17 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id pk21so7068603ejb.2
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 14:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YyvDfV/dddU7T80+9hpKdW4LApiCpWweTbxEwTLNu80=;
 b=5l+1UBUnTRbF36xzx5IUQLurxxuS1AT3NDGbOve2kGYZU8Y9bDdCFoUhQyx8nokCLp
 4ByK98Myi0pyMjTTn72X+LDw7k2VvKm20OgIGGSjSB5SXy4A1HIO0FicuwjMCEKPjv9U
 Yop6f76qeGxNuDVMgznjKKJi346xmTBK3YKI8tlbQsXH6HEVKeHaqQTOLfezte1dWfiI
 OTaVH4AInRF0TrXgF+2Z3OkKgLgGPPSpIpyCUtrn6y7zda7IOgpeEqoM3fAilE8QbxPU
 mUY6mdFKEL06Itx/PT8v7Dujtu/Il9rPOYCReJLnx1Kw35LLmgmhWZNNTJhOGgC3F4uF
 yuKg==
X-Gm-Message-State: AJIora91sVrzTr1Q18elIeEkyjZ0PuH5GgUyR4Ep6B90nFf3K8kSXBki
 nKtIIXDzLIDW7FWydF2+pMaOc2lo6AzQTw==
X-Google-Smtp-Source: AGRyM1sZSmLkgRHiM87FqvP3kgSJ2oD+aHazshAAbc5/OUMMGuDbq0gwOs53JSkJZFf+civb4TyjjA==
X-Received: by 2002:a17:907:16a4:b0:711:c9a7:dc75 with SMTP id
 hc36-20020a17090716a400b00711c9a7dc75mr110698ejc.542.1655847255991; 
 Tue, 21 Jun 2022 14:34:15 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 dz21-20020a0564021d5500b0043592bf496fsm2899861edb.38.2022.06.21.14.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 14:34:15 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 23:34:13 +0200
Message-Id: <20220621213413.2191964-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YyvDfV/dddU7T80+9hpKdW4LApiCpWweTbxEwTLNu80=;
 b=DeV9gxrWy+5plRGjBNhneRayJyM/ClZUMbzHdR8cVgUlyzs9CBndOGhqvSkYJ//8Fy
 WjaPlW62Hdz12kRY5ev8w4qeDiH/8u6FpAPC9c03he0IzJ91wpoB3lc1aZOF9Uk582v/
 H0wuk+FUpxg1YidpCd7qouBWOkhJ7iHOf7bnU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DeV9gxrW
Subject: [Buildroot] [PATCH] package/python-pydal: bump version to 20220609.1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pydal/python-pydal.hash | 2 +-
 package/python-pydal/python-pydal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 46271dfd91..9366708a7d 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  40a2cafb5aa830d51ababfe34a8f8a0e3b630bc4f931f04db75ed84c3f55ea38  python-pydal-20220213.2.tar.gz
+sha256  7891bd35d57b850efdbbe1f2d46cb1daf8c991c912a99e211ab87a30e7685781  python-pydal-20220609.1.tar.gz
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index c3be683dda..2990051351 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20220213.2
+PYTHON_PYDAL_VERSION = 20220609.1
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
