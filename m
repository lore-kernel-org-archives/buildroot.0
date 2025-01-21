Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCFBC02187
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 09:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C832F416B9;
	Tue, 21 Jan 2025 09:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yqr0h2qY3XIz; Tue, 21 Jan 2025 09:19:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A79FE41701
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A79FE41701;
	Tue, 21 Jan 2025 09:19:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0082069
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D45FA416B9
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQIUzXMMAEw9 for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 09:19:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D992F414CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D992F414CE
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D992F414CE
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:19:21 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2f13acbe29bso9790471a91.1
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 01:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737451161; x=1738055961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1tXKuVheStBbP3tdMdXwrulzdNy6j1G0p8/M8EDNYh0=;
 b=kv+YDyqqnvJdYc8wNpZabvrTmjzM4uGIIAE52OPBrU7f0TkoAYTiEfwHiZo6vb9G92
 gHnVkLEt9WN4HbACi1r9Z9RAWN8pTngxKVXbokYVTy9ZDzKyZLoErRtM+emnQdr/K+UN
 IarcnVfUUJxNpJQ8pSkWx89uLjevjsILf237i2MD5iBuTAKNE5MSEaR2SOBUiZSfhQT0
 RMUrwVcdbj3Z9M3dgFJd5akvrJ7bVHc6vUtRrjZx6ICtN1BzU0LYKU4EksxwDxMKYZpz
 IipIsc12h7BmRwc+aDMk/tBATQGFHs6iS//LqY/HJagjxzNTSvI9d90r8OXkI7H0d2my
 McxA==
X-Gm-Message-State: AOJu0YxyoXnRUqjxgN5PBfOeuKDwoZym3FTGrbjcJ4KSk/16kknbWpEb
 H4lK0AzrSBaXZbI6yyyIb2NbNcWTR1X6KXmN6YbOPfi195S5zoDUolxU30lS
X-Gm-Gg: ASbGncvCEQdMNCJ/ColxqvR8cdYloqS1OCqzfdVeoI7yoKuJuBO1/vCpUdQrfmtb1ft
 ufMdISKc7hhy8o+D6/tQplmTh9SegGcRg1Xz4uvIYQG7FiWQDQKhWoVuTxD5mPG2419G5+QyBJJ
 7j+0HwWwqIkwaK1UHYtmMXxDPUm3vrupVAj7hixLbTMa1W9sV2GcjbkyA84LhsO+7CSLLhzTZFU
 9UQUBA1UITQnujzsKkJHrK76mnmx3zMuu2x/s+izCzUthy9czbta/zC7jAFJ6SuN0hG81PxkFel
 1NQyD2oBePj5F/PfwEyElK2gG7uCeM8Qm0w/F/aMX1AAWbR55TFLOQ==
X-Google-Smtp-Source: AGHT+IFa3X7+v3WfsP54EtzK587ic5jbLGA1AgZc6t5ZHH9Mbwmoba7TGUAMI2+anviq3WlVkBXtWw==
X-Received: by 2002:a17:90b:56c8:b0:2ee:ee77:226d with SMTP id
 98e67ed59e1d1-2f782beed29mr22988421a91.4.1737451160778; 
 Tue, 21 Jan 2025 01:19:20 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f72c335093sm12403848a91.48.2025.01.21.01.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 01:19:20 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 21 Jan 2025 01:19:17 -0800
Message-Id: <20250121091917.19379-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737451161; x=1738055961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1tXKuVheStBbP3tdMdXwrulzdNy6j1G0p8/M8EDNYh0=;
 b=GpNwWYUHkMjL9fXq8JTXWT0ZC89jcRrJgFPJVuwu/pT8rIlPIYASOjpws9wI+MjA+f
 PtY7auGndzy39DyumY8Tk1eZw6iyDrmFh97DJzMNgrVkWJiysymfe0XnwX63op25MVa0
 OIvb0mHF2ghrExMWz8DC3HNhLw9F5b66NdPiHqCoNfSgppxoPtY967IujXOWzmEi+R6L
 o/yorpanaGT5IkQZtrjSbq640CxdE73ELwlRYL7XA+S7NRRSi2tfphinLjemjr+JNT/Y
 MLZNqgENbULvVOk2iVkAQhVl+sP33vj0AGnzrOzapBFv2Z7e6QEFPi12Ne9LOR3OZPvT
 doAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GpNwWYUH
Subject: [Buildroot] [PATCH 1/1] package/lzip: bump to version 1.25
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
https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/lzip/lzip.hash | 4 ++--
 package/lzip/lzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 7900835e11..ffa70c3e6c 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From https://lists.nongnu.org/archive/html/lzip-bug/2024-03/msg00003.html
-sha256  30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162  lzip-1.24.1.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html
+sha256  09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f  lzip-1.25.tar.gz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index c88be5680e..9c8c54a8b1 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.24.1
+LZIP_VERSION = 1.25
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
