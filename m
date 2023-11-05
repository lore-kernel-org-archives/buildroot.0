Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86E5C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 01:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D07E403EA;
	Sun,  5 Nov 2023 01:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D07E403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pv6H6wXU_2Gx; Sun,  5 Nov 2023 01:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AFAC40424;
	Sun,  5 Nov 2023 01:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AFAC40424
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37CF61BF263
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1123D821F3
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 01:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1123D821F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MP6l4MVbYePc for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 01:33:44 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12949821BA
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 01:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12949821BA
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7a68d1698adso88604439f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 18:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699148023; x=1699752823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tj/KNW45O0srBAPTJu3yxwrkOtFGyiQM7+w2xP83pbE=;
 b=QAj2Sw9PYg0yYy5Qb0OVQqw8u9RGYlwwRPtywi3nG3UKmdeBcdLTdnsaN9nvJ+3OuB
 1STElohTROEmdcIe/Omm5qwe0iQPoP7gCsa5+gg2zeZ+wRBWMSiOPoyU603ik+MNDz3q
 QV9RHVZuwfTHfrjIj3tlB4hsmCMqh32lIyU0ze8OjrHuUdvNlyU/TqX2k/4jZd1j32fb
 /n5kCYi7yhdhrjVh//7Neg+iCtg1PL0KwdgXLJHrsSAXqRXbXwphmBClHCRAwMTSXPwp
 xZjrdenAvl5w3X4jsyhKAUK94h/ipzxx/WOu6/8jKlWvHfF3Ru6yonqQfNe5dF95u7bv
 R3BA==
X-Gm-Message-State: AOJu0YzcmQxBNm/HPlZdAH7tQWox4aJ5L/L3S00RTeMLdod7wc+nIbqZ
 wHqcSLEChRQnnr50hK0Xh43foc7FQzI=
X-Google-Smtp-Source: AGHT+IGFcVU0ACLh8Br3GUk3KMFKTh15mY7Eif4eC6gB83AD6FGHsM/sd9AhKXUjEoyqIPexB6qosQ==
X-Received: by 2002:a05:6602:341b:b0:795:d33:861f with SMTP id
 n27-20020a056602341b00b007950d33861fmr6902582ioz.6.1699148022749; 
 Sat, 04 Nov 2023 18:33:42 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 b6-20020a02c986000000b00430996b3604sm1384670jap.125.2023.11.04.18.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 18:33:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 19:33:40 -0600
Message-Id: <20231105013340.2716989-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699148023; x=1699752823; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tj/KNW45O0srBAPTJu3yxwrkOtFGyiQM7+w2xP83pbE=;
 b=JxSqhsVVOXYXTJwG/WaeRvL7u0sCohcrWSY9xQ+7Y/gDmsVAN0G7Z84xl/uDt4c9Zl
 Zlemcmx3sc+hm5LjWzeX6CzQb5Ps8rfcgnAU0ZMqNIENWAmRBO/Q0oDW9UUJtGpKsI8j
 jTIQEAKMsZ3ZUqJf1DFs1QtAnBlFHQjVd3qPdfVUqsWjYxTwkg9kYeMXd1+csq6mJkHI
 RBNCEyCqxLcRdQFwD7JLDo4Jo9AgROxm9fxDekTLN+i8EcZ6SytFRPtXffNHW7WC4JqS
 +T7Ctxjk1blyMpJwb2XRxHNi+lmlUfYypv55UgFEphiL8ZTHtA3bRjq6Bur8rOTTzvY/
 Nhig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JxSqhsVV
Subject: [Buildroot] [PATCH 1/1] package/python-async-lru: bump to version
 2.0.4
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
 package/python-async-lru/python-async-lru.hash | 4 ++--
 package/python-async-lru/python-async-lru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
index c6f11aff1d..0a7cd03be9 100644
--- a/package/python-async-lru/python-async-lru.hash
+++ b/package/python-async-lru/python-async-lru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-lru/json
-md5  825ff7d35d1cd76f1b1ae44f38bf69f5  async-lru-2.0.2.tar.gz
-sha256  3b87ec4f2460c52cc7916a0138cc606b584c75d1ef7d661853c95d1d3acb869a  async-lru-2.0.2.tar.gz
+md5  cd57e4d7f51bcbe2b940c523a5851b40  async-lru-2.0.4.tar.gz
+sha256  b8a59a5df60805ff63220b2a0c5b5393da5521b113cd5465a44eb037d81a5627  async-lru-2.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index d707249e29..16c6a32ffd 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_LRU_VERSION = 2.0.2
+PYTHON_ASYNC_LRU_VERSION = 2.0.4
 PYTHON_ASYNC_LRU_SOURCE = async-lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/92/16/be197573adca3d584dbd64d508488e95e36324ea036d751564d2f88d74bf
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/80/e2/2b4651eff771f6fd900d233e175ddc5e2be502c7eb62c0c42f975c6d36cd
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
