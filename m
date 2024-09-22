Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB811CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 08:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4F040223;
	Sun, 22 Sep 2024 08:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLHMH5xlh4fG; Sun, 22 Sep 2024 08:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48C2240506
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48C2240506;
	Sun, 22 Sep 2024 08:54:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D63F21BF57C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2F0340506
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTrfNhFkkPgT for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 08:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A849240223
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A849240223
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A849240223
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:54:47 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b498so109894139f.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 01:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726995286; x=1727600086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P62HhMoNKYu+NsZUBCEv05cHI9IhgdXO8sSZp7UyzZw=;
 b=uleru68JnFhYVjriYCZeyx0fxgh1ejzTdW90VNlhiGj45M6xBwnLlpxkn1oi71IWMG
 LgL948brYuQPjTzxaA4WGW2QJravmXP3aYpoGx3O0RhX8ZnYHsLjKiJvWg/EwRQ0N/bg
 STCoI/LTyYhk1mF6K1jlUsO6w/+j7eiHftGEC9nIbkoAC0bgxIMfwvZg+OTIEUksA18N
 6P0MH3y8PNwhj8wCVIkGDS/Ubnc5//BCKYR2Cklme7FQZJulPMmLm8DHqXXsg3Zy5ny4
 SYl4SlaUbGvtYldlEbUI5Jws69UV0D8WtdF+aF8jv1djmk/738K55go3o/ii+0NY391n
 DtyQ==
X-Gm-Message-State: AOJu0Yw+CuL46cwL0Cr2aPFuyXyUrILCnRUyU4je75NEA5vD+g1p0Wvg
 6j/oRJ4KfnWiW+IfkBDUniVj9lHCP4YLe9i2kdVURCYUgagxAKpJT0/36w==
X-Google-Smtp-Source: AGHT+IEKsJ+L5Sj03IyYfHiVnjBDbY0iOW3vqke8LEyYYpqelAnnH/Dx6qDAM1QGRM9VG5stSHwpcA==
X-Received: by 2002:a05:6602:1c8a:b0:82a:13f0:800d with SMTP id
 ca18e2360f4ac-831fbf8ccb9mr806225539f.5.1726995286485; 
 Sun, 22 Sep 2024 01:54:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec17f10sm4554063173.37.2024.09.22.01.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 01:54:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 02:54:44 -0600
Message-Id: <20240922085444.1018624-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726995286; x=1727600086; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P62HhMoNKYu+NsZUBCEv05cHI9IhgdXO8sSZp7UyzZw=;
 b=Epf+hG2Tbo1/WXBqMfJ5DfNMASffeT+EeqxlJ2RX2eh7SizTQWnMXyxE5iiv35127t
 QpNeIPzERAoauPN1keEFtpIn+arCHmsjP8/NEjTnk+cRU+Mx4XloOinjBxgM0w39Ess8
 F4ap07jyQeRiDmBb0KABtC934DnmM1mcvUI9e1QZj68K9TQ7E5wThhUSsHOVP4jVpOCP
 W/BjMaqXFjHu6CZjoQY7NwYyhhz3DFIHui6NVPKFmL7T7KT35X3F0llCzBGp7/z170Qt
 Pn9evjwTtxHsVSvhgPoCYctL07IeJOvnD3EUJoN0yoq5OjDId1+qo0ZxuLD0XcvgnQdO
 vQJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Epf+hG2T
Subject: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version 0.5.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gnupg/python-gnupg.hash | 4 ++--
 package/python-gnupg/python-gnupg.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index 4a194ad41e..5d722a1b95 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  b263ea268692cfe687d29d52daab4770  python-gnupg-0.5.2.tar.gz
-sha256  01d8013931c9fa3f45824bbea7054c03d6e11f258a72e7e086e168dbcb91854c  python-gnupg-0.5.2.tar.gz
+md5  48c77a551bed992d19f7a99e3c6fb9d6  python-gnupg-0.5.3.tar.gz
+sha256  290d8ddb9cd63df96cfe9284b9b265f19fd6e145e5582dc58fd7271f026d0a47  python-gnupg-0.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index ddf2287f9b..00c1b9edde 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.2
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/b1/5d/4425390ad81d22b330a1b0df204c4d39fb3cb7c39e081d51e9f7426ce716
+PYTHON_GNUPG_VERSION = 0.5.3
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/85/61/2df3cd6f49dbb2d4a6a567cac1d803e3a50d86207e196d0f9e67a48664f7
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
