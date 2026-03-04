Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A766EEFCE20
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 17:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3644B80D97;
	Wed,  4 Mar 2026 17:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjlUIVLg6cIv; Wed,  4 Mar 2026 17:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558B080D63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772645256;
	bh=isdDa7sFSmzBYZ47NZuBrgFK7AnXD/8KHrx253ZA3A4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YsxhUoqGbKLWULM10rZf/W4yjQKkQzgMfNUTFBZ9pEjPrCgjN97iPjojyTz/YYHAt
	 M8SC5iuPGMAfvnn7Qs21oBv24r3Q0/JQYQMKuECARt/s3vIfIhgY3Zayy8sLbdEMbh
	 jFn4LMVpqcjslKecDeNsDCNvXtqMXetyBs5OfWAFEykCHp6EZu1Mg+35ujYo6KCIUH
	 dtOiQ3PYuuH3b20veDT2jYonv1C4ppoEB/p7YZBSizGNBnsqlWlMR947hDq5Iroubx
	 ClvTqFy/lqRqzfBOHKu8U7DAtjfCAdp8hmT0TEg/uk8xs7TTH8/M8JIl1NLgsXi41r
	 6Kot6C07oyf1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 558B080D63;
	Wed,  4 Mar 2026 17:27:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03C28F6
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 17:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD67180D5E
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 17:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9qtorYqBHKf for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 17:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F368080D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F368080D50
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F368080D50
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 17:27:33 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7d1959ba05cso3604183a34.2
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 09:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772645252; x=1773250052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VcH93K4OlxeFVBNrvbpD7uxVHFcD+ZNmE3PwNijID0Q=;
 b=JrM/v99Jf01FqTTqhkHhZ5NslCcgAfxrQI6wS+GVRYEhJVD1rzpCjoAdFHeUjWulpj
 90MoTpacjaiPdKvEK1BiYOU8KxcnLFqn3vrJ7Ev9/4tXPSuS0b72QRtYG7+ODPC4W8rx
 v23WBhGryTCHWMxEY9DllZGkTJvP92rtUNj8jAtb11nxGlXG4qWtVy574mgTKU6ztLIc
 LN6hLgvenX01y6IV4ZQzDrTGHKeuU3VVGczDcJT499jG7MEMK3niIsKE7tmun+y+5wc+
 nps83Ijy4hp54ZTC9GxpEiEarv9Omu9R8SMppur9oKIEuGu18EtcuNQ08jrkH05hp9Tx
 +MWw==
X-Gm-Message-State: AOJu0Yx8ZXPo3J8eSqSdVL0jUM8HCHTevt3QSv5+8C8vyzE5vwvRRw0l
 ZZkfwJ3FKHcmgRG9HzC4fYI8Rth8FK9WOeG4l/5SP8APPZqzWNYCicnk6vLUFA==
X-Gm-Gg: ATEYQzzwx9zQKJTdWFK66fSo2+4NU+2nYjEOUq3PSJA8dh2GfNcJQtsci1KYpBwspYX
 zXXHTSKfFZmbCsfnpGXMYlkh7L2zQ8hdJMlgbtuTvjQ7045hWRjTPlrpQMmVnmiBcS1p7Qmuznu
 txPgimerRajs4wKukcnVYRu1TxxiY8OngExcS8aBa8v1KUVL2CC02XKOLsX1/OuJuMJ1fq1e7/a
 l2U3a6OqT9s7L0LrZ5Ap3yeAVB9dm3ZHvCHF6a5PMvlxSuhS1NKsqRC2GopAiOQIesK77x+fhPz
 rgWTwKbwJN8HIQlPPmp1Yo7cYqdX3aOk5y4WhykAfhGaUMxU2ct9JLpGyqlibWXaZVmbTv4i4+Z
 rcrvfMPL/BLUcQPLjBmunBJSXMfouKJLEpQfoWG2ehrooKzNlA/HF+4xDmEAzN0d4zoksKUCz2a
 JMoI6i/mTf0sTu3hb787A8q4DpYWdtjg3TStDvVmKFwXkx3lku/tnjmOshf3qzbG6XG2G68y0NC
 QTyvGf/imiAxgk3LMlIbrgBANqSoZ/PHkQpsDFCdxQ+K+mLs/ZfxaX8DkXm
X-Received: by 2002:a05:6830:6aca:b0:7d5:1850:b26d with SMTP id
 46e09a7af769-7d6bf91a080mr1427393a34.0.1772645252562; 
 Wed, 04 Mar 2026 09:27:32 -0800 (PST)
Received: from james-x399.localdomain (71-33-158-51.hlrn.qwest.net.
 [71.33.158.51]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d586653f6asm16707880a34.19.2026.03.04.09.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 09:27:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 10:27:29 -0700
Message-ID: <20260304172729.3622901-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772645252; x=1773250052; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VcH93K4OlxeFVBNrvbpD7uxVHFcD+ZNmE3PwNijID0Q=;
 b=IQcpc1sFARFFFAC/DO8lw2jhBGn6NNG/dHLsllI1fQi+96HGOd8LysoyVfMpG7XgRP
 YtTWGy32Cp2Bf0KK2E9ooGSbArFX45517qbRFgHxNZc7TimsYacccxcFAxfmvZekvFmP
 RyD8Te3m+Ar9Tg26VMhFAVEYMvqLcnGfs7+eL031wu9I8Sym/v9HUH8mhzYXab8XYXxw
 9ClkIXwo0i0g7DE9PmTI5NhkfSUAnOIajk1T9uvrTTFCtzmMKWuY4mjn0m3mO2Pv7aZS
 EruKjjdnRZ7D3JAtnmU++/xCCjJmOMybQk/jwiXfr+j/2nXapP20J/I+EnRVtpmZ9JLe
 7wRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IQcpc1sF
Subject: [Buildroot] [PATCH 1/1] package/python-aiodns: bump to version 4.0.0
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
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index a4a242670a..4cde1c4b1d 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  c1552fe562a1f9c98ea4c2311a2c75ba  aiodns-3.6.1.tar.gz
-sha256  b0e9ce98718a5b8f7ca8cd16fc393163374bc2412236b91f6c851d066e3324b6  aiodns-3.6.1.tar.gz
+md5  c69a64f09c0999f63ed759f5046d5bb4  aiodns-4.0.0.tar.gz
+sha256  17be26a936ba788c849ba5fd20e0ba69d8c46e6273e846eb5430eae2630ce5b1  aiodns-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 7476c76b72..6befbff203 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.6.1
+PYTHON_AIODNS_VERSION = 4.0.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/85/2f/9d1ee4f937addda60220f47925dac6c6b3782f6851fd578987284a8d2491
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/10/da/97235e953109936bfeda62c1f9f1a7c5652d4dc49f2b5911f9ae1043afa9
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
