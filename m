Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E36FCDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18FB480A61;
	Tue, 22 Oct 2024 20:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0RcdsL31hih; Tue, 22 Oct 2024 20:51:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6DC380550
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6DC380550;
	Tue, 22 Oct 2024 20:51:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB3B92072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACE8480BF1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_33ydgcv6ed for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80E7980BE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80E7980BE1
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80E7980BE1
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 20:50:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so31116845e9.3
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 13:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729630256; x=1730235056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qbx8C47gldlKeaHnEL8+DXyv8RtkW7mYzhTxzDA9uV8=;
 b=Y0TkQpf3piWzDL5X/1EbHVCjGuzWrkU4955KsqAr3szXYWh7bAJV0eANfmPV2o9ty6
 KfDdCAyFsanCkaZWN8YwOUuY5/tB7eKn2m6e1XLANcUln3mpndv7ew/giCYNLpDvqUx2
 /u28fU5sOxEoOyexaBqHw81sTbBDfwJenRvCNTZr/qOBqMI9TCYq6UGBkLsKHU1wTIml
 DnjrTzCXDq7R77j1SlRhKJq18mUFCKghr25fzK6+LZIC6X6ITP+XsNA7ng2vl10ZCOBI
 G1npNGdlkD1qvySPxKwZh2OoUHyrNN2zstNQQkHVBmLX94sZeHXBzBG6sISsjJ8eSeMo
 eA8A==
X-Gm-Message-State: AOJu0Yw0KLgAvfFhBAzF4RuPGx7a3Fk65LibBBtH4C45ZLKxWlfSKgkp
 LljH5JKQFybL/zeAOec91YYFyOFHfd1ZYdrwiKR0OEtug5V7Tg3f6XRZQLcBoVckJ/5usjScK1k
 ivA==
X-Google-Smtp-Source: AGHT+IGLyexE4IWp37qjmSylfgWll/oiX5c6VjPz5Pr+BaN+90Xz/Yfp6Qm2UrBPSN5TsAybIoDPxw==
X-Received: by 2002:a05:600c:5490:b0:42c:a905:9384 with SMTP id
 5b1f17b1804b1-4318415c8bcmr3053025e9.20.1729630256409; 
 Tue, 22 Oct 2024 13:50:56 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5c3173sm97081725e9.33.2024.10.22.13.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 13:50:56 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 22 Oct 2024 22:50:50 +0200
Message-ID: <20241022205051.532108-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729630256; x=1730235056; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qbx8C47gldlKeaHnEL8+DXyv8RtkW7mYzhTxzDA9uV8=;
 b=ScUzD94yfFGHQ6OG8KY1xTHfd0pzRqHcs317lJFD0uGiQL/nCh7Z6TK5/+LQXtjeiY
 XCWKNKGYBbD/dYzD5ceNoJIn4vLy94o3TBj+A81m2dB31zGXwPnF48t8MAfgSQ6sXrWu
 tVea+GmaWEBj9YHMm3ARfebeuk38DOAVhj1bAcvxxhYUYbDj3sKPlw/JyZX9XcjrVTZj
 G48/YA/Lp00gcNmUkLn9GuV7ca+vfDRs2QohRFxzRvdxcdX256o3FgpNOAHZwhn9nHHX
 bLRVJXX+H0dXxNlQx08d7mWLz0cbFf5U4JT69KiSQOY7aeTbXoIGFm1TnL2PGa3cMdRO
 Ts9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=ScUzD94y
Subject: [Buildroot] [PATCH] package/fakeroot: bump to version 1.36
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/fakeroot/fakeroot.hash | 6 +++---
 package/fakeroot/fakeroot.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index a148de676..0d78d7123 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.34-1.dsc
-sha1  aaa6bf0158d886e0093effc0e9422717d5c60eee  fakeroot_1.34.orig.tar.gz
-sha256  5727f16d8903792588efa7a9f8ef8ce71f8756e746b62e45162e7735662e56bb  fakeroot_1.34.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.36-1.dsc
+sha1  ea895c6632fcf1b38cc84987d1b4daf833ffd430  fakeroot_1.36.orig.tar.gz
+sha256  7fe3cf3daf95ee93b47e568e85f4d341a1f9ae91766b4f9a9cdc29737dea4988  fakeroot_1.36.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 1a0996ca1..e18cdc5f0 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.34
+FAKEROOT_VERSION = 1.36
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20240401T084438Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20241022T144244Z/pool/main/f/fakeroot/
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
