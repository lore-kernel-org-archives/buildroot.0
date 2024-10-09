Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18146CEE32D
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 16:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCE3A40DC8;
	Wed,  9 Oct 2024 16:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eruEcYOmAaix; Wed,  9 Oct 2024 16:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 869D740E01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 869D740E01;
	Wed,  9 Oct 2024 16:31:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4889A1BF3F6
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69FAB40E01
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzpsiNRJ7mVn for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 16:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 240D840DC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 240D840DC8
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 240D840DC8
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 16:31:35 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a39620ff54so228745ab.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 09:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728491495; x=1729096295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LMgcvEb3M/5QGVGgtmVhX/uC6Bo4ouSj/5vVGZHI+ns=;
 b=RPlnVB3WuRagvMMRRXtcGuJcLP+HriOO78oWWFjnOIKN11mJDc8XDGf8FurtXgO/dJ
 MDgY9iDVFZm4o2ZxigGzdkFT88HPTRUoMZiySg4m8L8oL0JDfZWaqXBMPU9a6mFPittp
 kXAuHuwEPZ5x50gkDL+fOh7nS4BGFK3N+8YtFfV/L9r9xtEpHfIg8il/gfLNCo/ONyS2
 AOmSvIBIqWkOgmM7CdCYKVJzfDgJ7N6egGIl0zZHqsEqFGUP1sdeFOSRABJblI+JoJcz
 azCArpZIdsqXS9U86dhEipJbVAHfoO1YG3qGYnXlEt3673huFoHc1UIyAQLCsDCvyNlC
 TGHQ==
X-Gm-Message-State: AOJu0YwsURJ927dJtjiv3QPhexAZZhqDklETJEwMCEB0iazaQMqiYP2p
 IB4ETRC7oG9MDXtyJf1O/C0sT8M7zQQWX8DzRM/T5q2ntMhKcXFMn3ZqIpR4
X-Google-Smtp-Source: AGHT+IHMNtHcK7iFR74N7p5gogQdxLDHCmsWwfi8Maf6CWBz4g1/BVCg71288DK+4STemUntCOTCFQ==
X-Received: by 2002:a92:b74b:0:b0:3a3:a3a9:c1ae with SMTP id
 e9e14a558f8ab-3a3a3a9c28fmr12290875ab.20.1728491494767; 
 Wed, 09 Oct 2024 09:31:34 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a37a868cd2sm24060195ab.63.2024.10.09.09.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:31:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 10:31:30 -0600
Message-Id: <20241009163130.3823216-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728491495; x=1729096295; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LMgcvEb3M/5QGVGgtmVhX/uC6Bo4ouSj/5vVGZHI+ns=;
 b=j7hUkLn7hm/dsNwGsTJoVSaRiJSrLoXSLayXZ41V3pc4wivYxYrLfoYeI6P5uLst+E
 AOvaQfws76L+k3hth+1KS3LggdwTEDwE/r1qE9+ixj+O2Sl78KoQvI/WL0cuXveyAbkQ
 X1IFIJ4dpf44PM9rxQMqD6gd2zoMVVxemu8Tt8tZKO2nCF2BeR38cJlTBoseSAXofjPT
 h7nHqOio3+vEDeG1roICu7CKdJMbayjGx5eGCUDY/vh3wtzuiomTTN5FSb8GnnOKo1It
 UvnBEEpOGr7YAm4U18Mpe9Z4c+jGmq2Hvm9JJ/pR4rNQvkZYLYQMHvAYTsd7xP8MZrxm
 sjng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j7hUkLn7
Subject: [Buildroot] [PATCH 1/1] package/python-httpcore: bump to version
 1.0.6
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
 package/python-httpcore/python-httpcore.hash | 4 ++--
 package/python-httpcore/python-httpcore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore/python-httpcore.hash b/package/python-httpcore/python-httpcore.hash
index e773374c05..68c0450f94 100644
--- a/package/python-httpcore/python-httpcore.hash
+++ b/package/python-httpcore/python-httpcore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpcore/json
-md5  17916ce84db1c0705af60a61bbec9061  httpcore-1.0.5.tar.gz
-sha256  34a38e2f9291467ee3b44e89dd52615370e152954ba21721378a87b2960f7a61  httpcore-1.0.5.tar.gz
+md5  458f9b56367cf547425bf2347bffd784  httpcore-1.0.6.tar.gz
+sha256  73f6dbd6eb8c21bbf7ef8efad555481853f5f6acdeaff1edb0694289269ee17f  httpcore-1.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  fdcb59154c74cbaba16a11242f7740bea9f23d6feb5547917d8c5f94a80392a5  LICENSE.md
diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
index ae29d8dc8a..19edf18c97 100644
--- a/package/python-httpcore/python-httpcore.mk
+++ b/package/python-httpcore/python-httpcore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPCORE_VERSION = 1.0.5
+PYTHON_HTTPCORE_VERSION = 1.0.6
 PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
-PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/17/b0/5e8b8674f8d203335a62fdfcfa0d11ebe09e23613c3391033cbba35f7926
+PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/b6/44/ed0fa6a17845fb033bd885c03e842f08c1b9406c86a2e60ac1ae1b9206a6
 PYTHON_HTTPCORE_SETUP_TYPE = pep517
 PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
