Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479E3CAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 23:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F9D60778;
	Tue, 17 Sep 2024 23:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpGz_IGOusDD; Tue, 17 Sep 2024 23:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6BB46115E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6BB46115E;
	Tue, 17 Sep 2024 23:22:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C37691BF2FF
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DD8460778
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ju6S9QqmaEes for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 23:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D81E61165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D81E61165
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D81E61165
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 23:22:27 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82a151a65b8so336854339f.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 16:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726615346; x=1727220146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NjVHpXshOV+LdqWD4IKoJVjeD4Q5a5DRg2hR7QPdk6o=;
 b=cfeVn9tT5o/mgW4SIdtO5dCNjpWuedwQ/U4SjHf8/GUmqwFLWmufEzT0Xsdn+0WIct
 Q1c4L8NvIj47MnizgDygZ4a4k94ucY548KiOHnI4v3DSr+Ulgr/+mBTs9xGk3B3csQoM
 E2tK/S8r/mXAi20KJyttcMiRoYjL+nSFVApUYupLHxOKwOMisA5k0be6G3NeCx2w5lZf
 tMtc8xczN9HuSrWnixM6KF2x4eojsgcQA6QQV7S57VyqG5Y8tEjpjAo70j2FfT+txHZl
 bmJipl5w1nFqlQvBrU1PI3/EgSc0tv7NKaHmvk1BM+j1PH3GElFVn8Obx8zmeIKbz+x8
 kpsw==
X-Gm-Message-State: AOJu0YwTAmNA4DsXFPlthCUxaV037k3Z1MWb3a1RJqG9QEGEPtc9J4Eb
 yw1V9YEduUsV0wsI3K0mCDNV2XSNOsmVnfD5i08RATh7VRRlk6velhaQn7u6
X-Google-Smtp-Source: AGHT+IELtr2K7Wr57NMVui3AI8PSszZXP5Ak8JWtZIjR8T1f9Taq4iLtTcOEucfNdMTSHYmchX7BMA==
X-Received: by 2002:a05:6602:1542:b0:82c:db6a:366 with SMTP id
 ca18e2360f4ac-82d1f8132d9mr2147817039f.0.1726615346168; 
 Tue, 17 Sep 2024 16:22:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d493389c8sm227972139f.44.2024.09.17.16.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 16:22:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 17:22:23 -0600
Message-Id: <20240917232223.394548-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726615346; x=1727220146; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NjVHpXshOV+LdqWD4IKoJVjeD4Q5a5DRg2hR7QPdk6o=;
 b=dLn/9B9boVBsusA01ElAie5ZlZBaTrefChXsxSOKPsNcbR5T0eGsHjBosw6zy0HrNo
 SdkG2sMtYiMlXBpQvlpbV1WB3JxkJidjShbUNglWavJ3ySxzHdy/qoUkvKHmoha75GBM
 AUbRtP2lMycM+m+t91tNlBx/OQeea73PlCMCITDBsswzqka0eiWRv4x42q2vfgWcyT9f
 UlDsyl+9juAVz4PNWmU1bOYXeFyFEwjGUR7ioRCpyhWq8TG9+GuDn4CHgui2BZqmEPXs
 KhQoYCkLXCfRqwW3BLyN2Y2Ba5wIL9ofArvDdtt3PDM0a+475xR9tQhk4g4A9F2nunZa
 wm0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dLn/9B9b
Subject: [Buildroot] [PATCH 1/1] package/python-pymysql: bump to version
 1.1.1
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
 Steve Calfee <stevecalfee@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymysql/python-pymysql.hash | 4 ++--
 package/python-pymysql/python-pymysql.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index 641d5dba97..d697dfae88 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymysql/json
-md5  81d559c87414017075de030d8ce93257  PyMySQL-1.1.0.tar.gz
-sha256  4f13a7df8bf36a51e81dd9f3605fede45a4878fe02f9236349fd82a3f0612f96  PyMySQL-1.1.0.tar.gz
+md5  66e1b2c679250e0ae9ae037444de950a  pymysql-1.1.1.tar.gz
+sha256  e127611aaf2b417403c60bf4dc570124aeb4a57f5f37b8e95ae399a42f904cd0  pymysql-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index c600fe515c..742fb4f6f1 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 1.1.0
-PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/41/9d/ee68dee1c8821c839bb31e6e5f40e61035a5278f7c1307dde758f0c90452
+PYTHON_PYMYSQL_VERSION = 1.1.1
+PYTHON_PYMYSQL_SOURCE = pymysql-$(PYTHON_PYMYSQL_VERSION).tar.gz
+PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/b3/8f/ce59b5e5ed4ce8512f879ff1fa5ab699d211ae2495f1adaa5fbba2a1eada
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
