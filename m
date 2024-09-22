Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DD9CF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 03:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2B59400E4;
	Sun, 22 Sep 2024 03:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cj6M6nqybebL; Sun, 22 Sep 2024 03:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CE3140124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CE3140124;
	Sun, 22 Sep 2024 03:41:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECCA11BF292
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC77A81570
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Phks1zv6-CpH for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 03:40:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCA3681521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCA3681521
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCA3681521
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:40:58 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-39f54ab8e69so14564505ab.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726976457; x=1727581257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q424Q+fIRhj1AtgoOoPO3qNrJFkoLrmqmcBpfk0jkVk=;
 b=jcuaH0njU3Nd+2ze2aBNX2tMEYZGJ/xT7qcaIqzWCuqWsI16PsDb/LGh91yOX1XQ+W
 zwjhDAbQ97Aj73S0GBx6LyfyzQKDRUVo5/0+UkY4Ub1Vfe4HwubEi5o55vEkWG4AXtHC
 z9EsXL8qLdSgXZYP4yMozdoJkLNgKnA21GcwRCLxSgqiBbjIop6ve9nb6OsOZXjuqmB9
 l9lQnCwIroK6jTG/dOZ8p4lsxgc/ULm5gn5KluCSb1KBdVoFS3kaJnpyK+vcC0fYIPu0
 bHg+RPi68tiupBCyvT2I3ujXqA4PiwGbEr7HP6hBb/DdWMZPA1H5X3kWXeLroet6GH74
 25Gw==
X-Gm-Message-State: AOJu0YxREo6tAP3dG3zEeZ9DowgngnNApLtW+nTXuDkO/1snyJNRuDDl
 SBeMis+Q9kHsT8f3o2c0WloLPYN9Ky4LCIr3e1TpFO14bUsKQF0dpeiNpA==
X-Google-Smtp-Source: AGHT+IGG3xOdIozHh/eqEogeiB2o1oAvCFt+mFfhU6YrZx9e0KfdfRHybBYAsIG8Mwjs0ZbB7ZKHjQ==
X-Received: by 2002:a05:6e02:1d87:b0:3a1:95d9:6f36 with SMTP id
 e9e14a558f8ab-3a195d9710amr13351815ab.13.1726976457464; 
 Sat, 21 Sep 2024 20:40:57 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed5994bsm4370626173.179.2024.09.21.20.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 20:40:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:40:55 -0600
Message-Id: <20240922034055.849037-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726976457; x=1727581257; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q424Q+fIRhj1AtgoOoPO3qNrJFkoLrmqmcBpfk0jkVk=;
 b=eOJm+mH1w39Jl6vKYL+7D5iI6h/ncYnWreVlCqfB8SjJAQKVqz2T+YPRjk+ztsliC7
 UU/o0JemCFPgIkD5VDOURODhqrqMwwFQR/tT3iFY93NMfz5D1Gxl0PSMDNGwOflmNy9G
 xrkQ589EZGcTXwY6IcdGJnfH8QX3stKKFmyQdBdQVTRyDcOzPYNIeQZXXepB4ZSXzP18
 gdR60cm+Fr0QgjyXQIJVPllFfK6FI338P0tpQ9xsRtT3cCHv1eD7eDhRZW6oRKmJnKIh
 b/cDh80yNYTTslGZRDM9Wwev9DeWyzNiATLzVrfQunWD0sYpDFYkDNSMp9m6bqUM9PTf
 pGmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eOJm+mH1
Subject: [Buildroot] [PATCH 1/1] package/python-thrift: bump to version
 0.21.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-thrift/python-thrift.hash | 4 ++--
 package/python-thrift/python-thrift.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index 0907a6e88f..042c801b88 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/thrift/json
-md5  486887192acd558636a1528dfddf918c  thrift-0.16.0.tar.gz
-sha256  2b5b6488fcded21f9d312aa23c9ff6a0195d0f6ae26ddbd5ad9e3e25dfc14408  thrift-0.16.0.tar.gz
+md5  1e7f196bad9e3ce3f9092a38f5287d9f  thrift-0.21.0.tar.gz
+sha256  5e6f7c50f936ebfa23e924229afc95eb219f8c8e5a83202dd4a391244803e402  thrift-0.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  35e2508f171c3ac2529f402c123c12f3b2ac91643f2e52b334f71f8c861be321  README.md
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 23a2ad0476..ebfcff0e3c 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.16.0
+PYTHON_THRIFT_VERSION = 0.21.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/e4/23/dd951c9883cb49a73b750bdfe91e39d78e8a3f1f7175608634f381a197d5
+PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/33/1c/418058b4750176b638ab60b4d5a554a2969dcd2363ae458519d0f747adff
 PYTHON_THRIFT_SETUP_TYPE = setuptools
 PYTHON_THRIFT_LICENSE = Apache-2.0
 PYTHON_THRIFT_LICENSE_FILES = README.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
