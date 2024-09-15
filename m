Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE5CC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10ED81149;
	Sun, 15 Sep 2024 22:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uwr4P1bmTGl1; Sun, 15 Sep 2024 22:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A458A8114B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A458A8114B;
	Sun, 15 Sep 2024 22:20:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05B821BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFAB2606F5
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbXLDBzbZf6o for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:20:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACAE160884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACAE160884
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACAE160884
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:20:27 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-829f7911eecso230667239f.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 15:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726438826; x=1727043626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PciShynl/3Q1Fquebpxto2l4WGg8/IxIe3V1Cj8PVeY=;
 b=X5mGlnUmkQIC0TQ9xCbssC6lkazQUxErBAsSRBo+1DO2CCDjvTcPwJI7nqe1GXm42A
 Qs1PqtYtY/gmmwWWCjkSi5Tsn4ZkVzqvkkjnRPP8lofuI0q/N8XYybmw89fxiAj5Z4By
 P89bKTSFvwD3L/EMrLaU/R67VU50//KjeNaiqmKUsyX4H/FCtfR0z+sP39++oMC97eh5
 jIaXMFKbFsqLJxRg8Rkg+T6aEJU5BHJBpY+uCNQBroLbZr+qrzP40wih/ZNRysb2y3v0
 eybvzZ5cInnvZ18TeqqSrIPX+D0G2cIKfrLJnHfk96iJwb1KhyGeuGcXb9iVmueUo+8Y
 JpeA==
X-Gm-Message-State: AOJu0YxWjSN3w8CNiN7sHB7qxBgg21UHo0QfKscTq4ZXsshFcHUSIW9M
 L3mJDwnfzd+AUWVC/Bw3ciS3w0njnhQ4N2REbb4JAcOJ16I4xnVApQZoOw==
X-Google-Smtp-Source: AGHT+IEX3JyVs+5yAbaWzKKwtapgDhUIyPF32RYEZftchfR/yhzP0Tor6L1tx7WDAbPB5+23JH0FMA==
X-Received: by 2002:a05:6e02:1a48:b0:3a0:9aff:5042 with SMTP id
 e9e14a558f8ab-3a09aff5711mr46506115ab.20.1726438826326; 
 Sun, 15 Sep 2024 15:20:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed59713sm1120746173.177.2024.09.15.15.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 15:20:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 16:20:23 -0600
Message-Id: <20240915222023.1660220-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726438826; x=1727043626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PciShynl/3Q1Fquebpxto2l4WGg8/IxIe3V1Cj8PVeY=;
 b=At2EaM3GCnfFSjjunJeesk4rLPb0mEP25135EBxg7IWqASZp0KHug5ctDf8MVThBO5
 is3dBcQ0Ad+ia0sjwXgVal7FQCKTxQAc96oeqe+C4E29UBRmXvCVt1C5MkXGw1U48DU9
 NXmT6XMjXPTgPB6FvcAR8wS/lAi0vaevd3B4sYdYy7WaPRDbmTq7WfL8SRNJFt3m9Jwr
 eiDBQpqSzHoDKZ4BBEmsdQKl10W1CctUM8Fve24RAQ2jonbLhni+a9Kiecd+sSzAEXMn
 4oMwlC2HhjaytPod5VShvgoimlhJwCTc+P7o0rd5TCEDenbLypzCWxHnfmeyZBHNbN12
 gQ1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=At2EaM3G
Subject: [Buildroot] [PATCH 1/1] package/python-markdown: bump to version 3.7
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
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to template update:
https://github.com/Python-Markdown/markdown/commit/ea92856855a6314488acb121f21f8fa02860e008

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markdown/python-markdown.hash | 8 ++++----
 package/python-markdown/python-markdown.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 21f0c28bac..9a452bb4f7 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  1bd2746a8f32643f151991719fe7faf9  Markdown-3.5.1.tar.gz
-sha256  b65d7beb248dc22f2e8a31fb706d93798093c308dc1aba295aedeb9d41a813bd  Markdown-3.5.1.tar.gz
-# Locally computed sha256
-sha256  6f1193cb634718e65c3a537d6e25ebd614820ec0ef693cfc12248112638d64da  LICENSE.md
+md5  de4cdc6db368c7386f733d6dd8c858b1  markdown-3.7.tar.gz
+sha256  2ae2471477cfd02dbbf038d5d9bc226d40def84b4fe2986e49b59b6b472bbed2  markdown-3.7.tar.gz
+# Locally computed sha256 checksums
+sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index b491660f24..4cacee24f8 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.5.1
-PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/35/14/1ec9742e151f3b06a723a20d9af7201a389ebd3aae8b7d93b521819489dc
+PYTHON_MARKDOWN_VERSION = 3.7
+PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/54/28/3af612670f82f4c056911fbbbb42760255801b3068c48de792d354ff4472
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
