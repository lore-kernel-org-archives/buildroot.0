Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76461CCFA13
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 10:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6FB80BE7;
	Mon, 10 Nov 2025 10:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bpG_x1pUZB8p; Mon, 10 Nov 2025 10:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 805F880AC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 805F880AC2;
	Mon, 10 Nov 2025 10:05:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B4EA25D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 10:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3821C608F7
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 10:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tP5qgPMO2Hni for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 10:05:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A34A9608D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A34A9608D0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A34A9608D0
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 10:05:04 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-33ff5149ae8so1657917a91.3
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 02:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762769104; x=1763373904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAne8slJP8B4+5SJNZsfjc2TDyTEdh243Z9DOuw9BKI=;
 b=WWo4j6OweKDuYhDvYAms/qsKi87GtgE8rQp7ED1dYhg6XGc6uDLk+YXYvBxcVC5DYK
 6RSWrNUzKdHgRW3lz0MOJjQD/Ll1MFp04s8BAaaX2lg+1Cgt09fvfPDZ4VNbqW89Kjdx
 NEtCtmmMWeAbXs2fBXBLE+VttDTLL4LHRpXei85D05NkpPJ0C9C8njd8WBqpGWH3dIIU
 3z4jkh1LKmrmVJzv9Apb7mgX8IiHClGi6olMzPEZ2FERfPRI3LwuzvT7SNUpc8dV6v75
 YReTP9NUyQMXjUl/X91JW3dHsGRleEV74fN5p2Zwa8aAyzAY0cdfASiL3gUV1UNmixrp
 ILXQ==
X-Gm-Message-State: AOJu0Yztfs+1YkE1OFRWgZBeAD/NIymYkpxXRrEsQIrsgnw2Xvcz5EsC
 bejHVeHGqnIQoKT76cYJQYoMQ8WtQt5YmUSIolyJdCV4CcHDRddtxNpz25McmNfH
X-Gm-Gg: ASbGncsTJeaO0vdCSVO2lFwdx3TsZxAaWxe7+Oh7fu8/vSZUOz86sj2l31zCjg2GLYm
 JhLXi7HqCzzUfI4qRcVZV4J9sCdUxD4Q71GY56GDvvt+lWh+08/8nLT8NqwD76gzb16SaYVCF/J
 wpEK2sdqh04rFQTfC9P5XQk7M0x5FwJrpURLHg9ViANOwA1MlSl3Xdy31+coJPN3SlgxnL+tD3Y
 oPd3C+Xy7Hn8Pl5o/LWe2A8r2d6r3UYgv12YVTrLFrDVM5gKiwFCh/5HtskIvd/iLBQ2FIHqh/T
 82a/HI+CxFFI6mhDzS7JH4EynubuY5FhPPRQDeolfiF9VYZTzOWtaZiwFb1pfv8PFlRC+GZtXYB
 VnwBx1GF/+b1WAYLEBitCotte3eFvyDaQ5LJti89TLrV3j0t4r30dKO1k7GAUQr7TFS90J1eeYH
 o9a3nYLMgq7BYErFE9EG5Q8r0kdyvIzwNKojslZsHSq0zJCbOHJJD5D4XgLvw=
X-Google-Smtp-Source: AGHT+IHXeZfgtcSZS15o9I/Ax8/2uZVzlD7wU9ogtlTrMCN1UpKW9z/OlO1mMMsRM0iDzG+8673Q/A==
X-Received: by 2002:a17:90a:e18b:b0:340:bb5c:7dd7 with SMTP id
 98e67ed59e1d1-3436cb7ad33mr8481641a91.5.1762769103647; 
 Mon, 10 Nov 2025 02:05:03 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a696d978sm17162373a91.11.2025.11.10.02.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 02:05:03 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 10 Nov 2025 02:05:00 -0800
Message-Id: <20251110100500.461973-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762769104; x=1763373904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eAne8slJP8B4+5SJNZsfjc2TDyTEdh243Z9DOuw9BKI=;
 b=f7nB8g3HUeTwOHsC17fPNhOBfgROOA8QD/drWjlHjnuGej/6B5Sg+lXWWgZOOm4GRs
 ALsmWiRlrAi+23J9vaHRkJhv4heD0dlc79T/wG9YVTzVooKZwv0xl6Er/RVHXPjNdZMq
 ClVY/+j96t6sA0ldwkkntB1buJlGmifkDjvvqAPx7FgWmh9l2E91RVt51QbsIkjoGS3g
 HkzQo5RKTeppLd19crCjSlUGR7v3+wi6iVdSmyMdYWVsuDdzduaY6+rMzfsNzrfvwHKI
 6ZqYBsX0xqKhG73fzTadx/0+cAHU8pS/P+hZZ2Z305NT/bHFwpTEISzZHIGAOeozq2kg
 OutA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=f7nB8g3H
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to 4.5.1
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

LICENSING hash updated due to the addition of new cryptographic algorithm source file names.

Release notes:
https://github.com/besser82/libxcrypt/releases/tag/v4.5.1
https://github.com/besser82/libxcrypt/releases/tag/v4.5.0

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 6 +++---
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index 88abb79ee0..af46fbb11e 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,6 +1,6 @@
-# From https://github.com/besser82/libxcrypt/releases/download/v4.4.38/libxcrypt-4.4.38.tar.xz.sha256sum
-sha256  80304b9c306ea799327f01d9a7549bdb28317789182631f1b54f4511b4206dd6  libxcrypt-4.4.38.tar.xz
+# From https://github.com/besser82/libxcrypt/releases/download/v4.5.1/libxcrypt-4.5.1.tar.xz.sha256sum
+sha256  e9b46a62397c15372935f6a75dc3929c62161f2620be7b7f57f03d69102c1a86  libxcrypt-4.5.1.tar.xz
 
 # Locally calculated
-sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
+sha256  9144e66d8140feb84f0e4e344906ac425378896320032e0248567ef195cf0135  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index c2b2ed3e4a..cb4924e0ff 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.38
+LIBXCRYPT_VERSION = 4.5.1
 LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
 LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
 LIBXCRYPT_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
