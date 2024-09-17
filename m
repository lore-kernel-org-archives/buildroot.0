Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFEBCAC5A2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E75CD60618;
	Tue, 17 Sep 2024 21:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TaL9OjonuQOC; Tue, 17 Sep 2024 21:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E03446064B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E03446064B;
	Tue, 17 Sep 2024 21:18:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA4E91BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9B6B811CD
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyfYqQsTG52j for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E081581146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E081581146
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E081581146
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:18:22 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-829f7911eecso344919539f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726607902; x=1727212702;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=90/2UFgzZ5FYObkOlsIJGd6uqgZRnhgeFgJz/piw4+g=;
 b=ID8eVFe/JjCp/rHIRnIO048SXMzahvDDPv7wfXevwRMx/WgGhiDNALyLOhM/3CN9VS
 Ve6XVw/vLPUHd9JyCoWqzS8tZPRR6KrOkN2M+iP8Q7oGq9GsR27ONsVcp6kmExLupTDa
 Ladb1CtpeX4TQ6SO9yamyJIQctuZVGUANkMQGrft6GbROd6XIaTLbex4BFJsnuWlnAPc
 uMmvkjk8DucmQzVBK30hsyvXAy7KfFmUhL2KTf4F+XLZPWWJk0yqZhd08lHnc46Bzo7I
 bQPWhKJzht2ZVulP7BrCOPwRR8etXqdCy6akPH1KaiqE4Klpq33d6GPxRdnBftxQdvA5
 vfGQ==
X-Gm-Message-State: AOJu0Yzyn4Bw3uiPV5UYHm66JRJVWPxIDx6A5zTNxrShV9Uga6QuPwfV
 byENy5WeloAvf0lqUyKRrfLvqNkNHxrMWr6MHoXKmukRfYf3B92y9XB0ig==
X-Google-Smtp-Source: AGHT+IFjujRvY/HmigX+/o4aBajFWrp6RhU1hOOUPUhxIdueiyChxZhV/SCYFQL6JRVQQ8or/VivjQ==
X-Received: by 2002:a05:6602:3420:b0:82c:f30d:fc9b with SMTP id
 ca18e2360f4ac-82d1f982f5dmr1622336039f.13.1726607901767; 
 Tue, 17 Sep 2024 14:18:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d4928d5dasm221147939f.14.2024.09.17.14.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:18:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:18:20 -0600
Message-Id: <20240917211820.5344-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726607902; x=1727212702; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=90/2UFgzZ5FYObkOlsIJGd6uqgZRnhgeFgJz/piw4+g=;
 b=TqYKO7wk8n3ho4nDjpYNEbmSM/p0cehB8/MRCIkhdXROBXsQK7KmUEuYnkglGx/cIR
 3713dAELoPav4JROXwJ3gjALfjLLpD5BWML1Y2gF2HsRRhmFM4hnMGeeLHyibPTpS2Xh
 J8zOiaNlrKHDUv1ssAARlrz5f92Tf7VSqBPqpl9TOWu/3uE8GT0EjN/NZ17zyEtXHY2t
 cxQl9300DMjxxBOfgEyUZg03R1cDJKPYq+2jLMKn/yNNUMUUVTb2ZTH9Q9eiEe3pJQW7
 iTkn5qeKgPCgnKLZ2hYCWCm4V0YJF3U/qezFXNL3drYv/XwV8rkyPK+aLN5hF5crF4nX
 W8yA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TqYKO7wk
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.20.0
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
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 10447fd800..d8c40e0586 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  db8f8d516e0229f503dd111ac4de177f  pycryptodomex-3.19.1.tar.gz
-sha256  0b7154aff2272962355f8941fd514104a88cb29db2d8f43a29af900d6398eb1c  pycryptodomex-3.19.1.tar.gz
+md5  0dc549942de42494e34e8670126471e9  pycryptodomex-3.20.0.tar.gz
+sha256  7a710b79baddd65b806402e14766c721aee8fb83381769c27920f26476276c1e  pycryptodomex-3.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index d969e600a3..8fd3df53a5 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.19.1
+PYTHON_PYCRYPTODOMEX_VERSION = 3.20.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/3f/13/84f2aea851d75e12e7f32ccc11a00f1defc3d285b4ed710e5d049f31c5a6
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/31/a4/b03a16637574312c1b54c55aedeed8a4cb7d101d44058d46a0e5706c63e1
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
