Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D77BC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF40607D3;
	Fri, 24 Jan 2025 21:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnpSq86N8h_e; Fri, 24 Jan 2025 21:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B106F6081F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B106F6081F;
	Fri, 24 Jan 2025 21:40:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24A69941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12A88608A1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yXIE0HG7IHI for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 21:40:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E7586081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E7586081F
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E7586081F
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:40:04 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-84ceaf2667aso172683039f.3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737754803; x=1738359603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pIX0Z4JuN8CSPtq3cOvfdrG6EVjUbbIzzuDvsx6EYws=;
 b=IxExPbxtmpyLAx5j9y2+L0oFBWA2HS/s7GPLUdDvg5MQjid/LmCPd7HW8I38Zub417
 mZz0DCCR86lhQM0gYP7juB/8Qxz1osI/SkysO8qthC3m6o5o2ywP8WD+bG5WIn7771YZ
 LEvsUnhG1lH55WtilBblaV8ZnOu4d3Zxph4HcPY1sAp7jHTtrvbG014hv73JvClwc1jU
 h7C1a4yWOvL8oNbSSyUQPgRSDjZQdeUwUc6xkJXNLrBMeXr1/G/KYeTPzd4hX8to7EZP
 clZBkDMKuHw5Kth4OUkaHukXhUqkpECNeTC2HEGUn07lCyx0RFkXuB4fkm5yKyLn3bNY
 TF+Q==
X-Gm-Message-State: AOJu0YwBFZKnQktedgwlJL4e0tl1AGjrBXns9nHeT8FxZ2uL6FiegUit
 /6khph6BdbqfJMcO5mIGrjTQcV7pEhGwN6YK+zNHUaSwqOTzDKJ8WG2TC0t5
X-Gm-Gg: ASbGnctnx+W3wj8JYJAddoNZ5Vcn69ZTvoIP6+J0wErx2rB5BlHuonAphEeL8JqPPpV
 DYcEpK4j0walxwMVX5uhQjSsITb1aX46pz6MPAg3eaBubTAH7FtHwTGvyJIft0f82mnLmdylyFa
 X0Tfr1DP6eH4JpdDI+AsDN/ExAsbOioHNf+CC4uUd/qDxjQNqjTLx9LvY7zNASPy/E2ZUAGsWSr
 HwwbwDlCqr/iYwr+7Lfy/e0+02rlBby72N94Kl0qhqfEiobMsWvrfSBo8WVRK/zCDqTq/H0zwHt
 PLNpK638960h56JBhhC0ujSFsEkOsGn04m4jd2vPpf4hRpTKsgsoV9k=
X-Google-Smtp-Source: AGHT+IFYmwGCK8R2VVOS2dKob+8PnXVxO+PYQtliU8XGZZUGpzYk/GcyO4mfubO9+EJpAEn13wdUGQ==
X-Received: by 2002:a05:6602:3c4:b0:84c:e8ce:b547 with SMTP id
 ca18e2360f4ac-851b62b1e17mr2758671139f.13.1737754803663; 
 Fri, 24 Jan 2025 13:40:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db85d43sm875732173.115.2025.01.24.13.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:40:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 14:40:01 -0700
Message-Id: <20250124214001.3880942-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737754803; x=1738359603; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pIX0Z4JuN8CSPtq3cOvfdrG6EVjUbbIzzuDvsx6EYws=;
 b=NP3GO7UHNlemEIBPD2uVUHeSJ0o8jgNFzOM5yox3G2xaMjmf2Td80rieBAssoJlPuo
 hsQDmsn4F0mBbYxAuWi3H4wCWCF4BsIq+/sPsM3tJyO3WURQxR93AewPEQ0lX/tHI4XM
 LY9y6y90SaLV5fC+/7XEtRAAXzWy4m/PNjkO37GXGMgw9d3T+YxN4tOqBbViBxKKrpfD
 sHWHPHvvYdDn3hQz+UaLu/q3/QMfMgSTSDV443lLzOnsaF2wglSPpVVvy84EKOQlW1eY
 qYPzMhfnp8ApeQHJl+0i4rV0YWc5YcEm8hEaUuupIK3Z/o5+c8pEiJNOw2gviPpRLcl/
 litg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NP3GO7UH
Subject: [Buildroot] [PATCH 1/1] package/python-zeroconf: bump to version
 0.141.0
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
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index f190d5ff6e..cf49e6f21e 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  ce24b798377f12fb3def7ebbc66e4e57  zeroconf-0.139.0.tar.gz
-sha256  2cfb4ef130aac602c9ed428a52243597ed248cf0d22ac4e2b21d90541de90684  zeroconf-0.139.0.tar.gz
+md5  13003da434beff520db50460d8d603bd  zeroconf-0.141.0.tar.gz
+sha256  c0c41cfe1331cf885f132dd2400e4091f59ae0a571cae14f3db66919a055489b  zeroconf-0.141.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4d1d974999ae8655ee47afb47ac3b327cd1baeea3509aecb35341ba1a1a53c94  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 3a69afeab4..7f14651b86 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.139.0
+PYTHON_ZEROCONF_VERSION = 0.141.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/5e/77/1db96e97567a1ffd8393a42959fa783ef66fc91d19ac9f7c75fd3be14661
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/d1/36/78f2cc563958d55b079c977ad2d4ae5d8b182f2dab9f1224d89c9b1311d3
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
