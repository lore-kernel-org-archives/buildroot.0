Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE874C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:02:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B6CA60FF2
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B6CA60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0142680F18;
	Tue, 28 Sep 2021 11:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEhNdXeHKwsS; Tue, 28 Sep 2021 11:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5045880F16;
	Tue, 28 Sep 2021 11:02:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD8AB1BF84C
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9753403BB
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABVdfoKeCChX for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 11:02:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC07440331
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 11:02:21 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s21so17258937wra.7
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 04:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MbcKu5Pn6wRR3VmlkWI8Wqgz7S4XuXdQqSfl/6yypVc=;
 b=CCq6TLnerof4NkrqT4hOJwhY02MULitOLGqjkCXtUIucL1nm21CJ1m6JR1J5rMKtdp
 fWYGjHMSThc9TfXJUWgXDhiPdrjxQVjc5EEmI8a3oiJAG+Ge5XYGUj6dJsci27ks2lPX
 unySHXP6Qxxwrv0TlQjbKQGWokGtHjZQipfgbDtcWzZ82xfX5pw0dOnOQVJb2kl7jOhZ
 vlFAsF8tRFtQBpkCsMXE8C/oQ9doHWuDScYhsGbOlNrpSPsMKW86krM65VJ8OL7n0USb
 ooStFDYoNa89IHjDyxM4rbIKjzE+hCtVEaKSNdSMxzvCcklq3SMRtyDcGGIYem3Ud/hw
 9r/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MbcKu5Pn6wRR3VmlkWI8Wqgz7S4XuXdQqSfl/6yypVc=;
 b=ja2kxdk3Qf4HZEmn0RKVt09JK8jLO+Nj6uziIlVaH+UhnyJ06xf1CmeMHDdOgoPXLM
 lHmHtLywnI8RUHmT1iUPKAbhUFfbkG3JfUIxIZ083CLBNOmjU5FzC77AbdrZvtuqRLs7
 w0/sER6j7YQsVtFDIGB7J0tqSlhexj6I26rhfB4bWWMkcCnSZlDx5lGloiMKKyOiN00w
 y9oN5mPuHOXgDeXmOSKc/IgxChOilVmFN1Fk6CJ1k2i+wKK42kyjKxFUN5qyOX7L3HpN
 qogf2x2n71kFJ5UkZFkrHrjLRmZfXguXK5yI4tTBqLdMDCS6laUHKWvxe7JYWAq8wB1v
 ewjw==
X-Gm-Message-State: AOAM5330DDMEou98q7VPVEixmEE8rIc2NNyJetvU6J6UK2mXFpT8cG7+
 RvbqgZtRC8KoqVAGd1kv7+AW6QBCUJA=
X-Google-Smtp-Source: ABdhPJy/m5DvsgU6T62wt5Viu1RoZAWwaMD0e5/oG0/A//LlAu2AjzRIu/lffaggeo+QQM+oQiChXA==
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr5554035wrs.55.1632826939675; 
 Tue, 28 Sep 2021 04:02:19 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1254:64a2:465:81e0])
 by smtp.gmail.com with ESMTPSA id c4sm19432155wrt.23.2021.09.28.04.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 04:02:19 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 14:02:08 +0300
Message-Id: <20210928110212.596939-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928110212.596939-1-asafka7@gmail.com>
References: <20210928110212.596939-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-posix-ipc: bump to version
 1.0.5
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-posix-ipc/python-posix-ipc.hash | 6 +++---
 package/python-posix-ipc/python-posix-ipc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index d267cabc88..4258af6348 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/posix-ipc/json
-md5	c4fd0065244ccb2f59cb8ceedf287cf6  posix_ipc-1.0.4.tar.gz
-sha256	ff6c9077633fc62a491d6997c43b094d885bb45a7ca1f36c9a0d647c54b74b14  posix_ipc-1.0.4.tar.gz
+md5  8c9443859492ecf3aae9182aa6b5c78c  posix_ipc-1.0.5.tar.gz
+sha256  6cddb1ce2cf4aae383f2a0079c26c69bee257fe2720f372201ef047f8ceb8b97  posix_ipc-1.0.5.tar.gz
 # Locally computed sha256 checksums
-sha256	61f0669e70518e6d32f87e485965fe9309de60e4bef938b29cecd068b3db9a98  LICENSE
+sha256  61f0669e70518e6d32f87e485965fe9309de60e4bef938b29cecd068b3db9a98  LICENSE
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index d4429f117e..359dee6d7c 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 1.0.4
+PYTHON_POSIX_IPC_VERSION = 1.0.5
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/c9/3e/54217da71aa26b488295d878df4d3132093253b4ae5798ac66fcb6921ef0
+PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/bc/2f/9a7901aa26fb0e02a671b989ba814d059a0f45af85cea31b9c9eef7e2dda
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
