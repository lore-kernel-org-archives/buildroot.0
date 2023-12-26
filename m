Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEA4C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B0924018A;
	Tue, 26 Dec 2023 20:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B0924018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIdKbqLzbz62; Tue, 26 Dec 2023 20:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B144098F;
	Tue, 26 Dec 2023 20:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B144098F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 314821BF3EE
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A00E404DB
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A00E404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6HpZ8DPYQXq for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:50:13 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C4A340491
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C4A340491
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d3c4bfe45so52072305e9.1
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 12:50:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703623811; x=1704228611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8TTR0Zq+oA0YbpKVf25iRn9D+gp3xjfsl+tYmsMLH+A=;
 b=YolFrmhGwr99Lqo4mwskB3/7mwAeaxIE1TkCHOvwr5KLe+MSmYd00hGXXunYzMHV2x
 35VRclkVFL+g/DrukKH0lMbTmCEIUio+syZeURUG/+0iEdzjbvC9OvhFrTMx570fLiUR
 x9pj4qXMIi1ijJgtCIcC1MkrSgr3LcmoraJuDboehgRoZ5yYgwhgAQBka2Y4m8ZZnwqe
 XfAKLhRyG+4vokKNDbDzXXRS1ND6qlR2YvWKz7ghtiAtYRVWW0KidEDhtUcpXxwQMe+8
 3fGItIx+YRbwQKdW24Cq9jBawROV7a3W4tFWcx9BU9Ek7P52o613rUdMzy57ffnExZ1g
 bzFQ==
X-Gm-Message-State: AOJu0YwwcSOe0OqbbMa/FexMfOfwF+R4wROKgGOO3uPpNa3TPPIU2wnx
 osHZ2kpmUXePtozEn2sfCxj0mZ2GMH0=
X-Google-Smtp-Source: AGHT+IGD6rJuH6qZtTFiisjungbVP1bHBrggey2+9Bv9xGK1jHa+oe14OQy/d/CmfjQZ+6HYq07T2Q==
X-Received: by 2002:a05:600c:5187:b0:40d:59ee:d5df with SMTP id
 fa7-20020a05600c518700b0040d59eed5dfmr469666wmb.331.1703623810511; 
 Tue, 26 Dec 2023 12:50:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c45cf00b0040d5d5ac69asm447189wmo.36.2023.12.26.12.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 12:50:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 21:50:08 +0100
Message-ID: <20231226205008.1385786-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703623811; x=1704228611; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8TTR0Zq+oA0YbpKVf25iRn9D+gp3xjfsl+tYmsMLH+A=;
 b=YAYfLyITyecMdcGDcqE1KurDVHBv7RpRl2eJTmdcoT0bp9uc3qJYOCXR4SQ3QvD+Fy
 KBQSygZRupWN/kuMA6hhaofyKybaHrsOq9nFS82+xHUs3OsEsQXsh803OrprMiHN1Rw2
 /oOOAWRMH37qeVV6O0g8/3W+DVdBIlvTiZ/T2ayUb2I0l2bWTIdoNkjOi+WMifFIvdj/
 X4cfzhCwrE/7zTND4Np8sfj5LWS6F26Mg3Lgi6cr/pC8huRAjmCs3mXMVSIY+A9mBAx/
 AsolSRF6WH31sHHaIsA3bx+kx62EUEugZHZ1zj+I4pLYZqZA3G7Hj2CiMr+PkpLp9SWe
 bUsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YAYfLyIT
Subject: [Buildroot] [PATCH 1/1] package/ell: bump to version 0.61
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

https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.61

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index dd4722480c..8bc61ee293 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  7603928ee584b758ca27c67e4dc513049a09b038d7d28459a9440f8443c91018  ell-0.57.tar.xz
+sha256  c21ba3530d530c736f9b3e6acc954d4404c1ce4abaf2a4694e46ecec17653fa0  ell-0.61.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 08deb62abe..300c1eee88 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.57
+ELL_VERSION = 0.61
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
