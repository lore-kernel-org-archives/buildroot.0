Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD4EC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3599640B7A;
	Fri, 16 May 2025 11:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYznzv-hMsE2; Fri, 16 May 2025 11:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CB0E417AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CB0E417AF;
	Fri, 16 May 2025 11:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EE2C13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 407EB83981
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnJzUMTdVh0o for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1EBF283C93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EBF283C93
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EBF283C93
 for <buildroot@busybox.net>; Fri, 16 May 2025 11:30:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso16022775e9.2
 for <buildroot@busybox.net>; Fri, 16 May 2025 04:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747395045; x=1747999845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F1l07nHtjRPwDEsCNrk80mcd/wQf3f73fOsYiqOnua4=;
 b=NW6nW8srIr909JcqOgPo8UJVql4ylgX0ZU4nVfWBvOFz4L8oRN9KwLisssMdW8UdWy
 eIYAa0PnUNcuQQ381HJOQvvIrldnakODWctBG+olRIsokTc6CF6co+WbTAMRJCfYNXva
 18yjr8QY8ckRSKSv/IG6XcsJJ+jjPA/NqawyRTAsCVWpq2xWpTaO97j0tleqlP63xdnV
 XoOLpT5bMJfk+rQAlvOhLFHwzVJTNXNxzLy7KbZxDSkZASPl4sf/h1jwMt4WUZfiTA0j
 BddrSeRFbtfqOdfBiVQQ61quVHmy3z5nBpacYdLYothkJWCI7frJ2xBu4ky2FV1Ys6/u
 KzHQ==
X-Gm-Message-State: AOJu0YzMZ6fIhOILzqRG8wafYgXbT9V9XdjNFLgnk3ahneSK6lamspVz
 4T5BbYFCJVmvnn7cUwiwnVp484TJjbvh2XIA+ZmMeCxY6Wtcrx3mfgvaUArn9bsDkQwFNu0YV9M
 Ev/AaPQ==
X-Gm-Gg: ASbGncvZdG2JC9gkOLGG4ZezkJpaFtLR3VHzGGzG4TTj0nGNdc7h8sKmSx60us/j6l6
 H0AlvQYhw+XVlu9HqyCAgaKZcvgcpA2yF86q+gF46J8GajnOOoyCsBXqae9e2G9rFMM5Nxatmum
 3RASU+kDDelbonROo+hw6BgRPa6MgkzrzkpX6s/tvgl7wnA3WegAuQofl+JollxAf8eEvZHV2iE
 a/qs9iJpOlMym97u6vOXYIR9agl/OKWBsUObw3OXDHjscmdbhJZbtEhbrnZeOvmZCPzAdy+G8is
 ts1uDepBYbWPYICeXDj6gFOMK4G1m0BkH7vsCDcugI7HgX8qgeuuowglETLZXWvUtJVsNvT7Zt+
 nFGt6jj/jew==
X-Google-Smtp-Source: AGHT+IHw9NTFt0FLGri+FyUq60zm3LH485lkjcbwiicMKAIUJDi+11WdzjctufSUShelxmKsTPdIMg==
X-Received: by 2002:a05:600c:3c87:b0:442:d9f2:c6ef with SMTP id
 5b1f17b1804b1-442fefd5f98mr21592305e9.2.1747395044996; 
 Fri, 16 May 2025 04:30:44 -0700 (PDT)
Received: from vm-2404.. (52.186.66.37.rev.sfr.net. [37.66.186.52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca62c70sm2615824f8f.54.2025.05.16.04.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 04:30:44 -0700 (PDT)
To: buildroot@busybox.net
Date: Fri, 16 May 2025 13:30:39 +0200
Message-ID: <20250516113040.1926881-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1747395045; x=1747999845; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F1l07nHtjRPwDEsCNrk80mcd/wQf3f73fOsYiqOnua4=;
 b=ZphQ4SM7Pq0Xq07KYJajQ4y7XwJJXQ7yGL/F2SFmT8gDOpmB/EMs/VYEUAVDRCjSoQ
 DxYFJoPjtpvmlqGFiIVmNM+BQQcXcTPnc+KEDLG01bPa/YWRCYscNvD6AB50Df2y8m35
 9MmbbR4WFLtJazlM7V5/t0F9nq5aj3bM8eN4NCB0wzpiinp3JyFPplvvcG/0TKHME3hq
 hjH2U7b4hZ0Yr5ZNvrPg7VLnveuIbWJWkXCM/c2DIg0s5ZX9dQWxHjdy0MxphfjkNBSn
 YFhbzV5guHa0yO9A86Gp31TBz93DntRecKQB/oslnqm3LEi0s3TMdGlZ73PgOefiEJRs
 k9tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=ZphQ4SM7
Subject: [Buildroot] [PATCH] package/quickjs: bump to version 2025-04-26
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENSE: removed trailing space

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/quickjs/quickjs.hash | 4 ++--
 package/quickjs/quickjs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 30613b982..798c857a1 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c4bf8f895bfa54beb486c8d1218112771ecfc5ac3be1036851ef41568212e03  quickjs-2024-01-13.tar.xz
-sha256  f41baf09eef895d468d18c23055d74f711e4b8b2641cef279b5d71285c07bfe8  LICENSE
+sha256  2f20074c25166ef6f781f381c50d57b502cb85d470d639abccebbef7954c83bf  quickjs-2025-04-26.tar.xz
+sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 2bd9da139..e2170b297 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2024-01-13
+QUICKJS_VERSION = 2025-04-26
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
