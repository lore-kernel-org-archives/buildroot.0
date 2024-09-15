Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE90C35FE5
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 05:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE289400EF;
	Sun, 15 Sep 2024 05:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4DtMyqZ2nV5; Sun, 15 Sep 2024 05:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99956401A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99956401A1;
	Sun, 15 Sep 2024 05:08:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E8E01BF293
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D5F440359
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzzOxMLVHi_a for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 05:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 158F8400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 158F8400EF
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 158F8400EF
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 05:08:13 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a08ca8d3fdso6612415ab.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726376892; x=1726981692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tkH1HtDhih1kR6paQylJDb9Fm4pQz9R91NRtcgldVLE=;
 b=R87DAxXBVUCwa6gPMTeTGhA8RSVt/VB/tFBKhNl12XQZ/VhPj24Wk46R5LUKcoKZT1
 F2jrkZCZQWBu1RIv7tWsUW5I7SnqhtPanJLqekJG7O+iv5WWeUDfYYQyte0fW7RSWAR7
 f3QS8nSnLwZoQ0V6NuFQiXAl3nNNYWCKd1b8sMPI3UXIyZ5+DzSDlS3AJSAt4fCMJfHJ
 RoVbTKBhuFBba6yTL5XM8OAOTZuhRc0PomeEZq5+DzWQ7mKjpbce0bWmoMaiy90jXdbo
 ejUfTAsdsfRpp5paagpveuDqQoDqa6KKP+B86RJ/EDuSrXfk3XEIc5/lowLFCKMXWoat
 Bm8w==
X-Gm-Message-State: AOJu0Yy2QjQFBYFK35Rml2pDbbeImvDGO3muK3p4XLPdXyuExTyvytVr
 pt8alFVJix5dp/cfVURRR+suBAQBUZ2i7wbqYf57pSYVAwyGVGmaaGOdEA==
X-Google-Smtp-Source: AGHT+IF48IQ3T7tkhozmwhiubaK3rXjZPMQ+B6m/ef4tKjcB39iemxsX2aIGGheOcUDOngAT5dgGxQ==
X-Received: by 2002:a05:6e02:1e0c:b0:3a0:9043:59b8 with SMTP id
 e9e14a558f8ab-3a09043628emr62647665ab.12.1726376892492; 
 Sat, 14 Sep 2024 22:08:12 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e7208bsm8308525ab.58.2024.09.14.22.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 22:08:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:08:10 -0600
Message-Id: <20240915050810.1411887-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726376892; x=1726981692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tkH1HtDhih1kR6paQylJDb9Fm4pQz9R91NRtcgldVLE=;
 b=ZNuUkXowQgCE6SDYOTn//dIkOS0A9PTBvT8bq72uKPYif5ksZp+chanVP9dn521eOP
 md8Ztufs4Maa+I9sAiIQ6V2GBscNI6Al96pOhuPaP71d9Oo3peYoMSjcGoVSRZR9Anmz
 TRpUHt1oXrFpcpspsDtaYXZf3ioDnDKxcxrIeuGt1u+VLGqTP1O/X/YvqdPTacL/gU1k
 R32hVkVRNEkE4jZ5Bw7orZch6XA8I8R0mzPqyH/T8n9rvQHiqrf4B/BNP/TzzoOEROiu
 gHJJ2zYblnZpFF08a30+DBoDwvJJzfRQfuJLWERnd92PGQCPe80Ak84RranfGFBu/Nc0
 bn1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZNuUkXow
Subject: [Buildroot] [PATCH 1/1] package/python-email-validator: bump to
 version 2.2.0
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
 package/python-email-validator/python-email-validator.hash | 4 ++--
 package/python-email-validator/python-email-validator.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-email-validator/python-email-validator.hash b/package/python-email-validator/python-email-validator.hash
index 4342f8d91b..f7a7ed8a33 100644
--- a/package/python-email-validator/python-email-validator.hash
+++ b/package/python-email-validator/python-email-validator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/email-validator/json
-md5  a836759afeb7efdc5d493fbdf8a1bae6  email_validator-2.1.1.tar.gz
-sha256  200a70680ba08904be6d1eef729205cc0d687634399a5924d842533efb824b84  email_validator-2.1.1.tar.gz
+md5  593073eca56ac1e947d47b9b314f2f11  email_validator-2.2.0.tar.gz
+sha256  cb690f344c617a714f22e66ae771445a1ceb46821152df8e165c5f9a364582b7  email_validator-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  672179752e109134a3fb2bdd0780b29fdb7a03974f0f586a13aead5129562d4c  LICENSE
diff --git a/package/python-email-validator/python-email-validator.mk b/package/python-email-validator/python-email-validator.mk
index 8d82eb092f..35881c13a3 100644
--- a/package/python-email-validator/python-email-validator.mk
+++ b/package/python-email-validator/python-email-validator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EMAIL_VALIDATOR_VERSION = 2.1.1
+PYTHON_EMAIL_VALIDATOR_VERSION = 2.2.0
 PYTHON_EMAIL_VALIDATOR_SOURCE = email_validator-$(PYTHON_EMAIL_VALIDATOR_VERSION).tar.gz
-PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/63/82/2914bff80ebee8c027802a664ad4b4caad502cd594e358f76aff395b5e56
+PYTHON_EMAIL_VALIDATOR_SITE = https://files.pythonhosted.org/packages/48/ce/13508a1ec3f8bb981ae4ca79ea40384becc868bfae97fd1c942bb3a001b1
 PYTHON_EMAIL_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_EMAIL_VALIDATOR_LICENSE = Unlicense
 PYTHON_EMAIL_VALIDATOR_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
