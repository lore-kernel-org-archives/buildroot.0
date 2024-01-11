Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E7BC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD91A613F5;
	Thu, 11 Jan 2024 05:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD91A613F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VkqCWmhaVN18; Thu, 11 Jan 2024 05:17:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF5C161400;
	Thu, 11 Jan 2024 05:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF5C161400
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E38FB1BF23C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD340423EF
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD340423EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id veBzGp0g6fWT for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:17:30 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAF9E4226B
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF9E4226B
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7beff81df32so28329539f.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:17:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704950249; x=1705555049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zDBOX1ErpzZIKBh4No42TTbI8k0k3hbNxv7V0Baq3Zk=;
 b=bHVqM9JsR5fm2R5igVwyfuffKz0On/DeXeT/KZOrWJeCfEZ6GTwkEn4T2iv0V53DDt
 rgrjTmhmMW1xHo5ySoaeRtbZVG80hA2dUeCcL4mFCJ8CIYKq+CurQKLKyKGSQ0RCAmDh
 dTracXX0hSIIISoH3w2wjn1KE2YCmdYdP2YvGrvvJcP7An8S57/CnPZEV+Uam/B90k8B
 FHRk//KhmP5HbnBj2z8s3gH1vPxvZq3Q8L8+O8nz0biHrYCfrQzEkR8TFLj8g8boF56D
 BUcZWqoTp2olo6LtKFKCVxiI5svu+ZEyisWhFIwMe3bIwGee1cqSU/ce/R5a8pvoBZDf
 4aBQ==
X-Gm-Message-State: AOJu0YyEv2bav4IvFWQgCbYKg3MDoFhdg9r4inb47VkZixu/E4lGbAw1
 5aUIrbL24Pfkp+IJzypWC2m5i5TZI02pcA==
X-Google-Smtp-Source: AGHT+IH9vEJJ/uWmpoNRPA1O6dJ4jJ4JayI5ScRSQJ1b4UzgYWfm065LLGpXfv+fnBEEagpbJCWQnQ==
X-Received: by 2002:a6b:7303:0:b0:7bb:6ce9:d958 with SMTP id
 e3-20020a6b7303000000b007bb6ce9d958mr810335ioh.33.1704950249266; 
 Wed, 10 Jan 2024 21:17:29 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 k20-20020a056638371400b0046e255b3cf8sm106330jav.115.2024.01.10.21.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:17:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:17:26 -0700
Message-Id: <20240111051726.2918732-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704950249; x=1705555049; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zDBOX1ErpzZIKBh4No42TTbI8k0k3hbNxv7V0Baq3Zk=;
 b=AkZK35tU80owoGQdMfgNale/XaQUez8dvajkHQZrDS9N0hi+KT4oduzIbnflCZHr7P
 vnso1cNMkW7tFFWq2+tf5PSp8FKLcO6ds0khKEhOV2n6gVvP+GctpO2YreppDaPRi5kJ
 W93Zx2yNi7F4a3d/lHASnqAi/3iTl/AqosbPb46Du8nsT5IlO+tqHlTTooFZ4Kq+SGeh
 xaNlKglbtZ8BReoTD/edVICy8x6ABg3uKG9vE+B9ytnGgET9BSENURswrP/7oNFogh8+
 6K2DuU79aNFillLakVGiXgnbcTlSjQjhhWpYik1yv5zRQ8too3LEmJhFrV9k/YrEwdrA
 yUsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AkZK35tU
Subject: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.16.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index b04aa210d3..8c4b6181d0 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
+sha256  861b1fa8c37819b2e2cebbde6dea66ac2fa1247e4a7c3933dbf4c89244d7fecb  rpds_py-0.16.2.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 6f71d02047..5f0d30d002 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.12.0
+PYTHON_RPDS_PY_VERSION = 0.16.2
 PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/75/be/e3f366aa4cd1e3a814f136773e506fc5423eff903ef0372a251df34e6e45
+PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/c2/63/94a1e9406b34888bdf8506e91d654f1cd84365a5edafa5f8ff0c97d4d9e1
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
