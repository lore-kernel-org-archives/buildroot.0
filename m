Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFC7CD042A
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 02:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66A37810C8;
	Tue,  6 Jan 2026 02:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNk9NmAy43QJ; Tue,  6 Jan 2026 02:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 853F681495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767666644;
	bh=WhoYv8farjrUoQra8vQpmz5EH6meutI6kafDWh/+DSc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GlcQb66OChTl8rxDnqu2olmD9PhyzOrmBBFaPglGhHSf+eE5RNkff4qcgK0ShXggF
	 2xj6pytwObsHHnSiLngMCkIxqRVuZddLok4wp7nL1hrAjv6iqPvEqD2maqK4jsk7yK
	 fY1fLleu7+4VZRwRcapIS68gYHLtxw7pXtzDZIQkGxiuB83Kb7LDri/7D568pzaXi5
	 z09mkQYoMuZvy4jxznUwoj2xQQy+8gUQ8/0Kl36z66RbCo2iF1x1i2hpo2Ca2z9Mry
	 94e1jIA8n4oECnoJ3grXRwWcaLChioOgYFGOdmuiXFWkvdnsLmUUgm/mmJ/CbAq+Rg
	 rvl0tcIPQkhyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 853F681495;
	Tue,  6 Jan 2026 02:30:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D5DB249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 02:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB6B481495
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 02:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeYNHWiYQev7 for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 02:30:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C7CC81471
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C7CC81471
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C7CC81471
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 02:30:42 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-3ec41466a30so460348fac.0
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 18:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767666642; x=1768271442;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89D+EQILcwiP+O5VZS38ckxirIFxuNyCnBvEqzMUMh4=;
 b=VbXQVhTRDZUYpLr3eiit/YdLWR2D8PzeuAiP/C1yTXgno9wtRRFzJNi9Sn8H427jqx
 Sir7nXv8K1V6Q0maXIicwW4t7fcd8gac4Odj6CYsOJjo9uarF8isMczYJUdZIWkJJsLS
 MZNsjsU/H7RyvpX7ktKTuRP5LYuF9M4Bad7FIbwWdpUSBB5RzSmnTJJBoogm0ivsg2NX
 bcPOyGOQxcU9WqkaHXd9GEDtBfEWyb+NPQ+mCktQoTnf0bK4+Tg0CM0rrPZa8sj3aZKq
 x/GkgerA8MaD2yDZrYDvjtF4INAbg4MC7WhhxHTbcAQ7P7Z32pzdalNCY/7xEwEojfSK
 KSJg==
X-Gm-Message-State: AOJu0YxEqCfwEc50qfzWg03oN0gaLzwPkSdtcQuoLhWmuyqMZntsRMa/
 tWI8JeVN6dfWNM0Nlb4HatWz689M38+xx+9KXbkYPnpBfoIRXhGaGiKBOtBGkgSx
X-Gm-Gg: AY/fxX4dDSwszDlPbmdz1usQ+MgvQZQuWJNUX/86w/D/HzfVxiH/wtZrcsoeIuum4tU
 A1jD2remrF4eBYlY3nm8h7abZfntw9n5y98eH8a7srtX8qhkHFqu+Ca4VmLJzqJOSXLq3yRYrNa
 H+xwnA1FRYUDi38AnA3vbZtSPz8keDkGQTESd8ng7oznDZ37zw3GT8xKSAuRfWRph44b51NEfIn
 9Mce3cUzchSTA+BMXlar1nVKN98cJEIsUkbJwp/J9qhNLc6qaN1V/e85+FvyE/UWfD6ZHwO4rly
 v1giotMafu9FhJ5aLYPOYm4e5eF/6Rlz5D9+rixGfa8AfxJbOZG/Ltx06XQ7htpOFHcTrHUH3u1
 bChcEnCH9Nw5bc9heNR50o9oboE/iOOK2jQ7gOCAC/xBd/LVQ/UYCfcHGWjV+b42QPgYf7nYlzt
 GXixvQUbMfq6NvcF7t9KJaszOdcCYqkh11B00CY8gBAlLu7iJFapessH/yivEX2vVStlghv3qcs
 wb/jkcKaphKVKVFn5Yobr8BMLNNHZ+0eMn2M1jiYvNh+jfriO1IQCu3cEx2
X-Google-Smtp-Source: AGHT+IEk8Mz3L2YViKEag8BQQG1QQIP8PSouoBS7Vm7x7FYUIid5+l7pa3xHcfNN7AhZp5/EjuYNEw==
X-Received: by 2002:a05:6870:8274:b0:314:d62b:3f84 with SMTP id
 586e51a60fabf-3ffa24c1487mr816335fac.17.1767666641681; 
 Mon, 05 Jan 2026 18:30:41 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (97-118-158-110.hlrn.qwest.net.
 [97.118.158.110]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3ffa5072427sm495483fac.12.2026.01.05.18.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 18:30:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 19:30:38 -0700
Message-ID: <20260106023038.2231960-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767666642; x=1768271442; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=89D+EQILcwiP+O5VZS38ckxirIFxuNyCnBvEqzMUMh4=;
 b=JlmhtNJioTTtOsTBgxTV4r0CcXGZJ4v2KUP69ZsE7pHfvXnOvDfFzbRRZRR7BNYoKG
 Zj6DEVNF5qEcKoj/xtU9jgr2LdCtvSDqM76adMhSxqdLKkwFVJzFMdbWEWyKgyy2xYag
 m98JTfDx4/aIRfgf1nn1wU0BVuiQmPOVCTVWdlq5R/WzcKHkGUS3miq2pzQWA8pz0I6J
 aDU9dYp2Giy3AjTVbqNJ1AxdUp/HrX6AXw6wBS6+Zw3xHl7fYVTWi4EHbiTNa4fPt0vK
 bm2ZRBDirrz54aG0lf2llKQl1aUhoec4f1z5KwIhDExPi+Pa9MrFgIyMrX8Q2gTQaa3b
 h9+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JlmhtNJi
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.13.3
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index abc6191470..a4f76ffca5 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  336f47ec48aff07052a7f1dcf38dfbac  aiohttp-3.13.2.tar.gz
-sha256  40176a52c186aefef6eb3cad2cdd30cd06e3afbe88fe8ab2af9c0b90f228daca  aiohttp-3.13.2.tar.gz
+md5  83aff9f11bb25dbffffc2415fd34dfa3  aiohttp-3.13.3.tar.gz
+sha256  a949eee43d3782f2daae4f4a2819b2cb9b0c5d3b7f7a927067cc84dafdbb9f88  aiohttp-3.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index e7021cbf45..173a2f2453 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.13.2
+PYTHON_AIOHTTP_VERSION = 3.13.3
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/1c/ce/3b83ebba6b3207a7135e5fcaba49706f8a4b6008153b4e30540c982fae26
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/50/42/32cf8e7704ceb4481406eb87161349abb46a57fee3f008ba9cb610968646
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
