Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43094C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4193608FE;
	Fri, 24 Jan 2025 20:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIwoiA4rw_6W; Fri, 24 Jan 2025 20:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED7CA607E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED7CA607E0;
	Fri, 24 Jan 2025 20:01:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CD1894A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8C6540154
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lH5yVpD0Ki86 for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:01:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B244240096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B244240096
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B244240096
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:01:55 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3cfcf8b7455so3560465ab.3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737748914; x=1738353714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ilpf4XPEk1Jhx5xXgPIizdqqcNGPv2Gfickms7JyelU=;
 b=ibYuD8I5Ux6f2ZDo7n6pUBt89bz+Ez7ZgiX7JC8SHOA2ZOMdUOJ1wqKYS87NOJ7O+H
 JY3ghbYA8jm43+oK8jA8dnDlSNuV2ijLKog3Rr+5xs75sJNEZp8V8IPbIGTNemiSmuP5
 7rKHCDJC11eSKFjC6yaZS2vKgWEwvc/r47YyPHMtTaAax1sacUBdIyUUHsLXzADiPWdN
 8Y9HDB/2YDxiKcklGJgzl1EjzQq58Hgtw++Mh8pq6sX9rkSwHsasRKZWqT3wF6QwH0+e
 MVGxiMFqfCLyRB6dPjuK9IE9oimWzRf433oRF0ECB+etboWpeH59+OE5l+td8YsNlrT+
 zB+w==
X-Gm-Message-State: AOJu0Yx1tBzPvqC5+7+60hK5m4qnapMWhR/DkB2WfaCKJWxEhaVRYEdL
 68Ip5N7lFCEOfSniEDbsJ838uSh5TDhvtaU4q4u3tDcRkbxQLmFJ/fhE9Dd/
X-Gm-Gg: ASbGncssAgEyqCdE/M6PF2H9eTZkC1qcJ/AqzO8uyWkHfUOjCu9yBz176Y/LIYR+O1G
 NM7G6KwYSdWXkNKulQ9tHWb/r2/g4EOoOg4/RXTR6XOZe95DJmfaGW1RWNNGpML2pbUyE/UIC+q
 beT7SwEEPWDSWP3Oijei3eU1hgAlr64MPDqQLzcuqRsS5yqsNlXILiJcTUUCJN+s0ISD1Z2M5K4
 B+TkJ9u3kV9DCtg36Y1+25yIYZPHsPMyiJm6EnOWkNGdNvC7U5XGAgrLuGRnyQrdw+F8WQcgLO8
 wMtG3BLiyrDUknFh9lOWgcMlrLA+GZ9GiAH+PB7lKhe7ZpOkRSGIUoI=
X-Google-Smtp-Source: AGHT+IH5xOKBmElk3H/xa5Tp8X0nnpdOsevCmvqa8pU1bj5sPNZt8uGwa7OL6KXrMEISzF1lG6jIJw==
X-Received: by 2002:a05:6e02:144c:b0:3cf:cf15:f35 with SMTP id
 e9e14a558f8ab-3cfcf1513acmr21310315ab.6.1737748913430; 
 Fri, 24 Jan 2025 12:01:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da2c5fdsm822689173.38.2025.01.24.12.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:01:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 13:01:50 -0700
Message-Id: <20250124200150.3839590-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737748914; x=1738353714; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ilpf4XPEk1Jhx5xXgPIizdqqcNGPv2Gfickms7JyelU=;
 b=dtPgcgrbRJFybWE8hx6aLsYdotchcaGXx0Iv+pYzQ7mnP8lb+AUEiaHy+WeX4yI2QR
 V1NgsayA6GjhbZQZdmcYxzvabgX0Gu+TeajS78pgfJy5BYuR9aADV1joHNIW0c5KGlgX
 t3/CLj/45tXokpIFtNef1kDCFp+Tw8741Cbuqbaxf/WrNfOXyh7Skmhjz+xfQIzuSgol
 742bBomb0y6a1J41Az4KyQneHgEOcNLnGC7OG+qVQIzikFusHW4BPKRTE2JCBL28DwSC
 ucamlblkARakcI+7oNV+IyX12S9qpZogNKOmpfxc9JO/vMDqalCaoMvW4vgEDln8m40L
 TTnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dtPgcgrb
Subject: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version
 3.10.15
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index df657aacb9..d11892b4b1 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  2d093fc336be04a32f4edf27b2aca8e6e7c796521cfaf9552079b39d2ea93e06  python-orjson-3.10.14-cargo2.tar.gz
+sha256  a7ca27f4e0ea702b1d71d4e2749718e79aa35c0047f07d3e8681707c2d2aeecb  python-orjson-3.10.15-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 9b44ebcd67..29325e2f67 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.10.14
+PYTHON_ORJSON_VERSION = 3.10.15
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/92/f7/3219b56f47b4f5e864fb11cdf4ac0aaa3de608730ad2dc4c6e16382f35ec
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/ae/f9/5dea21763eeff8c1590076918a446ea3d6140743e0e36f58f369928ed0f4
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
