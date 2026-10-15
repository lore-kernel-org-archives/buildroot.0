Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B78FCC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C73D4092C;
	Thu, 15 Oct 2026 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qO4OYdQtmKa; Thu, 15 Oct 2026 21:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6F575408BE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101146;
	b=IDGcHrcZfItLOQS05UT8kqSjvyZESGK8rjBMa9rEfvtfDY2oQqCViHoBQLtza/v3stY4
	 nn4xqQNOAtPm3wDGsykq6kEIB9yTiuc/IO0+dC8W3UtsDiO06LG8F59WfJGZQnYCUdd0M
	 haEijZ/gBD62eNFv+AE/kIhbEv1lB3TeC4Wy8uDAbpu0Pfu4AXlhtZb4dJfuMRqo17iSw
	 Mir9sRnu4TWIkt4pF46O54rMt56EZFC9N/iWYvSx2IzuaXySOc/P+42uE8Rfex86ZfE3Z
	 oUAj7uBP7fYjJhgWKdRfog+X5dMK84Ht1P1CSqBKIb8ORJ0nioLWzgsdKct+ctxM0Cg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101146;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=REhb6Y27viSPqjCSDNOFLwRAsgTnYles0868rD0lwAs=;
	b=BnF8iWUXmv1gvwk3DpCHIH8c4NOZSRUJ2zFt39KRoTSNRBGPk+ssYwmqtgXPLhKRRsC9
	 2Xk7XfDAhV8MyNf/oH4sd+xcF51/BlI9m2MSzRALpgSJXE6KpQ1iwn72cOC2w8kLAhPQS
	 sfTzoLuhklzXtQaewl4HFtsoW/Q93fWMyKSHmXCxi+ZcMIpEXpEBDlfFPf1y9a2rZopdQ
	 vuMomncgBJcMUWdmcNxDvK/DheeAu6T87KY8VzkoT1LkJT1fp+23InChhcUQc/lOTfnR0
	 IWNaBBvd3znFFV5aJeq4XBEmG7QyhNQvWiY8u3X6+RHScG+zeKgYBTQFF7NyXt6qG7A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101146;
	bh=REhb6Y27viSPqjCSDNOFLwRAsgTnYles0868rD0lwAs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hr6Xu26R6dmKOw3VjBZ2K2+C8QAbV2LDmlW5hriIKQgPavmIBKWlrlPGQZLTfR8wF
	 TuDB8kLK/QYD5q14DhM7m5PB0u0bn7dH5Cr4oS6xZzAZcgtgw1VLIGGypvAkH+3qhZ
	 D2Qv+BRuraWdVWacWFxOPG8nqwvkI7ckG//NXYF6IYyGx1aj9l3pbsqTNGpD/LucrY
	 BUXTww8ZTcHUQqs00OOgGIGc7wzgNkRU8a2bgCyOVosXdoT5B/PMnHnaRaIZFPgWn6
	 L4VN6dn/QcxhfTpnEJrTrtWnWI1wH2B+6SxzS26vG8puNRS0QLtX86rz7hOLIw8oUr
	 1cPyQq2yKIGFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F575408BE;
	Thu, 15 Oct 2026 21:52:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A422B332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AAA88121D
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWmH0kJPNlsE for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9CB858121B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101142;
 b=DYuZnxt1MtGsKRBu2jPmDcY+RWGkVY8k1bE8ast6mqpv6SdHMjF6mdGT+Usa5avygWth
 fIApK3nuYd6K8iV8YCS8aOB2EkOP8OlSUYTkSP5U2RssMYSsXoUcIZHVJDobOjlaKz7mz
 dkSEZtY4rdrjUrj0oIdveDWjZZx/7I9oHxVbu5yIPv/ww5jNWJpiZjTezcUDznb+rQpYE
 fx+JDCo4YuklTv9WhG0suYiq9dmgBKFpC7utUZw0GfevZLJpbSHjicvbha9bOup9AzydL
 Wd+ygGJBUdtR0ZBDTpFrsbSokrMm60QuAzk1rkuJBPxMqLhyerHTQruo32gicGh86FQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101142;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=FMLomgvOB6lPw5shZtLpzyOGJ1sjMLW2OAGccgEFW4s=;
 b=i3XHT7v11kxyYPzBo7av61drJOsVjcEX8kK+j0DJ8q58OJBtIIlFRjADd82wrqXa+3kb
 cyBLqtPGUPlXTPVYmWDa1JHwiw3vgTMSw9jIw9p/jTR44mB4A2FMDAdEvltLoSLYAjK6H
 Wo1xkHchqryY/fZCLQPhXOe2S1aito4vaPPQAZFsZslOU0EB153QMX3wKtpxCKTckqV7/
 98xubsnrN5UugqgzGWkxZ6IYASyfNbGrUaF46KFV8j5LIQxS0vw44BFKvjUdU/UUZ18c5
 0gYJuGJjLfVe9ScZrCUTy1bMIft6egJThuDQnj7Mv9ukm3ox/eAJRt2R+8Fm+qfvS+w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KtidM+EP; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KtidM+EP
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CB858121B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:22 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-4c27f0df6e8so899603b6e.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101141; x=1792705941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FMLomgvOB6lPw5shZtLpzyOGJ1sjMLW2OAGccgEFW4s=;
 b=KtidM+EP515tZnpQ2n/+7w4fhDmNG5MjHBkctcgVfVrznfdu42KKRu6ZHdO3T36/TX
 XvZ5F4l9qDQsIv4p/fdwrf4YlS1MLQB4MX8BeeDldF0d3cdMoabSV10wsUHU8G1CK6rd
 avriZnX8t5P4/nQtknun+B3XakClq6YPYwcIYzQLAyaa8w+z1snksnFFBpvowDtJMpkk
 w7aBexHauWFZs5qsv6Bea0oLu7sT5hWZ5/mJeXI7t2JHKcltOTTmVxIFwVedcQkmSCNb
 9AsrKXGOPsWYS4mR/YmhR3mLkaUxAqfoArp+GIozcRlV6gl1ZaA8Sp9CEwQFr6Lw1u+8
 GUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101141; x=1792705941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FMLomgvOB6lPw5shZtLpzyOGJ1sjMLW2OAGccgEFW4s=;
 b=wy+ad03tW4QS8raGhiyt+cBhw6MKEkjTlOxqg3MgGByUxGa885EyeQQnyC0PyD/So3
 1DCbSKSF4TnKjJ1pOLl6N3cRvam/tV8rrGMFcfoSDWk0xkOjawFfpq1imAMNQlXsXaud
 r9FxmBYfs9kH7nuryhklo7tjdSxCVomEU8B2QpHyuVQendChHzDa9hDaPmgAoydO8ZQh
 HxnZPW80sQaNmf2msUt3JRaHp6IpZy9PI47+Y+E4TsBRWBWVlMzEDDB/FnxoabRczL2v
 In2xQQ9pyDOCkHCI6tmQEnIURRqXlcTnrdSLT71MqR/sqEu3FShlIGP8ljIjW4Fpbl1q
 PlJg==
