Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C26FD31765
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 16:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F8380524;
	Tue,  5 Nov 2024 16:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UHMJpMOwqM6; Tue,  5 Nov 2024 16:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3251280C99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3251280C99;
	Tue,  5 Nov 2024 16:46:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37FD8B8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 195DB4038A
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLQhoLsIRJ9Q for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 16:46:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95A0B40388
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A0B40388
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95A0B40388
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:46:45 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83ac817aac3so212284739f.0
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 08:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730825204; x=1731430004;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sX1ofj/sipPqFGXf1CVP+vO07PyThV3qwBiDeVofxiQ=;
 b=vco9PEzMDX/IXSdPZUd5bznUnI1pfKTq5dS5teV7k7IwKvH7laZExBRV+ZiLrkqANK
 AnpvtTMCz+K7/FkLzys3QSJSJ6WueU/ZPZg2VucdU9pPZuUQ+WISjqk7bzpeVy4H/zEH
 NLOs7l0kk06zB/mbjvuF+0ATN1KHKlUDsjIQI29fIzJ7yrWCdU/inGzjRPldZKw9UDh/
 X9QP5B6oyL9W1W8uAqfs+xGaFh9i1w0FUq3zPKQFJvuKyUq6te1qsWAd2eDOmT8S8Cme
 PWmnTkdXhnjXcIRUUZ+4Mvh2qfrW4zkUg4OW2t7bxPU6ivNTr/m2UpStFbrp6B7L5bV6
 PH5w==
X-Gm-Message-State: AOJu0YygkdP7lVlnKp9rn5Bhv6aCBxsGKPI41q2Qh1FY7MYH0MmDSdQN
 du9Phfs8Ye49mLAd42asG4bUyDe2KCslvcWKqEK1kTgB4FB8A8U3xsAhfQ==
X-Google-Smtp-Source: AGHT+IGigJnQ0/3Go9P8bGYTbAU6KclLkqIBBbo1289ZPowVLg0T4SmC2aefqSGEtOp2+6A/jlVEuA==
X-Received: by 2002:a05:6602:3fc1:b0:83a:b74c:800e with SMTP id
 ca18e2360f4ac-83b5676f6bbmr2553019539f.12.1730825204344; 
 Tue, 05 Nov 2024 08:46:44 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048bfc01sm2490531173.58.2024.11.05.08.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 08:46:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 09:46:42 -0700
Message-Id: <20241105164642.1381675-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730825204; x=1731430004; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sX1ofj/sipPqFGXf1CVP+vO07PyThV3qwBiDeVofxiQ=;
 b=CU9VLvvEtMmEzAc+XDA0SjuXqh4ZlGyQ9F6rhCYhk+5u0KMGzDW8H8FXwGUaZH2U6l
 0wAM4jpfFP8JlCZfh5E6VTxh3OuV8H5UDCcge80NNC5PVV02CMFho2TXR3jYYzV0wj7E
 6sovKh9jjQLv4eZgE6ivIjYsOMHVSunCIlbRzlOrjBCEhrMUtGDT73cmywZ8YAAosFKa
 YOtSxyQuCtg4OZ2vitvLQ7ySxEKYGHS14Nv4mZ3N9LqGpw4tkeMYE/dzFzRngf7eMkZn
 dtadAkk4UZtKU8hLepYKxyXJWeUzpPToCkySo89EFPBjgrgQTxPijxtVH4gT9P8CaVya
 Uf/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CU9VLvvE
Subject: [Buildroot] [PATCH 1/1] package/python-rsa: use poetry setup type
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rsa/python-rsa.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index 69a6309b19..f1c6cf5f3f 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -7,10 +7,9 @@
 PYTHON_RSA_VERSION = 4.9
 PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
 PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/aa/65/7d973b89c4d2351d7fb232c2e452547ddfa243e93131e7cfa766da627b52
-PYTHON_RSA_SETUP_TYPE = pep517
+PYTHON_RSA_SETUP_TYPE = poetry
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
 PYTHON_RSA_CPE_ID_VALID = YES
-PYTHON_RSA_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
