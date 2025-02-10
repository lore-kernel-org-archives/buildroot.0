Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4735BC021A1
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 02:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C48C580BFE;
	Mon, 10 Feb 2025 02:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMT9sph3ScV9; Mon, 10 Feb 2025 02:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD75080D38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD75080D38;
	Mon, 10 Feb 2025 02:43:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E93EC6C
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 02:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7F2D80D38
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 02:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWjoW7vlsV69 for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 02:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0179580BFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0179580BFE
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0179580BFE
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 02:42:58 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6fb0200b193so360867b3.0
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 18:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739155377; x=1739760177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KOT5p1SSs+TFspShLC4EqmCdbH5yEVqMWISuWeIOIOs=;
 b=qUXF198PzQ65/1HrHOs/HvVBd0PG001EvXtkboH6w81juyChYY5zN8Fm7fMed/qXmf
 XPtCTWDW59EBIa2PKV0/0ULZdUGDzLjYpau3VPlv/UNp2tO/Hiqx8nwvOMYzff+If1+3
 6T0eB0IYoDzUosa3qxR68HQ+Ixm6ClEQ/pHLCg2/I5r9E08o+hdBEcKj1rZr+fuu+Pdc
 scOHYbQr3F9QP9y5KvHhcy3udFk6kDM4M04SiGSdrIksQdWua6Ad2q5xGLQFMcpl6sLd
 vjoY8Q0FXbFMOrhUFeUWSURK6ViBSHcstJn41tn9+Q1ZD5V/0Qdlr+guzOCZUor1v8lb
 2Pqw==
X-Gm-Message-State: AOJu0YxSHlxFDdElwE5yc7pj/EIwlkO+bHJ6Ha7LPpqhVR23xsLuX8bL
 p05yH+8zenACpRytc85SyQtZjZ0v+xvgjwZ0JSXdeq5z8Z2RVC80m974wA==
X-Gm-Gg: ASbGnctuia7ZGtCOCvJ71hvriUkVfGFn0HVC3tyA6s8rXPyPe4QAQxkoz2HNPfi5WT/
 TNy/lCLxmK9pYusLdiSvIJ7cvvxUmKkAsThDxu2dHj0eOg3MwJP5sJQGIjYnjIflWhCyYMWR0aa
 41T5y712w0pHYJmvsXKryuXnYgx9iKWxsLw4GNIgQhIzPGY2/g9tHg2Rgh34wDDyZjEoDDfihDG
 9tRDOmONOq84eSxWabEzECC7FbtbSfNzU/U3oPZQsWsSwmzjNKBIF+eYDYeLwNtSApmt+H9gOHX
 MJ1PNEKNG7yV
X-Google-Smtp-Source: AGHT+IHGkUf/nWooMtQz1bleRpw95aj0DxCTfWWhSdxVVDBBjDV5c+hI70gJQQAlFplOXoQPqgKw3g==
X-Received: by 2002:a05:690c:6c02:b0:6f9:ad48:a3d7 with SMTP id
 00721157ae682-6f9b2802183mr107616377b3.1.1739155377358; 
 Sun, 09 Feb 2025 18:42:57 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6f99fd1bb65sm14777947b3.29.2025.02.09.18.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 18:42:56 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 10 Feb 2025 10:42:43 +0800
Message-ID: <20250210024245.1954529-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739155377; x=1739760177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KOT5p1SSs+TFspShLC4EqmCdbH5yEVqMWISuWeIOIOs=;
 b=IVrOWKC2tnGb06SCJRwlkCKP5L1v01AtGMtjqYKFsW/9YNgt7eDyNWSe6PGctwpJ0k
 sW4a31gyYRabAGRubk1/lDMvxOYG03dHCPztfExKTj8S0R8CYTJA1wsfQoberor1d/Ba
 t5Bp0n5mEjPNeSXYg2JwdfC8cnuzjgDJ/odeJHkFURpfGViEvMZjY5IRvwF1sRHgX8+W
 90uTNyWVhDiKoISgQxBdbJW/I1W8dVglqyMmCK0zDimhya7EApBMbCLFGrDtbSlnit7p
 yUixp/V31wvRUcKtb20QStW14NaS9AoW3D93/y8FzWcO4HzCDyDgMGCPNUjZo7fw3EFL
 LX/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IVrOWKC2
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.18.0
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

Release notes: https://github.com/timescale/timescaledb/blob/2.18.0/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 08d981661e..f799b0c7f8 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b2fcc29e9975b88c5323aefb062346326694c391d52af46186f5a5ad09136d47  timescaledb-2.17.2.tar.gz
+sha256  86248970971ad075e0b5ed64dbba5b190eb8794d6e36b508427a5cc42b20a420  timescaledb-2.18.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index c9dda67282..99756cb0b8 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.17.2
+TIMESCALEDB_VERSION = 2.18.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
