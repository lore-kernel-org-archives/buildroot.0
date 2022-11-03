Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7431C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B63E81EA6;
	Thu,  3 Nov 2022 00:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B63E81EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2uAPVcm8v4L; Thu,  3 Nov 2022 00:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AA8881E9B;
	Thu,  3 Nov 2022 00:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AA8881E9B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0CD21BF95F
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85BBF4032B
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85BBF4032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMg_TUD131xb for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:37:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85C40400D0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85C40400D0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:37:39 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id p141so183012iod.6
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w9AcQozMcxffGEiRkLc0rrH8OVHqTQXbdvOOnAHPFD8=;
 b=Zeq7twtLFk+Q4HKOxVFA00nIImYiTHssnOaoA1ce5/1YECUGaXjuQW3wI4HVf/ElBg
 +gfSzFCCFh/JN4YfPcNGyn//o3nZV/9oD/3pk6v/wO4JUuFxHCWc0KchwB6snHG6aRn+
 T754FnDOQZmO2IpsKaUsUp6fmD4puUTtT9WBj13YbG7i30/zLfC9dj4cOTeyezI7xAro
 OycjYskajHoSvVQA2bEUhYfuaAQm91BBmQrHpJh4GvRCRRPbhKXykE7ohbVo/21nUde2
 ITTE3VUuX2rzkHx++mVqIpu4weMUlYP4SWYw21JkJV40oR4dsYvIf2/junS8JLJUl4d3
 z6ng==
X-Gm-Message-State: ACrzQf1eBy36ZfD1Y8Jp7V9pHjq7xROfk4QCGvUFjIx6cVNSZBiSUN7p
 NdGE4du7qys9Y3qhrFNoFib+jlrn1GXtZg9u
X-Google-Smtp-Source: AMsMyM6LcYGCuJFuB9M22nU3jy/29jVC0hg9fSj5c2X2r4g1AVludZ+6vOyPDp8rzSyjMTrPlYxhhg==
X-Received: by 2002:a02:8807:0:b0:363:937f:6 with SMTP id
 r7-20020a028807000000b00363937f0006mr17642712jai.136.1667435858312; 
 Wed, 02 Nov 2022 17:37:38 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 s23-20020a02b157000000b00374fbd37c72sm5362346jah.147.2022.11.02.17.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:37:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:37:36 -0600
Message-Id: <20221103003736.3357983-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w9AcQozMcxffGEiRkLc0rrH8OVHqTQXbdvOOnAHPFD8=;
 b=myDILoTzfBsEC0uxshfEaWZHbVCrBtOh9SL4EKDpQ1oBWMUiGmZpDjvvQIcypieQZ+
 K2ZAYCF/EX1QP/r9kBbsbaUHckeRas7y5sCUaTqYHsRblA6u/9ZDmPj2gguLoX4oxtPq
 YQ/CpcAQz8KOPALzRMj5KRMhUeA2F1roxHzRpR7BEAuvrm80jC8WfHobUUILXXmeMOdL
 GxKnt8oXpaQyKbpibQnDxdF0TBHTsspfm+EKEioZa3Z8x+SeZQa1ZUd87WxDKktMUuE8
 tMi2tCp+wYSCwHgRw4+MkQonH87KlFCJuSQEfWoxIWbhaqsJvohe4ex1Ioqbdp5PkbN3
 nCsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=myDILoTz
Subject: [Buildroot] [PATCH 1/1] package/python-mistune: bump to version
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/lepture/mistune/commit/991c683584279102a94542b9b46e0637a9b4cb3b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mistune/python-mistune.hash | 6 +++---
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index a7a5936096..161f2ed6ff 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mistune/json
-md5  fb6ab174ece938dea09f8b2adad771e4  mistune-0.8.4.tar.gz
-sha256  59a3429db53c50b5c6bcc8a07f8848cb00d7dc8bdb431a4ab41920d201d4756e  mistune-0.8.4.tar.gz
+md5  a4437edb22cf6519a7c61730fecb1a3f  mistune-2.0.4.tar.gz
+sha256  9ee0a66053e2267aba772c71e06891fa8f1af6d4b01d5e84e267b4570d4d9808  mistune-2.0.4.tar.gz
 # Locally computed sha256 checksums
-sha256  0c5259c3dd0a7c46f4835221645f62a0638c9b9faa02af08676e8069e1ff964b  LICENSE
+sha256  539013fd8e19f744f8bf0e27a532bbff54cd689ecef7a800f56ae5dc824be870  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index 6beb425837..1e4bb71903 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 0.8.4
+PYTHON_MISTUNE_VERSION = 2.0.4
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/2d/a4/509f6e7783ddd35482feda27bc7f72e65b5e7dc910eca4ab2164daf9c577
+PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/cd/9b/0f98334812f548a5ee4399b76e33752a74fc7bb976f5efb34d962f03d585
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
