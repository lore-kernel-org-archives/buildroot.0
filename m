Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2D3CA0EC0
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 08:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A24E881EB8;
	Mon, 11 Aug 2025 08:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BJXEdzV-weB; Mon, 11 Aug 2025 08:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6D4D821A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6D4D821A1;
	Mon, 11 Aug 2025 08:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A8B3154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C2928243B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXvMwGT0cgvQ for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 08:19:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB3A8821A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB3A8821A1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB3A8821A1
 for <buildroot@busybox.net>; Mon, 11 Aug 2025 08:19:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso25554655e9.0
 for <buildroot@busybox.net>; Mon, 11 Aug 2025 01:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754900392; x=1755505192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yHZ2bpvZDByRK9Fdih25C2V1OHz+v5hfJY6MwLCvlOs=;
 b=C+eV+BQEluyANIqAOyy0osV3+e2VG0h4jOslu6rkX03ZrovNdqvSxZkeIOc2DimZEn
 6De7tB/YZoIlpOkiqYqi5a/qFP5vF78DgvFEvDbjy0q2xzT9TrXNU0HnCEaM5RySzkeY
 /6/npeQkaiPJ3rLgeqQdDWiNx8qWlEmlcj0Q/+uZRSKAxUpO5o0ad6vKmS0du7NvNlEM
 Fn/lDbeO9TUtmGEUKTUNX5wM9KVzJJNr28Z+Xntzk/5oxfmspvCgGGJyX2rvdIy7NbHD
 XiuapRdNiDpjtudFwwYwbFvknWvFX/AfrBHMstFdoA4gSDMt/riAZImT55ga1CjfSCu5
 KsNQ==
X-Gm-Message-State: AOJu0Yy3bqS1/35fj2h8v0qNHql9DOOmp421xzsTY9E9AwEmQmJZOOUd
 vWHDKja/fa5Eix5O8n7fVXpVJqzlFvy4ztTZ/PwMK0cK/QZzzGUfEc7+sFzxxtf+lg6E13BdWLS
 lA99epA==
X-Gm-Gg: ASbGncuaay7EKT8FynHnFgk/RLRPvLHHOxAsJBr1wS/4H6cEE2I8yCFV8VIeiwAsql2
 xhzg81aRWLEHbwwl68/kdhhLhMmv+6/RAX9Tm+NEg9casfgU93TSiyWay9EzV6jAxn//IUgxD08
 4PUWQReeGatd7fbUGvkd3Hs5vjrhLIiIdS+1iPvB4sheY8b7NjkDL7u4DiMa291ksu0K/9i1EA2
 qcOg0TE52i3pdNNI5+05Qbcbtkd2/v1nLvlHKtaxosMU39KDHgZSBl4m4NEfkI0jQobw/Q3I+iM
 XVLGOeovPLCQs7X59z5oCOWBiUwJBGGs1sDucobfVroH/GskfEnnEmC56s35vGD0eKlS3d3GwGJ
 j1ifEL2kwolJ2w2eo7RGd9skD4yZr7e5YfJIysFOzCD0c1NttUyG+n5oy
X-Google-Smtp-Source: AGHT+IGyH2NWa9q95jPiEBOkmqdVD0lCm0HM00+I+8umlZKnluwtdvkPhNKCGrZkI10H5H4WM0Kz4g==
X-Received: by 2002:a05:600c:4686:b0:459:d6a6:792 with SMTP id
 5b1f17b1804b1-459f4fb2d08mr96910755e9.29.1754900391204; 
 Mon, 11 Aug 2025 01:19:51 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e1cb7deesm29749929f8f.2.2025.08.11.01.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 01:19:50 -0700 (PDT)
To: buildroot@busybox.net
Date: Mon, 11 Aug 2025 10:19:44 +0200
Message-ID: <20250811081944.2353310-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1754900392; x=1755505192; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yHZ2bpvZDByRK9Fdih25C2V1OHz+v5hfJY6MwLCvlOs=;
 b=hmK8MSMNQb00tcnjUp111wxueNy4XsQtyOOksohjlFAtizpD3uWL2sNqYeDhvci10/
 zuDTf3I5buMqRJtaDNn232mPvMcWtdTQdWnqWSOSZsNeLgtjgb5Oy6AnhCmRVyvHfmlT
 VmcoQyyYldwp5RDSb6cqwtL7XlEotQiY8oaHWyNLlJaKDh865kb1PRfqR0LZlIplZX+H
 sB456+b8P5HbDGxPl5w9Q83TM2ACZ1kHu6DRiucgpjnbyqVIqPNCL4TbQ3eGMYwAlw61
 bXEVj2dCQfgb4tKEUp3AsW1Hzbt83XmcJ+LI8SqTVmilmLkmofP3shZp2bwb4rnxdYdV
 Y5yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=hmK8MSMN
Subject: [Buildroot] [PATCH] package/lua-zlib: bump to version 1.3
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-zlib/lua-zlib.hash | 2 +-
 package/lua-zlib/lua-zlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-zlib/lua-zlib.hash b/package/lua-zlib/lua-zlib.hash
index cef29efb1..c092ea431 100644
--- a/package/lua-zlib/lua-zlib.hash
+++ b/package/lua-zlib/lua-zlib.hash
@@ -1,2 +1,2 @@
 # computed by luarocks/buildroot
-sha256  42436ba2b78c9a2d515d6da59ceb12cdea7f84c9ce3c859d91addb42badd4061  lua-zlib-1.2-0.src.rock
+sha256  65e90d13f9da12168276d5533b1989ad0d8fc806ee93152b52106a6f2c52c1ae  lua-zlib-1.3-0.src.rock
diff --git a/package/lua-zlib/lua-zlib.mk b/package/lua-zlib/lua-zlib.mk
index 23e2a8ae3..cc5807371 100644
--- a/package/lua-zlib/lua-zlib.mk
+++ b/package/lua-zlib/lua-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ZLIB_VERSION = 1.2-0
+LUA_ZLIB_VERSION = 1.3-0
 LUA_ZLIB_SUBDIR = lua-zlib
 LUA_ZLIB_LICENSE = MIT
 LUA_ZLIB_DEPENDENCIES = zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
