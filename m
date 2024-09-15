Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BA9C3ABAA
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 20:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A851F812BE;
	Sun, 15 Sep 2024 20:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dv3m0iEhcTw; Sun, 15 Sep 2024 20:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6F68812C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6F68812C3;
	Sun, 15 Sep 2024 20:50:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 870DC1BF5F6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 20:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76C63812C3
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 20:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjlimPUnWBPw for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 20:50:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D4DD812BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D4DD812BE
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D4DD812BE
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 20:50:51 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a098ce3485so2885045ab.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 13:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726433450; x=1727038250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DtEtKLWupmO7Sf5hjw0HJhk2uWj/8eqx0AyoXnFlYS4=;
 b=psYNhzU0DeU3EK+Oq1M9+FhJL1GuVvNk3X3w6Mh9SuYmx1cvBzQoeNKhNb81XYvF8U
 bW/bErHf8o/6239QlZNeXQCOg7QJ7KYqNHKCdkhm22ynvP4kLLBlFjALmUafR5gXkj7r
 Oru+ZDOVHCdmrYTeLHMDNd7Lh7N4BqdPP0Z/hHA4B7CnCtZdPXP/wQAYPBYOiEBfCHLX
 EsWOJMC2WMgi1/PCc2mTqzD0rtAcNpqLzqLC5wbhIX4W6bF+D2eNDL5AZWuhwevzoQQp
 q1yHc7+Q0wK1vxkQ6YFqUIe4iNZKZbnEDBapf62/ntp1aYhCbrF+C2yhYdPb9DMLMTE2
 aFhA==
X-Gm-Message-State: AOJu0YylQMlFUSkVzx33Ta2Qn0t+kmWHxTgaYMLP3QBcw2Q0NtGSS3PR
 jiXJHh1kyNNgGOGQHlbP3wFozFtoXrP5/4vcq3iYquRLbdr7blUuVsePAA==
X-Google-Smtp-Source: AGHT+IG/LRPMk9FQM+RL21SBILuE6vl1LqTscQ5GIq3xK9RC3SXFMfBWteU7szo+wVFOR7g667iqiw==
X-Received: by 2002:a05:6e02:19cb:b0:3a0:56c8:f7ef with SMTP id
 e9e14a558f8ab-3a0848c92f9mr133591985ab.8.1726433450180; 
 Sun, 15 Sep 2024 13:50:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf44c6sm1119300173.1.2024.09.15.13.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 13:50:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 14:50:48 -0600
Message-Id: <20240915205048.1597645-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726433450; x=1727038250; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DtEtKLWupmO7Sf5hjw0HJhk2uWj/8eqx0AyoXnFlYS4=;
 b=GhFfy6EQqnv4Hmc3vrt6AV00/mfFK39+/X70ZmvA+xfI+z17GEGhhBS6GpfzmDCuXK
 6/u5ekWTQvv86X9P+t53Y5YEvRe/MrieXe3mtCBPJTsgCXrxqL5eLwCz/I1OV2NwR64i
 dL0XYxPny3AHP6VK5qiksPS5uZUrwZ1zQQdPga6L24PRXgW6xXT2zWDe/mpjcR4Ascbn
 e9aKBQEP1fpyQ3b/+m7KocgQDxmmwPcBeFEaa5Z4Cpiy2dZ+XLby/4imuY94AiOChWU3
 MyI0N37ZPBvruKc74mokY9V88n9TNy8uZR8QXRqbxI6Dmz8kDRCJ7vdBxFkZqkx3gD3d
 adCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GhFfy6EQ
Subject: [Buildroot] [PATCH 1/1] package/python-keyring: bump to version
 25.3.0
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-jaraco-context runtime dependency.

Add new python-jaraco.functools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-keyring/Config.in           | 2 ++
 package/python-keyring/python-keyring.hash | 4 ++--
 package/python-keyring/python-keyring.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 6c03317f61..55295ab7ab 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PYTHON_KEYRING
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ENTRYPOINTS # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CLASSES # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_JEEPNEY # runtime
 	select BR2_PACKAGE_PYTHON_SECRETSTORAGE # runtime
 	help
diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index 50ac3df342..ca94170de0 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  ed5df85d33c36bb268a79d4472a13312  keyring-24.2.0.tar.gz
-sha256  ca0746a19ec421219f4d713f848fa297a661a8a8c1504867e55bfb5e09091509  keyring-24.2.0.tar.gz
+md5  024f9ec53601f6b91670c31d705546fe  keyring-25.3.0.tar.gz
+sha256  8d85a1ea5d6db8515b59e1c5d1d1678b03cf7fc8b8dcfb1651e8c4a524eb42ef  keyring-25.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 87b51a8960..a0f8a0a647 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 24.2.0
+PYTHON_KEYRING_VERSION = 25.3.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/14/c5/7a2a66489c66ee29562300ddc5be63636f70b4025a74df71466e62d929b1
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/32/30/bfdde7294ba6bb2f519950687471dc6a0996d4f77ab30d75c841fa4994ed
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
