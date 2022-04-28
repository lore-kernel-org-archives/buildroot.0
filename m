Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD14CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 19:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D1C283EDA;
	Thu, 28 Apr 2022 19:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4xPFJ3QMXzv; Thu, 28 Apr 2022 19:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC76083ED5;
	Thu, 28 Apr 2022 19:37:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EE4E1BF3AD
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 19:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B3D64017E
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 19:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwMPrad4WT-K for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 19:37:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D79A400E3
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 19:37:41 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id 125so7570404iov.10
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 12:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FDWXHCIfm3lM1ynAxwxPwPn/eMI/mRnC/PhayVac+ts=;
 b=qeqPq0L/qWY04NNlJwxEsERCCbeTlQvVYST9ywN7wuPo1TS9eR4ItJkaRynfcUd06A
 aAKjuMTzm1JcwI+8evZIzmKrGQdEZ8/elZkRQHw5vF3pxVoCUV+DSAGMlq+T4VCGWCbj
 3DcnDfdVaXHF37IpwPjv51tva0pnhTtgx8LOY7nXxgP0QAhX2wJS+C5dkJRuireIKOOy
 oLBdSUEg1edI/IwwSdqX1GihHvocgKwS1vUCMPxwFaVIzRRc9DtH3I9OpzA72kID6Zw3
 FdN8bt6hu5Q1gj2IyLfXH6q1xqXMM96JQtdIExdtYPvq1eWFxztVkwgNO8PUOLYu33U4
 B2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FDWXHCIfm3lM1ynAxwxPwPn/eMI/mRnC/PhayVac+ts=;
 b=jLUnOh2Jl1gwyJH9jFTB67Wds1SF+D55U1TDC4WOu0dYhy256SxzscDsaSl/d8wm5w
 7xhvNoItbt0jyHnIfdM3q+nK6NykXzxwZfemuOdiFABz63G33bU8D+eEkD3eqsow/102
 13gJiHCcZ4Nhb2Krxw38WI581UlHEpMT+LW54xhMs1HaDX/1FW2//97v2X9qtsOEyDSa
 ntojI5xIPwd77f5I3GV7F9czIrxAYhZrw74O7/nVkJuLkcjpbanDW3CsXNDvwKeMnZBA
 ZgTDxdtdwKUN/YPdZ1Cs5cqGPmiNb/uRHBy67TQYGnHXg8QMvmmHP8sfepao59MEiT7l
 6wUA==
X-Gm-Message-State: AOAM5304bptuc06L9El5pHyLKpOeCiALePMKq1zEwfrpXHpBOb1A6FfO
 /texP0PEadpQG+2EHWNP8P4ajbTFcJk=
X-Google-Smtp-Source: ABdhPJxsi3Y3oWfyBcAwR7YFvqnkMMf9kXyVQgfTaDbMqhg0EUm5v7EvyJI5A3kmC7atz/80UaBWQQ==
X-Received: by 2002:a5e:8718:0:b0:657:af28:7485 with SMTP id
 y24-20020a5e8718000000b00657af287485mr5427099ioj.56.1651174660108; 
 Thu, 28 Apr 2022 12:37:40 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 m8-20020a92d708000000b002c6381d9144sm409983iln.59.2022.04.28.12.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 12:37:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 13:37:38 -0600
Message-Id: <20220428193738.772448-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.3.0
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
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index ae3a3463a5..2375c7528f 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  50c85a5d19ebb7985dc548c76a3bcc25  setuptools-rust-1.2.0.tar.gz
-sha256  0a4ada479e8c7e3d8bd7cb56e1a29acc2b2bb98c2325051b0cdcb57d7f056de8  setuptools-rust-1.2.0.tar.gz
+md5  9760ac511ebe33c759b76efb0a1299dd  setuptools-rust-1.3.0.tar.gz
+sha256  958c5bf4ab6483d59dab888538121871cc5006354a42fb0fbd50acf03caad1de  setuptools-rust-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index c2d8c6d9a7..c342773476 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.2.0
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.3.0
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/4e/02/2fc4c83b4f816fdd30f38c0c4837a322d21967f953bb9a51bce91b4511f6
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/a9/55/5db4a5b137af2afdc23a6e251d5ebb3b4e04c8deb68fbb5ffdacbd134c0c
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
