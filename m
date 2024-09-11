Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2302EE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 20:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4C97600B5;
	Wed, 11 Sep 2024 20:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yN4wdD_Eah2y; Wed, 11 Sep 2024 20:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A53BB60632
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A53BB60632;
	Wed, 11 Sep 2024 20:56:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB1ED1BF423
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B78B460632
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dN7xN2sjBYpA for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 20:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C70D8600B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C70D8600B5
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C70D8600B5
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 20:56:53 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82cec47242eso47259039f.0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726088212; x=1726693012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jItoYkBikq4hSJtJszBIIaanx0DkodrxOhvcHwpeThI=;
 b=AF5ePYp53s2HEMfdAtR8ty4wzXf2S2F54ObeA8Jw0ckvKn80ugeM6xtXuU8IpVWmiJ
 J100PNl2BixO/z134MthoyF2/tE+eHvi4w0LRaVOwpyfCu9UssJB+q+BHzHGXBX2tFDJ
 i/g7qhKMpCt4s+zxdlKOVaaYh9UWFm5FGru5W3khsx9i26xa8zQwjFc5W2vY1VqXezFx
 34p/P6LloolkyRCwkYZsRKVTSPYqG63ThlWDn1DbEraMd5RxVye34/VcSF0T/EPiW9eG
 wmL8pxgyZXgO+Kgx1n9hqR/7Q+daEyzSdCLk9/29uWEG6W6FjqRPti6IJ62sR2IKP3Sj
 NRuQ==
X-Gm-Message-State: AOJu0YwjSOhIY41UXtdGy/DJGuHbnC6XjNYf3buBjbu5QBQP4//FPY6O
 DsXOiieQY8l7GZpNPobsretaGwVwNGgxDE1ln4TQyg7gJKfkXZ2m2NBMXA==
X-Google-Smtp-Source: AGHT+IGeYbX1YJErrN4nyJbtyqb1pxbJvO+pcXE2s6JCQleeW+hxMQDwArRWAWdQ+AtguF7gYmyP0Q==
X-Received: by 2002:a05:6e02:19cc:b0:39d:6377:7c02 with SMTP id
 e9e14a558f8ab-3a074c1e95cmr33701415ab.4.1726088212536; 
 Wed, 11 Sep 2024 13:56:52 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d35f56b5bcsm196289173.41.2024.09.11.13.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 13:56:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 14:56:47 -0600
Message-Id: <20240911205647.1841244-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726088212; x=1726693012; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jItoYkBikq4hSJtJszBIIaanx0DkodrxOhvcHwpeThI=;
 b=FOILBAXGnthVkUN3/5cKfCgMrznThN79RoI0gSs0fhjl1/HP+cpKjeiPXPVcEOwtXD
 q/lyBzu+gXsP249mcFxC/NqC8rB6aH4sX4oxxduJ9/tc2wZO16NmM16jkj3mvtKG6+BY
 bAN1up1F1N8yG1mccrXoc2+myv4ExCsNKmbJ0BWLlMYSmZRB/xeLnFT9xbeqqT1NU7zC
 B6g/r6nuo2sSyjJCYQfgS3BSIeDRPyqHoItH9DEUv1xcGqGiRF6n+7dCg089qOykNbiR
 tojh/LMYvpZ58tZ685PKpSSrk2p4ohBce6DPcBO0Szz/QaKkrsfpwtiQ+NGsMrN/49Lx
 6nhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FOILBAXG
Subject: [Buildroot] [PATCH 1/1] package/python-aiojobs: bump to version
 1.3.0
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
 package/python-aiojobs/python-aiojobs.hash | 4 ++--
 package/python-aiojobs/python-aiojobs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index baaa61b331..d5721dc6d0 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5  d4742018c2188147f1efa41645b5758b  aiojobs-1.2.1.tar.gz
-sha256  59d6e7ad7829e9d0f73bfceeae28153b541be6b0959a08cc5ceb222717c888ff  aiojobs-1.2.1.tar.gz
+md5  efad80daa647b6346258f1027da44c8b  aiojobs-1.3.0.tar.gz
+sha256  03074c884b3dc388b8d798c0de24ec17d72b2799018497fda8062c0431a494b5  aiojobs-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index 9e4a55e13c..e8ada82305 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 1.2.1
+PYTHON_AIOJOBS_VERSION = 1.3.0
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/07/ad/e4240f9225022798e0e651ced8f6dc022e88eae4f2df6e1482a8f3c0d54d
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/c4/0b/d612a769c28bd22bcc52b369a9a10c63eb6e7b5e2e0cfb35e3be7357fe29
 PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
