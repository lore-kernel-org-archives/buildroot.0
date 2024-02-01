Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0816C48286
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 17:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F67F42250;
	Thu,  1 Feb 2024 17:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F67F42250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AldgRDMCqmim; Thu,  1 Feb 2024 17:52:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A51A742243;
	Thu,  1 Feb 2024 17:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A51A742243
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91F3F1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77C8242250
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C8242250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68Xv-nJuwFxQ for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 17:52:09 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4114E42278
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 17:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4114E42278
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-511206d1c89so1498382e87.1
 for <buildroot@buildroot.org>; Thu, 01 Feb 2024 09:52:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706809925; x=1707414725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UlqNJvSNtZ+gKBNS9iJEuq1XOv5WIb5nRe7Z5SIOq9o=;
 b=Zvu6isscDBefnCqhmjPcfgxJfbl+2KwQJHO43GwoYfCWl0l2gcqbJAs0Xh+v2LxpE2
 LYPScy+Q8mPWaWZrqkGrFZ/OwimV/kmHE12FttECqRlvNGihVZBhgbyFoHJDfyqXtHXq
 Nc5zqz7oEmrZsNQnJy8rD0MhtRvYNd6AUqO0w33Bcy8kdbWdn9tnD9I0P8Py0SRL6uwn
 mac6CI1kT5kBnRLEhFPIR2/PzBgVcNNl/L7OV6zui/8qFQKdTR0aNlUyz+77zeAMO97u
 YkhSLrPQnBbNu25xsIMKfeFC/SBrj3Fv8p8nEnjdcizaNDO71kIq8zOvKDw0gAPP5GjF
 sczQ==
X-Gm-Message-State: AOJu0YwpUzkqP2KU2dEYzKb8lLOm0odpoA71nX7JUBTomjkt46S1azax
 C1FWxtUhSx/pS4y4+hD66rR7MKv+J7RwmXFGdFLPguNRilmPChzVFx21+zRoDKo=
X-Google-Smtp-Source: AGHT+IGhvFv3eln6lIXEjiHwO/iwy4bEdIm6LB5pC0aaZjcZcrFFdh+e0isfqews3g2wQsx6lHvstA==
X-Received: by 2002:a05:6512:931:b0:511:f2d:367d with SMTP id
 f17-20020a056512093100b005110f2d367dmr2063182lft.65.1706809924915; 
 Thu, 01 Feb 2024 09:52:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b0040ef95e1c78sm5118053wmq.3.2024.02.01.09.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:52:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Feb 2024 18:52:02 +0100
Message-ID: <20240201175202.186929-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706809925; x=1707414725; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UlqNJvSNtZ+gKBNS9iJEuq1XOv5WIb5nRe7Z5SIOq9o=;
 b=GY53xH5i+K9/fcAH8TfHEMQzkz5TxkczpdqfBLFqx/2V51ycIDy6FLDKvQD/qJ52HK
 vD0K9SUadZoMzPRY+AGEeWPly/IrvQ6MoECR6h7TINE/bwjNvnvvR0jcclIeScRyalwx
 er/U4kp6DuBT4vKouFWAmUeDfKF1wMETGvpanMZsvZf2tL8RHp6wIqGUuD++iLHeIbhS
 LEszfFexrQymIWopDTbwVx+u2KvR65TN1DX/FxmEsDwMxkKNhPPxMiaf9aivQqRdq5kv
 LPdWNL1waxATZSxJXD5sG2YATqwHu37+uhI/e8GDOPX596pPmOfooESJJh66FsUv0hrY
 QDHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GY53xH5i
Subject: [Buildroot] [PATCH 1/1] package/mpfr: fix CPE variables
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

cpe:2.3:a:gnu:mpfr added by commit
63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE
identifier for this package

cpe:2.3:a:mpfr:gnu_mpfr is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/7B981E0A-5BAC-4A80-A734-5FD4B51B04EF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpfr/mpfr.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 8d12c7502b..c0c8c04646 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -9,7 +9,8 @@ MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
 MPFR_LICENSE_FILES = COPYING.LESSER
-MPFR_CPE_ID_VENDOR = gnu
+MPFR_CPE_ID_VENDOR = mpfr
+MPFR_CPE_ID_PRODUCT = gnu_mpfr
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 HOST_MPFR_DEPENDENCIES = host-gmp
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
