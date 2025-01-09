Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426D9E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 21:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F23E0408C0;
	Thu,  9 Jan 2025 21:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2_8FoVi9lwM; Thu,  9 Jan 2025 21:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1EC5408C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1EC5408C8;
	Thu,  9 Jan 2025 21:25:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C05B2942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A3B760BD0
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjRaO-dGkb0q for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 21:25:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A50B760BCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A50B760BCD
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A50B760BCD
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:25:26 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a816cc9483so7886435ab.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 13:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736457925; x=1737062725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pjl/7Pg2C4s/KHen6Te4mnbTVrd38YBCy+1IIut6ERE=;
 b=JU2DiZnWn3cWrEVJjAIQE+wtF+xWcvhLNRo5hP648+V6AN9J7byEq68TLJYVvGUVT2
 RtaaV5FYM5oLrXWsuauVBqow4qs2EEnUa9jcwHOSyCfM2wDt8qo/2FjS/btK68Y1x7iG
 Qfo/sEUPF+5FfgYRA73VfceX/MQr0S2mzAQYRuLtUHqdH9wv+zwE7ogaO55osc2NG/4l
 G5PFWFguF0hTOQChdHJs4Wn/RBuPMLluMSaqiHf7/wG2ZO6Z8KXlxxcXs66tOHhH5LU6
 j3jE/+dPVYERdK46yhOHl7kKDpxLJKewythQ7h5UVW29qyG7ERY3j7iBOoTKZS6Gq8s9
 V6bQ==
X-Gm-Message-State: AOJu0Yy0xcVWArRD1TXbRyzrJG5Rdm1ip/4DSmf9fVRnhJxIuw15I5l9
 LeHUloURAWyyo2jNnKC6POnLOko8HeQn6YxxgEGK7a6UrHnDkjMOmX2sFgDuiYI=
X-Gm-Gg: ASbGncv8PmKSWpvzMY8Hacy45ki+KHvUydUkjNsisXwcIHpzfGw3PB6/l8mOSvFhZPB
 RnnSnYtRJbBg8r23zIkvkF+2rwnS5kVgKnTH8V2hlcRBbZJ6N3Od02kpA7ioof+sOHAlFHkjlbg
 jXBZbekj9o2Tc41RH/CNKsyZPKnlC31IgaOn6fLyc9eap0QPSCLO78foNLJlO23AVAi/qI5w3Cd
 dw8LsbT8Hk8ml2oxs6Yy3WuPQlvl60N5BE90fnICtD1KRYqc61KzGja+K7+7F/LUG30VBElYzd+
 uwqnVPAXZY54Afi19vpq4sMmI6QGl10=
X-Google-Smtp-Source: AGHT+IGzZGwdvoC15I8YFyEEKDBLjDOdVpW5eRp4UO4MoDaBGIo9v5waS7deoFwHcO0v/4cxiJ84Kw==
X-Received: by 2002:a05:6e02:1885:b0:3a7:e0e6:65a5 with SMTP id
 e9e14a558f8ab-3ce3a877e2dmr59572565ab.6.1736457925529; 
 Thu, 09 Jan 2025 13:25:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717d59sm511543173.97.2025.01.09.13.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:25:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 14:25:23 -0700
Message-Id: <20250109212523.2404872-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736457925; x=1737062725; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pjl/7Pg2C4s/KHen6Te4mnbTVrd38YBCy+1IIut6ERE=;
 b=gy1h3hUbC/ndPh+/EzfPXewzyDYEmkjP4xKtUzFQVfVD4mPjKFMd+ZkKRKmIVojJRR
 a5cdeogJq2FCfPvZFoj5FJJ1XE4FknjkY93X6DURMPEFVMP5bgF8G2x9W4bywRVfv09Z
 hYOtPCwR9iQwSwXgxD1U53sH120QQOaWvXO2mzMmOTSvDQGQiLd2vcGPHuF4FAuVHO6S
 +O2RWVuZyLTDesPOyTuAdtzNl9R0gtk1a1WkDAYHhfo89b7igrgGDQg9FtwA7xN0vX3I
 H+xF1Kky/0hI/sJs/aqX2QOWgLlnYf9nMsSamKOoE9rr99LEHjKLfbf26rV9V7MwjXoq
 4Wxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gy1h3hUb
Subject: [Buildroot] [PATCH 1/1] package/python-inflect: bump to version
 7.5.0
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
 package/python-inflect/python-inflect.hash | 4 ++--
 package/python-inflect/python-inflect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-inflect/python-inflect.hash b/package/python-inflect/python-inflect.hash
index 8b373b8a7e..1538bfa178 100644
--- a/package/python-inflect/python-inflect.hash
+++ b/package/python-inflect/python-inflect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/inflect/json
-md5  7201084aafe65ed5925a8f055f9281a7  inflect-7.4.0.tar.gz
-sha256  904baa17cc2cb74827a6c27b95692e95670dadc72b208b3e8c1c05aeed47026b  inflect-7.4.0.tar.gz
+md5  2b4c0c942b110c587d8cc1acfb606882  inflect-7.5.0.tar.gz
+sha256  faf19801c3742ed5a05a8ce388e0d8fe1a07f8d095c82201eb904f5d27ad571f  inflect-7.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-inflect/python-inflect.mk b/package/python-inflect/python-inflect.mk
index 926f2c43ef..21e87aea35 100644
--- a/package/python-inflect/python-inflect.mk
+++ b/package/python-inflect/python-inflect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLECT_VERSION = 7.4.0
+PYTHON_INFLECT_VERSION = 7.5.0
 PYTHON_INFLECT_SOURCE = inflect-$(PYTHON_INFLECT_VERSION).tar.gz
-PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/e1/dc/02614acece4d578e709c606594c989cfd9f15cf6401444e5603e60df9b26
+PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/78/c6/943357d44a21fd995723d07ccaddd78023eace03c1846049a2645d4324a3
 PYTHON_INFLECT_SETUP_TYPE = setuptools
 PYTHON_INFLECT_LICENSE = MIT
 PYTHON_INFLECT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
