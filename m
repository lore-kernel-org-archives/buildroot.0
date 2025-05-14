Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D0EC3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 21:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 054A7811B4;
	Wed, 14 May 2025 21:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUCqQA3-72xZ; Wed, 14 May 2025 21:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EE99810EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EE99810EC;
	Wed, 14 May 2025 21:04:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DC26153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F0EE810EC
 for <buildroot@buildroot.org>; Wed, 14 May 2025 21:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0-3zhO8X2lf for <buildroot@buildroot.org>;
 Wed, 14 May 2025 21:04:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C626810E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C626810E5
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C626810E5
 for <buildroot@buildroot.org>; Wed, 14 May 2025 21:04:41 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so1994915e9.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 14:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747256680; x=1747861480;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zzpTWbQ2goZFfEx3MNrApVCB5uuyIjYOc/XYEVYxaFU=;
 b=iePdp4x3905+TuVR2l+lVGAnmHlJ3gMPXij9mfr5u5efZAapYZ+ACAQBw9s5cGNqg/
 Sn7Xc+pBjAu86E+rdb0l887ScREhm0nFXwbGeXAQljyJ043GDsuosiMcXwOYX8P2nIPN
 bSPGYie22dkHHKRz/3aGqaEHAA6GhUCWVPSsEFzJYXGtwR6BMpuclZsnI/qcAZor70/z
 KBSkSPiXOZW0xVAk5Pe7xQFIfnCJb9NASOGxm8F3TyegoYrMlvTY6N8Nxnf7Zscp6QvX
 0cm3xGAxFAXUt/msinpkdb66x5xzDUay5dXLMYK5rOHDSxHTpBjCxHSpY0j0KqLM0S5i
 hv9g==
X-Gm-Message-State: AOJu0YxKKdNMZM0g67wp3g1/WdQkW73NM31o2ZkqWpvubRcdOxuwS0yf
 uLFfdryO5DDtRIhGsMLBFImPxx90jmv+/r9/6aseMON46HAkJ+3gh90eC6NBcqy8HNlTfphaO9R
 z/cBorHs=
X-Gm-Gg: ASbGnct4TNI8C6c5c3t93FrCuukdvNPHnMtj/4XBxXKFDWxg1Vzl6dyiWKPsG7GjK2v
 IW3Snqgg0KGnSEWxZ5Za1kyiDo3XPmCGFyXyZpAU3vATR6sw4g1XQoNSpcYhp3iDSYkpnZyMM2A
 kmQKqVB+Obh1u76wzBYyoDW1HZJsyl0W9pUQerJOZtwM6U6B0Mq+OuxVryDZhWd9O+O637SLi4g
 KltTDAbSJLR3GqOaUgAXIpmlNC/6KDFfLFiZKHrdqykDzc6TQqbBw6WOFlB/4uLIfeiwR+KqfXB
 6DUkOxlr0y4ifw0D3Lklz2QZHHOJf426XM+JfrdkGI5cEfR5iUuUCyRR4nQ7y1g94w==
X-Google-Smtp-Source: AGHT+IERSsCNl9+qOkOViMYx6510OesHsIDzV+D8YpyaFG/ADNRbwE/mTCX6gxEdF7fAjEgnezM3wQ==
X-Received: by 2002:a05:600c:3507:b0:43c:f509:2bbf with SMTP id
 5b1f17b1804b1-442f8524653mr10235535e9.15.1747256679831; 
 Wed, 14 May 2025 14:04:39 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3368fc5sm46152325e9.5.2025.05.14.14.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 14:04:39 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Date: Wed, 14 May 2025 23:04:30 +0200
Message-ID: <20250514210430.1064027-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747256680; x=1747861480; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zzpTWbQ2goZFfEx3MNrApVCB5uuyIjYOc/XYEVYxaFU=;
 b=OTWpu5isA4uzq2z6oN3xyNioc0mOFtke4hMinDwjocyjG6jY0VtUtlSRUDXiInXl3v
 /RrURiCnUVmhvy5Prhp+AUZv1+qXRrXrmcx9HS4cOnmv7RXfoHx+lB7v/GReev4X8TGU
 pijG5UmIPMZEDQAXl8YZ+LC6uTef7NgmNelr0YTwyBiskDK4EinbRNpRr4Gm80eh55S9
 P0k/fi+DNcEtk8JkBSHN9V6XEoBXAa/prkfKuepmscdH+mTYmIqhNTT1ZwTZNNjzDwB6
 kNw/pZMluJYZ2HgXMu6hyYJgau3DGxNmFANsEmlmRtpQ+SYKB5fZZnIBvbpccsKPg+cC
 7OpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OTWpu5is
Subject: [Buildroot] [PATCH 1/1] package/libraw: security bump to version
 0.21.4
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following seucrity issues:

- CVE-2025-43961: metadata/tiff.cpp has an out-of-bounds read in the
    Fujifilm 0xf00c tag parser.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-43961
  - https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2

- CVE-2025-43962: phase_one_correct in decoders/load_mfbacks.cpp has
    out-of-bounds reads for tag 0x412 processing

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-43962
  - https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2

- CVE-2025-43963: phase_one_correct in decoders/load_mfbacks.cpp allows
    out-of-buffer access

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-43963
  - https://github.com/LibRaw/LibRaw/commit/be26e7639ecf8beb55f124ce780e99842de2e964

- CVE-2025-43964: tag 0x412 processing in phase_one_correct in
    decoders/load_mfbacks.cpp does not enforce minimum w0 and w1 values.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-43964
  - https://github.com/LibRaw/LibRaw/commit/a50dc3f1127d2e37a9b39f57ad9bb2ebb60f18c0

For more details on the version bump, see the release notes:
  - https://github.com/LibRaw/LibRaw/releases/tag/0.21.4
  - https://github.com/LibRaw/LibRaw/releases/tag/0.21.3
  - https://github.com/LibRaw/LibRaw/compare/0.21.2...0.21.4

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libraw/libraw.hash | 2 +-
 package/libraw/libraw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index 838c598d78..36d9d31948 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fe7288013206854baf6e4417d0fb63ba4ed7227bf36fff021992671c2dd34b03  LibRaw-0.21.2.tar.gz
+sha256  6be43f19397e43214ff56aab056bf3ff4925ca14012ce5a1538a172406a09e63  LibRaw-0.21.4.tar.gz
 sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  LICENSE.LGPL
 sha256  0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f  LICENSE.CDDL
 sha256  7d6650cef6cf892abe95e55a6bda1e1c42f221fd411b807deb2fc0b805b868d4  README.md
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 211b67f935..e320b2d835 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.21.2
+LIBRAW_VERSION = 0.21.4
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
