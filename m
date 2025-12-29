Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A50D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 01:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D72381468;
	Mon, 29 Dec 2025 01:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvPa4KqMFO3d; Mon, 29 Dec 2025 01:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D2718146A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766970453;
	bh=wIvSKTsLYspuCoT7iRhwMyYmojXxCX3EcoefI7axfDM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=i7MgnVv/ldljAdm16kSoLekbjr0bbi+3pjwhDKs493ZzmSbqsrYWwLZjgoaqtP20j
	 tWj/fQ9xOHSmMDJMezBFxcPWchJN8tYVI8KjZc/9jI8GimigZtBKWrRhIXwF6sf5gG
	 uE700R8fVNeZHlS4S/D62QKSAuGXUAYOw9nzArJmkcMaBUV+LmsGK2SRJr0At1jICu
	 c5H++XAmrje/DBm+vRTLwo/zGwGfdaG0TKt9LAMoRBBn/qPrc+fnyeSJLkn77yaorZ
	 DvSg+816d9VNC6fM0naLZ7L435j0/VdMPZJufxQjWkVSWLFOexbo9WGDnAZb/FEHQy
	 kAA3O74iUnQIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2718146A;
	Mon, 29 Dec 2025 01:07:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D18ED8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DFBA8146A
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rH3CQsYGfWNA for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 01:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91E4881468
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91E4881468
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91E4881468
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:31 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-4537407477aso5507234b6e.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 17:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766970450; x=1767575250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fRl6kePOI4GfEu8qyiiq+pV2cnrdj9NbHMa/kiTVjJc=;
 b=hcJyRRa9uD2miIuMZPJLPaozHBR77DzGFrfwt5o99+hvhs4K1oA+LXnc7n1iQxA7jM
 NUhvNPWzGjPntJBLHA+NBgBRLIDCyYMShrha+SZZziaT+d6e83Y5B/9EixULyUHl7bty
 7otZq0c57YTImwnzLK6rR0o2wu20GlimomwtPdc7wmeMVV5CN4OJC2dYQhcBJvXiLoxg
 v3A19QPj4RVG/nB0WzJH4LKeCyh7ZY07e+58cqmE9TAEWQSMxOKt8KAGHteZ2wsUJk/C
 O8hRL4n2CagMT0fZs5J8QufHTEj0/JKShS2WM5ABzwmu5NlGLKswII8Y8HV54UGzUvDT
 738Q==
X-Gm-Message-State: AOJu0YydRhBIYuzTfGvwZyiGAESn2ujjO4Z8iuWpjE2cRsY7EHjzK6xH
 dQlxUx4jdKpvCrLoOiP1MJopS68mIcegLxDnWXXe1lb9XG+Tmy7VSc96VhsbQR/i
X-Gm-Gg: AY/fxX77+VcQfjAb6ZUUeIR6a+bw9+MAJCzM1snZHysmDWxhBHAlbi2qf6mVRY8zwVX
 GeXGKwhTEQwAmYXqHEYKVhNe713FXN3GwEzS6QiDJ5BwlDYeppKwGcDkvGhsrU8n9NV3LoN1P6t
 rcc12Bt6lA0ddBmfZ0E7CuxpUqByXB2LZ6eUE765v8N1vDBwtBcj25pJQNYljOc2QyCd+P6crS1
 +tzz0TIZ7IR4b+z5HCmeCfcwZrTf7IWwawajbXkyeSJuCQUJR/oajRPVoCTAuuioanz9qlkP+PQ
 I2WScj7Hu3VFRgRA1J8IXhLrZN0NcIbOR7CoYcCsE4g3N4EqpVqlVx7VEtFHuHCs/hLxQBSTJXx
 xmMyqcGaQ3MZF7Bv/0B4ONT77x0xzFCZjd+rB1HmvroYwfE9q8KU++nXXsmEcGSBOkMHUCOxLKV
 l5Hse7GTyvWZHH0Xbxlpj6BR3QKKvSlN9aWBJZsv8IQ9h7TgILv7UwVA8IXhdqmuFJonyaMWH5e
 Ur+XT8QoveE1eL5qmKHlI5QgwvIbnJechMKXhcPBU1ghYMlI4uL2A7QqxOtISjvJg==
X-Google-Smtp-Source: AGHT+IEnEMBg6dE4RVScL5BKZF4z3rE1kUXZ9f34c/KH3f4aj/NpCXweSaQL03lmulG3GEc/vlj0vA==
X-Received: by 2002:a05:6808:17a8:b0:44d:aa6b:a59a with SMTP id
 5614622812f47-457b20187a4mr15258131b6e.10.1766970450255; 
 Sun, 28 Dec 2025 17:07:30 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3edb23esm13369485b6e.19.2025.12.28.17.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 17:07:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 18:07:18 -0700
Message-ID: <20251229010718.3139818-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766970450; x=1767575250; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fRl6kePOI4GfEu8qyiiq+pV2cnrdj9NbHMa/kiTVjJc=;
 b=IB1PIQLhhDnterH1Ie0hqy1o4rd/2P6WBwpLBfRk8iGbchZXbIEIS7RKB9htB3qR+b
 z9ifXh+zistf4X0cRNJgJ1ZtvXuc+F9Wnx7fiWT50E9bZ+AyB50jnK5eMbSpKKH1hL4s
 VFV1u1nbBZqijfnV7OPLm+ay+Sts1i7f9CHc4iNcf+un/OuuPHvf0WzkZK3Mv+nF85yz
 UC+H0qT5yK63THdKg8PuHEiYapq0PCYzZm7pRycf3nPUiuvXBQuRPO2chjguMf7IE7T7
 +ChKG6/QCguSyO2z5ZGRfkMU8tPK3h5jhm5ID934xj8WwvKcXE+WDG3ZrKL+se9ZWZpf
 xugQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IB1PIQLh
Subject: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.5.4
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
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 0c8e401ff0..53972feb09 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  dbf1f706f0a1efd9ed3dad8d82b7e865  tornado-6.5.2.tar.gz
-sha256  ab53c8f9a0fa351e2c0741284e06c7a45da86afb544133201c5cc8578eb076a0  tornado-6.5.2.tar.gz
+md5  bf697c5e3cfb0a572192abf062e83e32  tornado-6.5.4.tar.gz
+sha256  a22fa9047405d03260b483980635f0b041989d8bcc9a313f8fe18b411d84b1d7  tornado-6.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 800a5d775d..ab2dd3a334 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.5.2
+PYTHON_TORNADO_VERSION = 6.5.4
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/09/ce/1eb500eae19f4648281bb2186927bb062d2438c2e5093d1360391afd2f90
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/37/1d/0a336abf618272d53f62ebe274f712e213f5a03c0b2339575430b8362ef2
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
