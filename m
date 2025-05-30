Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637A6C5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 22:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E38383E28;
	Fri, 30 May 2025 22:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GspmN4Es0taR; Fri, 30 May 2025 22:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC9B83E2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BC9B83E2B;
	Fri, 30 May 2025 22:29:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33F86236
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2624540177
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IP9czN3HBZh2 for <buildroot@buildroot.org>;
 Fri, 30 May 2025 22:29:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A68840054
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A68840054
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A68840054
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:29:24 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2351227b098so17083055ad.2
 for <buildroot@buildroot.org>; Fri, 30 May 2025 15:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748644163; x=1749248963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UNfcmdGg11BFli/QIOUydXAUd/uKrgYYW4SMr6ErRrw=;
 b=MyK+jdcsaTyCsxVDgapLoVIFITdeZmfqwCkOw911NvkdaIwG0rf5PfAl9ufxhuynCq
 zprjvs0lbYgJXoxq/fJkoCBdlZbbcY8qgyFMxmRqeowz7ibJ1/Hc9cRXo4ADVQiR0Jds
 f/D7eKOFjtevPHEZhZ0HGpkCat0UrpG0hYW3LmKCea6sJA0Nhug2H5dnb02g3Vu/o/mc
 rfq0sPK+f9rngZ25173y7+KaIhw90w/zdbd23SDmqUl/gBklhoxUCT77AJD5Ot4J4Vcv
 dMMPmKcO5sV/kYU739dwK0DU4HhdmJKLDfZNhhTyENcScOjCQc8TzkszVNZr5scjVw+y
 nTGQ==
X-Gm-Message-State: AOJu0YxI25oqvjnqRH5+X9bdaO5oGtNAAwYpsQygBajEMjxnaA1id4Wh
 4TYb3Xlv9X+I8sPrGxGE8X/0xYUOwZ5IegJwxb1/DIbSRwFgIpMoeUaAFFtYGMhh
X-Gm-Gg: ASbGncsFJVp+hM5EuBuu6Kkx3AH20pb2QynNq+r4JLROexq4lW08VEoe/cElkJbekbB
 BmGJltiFnclV2GEij9+jhWT7Y4kw0Uf/Po2DGUFrJYcUL7FiIU1zs8+xsk1NX/bM8i7jT4NsaeL
 2cDSNz0LChLs8DV8rfeVYSKSy4kXyfHyETVWjPVXlgrh2HFnaaKKFTubdZ7DRlEVE183C2IKQLz
 bRvokseIvBWPbXohf8fgYGP7d9m3DbG/nPOEPADm3+7dQcQ7RWss2XxDZ18tw/DQ1JNSBGVRyOs
 PZa1fUIUXMO8J+xrw7lCiqt0prRbAhh53ieHaQiJs9q1IOsAyFd7XqJyswSx1wlenqbFn5yqmer
 DLIvGyrnTBsQVjEryWVS+rt0aWAEtS/R99fUApsAua7ppWHnoPwdXl6ZUEhY=
X-Google-Smtp-Source: AGHT+IHefvYBejvC9gZ+EeIXhlzjH+yfJQ0QZeI4THhTWhdFBJiCdHg8KpavrkPU9tb75ZjDs67CQQ==
X-Received: by 2002:a17:902:cf05:b0:234:98eb:8eda with SMTP id
 d9443c01a7336-235291e872bmr87284105ad.28.1748644163091; 
 Fri, 30 May 2025 15:29:23 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bdce12sm33177055ad.99.2025.05.30.15.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 15:29:22 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Fri, 30 May 2025 15:29:19 -0700
Message-Id: <20250530222919.594540-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748644163; x=1749248963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UNfcmdGg11BFli/QIOUydXAUd/uKrgYYW4SMr6ErRrw=;
 b=atjrR4+HhzjfxFamWAxDncjJu631/FNFuS1cn75rwkWJFz62bf77l33ClImJKhUe5x
 iw9uz2opZPVXSgAJ7BGewk31JXioU66/5x3peUXyVmHC5NAWzFJweBc7VlYWKH9eIhF+
 7HqnPnRgSs0QSJV9V0dTeVWXwZjOx4BIXQbX9Khv2f0AlVWwYq0uSFwD8Fp+BYbyRqtD
 KuuveqauQ0QPtYcdmz14Yvw1speOsq+RzusoZEYZMAqtUxK35BkwhOjrrXl0skX8pAGB
 PPRKoz/BzArUCRMdyzSaNnAJwR1luP6y+RD+yZs9expoNinBirQAg2lvgHBdjAwEIlqZ
 skXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=atjrR4+H
Subject: [Buildroot] [PATCH 1/1] package/tree: bump to version 2.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/Old-Man-Programmer/tree/blob/2.2.1/CHANGES

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/tree/tree.hash | 2 +-
 package/tree/tree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tree/tree.hash b/package/tree/tree.hash
index 9ef48b1e77..16ada077f3 100644
--- a/package/tree/tree.hash
+++ b/package/tree/tree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d3c3d55f403af7c76556546325aa1eca90b918cbaaf6d3ab60a49d8367ab90d5  tree-2.1.1.tgz
+sha256  68ac45dc78c0c311ada06200ffc3c285e74223ba208061f8d15ffac25e44b2ec  tree-2.2.1.tgz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
index 479a172a72..4b48f4cf48 100644
--- a/package/tree/tree.mk
+++ b/package/tree/tree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TREE_VERSION = 2.1.1
+TREE_VERSION = 2.2.1
 TREE_SOURCE = tree-$(TREE_VERSION).tgz
 TREE_SITE = http://oldmanprogrammer.net/tar/tree
 TREE_LICENSE = GPL-2.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
