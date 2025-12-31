Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B482EE644A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 23:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B4F608E0;
	Wed, 31 Dec 2025 23:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZoCDXYY5qj3; Wed, 31 Dec 2025 23:14:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F116089B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767222852;
	bh=fzHq5rRgofy67mHMh9MPXZAiIPfIb8vdmq0vDMoQ2Do=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bgnjuOZHF/1TL4fOL3Zq++SRdYNkP5ZmrQU6xhBcVulJJeJOLEOxBriQQP5Zb33Kz
	 E3sVoXMQQqKVOI7irL/bfgwiGCa9D6PRcoKEXGHtM9pCtHbfBiKUaBnfMRLpUo1E3H
	 PT35ReZG54qB4olwqNJ7Pauxk43gkTwWGbvNmN2hnZrbQSQi6BUFGaHBRRa/eYgCRD
	 z49nZ0W8Vkgj7W0GNKxdsWniAnBh0NLvByDWKtbLQ2JfSlvvdFwTU5aGdkj6OwMs28
	 aCGGDrmBssA75q6sImRNddaWFaLF1ph0o5dPVQEboE6fhnAktPUhGQVaJu4ihvvPkh
	 4+AF4fMcVdReA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2F116089B;
	Wed, 31 Dec 2025 23:14:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB916150
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEED840501
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lL7OclIQE7rz for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 23:14:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6239840668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6239840668
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6239840668
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:14:09 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7c52fa75cd3so12712984a34.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 15:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767222848; x=1767827648;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJsfunqop2ZD0KHGQz50DI5TvyxZO0lrV1m3Jr2bTrA=;
 b=GrFbQ8m1iQACaqh0NLSIKsR0c4xtHO9x1s1L8MWk9A+rK5Yx/44rdB/FWEPH0URlG1
 bKoo6GBP/R8ldPHtGs8+UJ5bXNuprB53YZiKOmDDDdklXAbpma4Pky64/wOpWCIaONZe
 rTVykEgDHmcZ4Ecnz9R46vbOQqB050qC8ANQLpIl9R3NDAbcanMJiSGh4PTbU7wG+aVZ
 yxpDwhaW3NKqQn9DIhghEw6dBy7qmb5T629lsoXb/3OICPGDFatZZue5/GmRKD7YX2h1
 EMvwdtXjU06BUCkRWbz23G2t871l3MBpMlPsLEMU7qw9/UhUfNBF/7BRqVqS0kZtUzc+
 f9HA==
X-Gm-Message-State: AOJu0YxLdbRO1TmXytTfA2IYL7xwqga2m88weQWcXoCEuOhyY7nVPNBS
 3uvo91L5dTys4D65v9c4p7K9HS+ajU3ILPDboRX2YogYNsFn7PhMdoyjo6yoLfgcey0=
X-Gm-Gg: AY/fxX7isnt4P4gD/3qtAug+1Ar2VNNxEa/t1MvExuYyKSM2DP5gz8Lk4PXUkhwygzb
 7Ov4xZsAIzWmB2m7jZCIJ7cFUOw4IzRN9nYK7FT0/bzb+aFcD+CE0riJYQeGhT+be0ZgMgoz+Lh
 N6MqMB6dWWZezL8nlBLWM2ZUhAcRFtq8nq4T+INX/bbhAK/DCOQWy9jh40HuzXyfhtyGesVKZoV
 tSYUQ0F65v7lDk3ebu14rn/zObzsZz56b1C8b1zGlxmy0Le6T2jOZ14Cxz8JzgAD++UiH9ikiXn
 oHewqGiGWYa/pRNplkH9V2HXn8DBvJ0xFdkLiPxthf+1pv+g0KThQChZ5KQ0qtg2/PpeYKmwwog
 hu86pozIcy/R2/fJ+wA2HR5Y6eUXzbjwjyDcVuDEtT8QetSM4Q1IR1G3FhCF64OMsveBodICrj8
 sRGsTigZZMXhGxN2rV0IlJLQB++938IzaLhuloY3a+6nc1McAkk7MVg8cMBKbn8BAcRHVHv7ldl
 nX5dDmjlnbq9qyxZvXSnkkrhOBnYpAacQwImHRNB4Sfd0QPC7wOQVYv+AmQmIUN7Q==
X-Google-Smtp-Source: AGHT+IH4PYKzFeOK/gvIqlJOduOEP8uzVsBI3um4sQ78Y7wJJVQlD94hw9FA/n/OkFWUEfJ7EAtyHw==
X-Received: by 2002:a05:6830:410b:b0:7c7:526:b1fd with SMTP id
 46e09a7af769-7cc668ba26bmr25067082a34.11.1767222848106; 
 Wed, 31 Dec 2025 15:14:08 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667f9468sm24875793a34.28.2025.12.31.15.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 15:14:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 16:14:04 -0700
Message-ID: <20251231231404.737855-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767222848; x=1767827648; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PJsfunqop2ZD0KHGQz50DI5TvyxZO0lrV1m3Jr2bTrA=;
 b=JeKz3/mHN0szmjdgcy/zq/dV9ITxHzoZDhYfmyv0rgnplsHR6FGT2lY8avZB89bwef
 qoeDRkF01PKq6BU/O2tMJNZVawS+HDszOcFgpgza/Liqbzh7xl0upbTshcgBKpee+cSB
 AkLSnhzoiogdaeFdY8cRKVvjb7UWvEEfW3og/SCgrogTtTHBD3or3P+0+rCfS7GOlj3s
 qzgwoRfIDraArgtmlD4dS9ErwP56o07nIcU+tR+vQqAbMlNxRGGGhebCxE1AbEkICBVZ
 dRhje90U2Csnt+PKghV/j40JiOJ9TPqxyGqHGzMveElIQzWXKZgNclMS8122PrfhNkJs
 2q4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JeKz3/mH
Subject: [Buildroot] [PATCH 1/1] package/python-proto-plus: bump to version
 1.27.0
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
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index b55ac8bca0..d5d4270293 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  631b92558563874de67630333450e08f  proto_plus-1.26.1.tar.gz
-sha256  21a515a4c4c0088a773899e23c7bbade3d18f9c66c73edd4c7ee3816bc96a012  proto_plus-1.26.1.tar.gz
+md5  008448fc31ca36c2a9185a070126e16d  proto_plus-1.27.0.tar.gz
+sha256  873af56dd0d7e91836aee871e5799e1c6f1bda86ac9a983e0bb9f0c266a568c4  proto_plus-1.27.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index b024e9952f..3d02dd321f 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.26.1
+PYTHON_PROTO_PLUS_VERSION = 1.27.0
 PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/f4/ac/87285f15f7cce6d4a008f33f1757fb5a13611ea8914eb58c3d0d26243468
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/01/89/9cbe2f4bba860e149108b683bc2efec21f14d5f7ed6e25562ad86acbc373
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
