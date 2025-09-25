Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BF8CAC5AE
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 01:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED8E417DC;
	Thu, 25 Sep 2025 01:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Skw6Xzrxo41L; Thu, 25 Sep 2025 01:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD7C416C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD7C416C0;
	Thu, 25 Sep 2025 01:42:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3859F199
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 01:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DDF2416C0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 01:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M86gPuTCNhPD for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 01:42:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37A4E415AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A4E415AF
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37A4E415AF
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 01:42:29 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-77f32d99a97so494857b3a.1
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 18:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758764548; x=1759369348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tDn0482KWXpfjemSeHXBImW6th82VFTMuFROFp7mcy0=;
 b=bviBWkzft5IRyWpPxX51jPpJAKFEGdOnFHd5T3t88LdPUp4wfQ0txsYk4V1pIm7ypq
 YcaVkTTMHJvi4jaEKBbilhXKBiNcCOn3TXCH2E1RwA3lViB/Goxp/4RM+iRz6vlfOh8b
 bonXFUOkPlgWjhths2+UggDO9SnnRZDXDdgh1SCi6/nCXHkj4Uac00Gza3K6ZKqF9QV1
 6SbehG/ueciM4vLegszE/p2NJPOPsaccyrlGT8NQC0GeIz2HxuHYY5ubH7fjENKUO9Kq
 0ICsI6xZBg5nbMhM2XNhAcldhT0eGvCh+YAGFOJz7/hZnIB9H9oax4wGmbALW7xdo8Hg
 SHUw==
X-Gm-Message-State: AOJu0YyPHYXpgWbguOsgvNUsGP9bIKENLo0PaPWHdX6fVyt0Gckxe7K8
 kUpQF3yTKomwBd3Ajr2F1+09TfCPLro9bO2vX5Zw9CVN/9XjHbtLZqQQpTm2/A==
X-Gm-Gg: ASbGnctthWTLoN408WBcBIHFwdJoTv4tLaWIgdRWcHoFig5nvMuPmtoj+tpE8XaHSKf
 px7VBtFTyIFow1Y9Pgzry3YjPbI4Ycgkk0wcdyMKb0zQ5UTsjavFdgzaQOlZZk0QO7xeKIK7xEX
 XcSwo5Yzqg7xkZLkrNU1aEyyrlYFQPqBn+QEr4z701N3zRgm85OpdVBx3NNmxL/g1fDH5uAU4Jh
 wddD5ODr/11Drs7E0JiOuHdVo97ms4aiEPRrD1pjTb37DbFWIRwj9DJz5eUM19PavPXOWSTTAjc
 6NFODPJxG/p4AfsEDol5etjlsvhvUiDLjd1YNpQwVs4dZc0Z5RUxYbokly126J7xpFUkBdLqRpv
 1Czi1qluSxmxYiHw0Iqk=
X-Google-Smtp-Source: AGHT+IHsdFKqLIlWOrpng3lRL/vvk0fMmzvGEpe/SiSmwb4rIt+in3XyY+q/aSZrpIqkiDazT/hOwA==
X-Received: by 2002:a05:6a20:16a4:b0:2b7:e136:1f30 with SMTP id
 adf61e73a8af0-2e7da8335c7mr1405509637.55.1758764548104; 
 Wed, 24 Sep 2025 18:42:28 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a41b1sm566828a12.44.2025.09.24.18.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 18:42:27 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Thu, 25 Sep 2025 09:42:15 +0800
Message-ID: <20250925014217.1562831-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758764548; x=1759369348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tDn0482KWXpfjemSeHXBImW6th82VFTMuFROFp7mcy0=;
 b=TKsbfQzB2gA+k4rr9VN8TMJ6Mmi4o8gxAHFnj0KqJaC7kU+gaTsk8QWYmavV+9jugP
 nIWxsW7SOeeCSwaL+E68k5DjqMRdEkHvGIhqQYP1cNdDYAM6NoZEA8Nwty7n7hMUS6cb
 sb4BAMkUwHB4Sakgnze3qNifrTbBEbsItfslOB2iKhHTah3kzdyweo5J10p49ghDlpgq
 FyGzGRNKUPRJ7/Q8tbcIaT3SNUJIyAgt7DCXdyBtyhXKhgtRCxg+5PA2Qgi7DFf0Ww+X
 4ITT32uy0snNdPUVN5qmiVMPZcJK5cm/HKawss6xuItXOyr/3oO8EN7AnZQ+1QmuO152
 aeJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TKsbfQzB
Subject: [Buildroot] [PATCH 1/2] package/libopenssl: bump version to 3.5.3
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

This release incorporates the following bug fixes and mitigations:
- Added FIPS 140-3 PCT on DH key generation.
- Fixed the synthesised OPENSSL_VERSION_NUMBER.

https://github.com/openssl/openssl/releases/tag/openssl-3.5.3

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 7f3795e1ac..d0ca45d303 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz.sha256
-sha256  c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec  openssl-3.5.2.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz.sha256
+sha256  c9489d2abcf943cdc8329a57092331c598a402938054dc3a22218aea8a8ec3bf  openssl-3.5.3.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 38d04ea924..b892d4e236 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.2
+LIBOPENSSL_VERSION = 3.5.3
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
