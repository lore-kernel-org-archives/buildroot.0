Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1826CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 09:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6392F60ECD;
	Fri, 26 Jun 2026 09:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qk0BGMMiXXb2; Fri, 26 Jun 2026 09:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88FC560EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782467851;
	bh=uWEVd/aS60Lj1RArta7UXBlsp3olsR5EIN4yo9vxGS4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=O9446VgUSENh6rvZ8JukWCG2C6m8ZkUpTpHtTA/nq118DcqfLO6y6QZLxM+53g/Lv
	 nU1w7KVc8prVtFfqWqAcWWASeMSFIVfQVZprRIRu90xWRESJ59nqkVSJWetqmlHFdq
	 dUngJrHYwnK3L8LMf9OPtUDdYXotOFYoA9FSUg01601E/HD/0znpOcRejjDpNBVneA
	 KrVLfWOWUKw9V/hhWTGhcI48/x/ue9pYAiDntpbY0h+Z0Q4Yx0fp7o/PF3atSpwt4p
	 1RTdT7qdmE9+H3O/8LNOo6BGvH9/90eBvC4iwJmwckv2jqJ7gvDFGoU9g+ZPwIszlM
	 7v8VR6jTUJjJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88FC560EC6;
	Fri, 26 Jun 2026 09:57:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CB223A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19A2C40DBE
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KaxAo57502e for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 09:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0408540DAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0408540DAF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0408540DAF
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:57:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-46dd46901dbso694274f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 02:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782467846; x=1783072646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Ko8WJifBFILd1iXJInJu2yzDqXh332z8xX2fIy8y4I=;
 b=MuY6FvVXuusDwxvuqaPQ2DrwIYsSDJRQjbVRgt+0xW2k8uuusnomltJm6JRFAOllQh
 eGnVeTj34uGRuK2+LKYJrKpT3b0sHqsOHWSgUg1YYnm26/Tp8S1y0LzMwJxJbRSWTG7e
 LrV3R5kahPgJXKqLDxK4KTpIY3NVguY955Y+v9ptiFlF9VSiLwLRbxemnE9CQxjvgEav
 8gA71F0UFxy+SP45562u0a6InusggAOxORbArfv+OKb5C9ESQc5mVwS3MzsJ0362xHuK
 WcYWENYY15+LQp9L6KaTrWbo3GDSrmnr1GVRWNtPnYCXaevpP49jVrtZlATRRZIWPW4o
 /MEA==
X-Gm-Message-State: AOJu0YxrLE3eTk9kyRN5IOMf5Shew6krDURMttZdYmf927RbcBuHBx1I
 FqojRNKgr9yijlDk0E+wb8eXRacMCRtkubv46QtNLKgd0bmQbcxebSqhX8sIOcIICxXfQcm5FLE
 cbEPG
X-Gm-Gg: AfdE7cnvrhtrY5QxxZQz7FjUamrtxOogrnLmalUloJK2QH8y5Ums3/iWj2v4th9b/3H
 OE306jwrZxxuSyxk344ebDYcb0cm00Gbks5oQWGDGA1VmlhPU8zlgbMBZvHox4sVmrFQF/7Nwez
 PUNilPiVJeBzaV3VZ0xg7zrZm8opjDcXNuJr+gWMjmbmrfN0KlhbgGU/lJWmnHI+hNhICv7XU4l
 CPqgoJyCttBmNizUtEbbgqu+r3/F0ji8tn7hn55I2Mh+PWkH2dsYxYq8W04aGT9XGVoscFV9LQN
 gDKpvyTeiVF1yuBxKNQAQxffC6BxIAtPtJ8OogC8vMYwWOiAeWntTgpcCnY8mm1UQRq7437hpwv
 7BP3K9yTliBCMssZwnz6Kf7gGqd08JisyukNT9l6kBX9iytN6e1N8EVSmuVqg3iHXYzQ9UfrD2n
 9SIFMstU2Z9daGMzU=
