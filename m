Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60D1C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705A44038E;
	Sat, 14 Sep 2024 22:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWjf5R2EKewl; Sat, 14 Sep 2024 22:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3237F403B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3237F403B6;
	Sat, 14 Sep 2024 22:12:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41AC91BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D06E4054B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLOlAVbbFD3V for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:12:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A50740130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A50740130
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A50740130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:12:49 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82ab349320fso120256239f.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726351969; x=1726956769;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jxIp1Q/OfvO9rgrRsEetyc9MHClKBqcEskhRzEZ+0ac=;
 b=fjwY10mVyruK3cPYL39yAZ+s4xEfkSjes2WIK/Ndcycgl57/C5NhGoWyxRglk7AY/t
 G4UeXCaCO8nh2J9FDZSd9RdJxlypb+uPeraHKyZUSQaDFEyCe5cgmVT49tdpqUUTYKUY
 BEcCaE0vqwGO5UV2vwWFg+kr4RbSRdSd9ZEy9c4/R64wfJK/hUI3KqMDuy+ryUJE7s3j
 8hQzytyyYgD95+s1ddpDYphrBfXZM+7sYiSCQsugPK9XadTGzqh9ih4L8KK1F0A6jbGz
 AmO9VnTX2VvBqfdXAveWtBfrtPtJisS+nfRY220ho3FWPw0Zdeuv6KzxGfUcIEKDFS/W
 DvPQ==
X-Gm-Message-State: AOJu0YyyS2xQrN9GrtqaysrUXxu8s5tKhiUNxbt1aWgo8SjguI+LUsTg
 1nzBQdrTLQewzwwiVQXSrYEfh3QacF10SKJRRmc/zUooMeAd8l+Bgi6RAw==
X-Google-Smtp-Source: AGHT+IF2q8PKSKtEybA2WpbvFVMU5f/Rp11hXiskx78CgM6x3IrFtX6H9sJ7PxwVzVZhg+FeE0oRnw==
X-Received: by 2002:a05:6602:13c7:b0:82d:3c2:9118 with SMTP id
 ca18e2360f4ac-82d1f97f9e4mr1108504239f.16.1726351968655; 
 Sat, 14 Sep 2024 15:12:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed34d40sm594415173.145.2024.09.14.15.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:12:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:12:47 -0600
Message-Id: <20240914221247.1343684-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726351969; x=1726956769; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jxIp1Q/OfvO9rgrRsEetyc9MHClKBqcEskhRzEZ+0ac=;
 b=jSEDIbBJDmwikSZ1Xk1lryQJD3OUrSOcqDascoGgdt7t98T9gQD6eiYGmrLwXDxVBZ
 8ujnKr2JcMQKoSOav3A0V0x+QrSOBgf6J49M0VFVevLp9oytKCqmgqmhhy+32OIhTl3q
 xPIYEerAh7DYGsIqQ+s2aPJkDGL9SFvjdclDD2RTTR7yBBiL8If4gaKTAakZQI3xQE3S
 eYXWcDeIuveYAW5t5UWKqanzANAJn5TQAGYitS1+s9K5+yzFYRUlP6xlCaZj5hFY4C0b
 T9iKhI9VyZDyHmAAYljSGrxEqGMpzqcg8ADlV3LIqHLNHJkGceN5GAPvnQOz/jdJhftV
 530Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jSEDIbBJ
Subject: [Buildroot] [PATCH 1/1] package/python-beniget: bump to version
 0.4.2.post1
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-beniget/python-beniget.hash | 4 ++--
 package/python-beniget/python-beniget.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-beniget/python-beniget.hash b/package/python-beniget/python-beniget.hash
index cd4fa7b873..20f5d4ca6c 100644
--- a/package/python-beniget/python-beniget.hash
+++ b/package/python-beniget/python-beniget.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beniget/json
-md5  a2bbe7f17f10f9c127d8ef00692ddc55  beniget-0.4.1.tar.gz
-sha256  75554b3b8ad0553ce2f607627dad3d95c60c441189875b98e097528f8e23ac0c  beniget-0.4.1.tar.gz
+md5  f49610696dd4682006f63e6cf4b7ddc8  beniget-0.4.2.post1.tar.gz
+sha256  a0258537e65e7e14ec33a86802f865a667f949bb6c73646d55e42f7c45a052ae  beniget-0.4.2.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  64ad3e304e9d2d8731c26ac3e652335a6016e38be2f71fe30350be51c6d500b0  LICENSE
diff --git a/package/python-beniget/python-beniget.mk b/package/python-beniget/python-beniget.mk
index 9970546b14..53c5d70b5a 100644
--- a/package/python-beniget/python-beniget.mk
+++ b/package/python-beniget/python-beniget.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BENIGET_VERSION = 0.4.1
+PYTHON_BENIGET_VERSION = 0.4.2.post1
 PYTHON_BENIGET_SOURCE = beniget-$(PYTHON_BENIGET_VERSION).tar.gz
-PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/14/e7/50cbac38f77eca8efd39516be6651fdb9f3c4c0fab8cf2cf05f612578737
+PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/2e/27/5bb01af8f2860d431b98d0721b96ff2cea979106cae3f2d093ec74f6400c
 PYTHON_BENIGET_SETUP_TYPE = setuptools
 PYTHON_BENIGET_LICENSE = BSD-3-Clause
 PYTHON_BENIGET_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
