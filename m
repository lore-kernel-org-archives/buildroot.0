Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4076FC282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 21:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06DF281FE9;
	Mon, 17 Mar 2025 21:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zy0O_jOYqx_7; Mon, 17 Mar 2025 21:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B1A381FFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B1A381FFC;
	Mon, 17 Mar 2025 21:40:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F242D5
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EE2381FE6
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FueXyCx2X6dA for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 21:40:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E42B80F39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E42B80F39
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E42B80F39
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:40:31 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3d46ef71b6cso38961285ab.3
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 14:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742247630; x=1742852430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BYhljzw8SoG+xmR2zHg+XN7tMgvufVcIYWKKFOrF1EI=;
 b=Y1KAsdaNJlPwKb/CbDLXNZXj9cdF6I3qkIAGlfo+s/zKKF5Tj6tUEdhE+3n77jpJRV
 ygTbpwW9W8dK5gwZIHgf3r80yQ4AvSWB79rF3yxfhOSgR9FOHsZvX6WDzMtx5Jy08GWl
 mlK/QFIIm0B1jOM9OO22KLD0K0znYTVY5QscdwZP9O6GLEW9olsEbGfmOo1jveGw87Xw
 xlkzbqmCmnUWVWUFRxhjx9zSxXm9/soT7UDEy8y2NGnkn1OqaY43iW6xrl+P7U8l//ps
 FjpPNuh0TC+qiiti0EgQDoiZ5CnjGMc9/YfOUUruif5Gk7SzSC6HYny3f4CBpzFC/1nX
 GfDA==
X-Gm-Message-State: AOJu0YzZnudMgoW/gK4x4gU+WuC1RXx+cYiFO3v0pQbANWXO11Zc4VUV
 D2ixYp2RJeo7aE5XAKUEvbkDZOvbCbfzEDc45etI1pmrfSznNn9+4sbxtw==
X-Gm-Gg: ASbGncsn2i522I99dfPtMJigoj0wOuvrYlxcrhKGHl1tqFBOGKOyrMe8a9wXDvWNiCk
 K3vPqCwP7wQoas2UaCu4txA0onL1wrnHwkRnK7lfXO172yjJjn5ajvvfRy6vKnUOPRPvbFHhLeQ
 KJXf3vrxQsr4bDEZimn81EQ3aXDhaR9MmxsARgU4/aKgIZGmbASybjxI2oLUcoGWrdTlX/Mz1Vu
 U+sfp0ZIRCCx3Pm9XOE4C7e5wmC37ETXh8IIsqmOEiBjtVWTFlT+BEDCOQeT68WX3TxRiZLnKZk
 YP7TZDAV2HSAmanoqIDm2ByIc4j+EyW0JL7VYvyoguSSAua1eWiD7pkDaodbmVI1emjytGmgvOa
 HqjUQhT4vthlZC5zSOYU6
X-Google-Smtp-Source: AGHT+IFY09pcQfCKjAFaDc1ONGZKmd4l5CLUV8vZbo8q+Jl2myVgESA9geQz3qyvgROO+hGegaQxkQ==
X-Received: by 2002:a05:6e02:1745:b0:3d3:dcfd:2768 with SMTP id
 e9e14a558f8ab-3d4839f3dd9mr164174545ab.4.1742247630044; 
 Mon, 17 Mar 2025 14:40:30 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d47a83b295sm29338895ab.68.2025.03.17.14.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 14:40:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 15:40:28 -0600
Message-Id: <20250317214028.3047061-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742247630; x=1742852430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BYhljzw8SoG+xmR2zHg+XN7tMgvufVcIYWKKFOrF1EI=;
 b=NidCqQGadOupLVm+DfWx2a8p1cWI6pT47oY05XcGfgN7zQoK3qmQ6zy7FUiJ7OkQrK
 SQH5Rt8VUByIvI/vrssjaz3PvwciuHJ/fYWdeqreDZoNqAPE66dqPkXaO2vsjDZSlX2v
 UeEQ+fgtdigrcaUGI7VcchDyMfhcWWbm8YPgV4yMn+mjQr2PEYWXI6q8qfngSGfD9lxD
 y7f3mAFCkdF+b0oSqU+OLY6Vi0llu0e9qktCCAqJKX+IZwW73YbM28MA46tWcCluSCmL
 G1ADgZN/KmOrH+bnVV4vrfx2GldE1R4jw6/wwsjrXLUVDEAnV8KuugfE/BQYMl8uu+Yo
 mFww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NidCqQGa
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-cors: bump to
 version 0.8.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to formatting changes:
https://github.com/aio-libs/aiohttp-cors/commit/c4a4ead0df64eaa266ba36660a8a841370bf07cd

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-cors/python-aiohttp-cors.hash | 6 +++---
 package/python-aiohttp-cors/python-aiohttp-cors.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.hash b/package/python-aiohttp-cors/python-aiohttp-cors.hash
index 29ae2d7909..5bcd8bdb05 100644
--- a/package/python-aiohttp-cors/python-aiohttp-cors.hash
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp_cors/json
-md5  de3940a901b269be82c8bd9f28d53ff0  aiohttp-cors-0.7.0.tar.gz
-sha256  4d39c6d7100fd9764ed1caf8cebf0eb01bf5e3f24e2e073fda6234bc48b19f5d  aiohttp-cors-0.7.0.tar.gz
+md5  c993585a46c40cc4292c5722c7dfbaf0  aiohttp_cors-0.8.0.tar.gz
+sha256  ec70f38432c938e39d240ff38a7d789a5aa0a18087882c12d6cc141eef1144f6  aiohttp_cors-0.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256  86cb2262ff825ce1c8b8fb9ea9f5174318badc3912639b9275fc25d0e305c556  LICENSE
+sha256  c20f93f9891ddab8de9a4db5415d39c1d7d782174fe218b4c38ad78a771706e2  LICENSE
diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.mk b/package/python-aiohttp-cors/python-aiohttp-cors.mk
index 27443540d0..26fa43bfa2 100644
--- a/package/python-aiohttp-cors/python-aiohttp-cors.mk
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_CORS_VERSION = 0.7.0
-PYTHON_AIOHTTP_CORS_SOURCE = aiohttp-cors-$(PYTHON_AIOHTTP_CORS_VERSION).tar.gz
-PYTHON_AIOHTTP_CORS_SITE = https://files.pythonhosted.org/packages/44/9e/6cdce7c3f346d8fd487adf68761728ad8cd5fbc296a7b07b92518350d31f
+PYTHON_AIOHTTP_CORS_VERSION = 0.8.0
+PYTHON_AIOHTTP_CORS_SOURCE = aiohttp_cors-$(PYTHON_AIOHTTP_CORS_VERSION).tar.gz
+PYTHON_AIOHTTP_CORS_SITE = https://files.pythonhosted.org/packages/1d/a8/3edbba1d565f7888c52e04ac6188e19b812a9fc39d81dea413f3abf81bfa
 PYTHON_AIOHTTP_CORS_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_CORS_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_CORS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
