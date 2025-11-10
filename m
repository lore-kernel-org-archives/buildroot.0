Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1ACCCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 08:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAE26608FE;
	Mon, 10 Nov 2025 08:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFXNtrdcMzfm; Mon, 10 Nov 2025 08:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEDB8608EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEDB8608EB;
	Mon, 10 Nov 2025 08:47:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F16331CD
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 08:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7990608F0
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 08:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tcgtq6pyvHq2 for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 08:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8762D608EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8762D608EB
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8762D608EB
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 08:47:39 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-297e264528aso15890575ad.2
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 00:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762764458; x=1763369258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8gxg2OXHvq3vHLAc3ScsrLAdFTMLUQrtmtAu3vtBpo=;
 b=kYvlI55+jNsf3XbDvVqMH6OWk3vdrTh/x7bf4zZepD0oxjTf04Kyn6xcJpEnp2rbG9
 ZaTMXxl5IMol7AfqNb5C/38arBB2ufQHcPYvn5/zqgEj6BsU1NB2Bx03yz2jj1AieHbI
 rN81aCzGCdfdhzf1Hkuk5zH9vuwMAXv1XLQ8M8iTzH4o00Y/dPtCxqfG/aHdIg4iI1KH
 COMRGmXi1dIU2N78klepkG5Cfacce4wSIjJP5bGCk2LjcDWtEwARAQ5Z76vkcVozTppO
 9KseDKBR5Sf1uMtPzXOzLdnFh68JdO15A2S+dWUUinWWlTyU8SyK+agHrIXKWfOTh6TX
 tXEw==
X-Gm-Message-State: AOJu0YyIaG+wVcN6idjvRNhTuFs2I5LwVOsROy0Yfwd8kkIh+ORiZi/E
 QCbk2353WvEZKcCm1FzaZE8kT00ZtRoRxkh2mfXIUQdkj99expPVCZNBVx9hNqaX
X-Gm-Gg: ASbGnctWtZX8c5t3B7HM4hCrECBJqS/lP+y4zbKGQAaUbUHpX6M5zT3w5G3K0I0fDyi
 ZXY1CTRobxToGCUoEV3adXBE0VPxAkGhZiaaMQqV8WkSl6iHOf94HDgK/IqkNM6Kx2qILgEQNoB
 oTmrgoi3S2GBUntd+asR74qETV9UQF2vObrwJuDBc9J1wupmj4t1oJujOC0CQi5zQQl9HIP05C9
 +fMai2SgzST1gPPWNe2YjO5hNJmjxymQHj+536YX5OB6dQRRSWZGg7PvIPsNQtPi/klR2cvBIvi
 q2n6ZaytlUmemAV5s6+8q7M9pCWNnt1ouhiCtTUgrm4z22j0Rub/q6J9kCt/BZkivmSX001VV7K
 iaoJDOxN+sVL3cOmQv8t5qYswWd17ZdL+lyEMoc3mfadwTQHgePq/t0cL+DpAXSMRmZ2VBSflSg
 sd+H5zMDgcmlkzyr3y0MKZLfaMzcd5EIBojDvfsZeK57c4thaeWNXE4JTpsSc=
X-Google-Smtp-Source: AGHT+IHJkOijlqxJVfYjmE/KgQX6E1nhCdb9pBEtnqCiTdTPwJZpjcs7tnCF7KA1lRqb9bstKHy3lw==
X-Received: by 2002:a17:902:e80e:b0:295:987d:f7ef with SMTP id
 d9443c01a7336-297e56191b3mr92847375ad.10.1762764458417; 
 Mon, 10 Nov 2025 00:47:38 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c9c310sm139028365ad.87.2025.11.10.00.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 00:47:37 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 10 Nov 2025 00:47:35 -0800
Message-Id: <20251110084735.431109-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762764458; x=1763369258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R8gxg2OXHvq3vHLAc3ScsrLAdFTMLUQrtmtAu3vtBpo=;
 b=mMFHvfqkK0Eypf5mvamGh+mRPMvdlf74jZxqTErTwblrWKW0WOWsGaFJxsY2eLZdp0
 tmktkefMbUVyE2bnlIPlSdhKmZz8C7KG76OgB5PKzqIBzoHwpgGFLL9YTTS5w6Ejivco
 yyHtf9BEdCAtsoCYkyXHQIYPo1dPjB+u7K30WIJUbAdRggsT6lEqivXR6LGplGfKqOwG
 xJy1r7edWbjw0AzSbw9K4fDS+g1yS9H+gZDzXQKqiMsXD2pktEKELZcYq/DlGaaAWdOb
 +9CjSfWlNoUIT/7Zn6EnceJNAZ+rDj2sWTjKXUu5gmE27R3oj15MYIVhkeOGAPs5R58e
 7DZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mMFHvfqk
Subject: [Buildroot] [PATCH 1/1] package/liblinear: bump version to 2.49
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

Changelog:
https://github.com/cjlin1/liblinear/compare/v248...v249

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/liblinear/liblinear.hash | 2 +-
 package/liblinear/liblinear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 01c7254df6..3a98c64a07 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  72ea3853a9fb430b49c3196177d8acdffd2dadb5901832ee323465792087e8cc  liblinear-2.48.tar.gz
+sha256  166ca3c741b2207a74978cdb55077261be43b1e58e55f2b4c4f40e6ec1d8a347  liblinear-2.49.tar.gz
 sha256  684e76f565a31ab057790c612bdacc2ee542f8a90b69f922377a92334771488c  COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index fb3dfdd38c..d3ef578aa1 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.48
+LIBLINEAR_VERSION = 2.49
 LIBLINEAR_SITE = https://www.csie.ntu.edu.tw/~cjlin/liblinear/oldfiles
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
