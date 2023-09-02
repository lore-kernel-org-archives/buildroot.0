Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2523C83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 10:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E0D660E73;
	Sat,  2 Sep 2023 10:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E0D660E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Toxh5NwfoU_t; Sat,  2 Sep 2023 10:45:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B89460C16;
	Sat,  2 Sep 2023 10:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B89460C16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5DA61BF40A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA7B9833AF
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA7B9833AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAR5ac5uUb4t for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 10:45:09 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 768F183417
 for <buildroot@busybox.net>; Sat,  2 Sep 2023 10:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 768F183417
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-401187f8071so4462245e9.0
 for <buildroot@busybox.net>; Sat, 02 Sep 2023 03:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693651507; x=1694256307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q02bRhn0pNJIDiJTHs8XWbD1NIlsM954sFoWUfCJGp4=;
 b=T0RaFqKuwpPFkDOtAupC4yYq+SlI2veYI8sUqxz7XsoUO2sTKX/NCVhM7Br9pT2W+Y
 N23PY2Eo56UbkHDlYn2GHT7jxb7wgZSytvY2pWlbu9EQayJQ7/grGRAhzEUrkiycvCev
 r2qUFLWr26RZwrc5wicBEnslqMpCq8M4ljbs0XXLkZhXI3Get3q7cFPJ9ciLlHbbHErP
 WET8gUZLhkp9J4VvCDA0Ai4Fys4g3tsqgQE/T8XLyasipWywjMZwFzmtQApy3eZUUeF1
 xidTSyditNd1EXUj8t1yhGvzLJupxzjBB/x/HUpuKfVA6SkdO2/+8A6KmPnShadHFjCC
 fGAw==
X-Gm-Message-State: AOJu0YyLys6ITFxMVsglUVZtDcLwO/b8Oubhogp/GnbqUZwBDJtYFUlM
 qCZN3D5YJ3hKF+VbAZPAYZOz8tWemZw=
X-Google-Smtp-Source: AGHT+IEcwLf1R+22KTCh4+yM5NEZenOH7w0ICvs1Pr7VWi1LnRfN8o8HvuhH1ihFHaBM3m9YuNcwIQ==
X-Received: by 2002:a05:600c:ac3:b0:3fe:1fd9:bedf with SMTP id
 c3-20020a05600c0ac300b003fe1fd9bedfmr4080677wmr.11.1693651507331; 
 Sat, 02 Sep 2023 03:45:07 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003fe1630a8f0sm10605973wmg.24.2023.09.02.03.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Sep 2023 03:45:07 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  2 Sep 2023 12:45:00 +0200
Message-Id: <20230902104500.1118348-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230902104500.1118348-1-francois.perrad@gadz.org>
References: <20230902104500.1118348-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693651507; x=1694256307; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q02bRhn0pNJIDiJTHs8XWbD1NIlsM954sFoWUfCJGp4=;
 b=sk6JW+pHDYkXOmv5P9BI+3HsI7mU4EkQRQ73uWnues/YBC9LsW/FXqx5KDvbyF6fWY
 knc915l8dY2fHVJCFzkuTi1asAQ6eHW8kUWlh+cGviJbUWp2mIHW5EFYymee0y1pjgL6
 nyAm841BJl2/nM7M/Sj7xp1ts2WrPhWE63JIAbPNQvYXmJyzRH+LZCHReOVuYQDHSeWA
 wUwpoBg5x74tiEh4avc5lMT6rbzVqdXeK1Etm/89UmHsP3bpj1PBlCkqeJ3Cy2+uUaFN
 CalrBuo22x6ndl8YEg3102QdaqtgISjWgqKDYcWQEoOe++aRuRbrhp3Ij4i4FRwec7sd
 uh4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sk6JW+pH
Subject: [Buildroot] [PATCH 2/2] package/luasec: bump to version 1.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

diff LICENSE:
-LuaSec 1.2.0 license
-Copyright (C) 2006-2022 Bruno Silvestre, UFG
+LuaSec 1.3.2 license
+Copyright (C) 2006-2023 Bruno Silvestre, UFG

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasec/luasec.hash | 4 ++--
 package/luasec/luasec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 3c2b7d803..0fb9996d3 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  82d9ea7d11688a2b11fc1c4549a2e7b0aca00790b49e67a41dac0c81f2890f1c  luasec-1.2.0-1.src.rock
-sha256  bbf73e23eae7df57a4c4ff33bc23c41a2dc4f8707ba33235c2026d20b41405a7  luasec/LICENSE
+sha256  f93bf9927bd34a5d4f897f4488b285a12bee89c0e7d54b3b36dfcbf43a7ad4e5  luasec-1.3.2-1.src.rock
+sha256  a3eab8badfcce959ae0c50be4ce460b547785dba61e6dcc6a1dbb8f800a18563  luasec/LICENSE
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index c7f3a94d9..6e338a7be 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 1.2.0-1
+LUASEC_VERSION = 1.3.2-1
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
