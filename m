Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4FECF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA711402D7;
	Sun, 22 Sep 2024 05:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBc6-rekYEqf; Sun, 22 Sep 2024 05:17:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE3B40311
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE3B40311;
	Sun, 22 Sep 2024 05:17:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FFE51BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BBEA40311
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAQZcJwJJQmM for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:17:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0B15402D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0B15402D7
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0B15402D7
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:17:33 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82cd93a6617so121338739f.3
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726982252; x=1727587052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7L3KonQu+D6xmlZusUSpYm1NMwjSDb++hI3sdo55G3M=;
 b=JwO4YglovjZkPyzrStKBEJbglboJJAUkul7DZy7AjVUSTj4e23l98RxnuYUBBOcHPg
 emH8ME1OqFBhXXxDViGvmnwJTK3bzRW8o7suPjmkApimUey9wPZxRYVZAu86jAB7iVBy
 QjbGgzC6gRhkvCdux98Yk1TN+aZtNf2921wGTQR5Glfxxr3ul3d7id8Xp1duM7984n36
 n63CvN6fU5bnZJun9mky27uxuO8yXko42acBRi2u7zXNVLLp4EHcqJQkT3VB+VNS1ZuY
 vLkwUvpONAMhuWRZZFRC3lFOirek/IxyPgWkkeqHPypWOz4zLPXLkKYFS6WB1bpjUvUr
 9ozA==
X-Gm-Message-State: AOJu0Yy4enobshjs9vuVphoqCEaK0K1uPoUM42lwZIOQlkf+Gys/Ikwb
 C0BCJPQF+lub0DE/FKDGdixlu3G0PdAO7rt42rHBG1KqSGMipq5GWWwGVQ==
X-Google-Smtp-Source: AGHT+IEzDM5/QA5gTHKX9oma//vx6ZZ4z+YdiAzcgPct9lBJ3udSWYy0W+BuHAirqPwqMuoneiWGEQ==
X-Received: by 2002:a05:6602:140a:b0:82a:1f14:997f with SMTP id
 ca18e2360f4ac-8320b287356mr727850239f.4.1726982252394; 
 Sat, 21 Sep 2024 22:17:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec2068asm4444518173.60.2024.09.21.22.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:17:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:17:30 -0600
Message-Id: <20240922051730.932472-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726982252; x=1727587052; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7L3KonQu+D6xmlZusUSpYm1NMwjSDb++hI3sdo55G3M=;
 b=fuDHPZvzsNmO65bQR/9m/ac1nH6l5U0a8/dnKYF/3GANnXTQg/AHYRFvf9n5KpDeMg
 IVTOnyZZ9DXvFpLsT6r2gdUxna/685ggV0Rj+5Iuk3MeUt86LLS3I7G/Po8Wxxd1Zc/U
 xm8tZYDhVFBGumjHj8C2uYWDWNZVgFfkSnlgqdg1+c/Y99cVaj3hr4IZNDWrKb9Njehj
 3U6hr9+q+hTk9ga9hGR5TMs7UgzJOSFE4YSiBcSeT+pE4i0ig5uFnOxfZKMFDtzVUEOX
 l0BfpLvk6/jGfJg+w9OTnqoDecDLdhEOCPY89Y8c4EQpi/y1hguvhT2IqdiwX3enQayB
 F/+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fuDHPZvz
Subject: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump to
 version 2024.9.12
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
 .../python-trove-classifiers/python-trove-classifiers.hash  | 4 ++--
 .../python-trove-classifiers/python-trove-classifiers.mk    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index 2aac714a37..904ffd7167 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  1e574abaf8803bab35289ab54d6bb251  trove-classifiers-2024.3.3.tar.gz
-sha256  df7edff9c67ff86b733628998330b180e81d125b1e096536d83ac0fd79673fdc  trove-classifiers-2024.3.3.tar.gz
+md5  717cfc0ecefe6d49ace81adac3ebe0af  trove_classifiers-2024.9.12.tar.gz
+sha256  4b46b3e134a4d01999ac5bc6e528afcc10cc48f0f724f185f267e276005768f4  trove_classifiers-2024.9.12.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index 5bfd045c38..567cddec64 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2024.3.3
-PYTHON_TROVE_CLASSIFIERS_SOURCE = trove-classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/13/11/e13906315b498cb8f5ce5a7ff39fc35941e8291e914158157937fd1c095d
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2024.9.12
+PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/16/14/55ceb59dabf95f554b5368fdabe8d370165a25f817a23d809ad6c87a0b06
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
