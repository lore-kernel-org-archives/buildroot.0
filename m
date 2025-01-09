Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F12E77188
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 01:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70A2E608BA;
	Thu,  9 Jan 2025 01:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rU66ofi1bXz9; Thu,  9 Jan 2025 01:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8A546089A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8A546089A;
	Thu,  9 Jan 2025 01:11:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60E2E1FF7
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 406F540242
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fou1rygnMB6k for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 01:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D09624023F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D09624023F
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D09624023F
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:11:39 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-216281bc30fso6558035ad.0
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 17:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736385099; x=1736989899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lwDo55gZuQ6HaXGf/7rCm/i8NjzBsrHAMpySL0dKG9I=;
 b=f4TSqFKl24thW8/oS+mCIWlCUKnyuKwpsDHlI4JFrLl2u4RF0++o+WtgCUN3DZOFG6
 qT0buBdbnmg4PbCee6VG9BOjCwACNkZ1I5Kob+1fHNbtzow+85W785nZehtmtpYuqyMw
 Pp52emDZaxKlVHEQlUvk9pvksGydzBoAS1cOIb/LXKp/+Ct4SSOz2N8N0D3t7P2ZEEr9
 RqAgG9UBUH6Wf1mWULypl4yXkvZho2x7Cd0Nf8BpNw0mnj0oLm/m9ddIGpEPHx7Q4sbF
 sXgt6lW0T/6HFksSDAM3X5oXjLhGVA3OMZujWuWuMNCS5X6Sx2gXHjefQAG7ddGwNwQY
 upxA==
X-Gm-Message-State: AOJu0YwcSrjX/OZRzhRx9IhL4GbhaPluAfu6vktcozsU1tWXXl6j/5/a
 oNAbXilQC84XsyL3I7JT3H3O/oT2AhWTb2Pw8lARH3/6DEF1/4QzBBUa1w==
X-Gm-Gg: ASbGncvFr9FoDAKxhfoTeUnWBWbPfevDwuYDtkuwt0RZXlHXRHS2lXqCJ56l7EG5eWy
 1fro7KNIcKT6fT8HNel/JTZBHbxkexOuVGJ738dNDcGIveYh2V/BLrwHSdwkAgGtMhnrYS7GyDD
 DuKbAkctHFT0sz8+xd6BRLd2SJpXw22rlJRaubLrLuCOBYEnsBd6QqnAoUpv+ar9KYLDpwv6ILz
 fQrFlDF0qfWz/yFOxhaWoD7Lb82LawHzIFBKyetxbXPvqmnN921ni32tMH6Cq0WzljOxu9oe1G2
 O7GEkoGDPbniBXIEBLGk3Jox5U+V/njGGDGZy+I+
X-Google-Smtp-Source: AGHT+IEkav52AlaAl2sxKhlWOedZheUJpup5QUTTYafaMh2gwKpcEvPhXzwh3cSIn1pH+WXKNYIpGw==
X-Received: by 2002:a17:902:ce8d:b0:216:3e86:1cb9 with SMTP id
 d9443c01a7336-21a83fdf1a1mr57165055ad.50.1736385098807; 
 Wed, 08 Jan 2025 17:11:38 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a91744580sm790075ad.84.2025.01.08.17.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 17:11:38 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Wed,  8 Jan 2025 17:11:35 -0800
Message-Id: <20250109011135.26496-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736385099; x=1736989899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lwDo55gZuQ6HaXGf/7rCm/i8NjzBsrHAMpySL0dKG9I=;
 b=hosngnyvrqUDXGWl+kulS+xlCy64CigTaRzY/Wmu7PAHvqsUSlzabTvQ+bc++RP+7y
 Zo2kwOapsowKkOTWTAdM7oBtbPoiFnLNjpJTgtTTbAYXELg6/lzxy0j/HYXQsNOLVRgX
 /dGPtXM1q70t3Rr6KM1+2CWFrcMD6IvROmllZYA/k1T+003Uq0jTrlkYwUmn/gmSy3cQ
 DKkHtY/YXy3qeyOkZ5t7lHPp5RxBeJV/lsNVeaLOFKZvxS2qeiJZXgo8cqTfC+wslQfl
 NOIx5CIPrLNPzYNktn0kPScUxofMWI9neTdtOqVdTfmu/53CwXebIFkLten86O6Kgs7y
 BX6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hosngnyv
Subject: [Buildroot] [PATCH 1/1] package/lzip: bump to version 1.24.1
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
https://lists.nongnu.org/archive/html/lzip-bug/2024-03/msg00003.html

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/lzip/lzip.hash | 4 ++--
 package/lzip/lzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 48ee8175ca..7900835e11 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From https://lists.nongnu.org/archive/html/lzip-bug/2022-02/msg00000.html
-sha256  4792c047ddf15ef29d55ba8e68a1a21e0cb7692d87ecdf7204419864582f280d  lzip-1.23.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2024-03/msg00003.html
+sha256  30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162  lzip-1.24.1.tar.gz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 9e09e578db..c88be5680e 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.23
+LZIP_VERSION = 1.24.1
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
