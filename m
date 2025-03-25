Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FF3C35FFC
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 11:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E9BF412BD;
	Tue, 25 Mar 2025 11:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27YohEHkjizi; Tue, 25 Mar 2025 11:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1656411D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1656411D2;
	Tue, 25 Mar 2025 11:38:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 652C01B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 11:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AAC180FAF
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 11:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKYCSiRPCH0n for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 11:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 771CC80F6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 771CC80F6B
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 771CC80F6B
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 11:38:22 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22622ddcc35so37195695ad.2
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 04:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742902701; x=1743507501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SrpV2WMTpWkhOnSX15U5NTiOfnUDYswloT86kR+v0Mc=;
 b=ls5cj2eHeVKAnVPFmv8DNmltxntiwrhPpTw2wKzkzSuK1uv+eGoA9MYyeNd57cM8D+
 bygTnIwmmde74r41eZbMEW+D9j524vjJ8tVu/ZbUWEqVZRPYy9pwzk0Ernfmi8x94+8P
 pgOvcwqtIl+H//UqytCzmdjONM6SlH1nK2dWYZAArokEf9acc1tWJ3FiaSwlDWXCvvFo
 NUQ9jmK6KZc/77hP+e2Dx1wybg1uWujgRgq03OLx/rX/EABrKRHQl6sK5kFxDXQFQwps
 YM2u8tSvMEn/MPDMpPLtIUQFTxGfQSzf+D8h6K1ruuWWoIOFgJVY4I+XX3AJgtWqhjeZ
 ActQ==
X-Gm-Message-State: AOJu0Yy6sIxrMvsqCOvUIJfXwt7S2QGiSCB8dEuuTyKylozIMrrHvRYf
 PGnMKvSfCvm9mDxiL2IfLuXUzO2jLYr9dwTUCn+n+EH15Ke3DSPOU/SFog==
X-Gm-Gg: ASbGncvZT2WFM9WJglw85qxhVtJHox0B6m2c3oB5o7XWMAppvaYXRHGohmPCmgtR10W
 ZFAYYylnhUu+z9lHoL4HtC13u/rmF10UD3Aop2S+8ndSJqKU5qutARkj24NeDljD1IRjVmpajFP
 Cb4vzc2ypvM9J5QDvNeZn8e/Iz7dibZXQW9VHQTQfvnTiONeXkfH7KK+A1PFiqHpX9rhYFULyXa
 gxwo57Nox4Ec1rQaocpVui+jGTIl8QSw8WuQ0apFhPAE6LNfRegVR7wr0gS5b9fZ9YNbVFZVlQy
 1XGC/McliYwFhVp5UGFoRp38ybM+W34m2ruAqGDZmd/l
X-Google-Smtp-Source: AGHT+IEjkWxkI7cYd7ZC+doTxW+RXOW+77LQUR2oaVYuZQXCDzznUNFFdvI548Mk/1emL3o9BgX0RA==
X-Received: by 2002:a05:6a00:2e11:b0:736:3e50:bfec with SMTP id
 d2e1a72fcca58-739059a0c47mr30859446b3a.8.1742902700563; 
 Tue, 25 Mar 2025 04:38:20 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7390617fa4bsm9916401b3a.157.2025.03.25.04.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 04:38:19 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 8EA7141CA461; Tue, 25 Mar 2025 18:38:15 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Date: Tue, 25 Mar 2025 18:38:14 +0700
Message-ID: <20250325113813.307451-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=bagasdotme@gmail.com;
 h=from:subject; bh=kmbn4ARp+lRgc5T35XbfF4V8KMwbbyHim7Mvt3GfEEw=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhvRHU5eKz9526Un03eDm3O1ZuZF3zDq2Fh28JyVzyPnId
 6sWh41GHaUsDGJcDLJiiizRa2V3GfPuvWQWk1AEM4eVCWQIAxenAEzkszgjw63E/DkB8fV76lP8
 pzkZ/+Wr3vY+1qIn17rd/9HTj9a2agz/TJYLFOzLZ713joX5hYT+x8dT268cTwrWV1v8RHGiYPJ
 ldgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742902701; x=1743507501; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SrpV2WMTpWkhOnSX15U5NTiOfnUDYswloT86kR+v0Mc=;
 b=NzOMLlGH14me8neMVEXBCJ6MGmUBlo4hVYo9TRa6KACFGG7nN37untSqCi/mUFPT8J
 RJeE/ZrP88T9Jw9Xq2NSDrXvDYiFy8L1/lM0P7fy1wZ2lAdmyWm26BaLwMqmRLOZ9fa9
 nC+fIjQbXpkUB9EzDlhF1thlOo528XVbiuGU3vAxmiK3htkDlpauHuPDOlGYp9yvUc00
 v9pFDO6RNb9+XPx/gLZVvUigvrVsfysjLLTVs38DKhADui3Pq1ecWAwYulV223DnqyiO
 UfmcplVZ0YAK+4tzfC8HGV/DXZIpGb9exM/q5AWpJkY2FbcAzt6n9zHlVl4CisYQpmuz
 ZxWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NzOMLlGH
Subject: [Buildroot] [PATCH] package/git: bump to version 2.49.0
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

Bump the package version to v2.49.0.

Release notes:
https://lore.kernel.org/git/xmqqfrjfilc8.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 7608cbe176..6235a8aa0a 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  1c5d545f5dc1eb51e95d2c50d98fdf88b1a36ba1fa30e9ae5d5385c6024f82ad  git-2.48.1.tar.xz
+sha256  618190cf590b7e9f6c11f91f23b1d267cd98c3ab33b850416d8758f8b5a85628  git-2.49.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index de3103f4ff..68a0fff65f 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.48.1
+GIT_VERSION = 2.49.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: b4d259727e16a4a3352a20c085f787c783c9f53c
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
