Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5916FC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E825980B96;
	Mon,  1 Jul 2024 18:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OT-kBllZ8TFy; Mon,  1 Jul 2024 18:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 672AF80B97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672AF80B97;
	Mon,  1 Jul 2024 18:59:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7441BF2F9
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 360D460AD1
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LM-7TPYlynu9 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29DB660AB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29DB660AB2
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29DB660AB2
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:59:25 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7f64942fc54so28411939f.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719860364; x=1720465164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6qB49IiMIAgC61jPCLdt9WS/Qi4Qp8Z5ZSWtrDStSM=;
 b=HYtPd1h0R6o9cF21aYVuoxsZILL2fBvdsF19ed0SoFhKIuvOufPPcR6t+X9VGY/gBt
 3K/5CVzQY7Hfhkkx9+cd6zwmTJetUcFgRmN9CN69HQ4T4fxURGjojfFlnAHs0MY6DslE
 8WlXjG38V9dvqUIsXabRgJT9PlFJt9wGaTt5gnOSTH25z7s9Am6OXLBb010j1JsbYy4A
 C05tkO9tXxWHd0QWIFXAH5MpejkTMJs16aGdjyL1iTS+D1NX5dE8Vy8XCoDcnwYM1GYQ
 8WXr7yfuP5mXh60ozs06tn/TbJt8UmoOpUfr91Pln1upEzwD9Si3PaXdPR8kyou6QgUO
 JCPQ==
X-Gm-Message-State: AOJu0YziRu5RuCQKuiMlDr/20/q7akUNcLZ9EYyNVf60VzmqPoCVTQ7t
 mXM5rK3E7scTiW9AKaL27hsltJH3Ae1nBsTYDjGLArZbAKFwrlvIgnw54A==
X-Google-Smtp-Source: AGHT+IH/QFeD/TYH+cAFzyDUievsCf2MxUqWCqFDa4GkNzvlmj1AUpvExjLzdZtwk46A5mQnMxdgrg==
X-Received: by 2002:a6b:e01a:0:b0:7f6:1fcc:25c5 with SMTP id
 ca18e2360f4ac-7f62ee9b593mr901139239f.19.1719860363871; 
 Mon, 01 Jul 2024 11:59:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73fa189csm2301913173.110.2024.07.01.11.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:59:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:59:22 -0600
Message-Id: <20240701185922.1759235-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719860364; x=1720465164; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l6qB49IiMIAgC61jPCLdt9WS/Qi4Qp8Z5ZSWtrDStSM=;
 b=K6DVmjCxBj415vhRWawBbMtb4R6CMFSaD6F8mDOzqTdDPH6mgy+0VoSakgnKyKZjfe
 sSp6YaCG12jc+0fQPSckMLWT0ZflFYyBHszGlcBAB7kmWKR0vhHJscY5Y76wH7WJnQj+
 vfuhbjUmGB8MFyVy1X6LlwdE7vf2R/zlJJgaoqjY9cAhItOcnqVVh6p8CcnlLAIPt853
 2v42UGroqingtCqEhd4eLRyJ0AerPFMCSEMQUydeubm2c1OTmolQmbF80g/4F1y8I7dq
 5JXaoDWUzrcCCtMmS6LGppxvduxmUXfZ7oEBLspP0oEcUt5PEqmHzNrZQ7n2tRr4EfJ6
 FZmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K6DVmjCx
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 6.0.5
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

License hash changed due to changing team to contributors:
https://github.com/aio-libs/multidict/commit/fecf3d43983a121ca44bfb11415c0110d7da4408

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-multidict/python-multidict.hash | 6 +++---
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 568c320c53..d23a3de3eb 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  ec06a613d871dadfb66f2be3a1f2f3fa  multidict-6.0.4.tar.gz
-sha256  3666906492efb76453c0e7b97f2cf459b0682e7402c0489a95484965dbc1da49  multidict-6.0.4.tar.gz
+md5  abcf9bf19365d06aa784de07da02115d  multidict-6.0.5.tar.gz
+sha256  f7e301075edaf50500f0b341543c41194d8df3ae5caf4702f2095f3ca73dd8da  multidict-6.0.5.tar.gz
 # Locally computed sha256 checksums
-sha256  06a240ea10ba868fda2de58df859886961df873aa74bbab1e0f13eaf99f92b7b  LICENSE
+sha256  93d11a968e2f0f36373c40811ff6d20e173f58c3cab5884cd6617bbfd795492a  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index cd35dcb4cb..3c9a21f1dc 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 6.0.4
+PYTHON_MULTIDICT_VERSION = 6.0.5
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/4a/15/bd620f7a6eb9aa5112c4ef93e7031bcd071e0611763d8e17706ef8ba65e0
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/f9/79/722ca999a3a09a63b35aac12ec27dfa8e5bb3a38b0f857f7a1a209a88836
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
