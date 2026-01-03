Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0853FC6165
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 01:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B94F81FFF;
	Sat,  3 Jan 2026 01:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrqMzVg8QFgj; Sat,  3 Jan 2026 01:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED3882028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767402784;
	bh=blc6L1z5uoPWvsbgr61cjZePNn6byfpXRNML4p8VJm8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=eIyAMMR/Y9QV4XeYaPau/P3jnOBnG5OUKCM4YEUfzQUFl345nukdO8N+WYQI1hUbQ
	 odXM2F+Fwe1hx6ZZysmYO0vY/5okez/yE8dh7tZrvNNDjjpGoEbIIHks4+adZAgSTA
	 DpCw1tamJ+x9is7wJObf+h1rXoDbV/13G+YmDYmVRjCFen+ymDo1GqjCHxngqmBM+F
	 z8NE0l2ODjCU0rxYQI4mPJLmCAcMhmBHfy4JACj0WX6bDnx0iPFLYtd7MRcOp9Wzqu
	 8kDCTlrsqXO26u1aSItY++/0eypKNGpZp9RsJNOq8Wvmr05NICz06iSQuZplNbTv9K
	 E4O1GNMCDP/Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED3882028;
	Sat,  3 Jan 2026 01:13:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF916440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A15A1606DE
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgGlZi60nCAp for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 01:13:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE121605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE121605F1
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE121605F1
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:13:01 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-3f4f9ea26aaso8911530fac.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 17:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767402780; x=1768007580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipL8mXpz0abKOD6iBdVFaFjXY5osP2GyWHt2nzsVa3U=;
 b=Qo3ibsinxRK0Dkq8x+BnAXSgLdi7hl75Y9tm+b57uqqfF2REmPZg339kKKovjAkxO9
 JIEgPYQjRUIDCl770zSlUmf99mNEhzC7ImcDunKqq0R20U2NF2iYDN409ohw+mU0UCIf
 le0rweXyIKJznqynXdHIFTI6wMEHzDOwMMG4a+BhCkQWWcij8Nu82FU4StQiqa4S7EEQ
 QvQr8gxt+8tozta3zeyz0P/uazQtBu9NFNM6V+GjDvDATSC1EWMpUOd8BC6V4Ayak7L3
 bywBjhRAnZ29Vp4/vZTjld0zTAwP0b3itwARsTKSqD4SETg/PcSYAi1WW/W9ILe/j5QC
 h0ig==
X-Gm-Message-State: AOJu0YwE0t7N1vGPvEMGuyOFs7b+n/xDwi3JNHpATcykhS1gSt7oaY2I
 HrkmV7fLJpviKaXtdDla2aZ4rg0dq+infEiHvk3+7L7qoXevVgoREFptIuCDsosPo84=
X-Gm-Gg: AY/fxX49KUfv1JlA034fuw0XdgwrAtJ0vUSCAZg/SVI2VF5Y3PnQtrfqn4xEl4UdKkS
 6ixBNmOgUubvNqH0Ouqa3jjeRHxh+a8taPcoiygO/3P7+YQUFIMv5/PqBYGq1uSShPvUiTWqBay
 1Gv/XxnD/CrGHE2bbYyVSneN4STpzKGcY6hPKHjkZ5XiG3VDub5cT05zLLW+hSwgH/onXSRm0A9
 n5kRWQyltC86k1pjSfZ6JA5WTXy9QT+SyTJ861tSWsEfsRx62uUOqWnpImpehhH/04LQoFnGINo
 +RCDzRm1ed6nlCOqe/7/hqbObn7dN88liIFNJJGTTMI5wtLpvU9iT9LDarqrtW084wdvbMUt06F
 nwWCp5h38+4P7YP4/J4U8tcpCPV7b1zI8G/saabxRpBSxwa6w9/7Yek0qB81EToRzR3TFwjl6Vg
 IENdicOpXO17X/3X8JrjTMzF0LYQrKSTD+EsWhlD7NeohZACR9RAEPpsK4BVzHylbtN+lfWeqj/
 wa6gjfNeRuFKXmNb/uBlfW5aoPVmWaseJlHSDrBk334+Om+qedqGxpWgq0G/bY5CQ==
X-Google-Smtp-Source: AGHT+IFcqryrV2Pljh9CQV7RzMW7MeFMlb32kAbOomhcBzRoTfCfihqBXoYd03clxgkc5lygMWo+mg==
X-Received: by 2002:a05:6871:8311:b0:3f5:4172:f with SMTP id
 586e51a60fabf-3fda5729fa2mr25291147fac.56.1767402780305; 
 Fri, 02 Jan 2026 17:13:00 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa8d366esm26384506fac.5.2026.01.02.17.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 17:12:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:12:57 -0700
Message-ID: <20260103011257.732068-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767402780; x=1768007580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ipL8mXpz0abKOD6iBdVFaFjXY5osP2GyWHt2nzsVa3U=;
 b=b1L2j1hTzyqPqqGwRITB0ksDwTwxsyID/DKKvuOTv9YomfUxRgVfxbqoGGxcOznYCQ
 4IHxThgF/zhY6T/Z/GdIH5DG1cG5Bf9VdgrH89oivunyS+9ocOQywF2n0xQv1ZXizd//
 81flIXVeoZA0NoAH7d4Y9Rj8JH0RymgizFxCEU4Sw0AQUA/81v32cl7hTdXujt4n+mAN
 N7zbEfd0VT+j/RC5D6L+u/vKRyWcWo4hBRGEZ5XBACWcCst9TSUWE3N2iCT7y/f+UHGB
 oQASL3EkFv0e9fqq9Xx+ccRZ7LENnn85bJyJyNojIdNmaPcoSyEvqEqHy7QzZ0dqNxcg
 kwTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b1L2j1hT
Subject: [Buildroot] [PATCH 1/1] package/python-engineio: bump to version
 4.13.0
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
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 764da93f83..05e222dc4f 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  3ef6c195d98209d6d0daf0fe728c98ec  python_engineio-4.11.2.tar.gz
-sha256  145bb0daceb904b4bb2d3eb2d93f7dbb7bb87a6a0c4f20a94cc8654dec977129  python_engineio-4.11.2.tar.gz
+md5  724a0e786c6eb7ba9c1a03fd58b719ec  python_engineio-4.13.0.tar.gz
+sha256  f9c51a8754d2742ba832c24b46ed425fdd3064356914edd5a1e8ffde76ab7709  python_engineio-4.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 5bc9906ec5..76ae166970 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.11.2
+PYTHON_ENGINEIO_VERSION = 4.13.0
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/52/e0/a9e0fe427ce7f1b7dbf9531fa00ffe4b557c4a7bc8e71891c115af123170
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/42/5a/349caac055e03ef9e56ed29fa304846063b1771ee54ab8132bf98b29491e
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
