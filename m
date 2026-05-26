Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6B7CD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 20:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 123A68202E;
	Tue, 26 May 2026 20:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJoKFvAc5mzO; Tue, 26 May 2026 20:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECF718200D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779826589;
	bh=A2VwE7sSDGQAiGNJPe7JbqpIylVbjaokUhr8VSo/X88=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hLyOjqWjndE6rG57O9DfwBaKwYvtH5vEmcyOG6M3J0jjE+tfLKhmIKalG8kVgH3aW
	 DlkLgS8SsjEOnGbJ0ONyTtkSAsUPkHJmeV2wNs0jhia2E6i2v4bLoz3PyspVss2pun
	 Yd/B+PgsTDssVUtvP2f1WFteWX4UDI8/ib62VPqZ9k1bfIX+mswXGXQrsHiuxfvZ5y
	 2HbJFo6tDjPTCN+tRw4cOFl6AnXdoHBdsijUNSA9NGNGcOnX7kgWrZLapjAFzHLv20
	 ZpgU5X0C1Z75QydjTEaCmIGev34fQH5R3jMy2F10tZo01pd+WHmCSTf4Xo2aqdciTy
	 72MehDQoI2jLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECF718200D;
	Tue, 26 May 2026 20:16:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3DB1297
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A54328200D
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnuKpViD5u22 for <buildroot@buildroot.org>;
 Tue, 26 May 2026 20:16:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B746A81F41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B746A81F41
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B746A81F41
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:16:26 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-4855e69a4c0so3410555b6e.1
 for <buildroot@buildroot.org>; Tue, 26 May 2026 13:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779826585; x=1780431385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAHvyfegOz/PxyjtXwl/pdnx/h8hbEFjyPa8zuzclk0=;
 b=o2iMaxi3TGYN4dTPE99iLlHkgxWeZABC1y+np0AaH5jtjC5uVJRJrgp6mvbfjOSRO0
 1/pm/7oM21wI4O5g4aoy1dBN/ON4AWfnf5jL1OD8VdOx0Fdj9p7HsVbXO/wy2OCVrp3a
 h6tLAbRhWSLcbW0mjBGm3yv6BWvhV+bDHfUwoH+JCsW1bdLEoZNfWNzrXov5g1K9wPwg
 WwYFLdIMIxPPSoipXPZ5YMfnXf2AMDpOjjJCd2uzzyANcsDUlzeymyg3R00pfqVCGagP
 dTb2Xh4Srb2sfCig6AhmTA4sj8FmnuORfLLDx7JbcBpvFYzcNvub6Xq3b4/6E+Sniuku
 eUZw==
X-Gm-Message-State: AOJu0YyeOeaE71jdova8SEIVb/0rZJi1K887+++eYS4iXReSkVATWblz
 DRpYcGRPs5oOrx5mfclQHrTRKfIp1FOBA2sV/Pvdjs9PCuyarWlE4fgNAwY2vw==
X-Gm-Gg: Acq92OFniax3IU5ppgqkm3T7jHAR1SDVNJiKrC8WserBTjCZOywoRBp8sV4zM7VlW30
 cksWNTxenZ/G+WveA5JTXmdp/eOJgkLxyphPkc/dY5dL2q4mZRubac2Kjhukh/IDvKLIquBEu7c
 I9/uaUrojDVVSnFrbJSP7rjpdBEjG0I7PvEoUAzQEFxyR2JR+CZbVtxIoTxBHYKlR+8/3ExNb4G
 vJCjjyQz6xeL4lQgck4V/Qw2R2mvQPA4v1becz/O8xkUT/hphpF2ELq2r+m5oKuwukbBnA8EfWx
 Wp7xsLYrYDJgXnBkRlKEPRryBMjujofY6uKJX2uKmj2EBOozEt0ebxEHi6lEG5mgvWo5mFVd7Bw
 Q502V3zZEV7JagI4rbXV8Apd5Wal6TurGTdf5qrDWeqeuHbGeaOsGAbs/F1UbW1WCe2iV09LDMe
 p3MwKEBPdaoClNqXiCWqfHFkWIujBcv9diV7Jsuy0sYTnI0gkHHlelZ8KnLWJ+OGEpgpjb71nvm
 SNMPL/PmmATQruqE6+keHZ44MpTJtxy8CsKYnbQn1lYY074xDRVFIHjiRMTAnM163ZXew==
X-Received: by 2002:a05:6808:144a:b0:485:4601:9c7c with SMTP id
 5614622812f47-4854a2ba33fmr11620638b6e.40.1779826585431; 
 Tue, 26 May 2026 13:16:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-131-78.hlrn.qwest.net.
 [184.96.131.78]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-48554538d1bsm6402983b6e.8.2026.05.26.13.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 13:16:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 14:16:22 -0600
Message-ID: <20260526201622.375239-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779826585; x=1780431385; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UAHvyfegOz/PxyjtXwl/pdnx/h8hbEFjyPa8zuzclk0=;
 b=WV4mH9moAL5gF7dnog4vGZWAMQw/XXl0afp1KSUViNhDQTFMn0xlTaB1/FTfmWxoDJ
 wuvVr8Ag7B8Om1+qT9P6/g4F1DkGCiQn5JiOjV+deCL9fCU4DJnq2pMmqZd7r4VS9TgO
 i4twMu9oBxpyNUasLEOteEHeLsId4ThlYmATF5EjnbdMcZ5KQ6xyEYg49XVxsq9686rh
 xoFTJTWqEtqxeW2oL2Q8P3CTKfhuo3RNMj/J+OGXX3JkJkxOZd5U9kN1Ky5yy3APBYPd
 UTJ3rNIGF7uCBtIPRuBmIL9UK4hSD07+p7elqlCbKEPsmklCdDj8N9aCLpVQJz6f/sEk
 mhng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WV4mH9mo
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.136.3
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

Add new python-typing-inspection runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/Config.in           | 1 +
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index 0dd4499a3f..01163c60f5 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_FASTAPI
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_INSPECTION # runtime
 	help
 	  FastAPI framework, high performance, easy to learn, fast to
 	  code, ready for production.
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 35988ef77c..3882212eed 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  ce568586b56db35b344df5c23d130ada  fastapi-0.136.1.tar.gz
-sha256  7af665ad7acfa0a3baf8983d393b6b471b9da10ede59c60045f49fbc89a0fa7f  fastapi-0.136.1.tar.gz
+md5  5e22f728ab9ea5c99a29a0137b4b8b55  fastapi-0.136.3.tar.gz
+sha256  e487fae93ad408e6f47641ee4dfe389864fd7bec92e547ea8498fc13f43e83ab  fastapi-0.136.3.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index d99a55c754..60e0a83369 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.136.1
+PYTHON_FASTAPI_VERSION = 0.136.3
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/5d/45/c130091c2dfa061bbfe3150f2a5091ef1adf149f2a8d2ae769ecaf6e99a2
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/81/2d/ff8d91d7b564d464629a0fd50a4489c97fcb836ac230bf3a7269232a9b1f
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
