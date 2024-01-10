Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E835C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2664141BC3;
	Wed, 10 Jan 2024 04:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2664141BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbeWbOrMtl37; Wed, 10 Jan 2024 04:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D40541BBC;
	Wed, 10 Jan 2024 04:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D40541BBC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA301BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42D1B41BBC
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D1B41BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0eU95u0bO9j2 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:46:05 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E0B441B93
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E0B441B93
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7bef44df5c6so10717139f.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704861964; x=1705466764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JUSpLsCe16blgZWfOH+PzBSsulsHoqvj/uKhL0giyrI=;
 b=p4yAJR1OsuHgT5I0SeUlMK95nTBzJB6/UUksVx6QE8pY7nm5y7awzXBF5UkWzhRwtw
 EgXHVM86MmIIIAhCawpng1a/PyJ7O+SWAplT3u3YDfnZ2WiLOG0NEfjX7+dHrxaaNAfa
 CvCFRmpGmiBWr4d5avcvdx6FI5xcFb01nZwofZ8vLj3wDUQbcrJFe1pEHx7vsJbDu8Ks
 ZMh9DNdqgFGQAd8yEpwClIU1T7q2OwBMFXLRglYqZXlPbAeqUK2qgEs0oOMNx2+Gvsbp
 DwH5MAlmccb2JFLuabu8CVpllXkci6//seUiAfJXxmNoaO84VLgWG+VmaMt+ko6zkVjM
 ToTw==
X-Gm-Message-State: AOJu0YyvCFP950G/pYxrma/HsCh6ypKpCc8ruDWkAyg6dhMCoU231Yvw
 L7IhRRvD245bWjHKBuABaqLt5WCn4XArBQ==
X-Google-Smtp-Source: AGHT+IHpsAmG9KFno6Kmz++dYGFxQH2M4lKTuc2GhkhXY7k4l0CJdKKx9LAvCwGNQuPX69cv6nAiKw==
X-Received: by 2002:a05:6e02:1847:b0:360:73de:be5e with SMTP id
 b7-20020a056e02184700b0036073debe5emr590681ilv.14.1704861963935; 
 Tue, 09 Jan 2024 20:46:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 a17-20020a056e020e1100b003608939659bsm1020064ilk.72.2024.01.09.20.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:46:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:46:01 -0700
Message-Id: <20240110044601.1084866-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704861964; x=1705466764; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JUSpLsCe16blgZWfOH+PzBSsulsHoqvj/uKhL0giyrI=;
 b=OMAKduthFovg0rDx1M62519O4wkZ9S9BvuTxHo3BAfA3TC5xZxDu00wV54siMJy7vq
 X7/OQXrdP8Rf1ANrbYLO80B/jd2fPqZvY5CvkZjT2UccjrRKtlkuMldtHotuu11PxIos
 SjmPCKPfIDyQkEytCW3A6IOME5sc5H3+v6lRTninDapYo13s+wxdn/1PBWMefUItamGW
 a887B6g6Y4FAf4AaT43/V0VkBzS+GUIrL4guQQkWOwIda4BZGeAd61gHmLRyugqUfh0E
 MSm6J28yRYWoTATPNs3KHfUZK4LNn7Q0Zu/VKx+Kfe3VAWH11wPUztG1I48UNd2QnXX0
 EDxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OMAKduth
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.19.1
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
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 2b74e03e76..10447fd800 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  0dc96e1ffb42c955d89c2ce3f3875c9c  pycryptodomex-3.19.0.tar.gz
-sha256  af83a554b3f077564229865c45af0791be008ac6469ef0098152139e6bd4b5b6  pycryptodomex-3.19.0.tar.gz
+md5  db8f8d516e0229f503dd111ac4de177f  pycryptodomex-3.19.1.tar.gz
+sha256  0b7154aff2272962355f8941fd514104a88cb29db2d8f43a29af900d6398eb1c  pycryptodomex-3.19.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 0d9855c602..882a90229e 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.19.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.19.1
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/14/c9/09d5df04c9f29ae1b49d0e34c9934646b53bb2131a55e8ed2a0d447c7c53
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/3f/13/84f2aea851d75e12e7f32ccc11a00f1defc3d285b4ed710e5d049f31c5a6
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
