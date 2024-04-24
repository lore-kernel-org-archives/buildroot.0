Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A496C10F15
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 08:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21995407AB;
	Wed, 24 Apr 2024 08:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNWcaSVrdEVf; Wed, 24 Apr 2024 08:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05078407AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05078407AE;
	Wed, 24 Apr 2024 08:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74C141BF47D
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 08:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61D3281F12
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 08:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHVgDEH5x7is for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 08:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E422B81F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E422B81F34
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E422B81F34
 for <buildroot@busybox.net>; Wed, 24 Apr 2024 08:31:56 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a52582ecde4so605383866b.0
 for <buildroot@busybox.net>; Wed, 24 Apr 2024 01:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713947515; x=1714552315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6vSSnngsrPOIWSCJQpTFXSxSFS8UX/U4dKgJ7X6buIQ=;
 b=HqPlD0CUecReJNq8+lk/NQ6fcsZChk8jLaLN6Qo4r/OPqeSbteHmVyzdtFLKH674pB
 wwKig1K0CWLzS40nX7jh63bQu6192TWuGs5EezBPq0d2ky+gSAIaavOiJhpkPrpQ9ShW
 GplO+hW34FL1lvCSi6HrbtaSsUfrAecq++Xy4tUgLn9Ln88d0j7jDqAED+flI5x8AacO
 8Kq33SreV/B7mmEepOKPBscoj/W+Rpqw9TXr1GUCDXGxrQnRqZ7nJb1wQnd8gmn+UPtR
 vHHhtShZ/ONFZuoPLFoDrsaSGbHgIPjS9/OHKc4yTWQOBhsh45CMc45BFmjU17ftsL2p
 bmbQ==
X-Gm-Message-State: AOJu0YzgAlZaOfLNv6kz7cNYIkbwwIkPHq47wNOJmlJzguDjc33lAzll
 C8wzWo82i7ws5eSnlwbRVvUhxmrjqPgXla0sJzR/EwarPTceF3kFuH9zqxE6rjoagX6PAyxDUZt
 K9Q==
X-Google-Smtp-Source: AGHT+IG5LGoniQ59du31+yZk70744VZjKvEBcs7NW7dVE37a1e927gJZZdYxO1N3B5PyHrLEtqg6gA==
X-Received: by 2002:a17:906:b811:b0:a58:96fc:bb53 with SMTP id
 dv17-20020a170906b81100b00a5896fcbb53mr412608ejb.20.1713947514748; 
 Wed, 24 Apr 2024 01:31:54 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 lk11-20020a170906cb0b00b00a55b6e7e16fsm3434617ejb.0.2024.04.24.01.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 01:31:54 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Apr 2024 10:31:21 +0200
Message-Id: <20240424083121.2818-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240424083121.2818-1-francois.perrad@gadz.org>
References: <20240424083121.2818-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1713947515; x=1714552315; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vSSnngsrPOIWSCJQpTFXSxSFS8UX/U4dKgJ7X6buIQ=;
 b=NLRGN6CLo6Y1gUeOnbHHWodEZsmEpCtE5qYkEwTIYkVmPvq8RKylCgkkyGP6a5zNZ0
 b9/p38jUP8sPl0oWfuCwAvVXgwZG1LGB7F+eMQ2jvcOvhb19FK57kKf0ufj+8ww/HP5T
 LEBJBblrAEEsQMdE4Qt6gRPALLjKtHcA+IG5nUm7aSdApFqa9UiPSrqyqM0eFRJkqfQ2
 CrMN+QK3bPoX8gFzsJSRbWoiwrQVtUq9JgxErVfUsJDPETe5MwB+aqqxFc3LmaXx9WNo
 fS3JDpwFfwxf96KwCM+N09EtbNmj58/J4DAmSazqn/oZmbI9bk4gFy/1n41A+rewyNsU
 ZIWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=NLRGN6CL
Subject: [Buildroot] [PATCH 4/4] package/lua-dkjson: bump to version 2.7
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-dkjson/lua-dkjson.hash | 4 ++--
 package/lua-dkjson/lua-dkjson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-dkjson/lua-dkjson.hash b/package/lua-dkjson/lua-dkjson.hash
index 8f1a6f6a2..2f210e497 100644
--- a/package/lua-dkjson/lua-dkjson.hash
+++ b/package/lua-dkjson/lua-dkjson.hash
@@ -1,5 +1,5 @@
 # computed by luarocks/buildroot
-sha256  e4ba15f2a85f84ffc7f628157a4ad16b2b04ba05eb44a2e5956fa46bd104125e  dkjson-2.6-1.src.rock
+sha256  f6101a0e77ca857ec20799f6b998a600b04c8dd09b27c445ea09f29695bfffb0  dkjson-2.7-1.src.rock
 
 # locally computed
-sha256  7fd6585e9776c1cf2930e8ce660b3116c8a9b4b676929d45078870a42f16aa65  dkjson-2.6/readme.txt
+sha256  9d46e06db7feb8fd68f73bd024c8a2c04807629e16f396880860d151b60a3ed1  dkjson-2.7/readme.txt
diff --git a/package/lua-dkjson/lua-dkjson.mk b/package/lua-dkjson/lua-dkjson.mk
index 718c47f50..2b110f8f1 100644
--- a/package/lua-dkjson/lua-dkjson.mk
+++ b/package/lua-dkjson/lua-dkjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DKJSON_VERSION = 2.6-1
+LUA_DKJSON_VERSION = 2.7-1
 LUA_DKJSON_NAME_UPSTREAM = dkjson
 LUA_DKJSON_LICENSE = MIT
 LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.txt
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