X-Gm-Message-State: AFq9FYIyy13uXM+o8eoZdKnp835oLp6tAtrV53mkzz/pNBAZveWenEnl
 6kKX2bZ0YuiwuB68POrQL9ikeO9/A7rE4F/TxSvC9WDa1WCkSQ4O42eXgbTC7A==
X-Gm-Gg: AYBFou0dhdc2Q8LIlqR39m4bQDUX9KFL75WuIA3/o9noSFRHD8i0hF1h/ru33o9xG7I
 WFFZh46YwwG/N2DmFvsE0yll2aIt1yN9EjRFsHoC/uXrsZi/tuv0s0iULBVbkbL8QC4klAgktNT
 UF9/Dh0rzQPaPT21ZkTEGwWB/GXrvm7j3MTrciboG6QiRLLEUQoS0L/LprZUsOtFDYvhcVOiwAR
 sMf7FIn3l6X2srLNx2D9rUrVpBv+SMs5a6UvMkr7Gf03cq+k3y8O3g3n9+N764tCquFXbl8N5IT
 930u10OD3wHTec0dFu2GBefMNbbUyTwvHXyB6NWoanFNwypLo0CVL3+3iapEy5ny6vL/gpjcdhK
 zoYm0Id6KTrNTQi9Cwk+4AScazpqzjqHJmiJJmJO+G1kAq9TwEgQj7NdMypRQZAU4BLs92klqSH
 lr9mHBMTctg82W9o8umKMCcHCu/tb4bfK04Gx77Zx97aCo+a8vkEIHK/2bjhAPhOl0uS9ScQFka
 7kjPC56TTj5GcUdzcBYHPyZ/kjpwE36bQ0E0gvRbyusJ6WdcdYnlVf0UGad8Oo+C0js+3lCnu+o
 0OI9aQGQqtch3oa15/1TNQA9HGKfMmWQ4/7ccNwmtWrYhavBHlVRjmXHLgH9dJlY/9pmmIZc9yE
 J3ioT+iVAO0k/sjxIrvyTBpRpRIwOQw2bS2wcdl3RjGQ=
X-Received: by 2002:a05:6808:f8d:b0:4d5:295c:a831 with SMTP id
 5614622812f47-50c587066dcmr17501475b6e.62.1792101141441; 
 Thu, 15 Oct 2026 14:52:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:42 -0600
Message-ID: <20261015215210.3426895-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-fonttools: bump to version 4.67.0
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
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 388546308e..23167e17d8 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  2a762cb1eff7c310f0be506618a23e40  fonttools-4.66.1.tar.gz
-sha256  64967c6ddb0d4c610dfd8cb1485981b2d27972ddfb7d4bbbd9e199d2a089c450  fonttools-4.66.1.tar.gz
+md5  95a2a896db1eb6f319ec454d1d9490fd  fonttools-4.67.0.tar.gz
+sha256  3cb57e6600ca77c0b1729cf8adc23bc0652633a37f18cfa934d9c7bc3de25519  fonttools-4.67.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 028861f4ec..0c82bbd62b 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.66.1
+PYTHON_FONTTOOLS_VERSION = 4.67.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/87/b6/126c659ab7e0e03e01a5f5d223abf7b2c0691ae92718085a212a3924a2a3
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/94/36/102e180f8f5dbaee88b26595b01ca8aa80bf4e62128d9aa94265b3996c96
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
