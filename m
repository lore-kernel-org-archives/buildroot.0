Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C0BCCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 18:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2957240B72;
	Fri, 17 Oct 2025 18:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poOQqHEqmn4S; Fri, 17 Oct 2025 18:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B0640B73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B0640B73;
	Fri, 17 Oct 2025 18:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 144FD43F
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 18:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0689B81D24
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 18:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMoPa2_QBPB4 for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 18:58:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E92FD81CC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E92FD81CC3
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E92FD81CC3
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 18:58:13 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-63c21467e5bso2643238a12.0
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 11:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760727492; x=1761332292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LzUrKRHclm23D+GLnNIa3uPqkmb90RdcjGbwCNbirvg=;
 b=IYqXjFJazrzEYp+CYGUb+xbBv1GH/8CQRFL/03JTK5pyKlQmsFaw+QUUpzKqQ8dwIP
 N+9HRvZrYnxwSZaUyI67M+mQrXcisTUVP2MaUjKucqVNLdwmKLc4oomOHg5h8O9hxdJk
 sGfBM0jlNf+6dPNMSHODcBWUP4ryP8p6hWTf1d/Szy32w7UJ66OUCDN0NIKgDa7GToSi
 AAhZFPOFokHI9G8ouE2STaE/vfLFe2uVgWXlOXACIL1Iy1+gNKgwgETLvQDMFLeRqRRB
 kMEhB+N2ihIbDd0rKBgrpXxLmkh4Fo/JsmYrzQrPESH4vqUiYuPcv/qjUWQojHYd8b4g
 Nt6Q==
X-Gm-Message-State: AOJu0YzKsmC5p6bUvhdeCyYuuym4mFDOEYtyECw3HGKy90kM1ZcYerK/
 WGHXtJfj+aCL94l40BNIQpH3LxzqlCAx4JtcJSZa5d19eE53wis1lQUPm7ZfNg==
X-Gm-Gg: ASbGncsj6l3r38TH1bMacm9IVzjY1zwDumMgSw5UuBxNUMFskYaMbAFVmoFVKu7Ezj6
 BqjJ40nEpJEfBvR5Taip5Sjo6YtqeMiJMbHhFs00wPvcOzvSetUbkV0bV/MjO4B7OKj8d3Tp8aV
 dy2z7thQEYRmHXoFCQIEkAYLCixXPTeVTa5HyssOlS64/BP3/Bu79BxUQTxwzWQoTfhTTMnG06p
 TzYtiJy+EvnY6NOlmldBJIA/qcxWp3sDvURf7AtultQ8iSxMj+qDYyS7Gd97P+cVdICbMy91iVg
 S0SCSZrqOiyMKpapIAx0j+NpVLVg5TXOlxmtqlQaHZj45MstkL+QEhB5mljGfStKnAdbPe39j5Y
 fy3SzQ9cd86IrB6CtzYWWKax6ffOHTslYoeRpiRw/bGKPn8KAJxf558WJEuisbj/ngw==
X-Google-Smtp-Source: AGHT+IGTp7iVHP9XPfkuLsURT01DxiL5S49xdfVc3MqSiW23Op0pUjd8BTN5yG9SUrcwA1VLHdI6UQ==
X-Received: by 2002:a17:907:786:b0:b3f:cc6d:e0a8 with SMTP id
 a640c23a62f3a-b647235f3ebmr570080066b.17.1760727491842; 
 Fri, 17 Oct 2025 11:58:11 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00::f6da])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e8393778sm43274266b.24.2025.10.17.11.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 11:58:11 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri, 17 Oct 2025 20:56:26 +0000
Message-ID: <20251017205626.438525-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760727492; x=1761332292; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LzUrKRHclm23D+GLnNIa3uPqkmb90RdcjGbwCNbirvg=;
 b=CNY7i59Sg8l831UAeD18YTE5YqFV1APSICAFRA4enh3OGEbNyhkT1M5FiKNZ5g5lt3
 OoGUuZkGTDJkr4QxsH47LDTIrFqTsTSfvJkHNSl/2niHTP9cot/zFt8St6IY5bcBAo4Q
 ziqYAa0W7X8qUr3BfWISLT3g6v1Vz2QSbrgTZw/yOUpKJg5OPNtqZknZTG0pEIvNxhV1
 HtLj26dHZ//lQdgoFLVSKTAE3tJU/zs0066XDGXOAaobo8ECNJvyCV825F4BXpBcqoZQ
 ATEBIaqxpmOKnuY7xmDftvJEqpBPkOPvPmnj7ygnJUAnkqJRyfS89REZ/CaPCvS3fQir
 yj7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CNY7i59S
Subject: [Buildroot] [PATCH v1 1/1] package/slirp: bump to version 4.9.1
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
https://gitlab.freedesktop.org/slirp/libslirp/-/releases/v4.9.0
https://gitlab.freedesktop.org/slirp/libslirp/-/releases/v4.9.1
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/slirp/slirp.hash | 2 +-
 package/slirp/slirp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
index 930e6aca58..bd07074bb4 100644
--- a/package/slirp/slirp.hash
+++ b/package/slirp/slirp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1c2e3d30e41a055ed41f9d0b3234d0d143bc28f5ad84bb101413f830844df757  libslirp-v4.8.0.tar.bz2
+sha256  3caff6e2de445f4995629d4929c55419f661b2b1d14f12481e155a71c1e8f811  libslirp-v4.9.1.tar.bz2
 sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 6d44df8d7e..950ad53ea8 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLIRP_VERSION = 4.8.0
+SLIRP_VERSION = 4.9.1
 SLIRP_SOURCE = libslirp-v$(SLIRP_VERSION).tar.bz2
 SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$(SLIRP_VERSION)
 SLIRP_LICENSE = BSD-3-Clause
-- 
2.51.1.dirty

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
