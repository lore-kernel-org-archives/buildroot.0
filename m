Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7B2E784BE
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 01:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB22180C5F;
	Mon, 29 Dec 2025 01:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geQimyJ0N0oM; Mon, 29 Dec 2025 01:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 175AA80E06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766971411;
	bh=qFK5gvKOQTouzw7dWb87atO/3ojofjYX5klmALufHAM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=iB9SwVbaHNgZyzoHF4fiJG0yFaN7O6Paq4n0jQK3LDTS2vAgU98E1aFGrkrtpDrXT
	 Iwv1lMOHqnlq9aO0v6WAPMPZgq6SPElJW9l/iuX8tBjeMyha3CMhzeRmJwq+0OPrQn
	 +52rqdj7rl6lqICbkSIZsMxeJOiKLIFkCQ5FTEXq/sehKGuqwzu6rK00cxegcVAqGu
	 rZcGNiqm6D6EDlRi1/EPv9naqdMftEplKSdGZ9kEtBTj5SUro8JbJA9yzB+ubTChNT
	 teDLhSFE50uqhJIb1exMQS5Vo+9QxjY0Zwj2Xv/PNa8G7WOSH7yX5bg88hqTQpS5Ec
	 20L99eB/lwFVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 175AA80E06;
	Mon, 29 Dec 2025 01:23:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 320AAB9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2371680E54
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_RlTkhcid3H for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 01:23:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3258080E06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3258080E06
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3258080E06
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:23:27 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-3e898ba2a03so7283843fac.0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 17:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766971406; x=1767576206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPyz5y8WYioDR7csBrsdb2NUb4jCSOFfNK2HFmwLmxw=;
 b=ejpSO4PwQGK/pFdMQpR/syOb/UaPFaHmneFy6Q4voBgyhkQx0mmEfO51XDeWHo/+K0
 eUAaJRf8EDeEnQWmoKlrBT2b5lhnYZqYWxr9JgHJS5EsElWr17BZgNiwWdLBQ6DtpQkY
 Qycw6RX7Sl9zh/GUXBpGgaH6Iz5HhUg1o8XOqB6pWjP8ImR+Q8tVKsFO1pj2Nsh6iezD
 hLoRlDfWo44uggF4FmJEP3F0f3l5Os4ftPOLsu1tvIwUWpgcsDkJk6mhq3r7tKgk+H9Y
 24SB1z2RtyvtQk9No4R2b9E9P67bu1Ryb+bJllJpFY+Fk76BQHWK5KMV6p5/H7QInmnm
 cGKQ==
X-Gm-Message-State: AOJu0YyfH5w3SsOqw64nWtr7hTzz67axMIaSmQ7R++rbh231gFG6ZM80
 kTFXBFzW3F5f15ar11V4CN2sBLRNs6ThmLZIFOpki7wk9/SQXrZ0oawLWNON09qC
X-Gm-Gg: AY/fxX4pCPJkTLadbI8pDOiCznS35RYNaapOoTDT21reDvn91GO8bblAPrxMDquVDe2
 zHrvoYycQ9F0FUMOlgB2Ha69txhVkVUMkChNm2CnjGagtNh+Wk4Jv/aX63zznwAuhwTzT4/oUhS
 m752We16blO992bzdf7t61XRBfUjH5ecGSAaMissopNg48c0td89kmmtZdPRbxfR8iwj+W8+mrn
 ODrUtoQKtQmURyt0k71CA2FULWcskgWkMXCiywrAUD7pPW1eIlN6QA7eW58bNAk7DzWTdHpbdW0
 VhBkZHQ5haBktXj+XzUC8EF8SL5oVdLQ/l48jEYid3yR7YUdCECrP0tukvZr/s/EW/ovRugVPEa
 MeJfOgAHv5py8nD9eE3eIVRCZrq4QTXh3fXfnxnqMSlQw3qhv6y/m18d4lwaW3Y7xT04CMr2xUV
 vW/in9h24UvT24RUK6KtPos3+Y0B98li+HURC16lvNbocISD3izqsu0Tpr1s/EAGlw1M4Srsg9W
 +wlsnqCnKdV/O54vhljJDt0bjnk+qD/LebNN2EoQMZlOWb6SbqjafX3cxuzJc3keA==
X-Google-Smtp-Source: AGHT+IEL6WYgWgAsAS3PHWRDN1lRfr1kbwlyvEhwDxgDCEbVvA0u6ZVZZayFWUSBimR5Cro/M/VtWQ==
X-Received: by 2002:a05:6870:3b83:b0:3ec:48ba:8f3e with SMTP id
 586e51a60fabf-3fda54199bdmr11547905fac.49.1766971406121; 
 Sun, 28 Dec 2025 17:23:26 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaac129c7sm16622626fac.21.2025.12.28.17.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 17:23:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 18:23:22 -0700
Message-ID: <20251229012322.3160158-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766971406; x=1767576206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YPyz5y8WYioDR7csBrsdb2NUb4jCSOFfNK2HFmwLmxw=;
 b=Jo/dA4Mq4DiLQlARdoZWFIETz28UxufmVLGJ3fajXzxKFuOx554pvg+ukQeFPocuTf
 WfewiuVmNvywB9hlPAvjEaUYGfftSbmffylB7JY7im+JpAbrJ9qL9jOIQ6XJv9CkhS36
 aZfBRtYzuq3IhZiLiVbgIgssYV6ZiLI62eAwsqJc9a07d4AV6fvWSmozQ4nBh+P5fqTM
 mtzA6ymQ6qz7LPguulXzyRrHAv4bL0xL8TmCxIB3fE4lgG2JVn9A5zn1On2b0ldg0LIR
 /nlPHZIQgFAhB1gxcrIlbqfRUQpL/dWQRyZwOvUQvCcWzrjuNws9eaZ3EOVeWzH48rML
 SUjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jo/dA4Mq
Subject: [Buildroot] [PATCH 1/1] package/python-ecdsa: bump to version 0.19.1
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
 package/python-ecdsa/python-ecdsa.hash | 4 ++--
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index c523553657..85ba70bc6f 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5  3c9234e8b57eea26d88093f18d2aa358  ecdsa-0.19.0.tar.gz
-sha256  60eaad1199659900dd0af521ed462b793bbdf867432b3948e87416ae4caf6bf8  ecdsa-0.19.0.tar.gz
+md5  f23885cc901dfeb73d3eb56ebc80dd56  ecdsa-0.19.1.tar.gz
+sha256  478cba7b62555866fcb3bb3fe985e06decbdb68ef55713c4e5ab98c57d508e61  ecdsa-0.19.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index 8fa2c431bc..c94cc0512d 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.19.0
+PYTHON_ECDSA_VERSION = 0.19.1
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/5e/d0/ec8ac1de7accdcf18cfe468653ef00afd2f609faf67c423efbd02491051b
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/c0/1f/924e3caae75f471eae4b26bd13b698f6af2c44279f67af317439c2f4c46a
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
