Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7031C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C7424109B;
	Tue,  9 Jan 2024 07:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C7424109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9J-hEKzJrzuR; Tue,  9 Jan 2024 07:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C447040998;
	Tue,  9 Jan 2024 07:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C447040998
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64AF51BF59C
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 393676108B
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 393676108B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FE6LsbDMHadf for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:48:07 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 366C561093
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 366C561093
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7ba903342c2so219698839f.3
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704786486; x=1705391286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uaSXzPcVx1qDL7GF3qR8gzdA/xV7JNO7shCac3fUeQA=;
 b=iLAsQ8nCeQ5Vly8pQ4umbGbeDHKsekRTj98rw52lPjtgZNpbT4wJZqMTQObdFeROjB
 saGTsqcUk0p5xb2QRc3UWsDqFxv+SwUhEkpunTGWgMUZ6Qnf7B+g00tWH7pEf4Vf1dGf
 4+Hco1AxZb/qbBBbJoJHiJ/HX1NhMPOlNtr9kAPgKIPYcXM9gQiHOBaPgzDqmYd9wGUv
 d5ZqYzsunUlBO8jH5zwnCAkVk0NROo/yUVkrHWfVrDsA+Sabd6+Iz3PSaQ9FWJkviSfw
 8Gvss8hafr6h7RJ5dJLjwMMSGO56s2xWpTnhY2NqFq+ZJAE3MVVzvVT0jdvULsrIkBM+
 ZuNw==
X-Gm-Message-State: AOJu0YxLRQixtYHdMO6ohEctrT0NTMB7gtbs4cIkbMI0F9shR1tbT2rI
 lNzi6Gp/9LB6711vq3WVFkZcmXS7Xjj+sw==
X-Google-Smtp-Source: AGHT+IEtQi9DTZwD8O8qMWJLHXE0EofVrwyuqLx96uykFeKRcRd2W04n1UxFIoKrJalouvBiXJm/7g==
X-Received: by 2002:a5e:8b4d:0:b0:7be:427c:37da with SMTP id
 z13-20020a5e8b4d000000b007be427c37damr3512030iom.27.1704786485569; 
 Mon, 08 Jan 2024 23:48:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 n26-20020a6b591a000000b007b7f3506685sm375184iob.17.2024.01.08.23.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:48:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:48:03 -0700
Message-Id: <20240109074803.4049179-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704786486; x=1705391286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uaSXzPcVx1qDL7GF3qR8gzdA/xV7JNO7shCac3fUeQA=;
 b=Tr6FwRxC++wGivM+7Paio/7S+18/FG7DFY3XjadA+Qjlxf0kM+8nH3uSuEoh6VW5Ht
 kKydHjiYDVbwzONNNOdps9m1Le7GiE53vJRYbG/j8uX+rm73V3pYwU5h2TA37CvFoOOz
 TmVAAfMKQCHDNh11mgWX2j1mqs2ZxSKK6LrY9H3SYBGpHJj3XaMsNZ9vTTEU5n9YArIO
 SxbqwZhOJjAIpPMJP1Dm5Pr8/RtQ3YnA3Tl4qzCj09a2bMORJaSMdHzOVWgBAeTModa0
 b2zXjb8mX3towT4w4ydvHcXKiVGd5TByMDS9nkszyBpxtY4S1tkadr3H2+ewEoFKtJ7l
 ioZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tr6FwRxC
Subject: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to version
 1.4.1
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
 package/python-frozenlist/python-frozenlist.hash | 4 ++--
 package/python-frozenlist/python-frozenlist.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
index 466dd6931b..40a87d2ec0 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5  4a14df2fe30853d9e18f73002493a860  frozenlist-1.4.0.tar.gz
-sha256  09163bdf0b2907454042edb19f887c6d33806adc71fbd54afc14908bfdc22251  frozenlist-1.4.0.tar.gz
+md5  e64b421e8e571623695cd414515f0081  frozenlist-1.4.1.tar.gz
+sha256  c037a86e8513059a2613aaba4d817bb90b9d9b6b69aace3ce9c877e8c8ed402b  frozenlist-1.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index 10c6bc6314..9333598808 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.4.0
+PYTHON_FROZENLIST_VERSION = 1.4.1
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/8c/1f/49c96ccc87127682ba900b092863ef7c20302a2144b3185412a08480ca22
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/cf/3d/2102257e7acad73efc4a0c306ad3953f68c504c16982bbdfee3ad75d8085
 PYTHON_FROZENLIST_SETUP_TYPE = setuptools
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
