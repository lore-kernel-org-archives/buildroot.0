Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB13EE6441
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 21:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EA6240696;
	Wed, 31 Dec 2025 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46pD3C6dtv9V; Wed, 31 Dec 2025 21:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20EAE40591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767215378;
	bh=FnciNGpiP0w2GdaTGtAYUd24pL5HIcToqh0h30Ra9u4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IDCeKNOs8T1Ohtyjt2O9ly1BeO2stO8xjPQGMSzawGhgHpNkrgSYT2mENBzXJf+75
	 4u6rY2EIl7oqv7xxPneehZJcQyLtpeOsUk5lRglYmG3m6ET5xLc0VN3M5DUwATX77X
	 nziON4vPBQpgPNJOwtGw8rvb10620XtFmvm+8+HQ5LmuA/BLCXGPdoRlEb6V/ZXIpF
	 uw5rJOoMuqFzcj7e8hlJXlHBG7Dqk7jWTUghIcVHWOOtcJSKFufOcMfkm18lDA/h3S
	 4ih4GYmDOdUL6hcONmz6MgPBLBJ9Gq2+QW8tptyJCzscgW1vsq/CMQAKu3VirQbGBP
	 9Ue0WB/eijWng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20EAE40591;
	Wed, 31 Dec 2025 21:09:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 180A2249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F266A40176
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPBwtA2a_srm for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 21:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1618D400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1618D400D7
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1618D400D7
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 21:09:35 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7cdf7529bb2so2538188a34.2
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 13:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767215375; x=1767820175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LlBPbII46T/yHVLLymJ83+PTg+lHieRhvNSHXbmC5/0=;
 b=qbyBQ9L15LZ0YdHxNjoKhm6UH5k2EiXKJlM3ji589pDrK4G5LQp+8atot4aOTvshb9
 7QoScRD9OK+4Or5qOSGGydYeCgtLUqjA1TCtyEQNc5r4rH1/pdnA6WDOqwNrqRFtbgsl
 1erfVik5rzAL9VnERRIwsA2X5Kdvvjy2UnTxQFQGRO9ZUfUGCNWYUde7+pMprLrKI6bw
 pTA3Io2ru+DZTqeE1CCJgM9/Ws40ZhCjMuNuWanbwBjHGvNafIIwdbgfUgMKh3jvRwiE
 MRmLkSyQnain2VkNCyYpPy/Zi1q09tKF6sOQTNjjZ47eZUTyVFpONiJ0ebDWslRWH4XC
 KivQ==
X-Gm-Message-State: AOJu0Yy4fAWKG4DLvhRvKvrundGDQLkGtCzcnjSESDFUTprvPs93MTB1
 mpMyFpPK/VArFkwvVxhH3Oe7yh2UcVEMAdYGWLrp4DwioKya2Ns0eWkr9oQpicq2jds=
X-Gm-Gg: AY/fxX5ZkusM6j/B2hOCJU6svsTa9LrcD6v5VanzevODWrtVdj1Bg8CXW5/I9tOsXDC
 1JQiGZ9viDo0zUMb6wNJ4idMCntxsJWBVPj2zYJx6cjW8JmF2mEwWDmvEzxr1rPFXhQBQWTGOQ5
 5aAQDqwJoGPRKZ6LndDh/trOp9onu9uwNUEMkNscKK/YDdW0w1G+CeSlXictTjXFK0rC2R9i4vB
 fCr88bHiV0qobD4I1nkGnS8TgRWB4FSCezDuOMNUnIQt1JoDk+B4vtmXdHJLW/hOLv+f7tCAzhY
 nCl/JI4o0l3k16zAdCAuiKTeiRpW2HsgBEIY32jyySd7mWsFrO9YmhAfMnHeCssGzZt3VU8zIF5
 dSskWxfMbfJ7221bfxD+YBvZcBbFAR17e1AZQTVNuXpjvT0y+FEAvEXUH/WJ5z/z7/rRdocKtcu
 w/it2C0EewA0x4bKvJDsrMBRKHwbMR8oKchunHP9A7r+T0zHgAWBemqnHmn3S6ig9LfOcgsN8zk
 12NeutEbkkqrOWAb48J0h8STwakoYHH0wAGT8PpJLq9rieV9TNJv3M=
