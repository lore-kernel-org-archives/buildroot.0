Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4403FA3727
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 00:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 945078128C;
	Sat,  3 Jan 2026 00:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6aEv0-7Y9Is; Sat,  3 Jan 2026 00:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A36D181425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767401653;
	bh=lqQfowiyEHqn4CH3W4JSrWWD8Rn6GHDBpdVjKzozeSM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YaP07dQ/fxbQMpe7CGPKPO5kdDNKtgHkNbCWYj4O/hmrGqi7M8t3ONOcBRpfkmryI
	 ohhVyrWMirfsasGpn45YoTOVZFRVlN9rP3npCSl0n59Nvf8SeIdyYsWyh4cgKSIGgp
	 s+JH3AQJva+qLklV09e1ifM5MuJqEYG9gjTCbV73m5w3QSkxInwJKhkeu9tZANz1c6
	 sVymWkD5/5z0oP76hPFWHvbQlcY6o2L5165okOnCpWLhKzo510t+ZWc+r20v4LsGOi
	 m0BMM++YDYUq3FuNWKK/Bab/bHW/ZkBNo30oZHqVLPZGjXIpeg1D9rgnVNoPAcMY8Z
	 w6LGXIQ+wpU0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A36D181425;
	Sat,  3 Jan 2026 00:54:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA36E440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90A8B401D7
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoeLMPPEA7Cb for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 00:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7C5B40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7C5B40024
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7C5B40024
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 00:54:11 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-4511f736011so226603b6e.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 16:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767401650; x=1768006450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2UiBkp2ayPzzXvJICbKwM0c9xEnJ08QvCnJ9pth1BE=;
 b=XckiKmcA8/V+2fE9cROEQiWkdf+9setMe93mFhNqIUzBnX/TBbcq5566n+qRHzmvo9
 Qx2Pe4SnBCIu6dHE+Tb+L3HL9w/+4m78L/Xg3S8iIqD4DCNM96YLQUVaroYUaYHXxxxI
 DEw+HikiqkZ2L4rbYEqiDK3QWDHCw7FsnGbC6bVrAXSOtWg8mKzywmgSOdv1LYL7B3JB
 pFdLHzu0hk4u1c8mhgF1p46sfruN/bGlqm15G+RithDnTXtJM6Y9VWdg9LxKz3Of2Fzx
 GTzMqYXaXcYzkQNp3pZB7EkD/l919c3WZcmvvyGd4RqLoIBJRB14q37h/2NVPpGOqjI2
 bTfg==
X-Gm-Message-State: AOJu0YzQKB7gVjIq6GOSYIInOXmhwXX2juUvk2qvPScfde9iwxKowYUY
 eu75bQ5KYZ9pywga5gQJgr5XNY2bodrC+BfyYANJodNAG6Yg6d6buMcsr8x2eAG0Da8=
X-Gm-Gg: AY/fxX7xYK6t19SzfkdrlE1WNjb6gARh0UU7+aJb790GY7Qz6Mj1ZXbnkgy2uavJbwT
 zbuIg5usKRF6gXqbMZPUzm8oWwkVPIneJIzPsPnkh/frBWNKFYFvHhsmUBs6rP9FT+4cGIRiGnj
 c7nmPYqwJjrC8Rp2d3hkNToCrshTN0w+FlOP5FiTESR+rxc5MRkuSJEDXutl1YfsUnPTeaBkz4q
 wC1X6iwCJEf0/TFqiT3QP3SleSLb+9ZfVUEXL2pqM4fjxCZxfFgeo5+jHye6NvSl9Dam5MTAQ+U
 T5f28H2tD3K1DFFeagc/hmRyt1mz+MAaOLl0/d4vssmUhUh7tHGRgQjhJXJvpvFEfOidNN0nQPc
 zwa+VmTZKXSuESCQN6igYl32GttvYnS8rAVtJowjJThBdt4O5ztwYcQGdRLiTk/tUgdjLanVgxt
 CSgpOtk+5L0esOdovySwB+c6+oCJSbmrozncuauYmsj0Dg5dPNKx/jREN7Q8xC9gryzWq46DWaT
 XD2pnf671GpVekyHPMa6NRW4TjNnnI0xp2s5yln7b9FItWW931Y70I=
X-Google-Smtp-Source: AGHT+IHYwcWHqgeNhuydMk25VkGADsZVEif4SlBBEsZJj8w54zHSg3sERuQLvkyf/S6TC415fj1Raw==
X-Received: by 2002:a05:6808:2018:b0:450:bc8e:cfcd with SMTP id
 5614622812f47-45a26c6bd7cmr554831b6e.4.1767401650111; 
 Fri, 02 Jan 2026 16:54:10 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc66728296sm29237629a34.4.2026.01.02.16.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 16:54:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 17:53:42 -0700
Message-ID: <20260103005342.702516-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767401650; x=1768006450; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v2UiBkp2ayPzzXvJICbKwM0c9xEnJ08QvCnJ9pth1BE=;
 b=TkVjQH9lTeba2vLtKeovgPLcZ4+Fg8wdJ/fvMlDpelk8tkxSbKxbZZFYju4QF6+NEe
 /zHbt7YkromTW5/sqHvOQEE7VdPXE7shJMrJxjdGc/1FhAafX7MO5QHzYdlbee/+4Gg0
 0iGYWM82pSkvbEb3D6TT74LI943a+xK6v8L0/j1c20iGS2BnHpZy3GUP6xJsXs1Bq0A7
 Gyq9mfWMUZ0ykBceGTICp3HkbMmDyGBnwOa3/26D03gtVme2eNB+Iljy9M9eg68hnTBA
 JjOL35h4hVMyHTZb9olD7zwV3HXdVM/CwJu4I6/q87vqV9111a5iCPS6ONoQYuok/LQb
 uvqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TkVjQH9l
Subject: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version 0.5.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gnupg/python-gnupg.hash | 4 ++--
 package/python-gnupg/python-gnupg.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index 9f3ba63721..5b0c450a76 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  8358b54f2c76b714545f04df3f33df28  python-gnupg-0.5.4.tar.gz
-sha256  f2fdb5fb29615c77c2743e1cb3d9314353a6e87b10c37d238d91ae1c6feae086  python-gnupg-0.5.4.tar.gz
+md5  faf076013aa2e25a8424f29b49c1b75b  python_gnupg-0.5.6.tar.gz
+sha256  5743e96212d38923fc19083812dc127907e44dbd3bcf0db4d657e291d3c21eac  python_gnupg-0.5.6.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index ae5548660f..55c57cb702 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.4
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/f1/3e/ba0dc69c9f4e0aeb24d93175230ef057c151790a7516012f61014918992d
+PYTHON_GNUPG_VERSION = 0.5.6
+PYTHON_GNUPG_SOURCE = python_gnupg-$(PYTHON_GNUPG_VERSION).tar.gz
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/98/2c/6cd2c7cff4bdbb434be5429ef6b8e96ee6b50155551361f30a1bb2ea3c1d
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
