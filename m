Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1566DC35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 09:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A88B140110;
	Sun, 15 Sep 2024 09:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZB8DxPc5LEyX; Sun, 15 Sep 2024 09:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3094740128
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3094740128;
	Sun, 15 Sep 2024 09:02:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC0BC1BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B85A281E21
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 09:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQKcLcnPOI1r for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 09:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3A3B81E06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3A3B81E06
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3A3B81E06
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 09:02:38 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82ce603d8daso116442939f.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 02:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726390957; x=1726995757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q12AgzcYnp94H2p2r7PvFHKhULt6DzhtxpfbPhj5mgw=;
 b=cx9R9aI1IOFyxLOtIl8uv+oaESiSimsIKkICjYjjMpxhXb3QvkBHF4R33HS1yzvZg8
 5IISt1xm3VO9n28PqoY3Iqykj8dBy6skGPlfIN6hpcrVIb/ZdiQ6loin+uHW20d346AI
 hJ9nP6Z6byPiCc6rix49X2aouF++AcWOHywe5Jnv6R55fj0zfz9/uUnzmUqezbjW88Q/
 nLSId1YQmiBZN2EYtLt0DfGH13wWYWJrrYnPhABNIrFk0WB/XC4zPZGglmyithHi6KgT
 YMR4XFBRJs60SvHswAmgAVVVpFNuc2b6DKPIug/N+MGnS1YdJTUFETS17abcNMReUcm5
 Fneg==
X-Gm-Message-State: AOJu0YylLb6SBUKTwOe8tGoQtezd/4GKpSI+NiHGbp0joRX33Fr67L7X
 5csVCUkwvby8xXBOh80T7jIh1FpAtnk2Y+6J6hlW2qW/FKfmf0wnCtt9gw==
X-Google-Smtp-Source: AGHT+IHBza06yuwpbIkQAVVcsFcAgTI7YUc2qblveCzAOjF0pieJSEDmPtjRwoY9pjRL+fXQzQTxvQ==
X-Received: by 2002:a05:6e02:16cb:b0:3a0:451b:ade3 with SMTP id
 e9e14a558f8ab-3a0848c9f4dmr113582235ab.10.1726390957188; 
 Sun, 15 Sep 2024 02:02:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e71ccasm9250635ab.69.2024.09.15.02.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 02:02:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 03:02:30 -0600
Message-Id: <20240915090230.1584379-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726390957; x=1726995757; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q12AgzcYnp94H2p2r7PvFHKhULt6DzhtxpfbPhj5mgw=;
 b=dB910oocLx25d6DD96Y6J5qk+qewFZUsQWqYxjLevz/XVzP4oP3bzOyTfAx8oE30bg
 U7UiKAOH1W8ky51qk3gVZmpda6tRKgOk9xBvmMTsFx5mg8VRu0i7k40yFDsAU1lwGFux
 UsjrIL7R93JXi8SnZy9Z44xfV627uw2Iu90H9TsJsgvZ3iSX/WhemyF2bROfxdVv24ma
 wmSuq/Ss1SiQ+3IFztKRquY5PjbH9mEiuyrTFd9FN/u+9bgcVdZtiSP+W88kFA2/72kg
 mE2w8avUMXzHcdYvZVETh/AD7rYPyaq4fpkahiI/PRdTLLG9ScKCxXQqrnw2JIZLVE/7
 6jUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dB910ooc
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-classes: bump to
 version 3.4.0
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
 package/python-jaraco-classes/python-jaraco-classes.hash | 4 ++--
 package/python-jaraco-classes/python-jaraco-classes.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jaraco-classes/python-jaraco-classes.hash b/package/python-jaraco-classes/python-jaraco-classes.hash
index 701aa07b83..370ec5e2f6 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.hash
+++ b/package/python-jaraco-classes/python-jaraco-classes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.classes/json
-md5  26ae65ab8cda78455ddab0b05fe0a553  jaraco.classes-3.3.0.tar.gz
-sha256  c063dd08e89217cee02c8d5e5ec560f2c8ce6cdc2fcdc2e68f7b2e5547ed3621  jaraco.classes-3.3.0.tar.gz
+md5  994fb3f2ce9bb538ca6e8abf6ebbdf9c  jaraco.classes-3.4.0.tar.gz
+sha256  47a024b51d0239c0dd8c8540c6c7f484be3b8fcf0b2d85c13825780d3b3f3acd  jaraco.classes-3.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-classes/python-jaraco-classes.mk b/package/python-jaraco-classes/python-jaraco-classes.mk
index 45950556b0..0ba39721bb 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.mk
+++ b/package/python-jaraco-classes/python-jaraco-classes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CLASSES_VERSION = 3.3.0
+PYTHON_JARACO_CLASSES_VERSION = 3.4.0
 PYTHON_JARACO_CLASSES_SOURCE = jaraco.classes-$(PYTHON_JARACO_CLASSES_VERSION).tar.gz
-PYTHON_JARACO_CLASSES_SITE = https://files.pythonhosted.org/packages/8b/de/d0a466824ce8b53c474bb29344e6d6113023eb2c3793d1c58c0908588bfa
+PYTHON_JARACO_CLASSES_SITE = https://files.pythonhosted.org/packages/06/c0/ed4a27bc5571b99e3cff68f8a9fa5b56ff7df1c2251cc715a652ddd26402
 PYTHON_JARACO_CLASSES_LICENSE = MIT
 PYTHON_JARACO_CLASSES_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CLASSES_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