X-Google-Smtp-Source: AGHT+IEC/RUx/qy3KQuO62B7tObpZRnUKUKQvZZbi1pzHcdlXLLPle5DwlwDg/QWwS1YTFneCJNuCw==
X-Received: by 2002:a05:6830:4127:b0:7c7:cf5:8110 with SMTP id
 46e09a7af769-7cc66aadb46mr23557663a34.17.1767215374666; 
 Wed, 31 Dec 2025 13:09:34 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667d572asm25206172a34.14.2025.12.31.13.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 13:09:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 14:09:31 -0700
Message-ID: <20251231210932.4168952-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767215374; x=1767820174; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LlBPbII46T/yHVLLymJ83+PTg+lHieRhvNSHXbmC5/0=;
 b=lZ1PVigWPKBYjwlmOCos64OmlxxkwbPoUvbdXkU08bWgSM+1xWqoy1sLhX4YYq/YLm
 qLmO8Pk+kHoz/Gs3TVDwRCzn1MKlFDnfW+K+kDkMhbip+l/GFAn3OTqZKLguDGWPTBYY
 RsNsTkSrGNdZDAQk1bIxP5sZVOHXnS+X5TAT0eMb87pe9d1HyPvAE8cwIMDOuqABfYUj
 FP9HB3UdFjShTNKKWQ2cdeKW6rpMYvGFmJGzv2cCziKzY/RpmJQWMIaFZIv5dbVWa4gI
 vkYAlqSIAoAQ7P6yMvMCr4ZSa0o5CcVeiF8R0K3ykvLjXOnaI1w0nRrlKJ1oHj+5wnC0
 bsNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lZ1PVigW
Subject: [Buildroot] [PATCH 1/1] package/python-reedsolo: bump to version
 2.0.13
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

Enable optimized cython build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-reedsolo/python-reedsolo.hash | 4 ++--
 package/python-reedsolo/python-reedsolo.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-reedsolo/python-reedsolo.hash b/package/python-reedsolo/python-reedsolo.hash
index c1729f0aeb..61d435d4c0 100644
--- a/package/python-reedsolo/python-reedsolo.hash
+++ b/package/python-reedsolo/python-reedsolo.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/reedsolo/json
-md5  5bbd7741f915ad67b6d425f93ab9d103  reedsolo-1.7.0.tar.gz
-sha256  c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732  reedsolo-1.7.0.tar.gz
+md5  640de80afdaaf856eaaf31091e349a44  reedsolo-2.0.13.tar.gz
+sha256  71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717  reedsolo-2.0.13.tar.gz
 # Locally computed sha256 checksums
 sha256  2da9536c23b72bac15603bb1f8dbf269dc68ecfbc35a75f8d0aa9cb209ba0934  LICENSE
diff --git a/package/python-reedsolo/python-reedsolo.mk b/package/python-reedsolo/python-reedsolo.mk
index 66e85fb40a..f5eea7eaa4 100644
--- a/package/python-reedsolo/python-reedsolo.mk
+++ b/package/python-reedsolo/python-reedsolo.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-PYTHON_REEDSOLO_VERSION = 1.7.0
+PYTHON_REEDSOLO_VERSION = 2.0.13
 PYTHON_REEDSOLO_SOURCE = reedsolo-$(PYTHON_REEDSOLO_VERSION).tar.gz
-PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/f7/61/a67338cbecf370d464e71b10e9a31355f909d6937c3a8d6b17dd5d5beb5e
+PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/57/5b/ead15a5d182553f9d7832851a954b7f0d662d710972b0d1c479fd11a3ebd
 PYTHON_REEDSOLO_SETUP_TYPE = setuptools
 PYTHON_REEDSOLO_LICENSE = MIT-0, Unlicense
 PYTHON_REEDSOLO_LICENSE_FILES = LICENSE
+PYTHON_REEDSOLO_DEPENDENCIES = host-python-cython
+PYTHON_REEDSOLO_BUILD_OPTS = -C--build-option=--cythonize
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
