Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9D9EE6441
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 21:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAFCB80E61;
	Wed, 31 Dec 2025 21:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6ynyacU3k4s; Wed, 31 Dec 2025 21:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14EFF80E2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767218177;
	bh=cVusdxhhNKz1d5TmNoQ/wICggVyo9VVePLipQYC12a4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EuSQMMzBBuOLgR8ZvBZDwvHlkFKM7p9uikEG6zSJORAKzhpbBAWhJzaN9TvwWxFb9
	 3c5sS70TGVAm91a2Ay3eujUXI/JI1poOr5Flu54ThUpv0qHnglDJQI3l0SFe74QQsZ
	 GQaJd/7MxjM42OKpkDZsYq4m/wAaBdsuf140PaTTWfVFGIWUpQyG+zN+nyYqzmmInh
	 HPsoWMQ7AkaCNJiSnWjc1FKUcQ9jtPl4/T2/r+tACt5CgZZlH5cQwgrx608TkTkw4P
	 JOU2K4gKDGHumXN12rEg3FliwwL9PgWwYrml130HEVoeacr7j9oilTrDsdGxyynwNg
	 Q31QSuvAEFqMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14EFF80E2C;
	Wed, 31 Dec 2025 21:56:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 516EA249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4269160618
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3pjMXTuKZKuS for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 21:56:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A3A560612
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A3A560612
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A3A560612
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:56:15 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-3f5aaa0c8d7so7962115fac.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 13:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767218174; x=1767822974;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3E5lAkVpZuMlBoOpnm9jvZ3yTqq5NxVDNDdiDkjQ7Xg=;
 b=i17tPMyee4IOz8A9CP6YQOauppAYsRGA5dDfL8QEufjVHeevwJK+vJXRf6rAY2WEKa
 04OzbUL5WTqt9gLD09Ks5eunL7exykilYQsZ2Mhm3pBaLkPPtzYG1Ed+ApbSB4fqQ4q0
 am2goWWUhMdD6h06K+zZXIXmfzgWbhT66Ly2dgJgamGGtMrbBn9I7sgJMhwQ73O/kb1u
 OhcvTDx2vPckeqXpJ6jl9CRmaazXxeCtWcOyLxoIUFEyJTnL6hTFaWs+FqSynZFavYLw
 nUTAccjIMNE8q2OU41ChJBxjcMLDCwFsSxldKR9SZfUaup+ke7ZpbAdf9IEznbNxIPtH
 5hqw==
X-Gm-Message-State: AOJu0Yyyitd1+2nr75XoHt3typpZ+QR4T0+igp/ZE5h7r4of4iNcYWcn
 /KsijkxP8OQhw8pxCd/7XUiq0Pr0t5ZY6OzRIKaELZbmW3a5Z40WbgLfNOxh7YUr0u4=
X-Gm-Gg: AY/fxX4hUxh1+qxmk3EgFd0EbXZ3cxm30XXhzwJTqKLOxNSkuDWROOFlfx3zAb51D9f
 cau1bFZwT601zDrHYRit9Klrbg12zkelGO2WNnSTb28TB/lt2IYPADdtDWF4CA5HwlagERuOdQy
 5llWfIJOMk41SKFUWXfoY2ljAS+LytTFAISPDNZymAVaMUBmhbprFbmjvKq6tH1Q64JFiR9UpVK
 uZgwmiTD4I8lKailbwiyOlDY5sxoV/EX1fevsT2+rCXwTK49M+VYeCTSKtCkNfR24o+qTWJZCEp
 CIVwb4LTqrWMD8/+TEQ1qlfKUAydBK0TYP9bIQMmexk+6OBsv2W6Mk0ul5V48H8j91rlOHJIIAd
 fE52B4zEhynOOo90z/PI9s/Ws1FrupQP/FRSKcp10FX1xFkPfFJ88ihL5dErmitnHeSCxiOXPUJ
 CsZjTo+UVEpO+Ud5EO53/tbBw3i0s1HwPVMeG1jwsRSJyd9CKUCnrNo0nnE1UtTuNZIExI3DwG2
 Rl6nf79t9aU4OJa8yMatD6GiUYjecRRFIZyz1iRtnVO5hTL5nSiluQNXBAknUS8+g==
X-Google-Smtp-Source: AGHT+IEH4kakxLXFNB/c+1f8cdnfFu6/hZ0V7WLnt/HCLMH51NQyL6IChToAD1rw+Bw7neI0veOQTQ==
X-Received: by 2002:a05:6870:8452:b0:3f9:ff05:438 with SMTP id
 586e51a60fabf-3fda56c99ccmr16367672fac.24.1767218173833; 
 Wed, 31 Dec 2025 13:56:13 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaab5d61bsm23476154fac.12.2025.12.31.13.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 13:56:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 14:56:11 -0700
Message-ID: <20251231215611.217812-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767218174; x=1767822974; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3E5lAkVpZuMlBoOpnm9jvZ3yTqq5NxVDNDdiDkjQ7Xg=;
 b=l3kXiAyMflINihgvRKDe/UVFjp8uxyZBjl5FOx8Jpjcc2bgrIFdKF3Jjzoge2QfPfs
 A7KCiiAZAoXIgwsZk7P7AeKV1I6U/qmHb+zzrFABvbPaoRyL+AtQYvlyOF0TrEvu8Gaf
 9fkhEJ/h/uKK3sre/OR3sr9pWhkjr8wYpC8kwZo5s1z2LRl4bxAlZ0Hmg8dsZN+AHKir
 s6ztOzBHQX5ZuHEcw965OaaK4IO9gLeIQyMCcsHujO+NFanRmWJZ5BpflyhOigqLBEIw
 ww+j5JvilhZf2+HQ+ELqZWj5pqWwTImrdDXp+X/lf1D2Ce8at/nCBTnIrpimG32sqWUT
 9XOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l3kXiAyM
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to version
 3.3.1
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

License hash changed due to line with date being added:
https://github.com/pyparsing/pyparsing/commit/9223660f41e8fffa1c2668e8564d443085396f66

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.hash | 6 +++---
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index d3323e173c..b5cfebef68 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  49f6a72433130541fd92c56b110061d2  pyparsing-3.2.5.tar.gz
-sha256  2df8d5b7b2802ef88e8d016a2eb9c7aeaa923529cd251ed0fe4608275d4105b6  pyparsing-3.2.5.tar.gz
+md5  2b7937d58eb818a33687e3ddef860638  pyparsing-3.3.1.tar.gz
+sha256  47fad0f17ac1e2cad3de3b458570fbc9b03560aa029ed5e16ee5554da9a2251c  pyparsing-3.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
+sha256  a5425f9dc14ac74d4c5f0b679e941f2442e32cca7452a4418d5b1a49893ebe4e  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 5d478a18c2..743e361b59 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.2.5
+PYTHON_PYPARSING_VERSION = 3.3.1
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/f2/a5/181488fc2b9d093e3972d2a472855aae8a03f000592dbfce716a512b3359
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/33/c1/1d9de9aeaa1b89b0186e5fe23294ff6517fce1bc69149185577cd31016b2
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
