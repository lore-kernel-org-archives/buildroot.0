Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BBBC54F30
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 18:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C590440228;
	Tue, 27 May 2025 18:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVWPioLvmA_E; Tue, 27 May 2025 18:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EDA94025F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EDA94025F;
	Tue, 27 May 2025 18:47:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72CBC19D
 for <buildroot@buildroot.org>; Tue, 27 May 2025 18:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64E8280B91
 for <buildroot@buildroot.org>; Tue, 27 May 2025 18:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjtvW11qIebd for <buildroot@buildroot.org>;
 Tue, 27 May 2025 18:47:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4E3580A66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E3580A66
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4E3580A66
 for <buildroot@buildroot.org>; Tue, 27 May 2025 18:47:37 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7398d65476eso108515b3a.1
 for <buildroot@buildroot.org>; Tue, 27 May 2025 11:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748371656; x=1748976456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tvOog8cc21E+P/pmbsOqZeSPAoGTVtbNIlGx+mbVHjs=;
 b=EZ4nR7VVaRFq4oaKPog8WZYNNmeNCJc8rOsG6ArihkbuGO0dVatZ0WVWxORmFrXGaq
 dZyqKoqlqm8vP1txfzsa/ED0jhY0aBMpbHvcazoxsdcNkfRuXlzAOl0uF+l199XTET2Y
 VSR6MPqj6hQEvSgSqfCfqjZltzl7IYKGFwGF59JmyZlVxGW9t1YAEcy7ZStcEZ3d/Siv
 GKfkBvTVTU2ROZAMWKRfLyhQrzEA9EkFcOERhlqOXJHJVStfqTvjPj4b6JEjAFYDYZ+2
 fNJNwtVA3tpyH5EPR9xT6/XuANMUDN/MC0W4gZhxm2lXOMY9c37M7YnoyDcviSXrqGtn
 lmTA==
X-Gm-Message-State: AOJu0YwE3EQaT9RcehSUyOw+CiJQLH05bKq+pE3q8BZFtcY165iI6dV7
 3N4P7HMqPCeHDD2E7yREvyFX25GPBq7Eh26IwoqvoaxAFxB/+jZhuKHpkFyx78hI
X-Gm-Gg: ASbGncsHFx4YIAa/gtv1LJw7nH1oaed/YvykVZwAbtEDXJAQQG2y5CpV25ySoKDwiU6
 R06aiakUwvj+cMpMhP1S67BWSPxvo0lrNg5qCXb30Gud0pkqCr46Kkj42XymKRUdH9gNNMUnIxI
 DnwMRGa6uD33mb+mdkWrDIhON+AcEO2yQRAkf8T4eiCy1R54oxshwOQPajh1QkFIsc8gfok3tc0
 ByDe6hYg4sIYL3kb5qijTVVRTrwEBomK+yTj8F7otGv7CNcls27eMZXgOfjGwwFGPwfg27qcr9Z
 IFoZjZvX8NrsmYzmGu+ecvpuPRwg2dZBmtgDA2Qa1LtjWSsB7fgDbyzunthKWxUvLRICUt5piGI
 oXk3spZG5dOb/wsf0m4yVqIqkF7U0dbIR2aJrBg==
X-Google-Smtp-Source: AGHT+IFJR7+4wisAO17Uf9VuwvokgR1+pk7MBWrb5Mt4YDlibBxHtYdvlH447oRDQAy/IH0TWjQNHg==
X-Received: by 2002:a05:6a00:450b:b0:736:4c3d:2cba with SMTP id
 d2e1a72fcca58-7462eba27a2mr2221208b3a.9.1748371656159; 
 Tue, 27 May 2025 11:47:36 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a96e5f74sm19011221b3a.26.2025.05.27.11.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 11:47:35 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 11:47:30 -0700
Message-Id: <20250527184730.344752-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748371656; x=1748976456; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tvOog8cc21E+P/pmbsOqZeSPAoGTVtbNIlGx+mbVHjs=;
 b=TuDtlKCzhlsfz/vJKNSZ0xHj1XKCVHCxSn54QhBlcgV1oOEQFpLoXOz11voL6JNwCI
 x0b/sxefwJ3l2uQTVYA2mle/GsjWWDPVwS/KKkORyEZup9N8KHdOGrkQ4rG2a8GiNwHx
 62M9Ao0ozqcMzqmkQK4KIyBEfx5kVbxKMZYxG7o3+l/UwVomH8zatnNjpUVEoPshEGHs
 UMgqjt45q8HB/SjfY/4BkFUl8KRtsWqVg11lmOTuIhZGo4z2N8VLJ1oMxcMhg/c3fN96
 4Tne+mWwd62/dlHi6BPzzxR5dNLbfeU0JB0JEN/BUXfnvXVBXtr3BUZ4I9baqBbO8ZTo
 DDVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TuDtlKCz
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.15
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/strace/strace/releases/tag/v6.15

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 10de7e7563..9bccae7108 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.14/strace-6.14.tar.xz.asc
-sha256  244f3b5c20a32854ca9b7ca7a3ee091dd3d4bd20933a171ecee8db486c77d3c9  strace-6.14.tar.xz
+# https://strace.io/files/6.15/strace-6.15.tar.xz.asc
+sha256  8552dfab08abc22a0f2048c98fd9541fd4d71b6882507952780dab7c7c512f51  strace-6.15.tar.xz
 sha256  ca2a0994c57e48b16828008c80cdb626e471b6b59116a8443b2ce4e3c77ddc3b  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index ee0e7dcf4a..bd7d73c78c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.14
+STRACE_VERSION = 6.15
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
