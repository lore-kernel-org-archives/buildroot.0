Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C36C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6078400CB;
	Tue,  2 Jan 2024 22:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6078400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIC7R4I4P0Ag; Tue,  2 Jan 2024 22:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D665D404C2;
	Tue,  2 Jan 2024 22:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D665D404C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 873AF1BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EF7640A6C
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EF7640A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k0fEQLFdFYR1 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:17:39 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03201400CB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03201400CB
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d5f402571so64920645e9.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 14:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704233857; x=1704838657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F6PT8p6PmUGNa/5rVFGXLxMC5E62LsmGgl3PCbaKHkk=;
 b=lJOT/AftDKlw3FVq7E7M9g1s9tjqqXukw8BL2Ticf0on5wb3ybmUV63/jSOV+yvxm1
 CBW0CArG8f/ShLAdtfRj58LmXWVbnNkJ4m3cwnisIz4mYohmypSIr9x41Pr5xcWh+guo
 o2XGhTEd0Z9BHdIXa5o/HiPVtSla82RTLAnI5Nsryr5Ycju7VyjSORPFJkDl0EVDkAQ0
 GjUPVZN2Tjktw9AUwGGYNzNVNJFgeu66JyDYynokElyrEJhzqP5vwAvZXpeOShJT7aa4
 xhl88J+VKyVJSwtp1dwpl0yU6feVGDHIDYCU1e7XPvJ+1USl03Vnvp8xa8GGv5IElSJt
 BsJw==
X-Gm-Message-State: AOJu0YzlZ0x1YD9b7DVoYG9MH1/FVL/owyZ4FVq1w3+IKcbXCzf7gc01
 UhVNEKgIWMhM8xksi36rgtxBucmvh64=
X-Google-Smtp-Source: AGHT+IHz2M2MxHWjmVSn+eL3k/30rcSxpGmnhayZoHaxO46l2GrIZr0Oh8X4waeMPIEMga7Nz0oEag==
X-Received: by 2002:a05:600c:8519:b0:40d:4e46:4c00 with SMTP id
 gw25-20020a05600c851900b0040d4e464c00mr7235980wmb.106.1704233856698; 
 Tue, 02 Jan 2024 14:17:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bg35-20020a05600c3ca300b0040d6ffae526sm285821wmb.39.2024.01.02.14.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 14:17:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 23:17:34 +0100
Message-ID: <20240102221734.2449276-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704233857; x=1704838657; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F6PT8p6PmUGNa/5rVFGXLxMC5E62LsmGgl3PCbaKHkk=;
 b=epfvxJ1GTX5ZW+jEr88fJOWZ8uBwWs3my3EkTuJd+OTFuYJsEgDZ/cSZZJuZCKKoU4
 vP1Ox1n/yqz+ZS6NzbABegnQQrukNa/NDnI00u3EIXdcMzxzTy6doIG/liaiiIJ8Dn3v
 dgdCg4vTrSue8lU2iJk1wawbEY3tLwioaBHhsPa8TiOB77axgsbqNAfVzZP8wXVyNK1x
 ACYL+Yih69yxI+H+QtsbWLyOEjbKtq+1FImp2vTC5wJzy75zKRuNNFSpYct/fZRkOPix
 mMQt88dK6vKF5SXXIOu7MZI4jIrBwDxPoeMzBWUUsY3kE/fkM2HoNYJzvoSM81lr7Uyz
 ngfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=epfvxJ1G
Subject: [Buildroot] [PATCH 1/1] package/isl: bump to version 0.26
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

https://groups.google.com/g/isl-announce/c/_yQ27dRgf7w

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/isl/isl.hash | 2 +-
 package/isl/isl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index 46d8e920f3..1f8c998235 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  be7b210647ccadf90a2f0b000fca11a4d40546374a850db67adb32fad4b230d9  isl-0.25.tar.xz
+sha256  a0b5cb06d24f9fa9e77b55fabbe9a3c94a336190345c2555f9915bb38e976504  isl-0.26.tar.xz
 sha256  3a2c398103f6bca0f50a9a9465deca9230b370b0212af5fdf31ed88a36215c30  LICENSE
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index ce9aaecebc..42830a2689 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ISL_VERSION = 0.25
+ISL_VERSION = 0.26
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = https://libisl.sourceforge.io
 ISL_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
