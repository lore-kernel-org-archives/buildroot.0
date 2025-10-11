Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA52CCD183
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 09:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1F1E8108B;
	Sat, 11 Oct 2025 09:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mADtkv52Eh_c; Sat, 11 Oct 2025 09:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C66BA81089
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C66BA81089;
	Sat, 11 Oct 2025 09:26:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41E5812B
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 285E840467
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOlkAydG7wcb for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 09:26:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02C95400A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02C95400A1
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02C95400A1
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:26:46 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-28e7cd6dbc0so31685615ad.0
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 02:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760174806; x=1760779606;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8TzWoLvpLELIIIzShejs5iIhO5SBmGcm9ARCUNXWwtY=;
 b=NLXp8lM/nJsxMscRT37b3rLNBP83iWCp932glhEE6Sqbm0L4unbHy4Eid8je1j281/
 0robNArRotWWMj5XTJNz17fpO5RGOHFtr8XViNA0Wz8uLR7S51bhWC+G8IV2nM3irNpK
 bkYDwugfg3mSazJt9hH34azGEzMI2xVb3j7OnRK07u5sBm51f8tRg3porUD3Q3KdBt5f
 J+gc9f9JYHRUjS1ZqmyAy5vrStxzOiviA/0kFhBwLPrcnPlUQ3b4yQ4/5AlwzmbwhbNc
 DCretjz9RMlqaeb2lU6YGK0aVvoHe+CDfCPiNWHSC6hRxtR7YCTnQGc099lTILHugF09
 hqTA==
X-Gm-Message-State: AOJu0Yz4FfdCVDLmRIpcpnjpzINFqwWk4NBqzrjymqi0HcSoJABk+Hky
 nzowvnzdQOIKAXcomd+idemf01+yUv/FmrVZQkJDQqmKfhV/2diwK+KiRNIU+xfA
X-Gm-Gg: ASbGncsafwQqORB3hnPVZXDlLBV0TNZQPXSrLm7J4BFu+tawd4HBBsQXxS8cf/mFIv0
 fLdBBn2Rr0sLfnTq08CjnXOxjew3ADAtWaNzcikqTFPPlP6rfHoIlei84FAFYRFS02LGl/RDxQN
 1Rhj4ZvyNzsyXao+tKCr2AXppZgig9Q19Nx0ubNrgShqleds1/UrFiZ61K/sGOMJAa3xLhgHSS2
 glrZEaiT76rSylUItZO/lggchLmz1VnnfeNSoSYuu1PIE+kyFjK8Crc0DwPCFEqEos4q54+pc6r
 A82gUskiooS/6AO/8K7H3k2U8UtNBjp3KPHzdiAYqxt7n2GSIxELjJi0dRE6OCBThc6OtZu+3NK
 vk0OuTpQmvcBrQs3t4L28bfgX87F8kVN+rKF6QxgGDAH/HBpmOb8wuahqNw4nVQ/Gh4HntT4kcO
 CjT49Cz1iyryXd8cC/yFpp0zYKVbeNTKlZPmNZ3gYNcNhXJkIfRWDVRAdbtUXm0S9FKKo=
X-Google-Smtp-Source: AGHT+IGb1eRyNiCPBGP2yIDaAVA+6xSjmSoNAEb4mnYFhNH+GYUq+HNp+i2qqENRNSCjV03sHEi5mA==
X-Received: by 2002:a17:903:1547:b0:26d:f589:9cd7 with SMTP id
 d9443c01a7336-29027373c2bmr201265635ad.15.1760174805903; 
 Sat, 11 Oct 2025 02:26:45 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f06c82sm79627955ad.81.2025.10.11.02.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 02:26:45 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 11 Oct 2025 02:26:38 -0700
Message-Id: <20251011092638.488934-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760174806; x=1760779606; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8TzWoLvpLELIIIzShejs5iIhO5SBmGcm9ARCUNXWwtY=;
 b=IJ+xQ9VihMYl/BXGTjY/ddebyYH1lNCHv77hqOoOUOn4EKnCPmpfFOltRs7quBB9KE
 XyPCRkjsEjmTN+4XItSYVtGJKTAhlN6Ht+PNhKBTHXuwt0leACAdzXiZidztRRjXj8jY
 Mzh7+bl4WrMhQegxzTfnry99tVJv+za0An8cNzqI4JiBq+WDo3SrAT46X3h7fNP4Y24/
 J4xM+oQ1iENpXiAmTCyOAPXoHEc2injzMgjOS/NrThx8addtmy2qBau4pZb79XN/j4+c
 3M3xZUY3C0zXJUii2MV93oW+qmOEI/o27h/c511MfEtI9QbSDsCTlTInIx81pGNRaQGL
 2Q9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IJ+xQ9Vi
Subject: [Buildroot] [PATCH 1/1] package/openssh: bump to version 10.2p1
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
https://www.openssh.com/txt/release-10.2

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 62c3bcad99..154464d68a 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.0
-sha256  021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c  openssh-10.0p1.tar.gz
+# From https://www.openssh.com/txt/release-10.2
+sha256  ccc42c0419937959263fa1dbd16dafc18c56b984c03562d2937ce56a60f798b2  openssh-10.2p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f1b8c0920b..bcbfc39755 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.0
+OPENSSH_VERSION_MAJOR = 10.2
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
