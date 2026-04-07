Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5B8EDB7C8
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 07:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2107B40A82;
	Tue,  7 Apr 2026 07:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZidoDCmnyHB; Tue,  7 Apr 2026 07:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B4A405E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775546538;
	bh=8dYA075FgxWqeGFsoCANwz0+8mggfEIJopvlkKtFovU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sQameiAsy3ZZOwdvw9mndPvB9yWZL8JBToAlR28JPbXM/9/tGqSzNK1yjat+PoHcZ
	 ZqPbvHr9r+k7bgGKjd5Vc981Yfczyb8i7O+xSYZYgBylsIdVaV+YldYS3ohWqJx1v8
	 T9qTShPvf6YoJdlsgVlnokh/ourANAmWxU7NgE9vH74LuSvZEM1hHiseTFmwf635qc
	 QhiaAtnsXQZyCxTTVZh3HPkU3q2xoG6ME+60bUdMhiK5yu2gY1QhceTa+yc09v8lib
	 dLpyonlkXalBzz2j0Cjed5zOGX6+cj/VcGPRSLFMtenQzlhrlr6p08FPyKas4A0MKO
	 X1Qc9VRQT+iHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56B4A405E9;
	Tue,  7 Apr 2026 07:22:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97C56219
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 07:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89AB6810DD
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 07:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbjrBGlYNqd3 for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 07:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C958810D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C958810D3
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C958810D3
 for <buildroot@busybox.net>; Tue,  7 Apr 2026 07:22:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488b8efed61so9834955e9.1
 for <buildroot@busybox.net>; Tue, 07 Apr 2026 00:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775546533; x=1776151333;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkAYsxH7IcZWZiL5LREaveicLegBw/HA8j552gJQ2sE=;
 b=bZUwjiWe/5ox1NI/BjSuJvjJiZEvcyqL9fbFnDJtJ6gUnNywuqeA+OpVilg7fSbjDC
 6T3o+4aTxC7TB82TOPRQaF/mY0Qz0fTUDlJb5dP/MeT0g6z54mEgcgocEK+eye8923DZ
 hcEx0XHbVkj4TCCGdFvv5XE00K/YqC+OKSu/uVqJeZMXcfurxflsTpWr3vUF7OUdHi31
 FCbWTneoh6zeVyaWP4B4ORDdBNXjqW2wmWMknaHDz1GNWDBmbPNqES+XQMcHtx21sJLY
 U2GwCY2LCcfeJZfZurjgg6n64F/lgP6VY5osm/mO466dq9smko8Bjs+zkKk2ECrCNEqg
 7eUA==
X-Gm-Message-State: AOJu0YwAHG2O4d0YwJG1e+nYsPyd9z3mzMxQlfdJmbmruFz3uz92YPuf
 MPVpHeU97WPd/YtTBTPUU2Mkyy+Aq//VT7rdrb/MXBpMrVTZ9cIahXv/deVJx8gAiWQmf8SiCIM
 tfNM=
X-Gm-Gg: AeBDieveRlXgJhZUhoCVBGD7U5VMoPjfRql176iN94iw8YH2QVl8+PdARPmIwyGV5y3
 9vPoy9Q2COcaZO4ZgdXkDvMcw/c59tsVegWmkrs/wttNqt/wEtrAa5BbtjwWJNF1gr9JMqzYihk
 Y2woBxa4cRu62ZMckPr+rLabuMH0TeVvufBC/fC/EiL28rvytiG0LiAUJl5/rrsg5w/+zwpYnrJ
 ESntU8Ji148R0+HADML810o+G2Ed8mtJ5H8gOnhfafeyEynpvL/Q5vk6FH/krRZbILF2XAjdwqF
 G0y9TFKe6voubH7XsjHgTMyHNz9RaDwJiLpvnxDLwUFyT8wpbO46NttRImoN0G8tjB6QZY0FNaA
 EvYZpM6WChPoe+UHzOVU/w273Phou8h7rZgQ/dvJwUeLRK8LISYSSRFw+oYbm0G4JY4HUkPio7I
 c8jH5RbOpOx+Pni7ZyYd1Kfcd8U/EHI1lHDveyi74PMkyjyJdKVg==
X-Received: by 2002:a05:600c:c096:b0:487:12c:e7ea with SMTP id
 5b1f17b1804b1-4889946a4demr134377325e9.5.1775546531664; 
 Tue, 07 Apr 2026 00:22:11 -0700 (PDT)
Received: from vm-2404.. (222.186.66.37.rev.sfr.net. [37.66.186.222])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a63esm704480155e9.3.2026.04.07.00.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 00:22:11 -0700 (PDT)
To: buildroot@busybox.net
Date: Tue,  7 Apr 2026 09:22:08 +0200
Message-ID: <20260407072208.8583-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1775546533; x=1776151333; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pkAYsxH7IcZWZiL5LREaveicLegBw/HA8j552gJQ2sE=;
 b=dJ9TNs8patOAZzA8INvk/+3GcZdFRvW6ZGnCvt4UZ90OkvW13xVR1LLOmMM9P8pheu
 tCFmbcYNNnKQArWb1JtZziihmCYfch/Sn6k57uAK9RRXAHWT4B43BaSKGrvgVdhxGWMk
 eM0NWoiOLBeXoYidSAupv/qTkQENoscdxd8Sme57bNfWCfttOw+Uc6BVhlzcKBA25DGK
 6vPOv3emAUoKosguOQ/VaqmriSz/1elM1Cc3sMOshXMfe1m3OpThSx+z6WdY5+OVSKTi
 w+f7a8LNTdltyPmDLnujQcO6qhOn+NGjDrOXDfDsQaIx/DqUW6NZqvaD5NiRRFt5FTFA
 8tXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=dJ9TNs8p
Subject: [Buildroot] [PATCH v2] package/quickjs: security bump to version
 2025-09-13
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

fixes this serie of CVE:
https://security-tracker.debian.org/tracker/CVE-2025-62490
https://security-tracker.debian.org/tracker/CVE-2025-62491
https://security-tracker.debian.org/tracker/CVE-2025-62492
https://security-tracker.debian.org/tracker/CVE-2025-62493
https://security-tracker.debian.org/tracker/CVE-2025-62494
https://security-tracker.debian.org/tracker/CVE-2025-62495
https://security-tracker.debian.org/tracker/CVE-2025-62496

For release notes, see:
https://bellard.org/quickjs/Changelog

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/quickjs/Config.in    | 2 +-
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index a59d46070..0ae0389b2 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_QUICKJS
 	depends on BR2_USE_MMU # fork()
 	help
 	  QuickJS is a small and embeddable Javascript engine.
-	  It supports the ES2020 specification including modules,
+	  It supports the ES2023 specification including modules,
 	  asynchronous generators, proxies and BigInt.
 
 	  https://bellard.org/quickjs/
diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 798c857a1..70dfb2d19 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2f20074c25166ef6f781f381c50d57b502cb85d470d639abccebbef7954c83bf  quickjs-2025-04-26.tar.xz
+sha256  6f1f322aea3bb3a90858db85c9fe717013fde4df7dfcafe2f57e78f5bb4b4a0c  quickjs-2025-09-13.tar.xz
 sha256  598fd7fc928e4350abce36e337ba5a1346923c5c692f5be92c3d8e29ddd7c18d  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index e2170b297..511f14245 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2025-04-26
+QUICKJS_VERSION = 2025-09-13
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