X-Received: by 2002:a05:600c:1d18:b0:490:b65f:8b1 with SMTP id
 5b1f17b1804b1-492668553cfmr89230085e9.5.1782467845862; 
 Fri, 26 Jun 2026 02:57:25 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492691f60bcsm68222045e9.1.2026.06.26.02.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 02:57:25 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 26 Jun 2026 11:57:18 +0200
Message-ID: <20260626095724.248205-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782467846; x=1783072646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Ko8WJifBFILd1iXJInJu2yzDqXh332z8xX2fIy8y4I=;
 b=ZxkUKr5IgzM6rPY1V99x+NC9Y6x3k2T4alUasjRZMKWddO4BVmAuMku5kYp6J51SVx
 xP7omvG6WAAwXuJKI77SsGQVUy1Lx9ANW8BJFouaB8ChmCV82U3ZIGv4xLfTQkLYmpRn
 v76P08fsoOemE0ThBqY2Kji+uwDDgKpNHRMlxcj0pVpIyCbe7s3cAD9I8Gy1rCRf5yNc
 dMOw/0H3+FTXIPulYy9cPrk3gm1TlVT2NOS+G/dL8vSjmLxRmhXIH+jZZs4TG9UXkHEg
 XA3kSgTUJozmDWJJ/8J9Uyr5gBmlvhri3EAGJ7q3Yj4vTasHppfKUOlhbT7iecJI5D7F
 AT1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZxkUKr5I
Subject: [Buildroot] [PATCH 2025.02.x 1/5] package/util-linux: bump to
 v2.40.4
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
 - https://www.kernel.org/pub/linux/utils/util-linux/v2.40/v2.40.3-ChangeLog
 - https://www.kernel.org/pub/linux/utils/util-linux/v2.40/v2.40.4-ChangeLog

Also add 0007-lib-path-avoid-double-free-for-cpusets.patch introduced
after the 2.40.4 release.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...b-path-avoid-double-free-for-cpusets.patch | 30 +++++++++++++++++++
 package/util-linux/util-linux.hash            |  2 +-
 package/util-linux/util-linux.mk              |  2 +-
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 package/util-linux/0007-lib-path-avoid-double-free-for-cpusets.patch

diff --git a/package/util-linux/0007-lib-path-avoid-double-free-for-cpusets.patch b/package/util-linux/0007-lib-path-avoid-double-free-for-cpusets.patch
new file mode 100644
index 0000000000..f3d9e75652
--- /dev/null
+++ b/package/util-linux/0007-lib-path-avoid-double-free-for-cpusets.patch
@@ -0,0 +1,30 @@
+From 27279d4ab2431e1afb3a125ae7306eb2323b86b7 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 2 Jul 2025 12:25:45 +0200
+Subject: [PATCH] lib/path: avoid double free() for cpusets
+
+Addresses: https://github.com/util-linux/util-linux/issues/3641
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+Upstream: https://github.com/util-linux/util-linux/commit/27279d4ab2431e1afb3a125ae7306eb2323b86b7
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ lib/path.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/path.c b/lib/path.c
+index f897599fd06..29b074a959b 100644
+--- a/lib/path.c
++++ b/lib/path.c
+@@ -1053,8 +1053,10 @@ static int ul_path_cpuparse(struct path_cxt *pc, cpu_set_t **set, int maxcpus, i
+ 	rc = 0;
+ 
+ out:
+-	if (rc)
++	if (rc) {
+ 		cpuset_free(*set);
++		*set = NULL;
++	}
+ 	free(buf);
+ 	return rc;
+ }
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 317efebcbf..09f8874bf2 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/sha256sums.asc
-sha256  d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3  util-linux-2.40.2.tar.xz
+sha256  5c1daf733b04e9859afdc3bd87cc481180ee0f88b5c0946b16fdec931975fb79  util-linux-2.40.4.tar.xz
 # License files, locally calculated
 sha256  27f25514040a401b2ceb7057eae1f46cedb1666664b519b5be7e0960d1b35164  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d30c26deb5..64da9ab5d5 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.40
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
