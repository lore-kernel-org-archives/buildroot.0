Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E1AF99C78
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 08:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B00D540DAC;
	Sat, 18 Apr 2026 08:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yop-SMf-myCR; Sat, 18 Apr 2026 08:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8BEF40DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776499639;
	bh=Stp9qc3SXx3UonOvC6cSN7ZplIvS4wuKJ2TGFmsOGrQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oqQ8q76T9DOXIlO9DeRPhjqSlf//xqq4QJBSESSrJHOKMgb97Zuy4GjDHAAPBlaLe
	 H9b/M+HDRDkSg0PRqMcA2jHUWolhRf3NyZII+qqQzGA/Z7VVB//u/zfb5Sz0Io9ILd
	 y+JaT3BIQ8jWh++I5yjbiU6dHYOGtAW8GwAV+mUEYZs1/CalnYRpKKMOisIAX3AdpB
	 zgdMCTmCArOXW0CjopZJSjHVkflfZ2C3Z9MgC1bbBbKamMJEulrozlD/gWxhkA6Ssl
	 wHbd5ypmDvXZCm48CHjQb9RwjRcWAQeIByzFGdqbfzRUdRGSQwndQ5v0kl88tASlMz
	 pcWZ/ccNyhKxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8BEF40DBB;
	Sat, 18 Apr 2026 08:07:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B051A347
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 08:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 967D58226E
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 08:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoqJ5TxVCBnt for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 08:07:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFE1682268
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE1682268
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFE1682268
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 08:07:16 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so18685615ad.0
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 01:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776499636; x=1777104436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYLKOZaoHtXZki8KoiUF/twgxDKX/3DAsxvBQMnixuE=;
 b=L3hFNc4DhBuqGvtsreOjFgtYhoGIatc/rgXct+jwX+3MYgO7V+SjehR9HGdWt1PAqE
 4dn/bRrE6mPHdkosynN8QH/HHaCIWk+VcbC2a5lPEhvvTQwtgxP58/yptKFrzH9HbV4A
 aTENOTRI36vGLgbQLby15bR2bfcMGRBKv0PytQjMYPysQ7wE7U8fjkL8wVrcKJTeCH/G
 IjAmeA+fD2gx1qw8vdZOXLS6hGIAyvC46AXJt7/bpRpXr29UlRffIlfalahZiadZPE+B
 aAF7bVYuZIO3IOAyAtK9klVNsenfZlqBQWIrCJ5hfF1Py8GshrvHk6j0MnPFrilUfHcg
 RUjQ==
X-Gm-Message-State: AOJu0YziCXYDLU4fz5TcI6A8hKFvvTUr3geNj/iT/WWbWgpFn5YHuDAf
 Xj/D2xsDMV/0/ikn+YM5bceLbVTCLpTLJhcIVaryGuZfdDnVsIrmEmHsg3shtg==
X-Gm-Gg: AeBDietQpQeZCZCOqs1rKvTP57B0RaATb+5mhnbVgBRITf7z95sR2NStFwuDWf1jTd1
 9DMELFgtxuYAm4sERFHIzjx+ZSS0oJNYH9wJV0CbB5nqlDa0jp7QEwERwxW1mU0QwSQYZr5HxnZ
 LVk21rFzP2oNJqO+WkQJxxDQUpSAXEFsKwCDJm7061lxmTfr1FteuFnExmkIgBaREzFrGTuEhyT
 LvnLm/AB2wdtS40yQe23KziPldMrh1i4ygudvV4RtCcRewy+YVKyd87eFJL/aAyCARKX9Q9FUxd
 b8QYeIpLF+8hams8d03CYIvsybFbujUf6IjNXpPKAbCUVTYvIt0/nz4mf8SC0LzwPjCcmv8UoVu
 I/FT/kzzOJu7uIu4FYVUcCvAyumbBTJz4us8kq54uSNWfot0/W0r7mIGkKjSCON21j52Sl/pR3s
 dcNSA1qRPbxscGsqfIKF3swu/SN6mfRw8FRw5CTjnhqmkugQ==
X-Received: by 2002:a17:903:1987:b0:2b2:53f5:461f with SMTP id
 d9443c01a7336-2b5f9ed5153mr54233975ad.25.1776499635655; 
 Sat, 18 Apr 2026 01:07:15 -0700 (PDT)
Received: from fedora ([2409:40e5:112e:daba:4994:b597:7615:a059])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa17632sm42994045ad.24.2026.04.18.01.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 01:07:14 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 18 Apr 2026 13:36:48 +0530
Message-ID: <20260418080649.52087-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776499636; x=1777104436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kYLKOZaoHtXZki8KoiUF/twgxDKX/3DAsxvBQMnixuE=;
 b=OVD+g+0UZ1RrExIiKxisGN5KmjiPWBHs3+AMJAL5xLyYzsT+aS3dqY+90iWOIrBaDc
 P6dBjrG7PO/mTkrYyuHM6SvcOKjAciZWI9E/eG5wjPayxPnN3C3kSShEGXyexckeAOfk
 piPS3tjJdUX0Nm5NFVeNjAdZlY8DVH30HgGzP4UjP/mjU7DXgdGAbSV4Vi7MJ2VwlDDX
 dtVIJOaivadGUnkAA2O4o+hbPqhsKRNymo/SpDMjrzyXAzc9DhUgDQwChsn/DLDsmykG
 odEloKvOgvFezyFCTKfCgUfbaCq+CAIDbayHnqUt1LcsJrF4LC9lZsLbN0FVURUbWAr1
 uslg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OVD+g+0U
Subject: [Buildroot] [PATCH] package/doxygen: bump to version 1.16.1
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

- Fix topics navigation regression in HTML
- Fix sub group documentation generation
- Fix group name/title handling in @retval
- Fix Doxyfile documentation and Windows binary naming
- Improve LaTeX compatibility

https://www.doxygen.nl/manual/changelog.html#log_1_16_1

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/doxygen/doxygen.hash | 2 +-
 package/doxygen/doxygen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
index ec46705d29..cc57b6f40b 100644
--- a/package/doxygen/doxygen.hash
+++ b/package/doxygen/doxygen.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  a8cafe605867ad475aaf288a3852783076e1df83aabf16488bbfa958062e7440  doxygen-1.15.0.src.tar.gz
+sha256  201ce33b514ea87cc1697c0dcf829692c2695c1812683a9cc622194b05e263a8  doxygen-1.16.1.src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index c31271197d..370d0d0d4b 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOXYGEN_VERSION = 1.15.0
+DOXYGEN_VERSION = 1.16.1
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = https://sourceforge.net/projects/doxygen/files/rel-$(DOXYGEN_VERSION)
 DOXYGEN_LICENSE = GPL-2.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
