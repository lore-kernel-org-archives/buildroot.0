Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2BFC3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 09:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7A2440B92;
	Mon, 12 May 2025 09:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-oDyzloJNtE; Mon, 12 May 2025 09:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F06254076E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F06254076E;
	Mon, 12 May 2025 09:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C717217D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 09:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7508815C1
 for <buildroot@buildroot.org>; Mon, 12 May 2025 09:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9O2L4pISjhO for <buildroot@buildroot.org>;
 Mon, 12 May 2025 09:43:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2280815CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2280815CE
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2280815CE
 for <buildroot@buildroot.org>; Mon, 12 May 2025 09:43:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a0bd7f4cd5so3576008f8f.0
 for <buildroot@buildroot.org>; Mon, 12 May 2025 02:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747043017; x=1747647817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3bJOMU75Wv2wOf4HJRpPHMhrJRMLmN+4TizoXDMMXZ8=;
 b=wZty8Hg19CZjP9x9veL56REgY+hhT+XoZ7OBnVC3AA67mlN09vG4oFDEcoGAZhrfvo
 +i5ywzN1ZWH7EWjtMEbbBcQ4l5PftbvTBKRfcKaZxWl2GOpa150Ff9aNGL2j09NEU+9R
 33XWLN7umnhGXfrJJ/1tmPFbXOMUnOSkPRRcrC917fB4P9umSuxoCuaqszBm1dqwOeAG
 ofHtO7CXNT7B4JEaz87nuRvLb7eHAyIMvgQ78yNu9BhBPGXGbuNA0l7lgROrpztagDhO
 /LIjehEq/n0QY7qQRKuVr1JQz0tMtITQ0oyLdazm/M8i102UkwO0m5MpGkvV/yICE5f5
 fd0A==
X-Gm-Message-State: AOJu0YwAIhat7SrIi/F9Hibj0nyxUaUSwoZJACyAFTll1x5MeGF3Lx6H
 ywAwq5TmOqEuCy6HNvQT75FYqxLrai08fuOcSUOqd6P8fgtNAaOBJBSg7LJVw5HwoSYfQvMR2Zo
 iCpmPlQ==
X-Gm-Gg: ASbGncumF/aNYNhsQkfDk95AT6YpG3ralyB8WIBLEWdWnPywbsEQqrcsVfeRvbbl8A3
 jq8nQ3GxVc3vhynitpyXATOdTqZTQPtOi6qDL4Gm2OMZa6K9ephqyWr7ISnRLCz6zRIrFOTBoi9
 GFGzEjuixA8+E/cmOTkn8e1E5vhenwjPHgr5NwM2PCwOpUdJwSqLhyNBjvhG4Keeoxmf7x8bqkV
 cZY+RlFBUkCcFQnZ/1bN581vuH32afjMBgYt3QSD9LCSywIutyN1avovVi4ycp53Egai8bgWvLe
 dumEWrJzsnxaUO+E27dj5l1mjmbT8dPkNGhBf88QlcwrRu2RaEkqPG/WVsqoqlGWUotUR720P/4
 OWHoTtj+KprdEXSoC5i8Xq/Rx3kkyFsiggCXaQFV9HhQbi6paA2ZmipFwAQ==
X-Google-Smtp-Source: AGHT+IEhtUPpDuR9y5R0y05WvdpXBMquXkDRvhDHKuKSldi+TAPb0EkIqJ7z1mhSo/Mvt2DVLRe2sA==
X-Received: by 2002:a05:6000:2481:b0:3a0:bb2b:14e3 with SMTP id
 ffacd0b85a97d-3a1f647864fmr10508410f8f.33.1747043017636; 
 Mon, 12 May 2025 02:43:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 (p5b26784b.dip0.t-ipconnect.de. [91.38.120.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a2d2f4sm11863244f8f.78.2025.05.12.02.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 02:43:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 12 May 2025 11:43:23 +0200
Message-ID: <20250512094324.127864-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747043017; x=1747647817;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3bJOMU75Wv2wOf4HJRpPHMhrJRMLmN+4TizoXDMMXZ8=;
 b=Af09I0vk2XG4VxxCIEj5SQ1EnqS4dG2udebTKu3AjkY9INhv2q8Wr8h46mMWFR0med
 zEJMSZHvlqBB6cGpWs8lP7GESj9SfgbModjX9v7oxrITq14t9rnSUdTpDhdPN2RnzHHA
 cpDDfc2pzxyiBTjIJf5UYY4T5hFjyYwNeHnN4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Af09I0vk
Subject: [Buildroot] [PATCH 1/2] package/inih: bump to version 60
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
https://github.com/benhoyt/inih/releases/tag/r59
https://github.com/benhoyt/inih/releases/tag/r60

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/inih/inih.hash | 2 +-
 package/inih/inih.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inih/inih.hash b/package/inih/inih.hash
index f20d7ac0b682..2d76a75563f7 100644
--- a/package/inih/inih.hash
+++ b/package/inih/inih.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e79216260d5dffe809bda840be48ab0eec7737b2bb9f02d2275c1b46344ea7b7  inih-58.tar.gz
+sha256  706aa05c888b53bd170e5d8aa8f8a9d9ccf5449dfed262d5103d1f292af26774  inih-60.tar.gz
 sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index 80cde0942ba4..0d6b5ddbb767 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIH_VERSION = 58
+INIH_VERSION = 60
 INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
 INIH_INSTALL_STAGING = YES
 INIH_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
