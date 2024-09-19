Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD09CF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 19:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE0FC84BB3;
	Thu, 19 Sep 2024 19:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUWUG_eoquH4; Thu, 19 Sep 2024 19:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3EA984BCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3EA984BCA;
	Thu, 19 Sep 2024 19:02:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF8B71BF5A3
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB55440120
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2X4iYCzPmmd5 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D5EE400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D5EE400EA
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D5EE400EA
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:02:39 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82ce1cd2026so51434539f.3
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 12:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726772557; x=1727377357;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YK4D8E/9xnqNLkjbRjg58lEsxF4eMD6CBt9Q7+niErI=;
 b=WGsPJScNhhCsomilLwxpjn68TnXwz25j8HmOHcRJsWCuPWwWbUBbLWGGdov+KH8/cC
 k90fy/ZfKslfXxgJA10OwZXNN//vGFkrE3Hyiq0HKmxSoC/fUrKNH/9iX6ibIdWnfd6u
 jE1BM2He252kKCpuJYZiymhlJPFeVgNLbfYxOqRXrfw996hDyxJ1f7t2Ezn84pdF9Gh7
 Jp3YaN60jRSI0wOZJQaqUvZbJtxo/bGJBMsp3eH4jocWnovawizG/rxffbzIP7avW/Qd
 9Q4ow7jKIhYzcl5VVkCb/Sk4EKbGY48oXFSJ2a573tp7gMy0GZX7Gj/5gxoSQaN1r6mk
 Gxvw==
X-Gm-Message-State: AOJu0YzzO82pvHZZgEfa+TYmoloPIDEdVNVZwMyaQ/TkpTn+4+dPfCg2
 8kmB/J7dmi41bRMMBl2mvoAmKCnvq/dzAOcjpnqKHLAZmm3s4knsVE1i2w==
X-Google-Smtp-Source: AGHT+IFTNlF56Yq8Th4NPktRTdYvusm1z2pPVVB6e/7oDfras6QHqj4bwDdkA9JRWvdg86oeOoD50A==
X-Received: by 2002:a05:6602:6019:b0:82c:f517:dc9e with SMTP id
 ca18e2360f4ac-83209d2d444mr58496539f.8.1726772557281; 
 Thu, 19 Sep 2024 12:02:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed35b84sm3136013173.151.2024.09.19.12.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 12:02:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:02:35 -0600
Message-Id: <20240919190235.658827-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726772557; x=1727377357; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YK4D8E/9xnqNLkjbRjg58lEsxF4eMD6CBt9Q7+niErI=;
 b=cEgFWS/G8nZ8kdH28E87J3TXOk5YxMvVccLb1/CgDYPQk8xfgw3qGZnDDiG1cXLTav
 BeSFaDJQoniy/IE+qGuVEEcCiEveI5gBx3HEvW5PV5XVemhXr9b+bCmTNhpeqXOL+h8h
 XGLv/VZNCOik3zsV8beBzBEXFgdAZKZ9C7EZ1EU+T+jLTXGcIj+679HW2wN2g9qMXij8
 CYWQO1kFm9YM63vJShHyTzoyfsRVWMOLFQWswYQtvcnfAUcFkiyayG4xqv3X3M8focSW
 qjhbjuN5tw7hbCSRrZPI4lJroP9oRi9rudeypzxBEhWfJB+9E88JuLQUYLZJVbZjER6X
 NccQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cEgFWS/G
Subject: [Buildroot] [PATCH 1/1] package/python-segno: bump to version 1.6.1
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
Cc: Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to flit build backend.

License hash changed due to year update:
https://github.com/heuer/segno/blob/1.6.1/LICENSE

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-segno/python-segno.hash | 6 +++---
 package/python-segno/python-segno.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-segno/python-segno.hash b/package/python-segno/python-segno.hash
index 58142c184f..a467b663e8 100644
--- a/package/python-segno/python-segno.hash
+++ b/package/python-segno/python-segno.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/segno/json
-md5  b80c19075a7a07cce50b054e9e221cf7  segno-1.6.0.tar.gz
-sha256  8d3b11098ac6dd93161499544dedbfb187d4459088109b8855ff0bbe98105047  segno-1.6.0.tar.gz
+md5  3835036bcf44667eb0a155107ed1ac67  segno-1.6.1.tar.gz
+sha256  f23da78b059251c36e210d0cf5bfb1a9ec1604ae6e9f3d42f9a7c16d306d847e  segno-1.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256  3af9b2f15c736a571978760b2d60598502c205eb6daebe2ec36f0272c380ed28  LICENSE
+sha256  720b7b93e4e80374be9aee88c650a468ae6a6b6471ce4581058dedce23d3cf9d  LICENSE
diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
index 2c230ee26b..03efcb5c0f 100644
--- a/package/python-segno/python-segno.mk
+++ b/package/python-segno/python-segno.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SEGNO_VERSION = 1.6.0
+PYTHON_SEGNO_VERSION = 1.6.1
 PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
-PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/51/a8/960844fec8d853a4e8e91f64bdde323ea5a2a44357eca799e7f7f7bf2f1e
-PYTHON_SEGNO_SETUP_TYPE = setuptools
+PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/5d/74/3896e205306a1b43d6b88326e5838572d97b4b74df8c9cd11acfcd9db503
+PYTHON_SEGNO_SETUP_TYPE = flit
 PYTHON_SEGNO_LICENSE = BSD-3-Clause
 PYTHON_SEGNO_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
