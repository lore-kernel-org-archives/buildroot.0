Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0638C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:03:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B561760F9D
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 11:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B561760F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7411760B70;
	Tue, 28 Sep 2021 11:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqDFsEMkDe3K; Tue, 28 Sep 2021 11:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 125BB60BB9;
	Tue, 28 Sep 2021 11:03:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E3F51BF983
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1526360AD3
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 11:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 469hEvbNPsqw for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 11:02:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC6FB608CB
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 11:02:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t8so57418452wri.1
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 04:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+sAiJ3PRyJS7G8cUomrXHLp1BabcKtDHKdB7E1tX32I=;
 b=WvWtTg71t+A+Lz9raU35Rb+Q85BvMW0rzzi77nvfcyAsvCggVvwmfgN4YDyYiORXlz
 OHdkxk6yS4c7qbL564n1dKnFPdKwI98/sAJGLInmgDqDOE68nChcejhNt9KfCYeONgQo
 Q2CZaZkP5/N+jodbmVIGUzfJFH7hzz2EMVJBgLudJ+/Sea83fyJpuHuh3hDjLChdB9S2
 9bZrPAbglQnGjce7dF4dxoUJAlOrg8zbDcLHfKbjoJ2XifxxdQwqXjztCgzQu97uhZyw
 aG7jcBDKfCGPizVGh4u3xjYp0AJAIItKqU7hZADA730pHzoXSX+RlmzTKa4QBwbk05+A
 b5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+sAiJ3PRyJS7G8cUomrXHLp1BabcKtDHKdB7E1tX32I=;
 b=EczRVcOBybq2lfcKj2J3NNyGNGXkqgzARnLzigW6UeSgtG3ZH1J+GHTUgNiBL0cpzZ
 /97UUIFNtGcGBU1GV5/hzII2e0ZXMFZmWwuafJKutqFBYlifxLbWIy+8Xfu/5zbr704v
 p0o5yFom2DylZ3zssP9zPH/g+GG1C+Jcrioht3aevz3mGGlEYNzXdIzsgAjHdn9Mufth
 Zp8iosIZI5RjV25SXl9d7f0vcPX6ou3C5ZagLt/KqhL38d0VYj/2eUW3TKVOZAkt30Qp
 SksSKhaGdlXUbVrXNOo9sPqGCR1n4uuKCJXQ1VUlOR36SvlegJ681EtGq8rOLR4lyor+
 c/oA==
X-Gm-Message-State: AOAM531jPPL369KzTXsNPMwaVGLDJkTaDCAZmjCFpFdn9Xw8g6PFlfru
 iwwSxmnDLE/SZ9Iw/EMiMJ0BhxNvuaA=
X-Google-Smtp-Source: ABdhPJz7c4khmHoNbRYWdU+NoSSjKVOce/lqt2G7AertSJHmhHgYI35bgJMUMUwgeim/D1SrPmv6Gg==
X-Received: by 2002:a05:6000:1561:: with SMTP id
 1mr5521312wrz.369.1632826943798; 
 Tue, 28 Sep 2021 04:02:23 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1254:64a2:465:81e0])
 by smtp.gmail.com with ESMTPSA id c4sm19432155wrt.23.2021.09.28.04.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 04:02:23 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 14:02:11 +0300
Message-Id: <20210928110212.596939-5-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928110212.596939-1-asafka7@gmail.com>
References: <20210928110212.596939-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ptyprocess: bump to version
 0.7.0
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
 package/python-ptyprocess/python-ptyprocess.hash | 6 +++---
 package/python-ptyprocess/python-ptyprocess.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ptyprocess/python-ptyprocess.hash b/package/python-ptyprocess/python-ptyprocess.hash
index 3af431a756..bbd24b33ef 100644
--- a/package/python-ptyprocess/python-ptyprocess.hash
+++ b/package/python-ptyprocess/python-ptyprocess.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ptyprocess/json
-md5	37402d69f3b50913d4d483587bffad8f  ptyprocess-0.6.0.tar.gz
-sha256	923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0  ptyprocess-0.6.0.tar.gz
+md5  9da200c397cb1752209a6b718b6cfc68  ptyprocess-0.7.0.tar.gz
+sha256  5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220  ptyprocess-0.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256	c822d385b1a73329846241799becf18690b5d44764c1bed69300b536a405030a  LICENSE
+sha256  c822d385b1a73329846241799becf18690b5d44764c1bed69300b536a405030a  LICENSE
diff --git a/package/python-ptyprocess/python-ptyprocess.mk b/package/python-ptyprocess/python-ptyprocess.mk
index 45102e9aa7..d077fbb779 100644
--- a/package/python-ptyprocess/python-ptyprocess.mk
+++ b/package/python-ptyprocess/python-ptyprocess.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PTYPROCESS_VERSION = 0.6.0
-PYTHON_PTYPROCESS_SITE = https://files.pythonhosted.org/packages/7d/2d/e4b8733cf79b7309d84c9081a4ab558c89d8c89da5961bf4ddb050ca1ce0
+PYTHON_PTYPROCESS_VERSION = 0.7.0
+PYTHON_PTYPROCESS_SITE = https://files.pythonhosted.org/packages/20/e5/16ff212c1e452235a90aeb09066144d0c5a6a8c0834397e03f5224495c4e
 PYTHON_PTYPROCESS_SOURCE = ptyprocess-$(PYTHON_PTYPROCESS_VERSION).tar.gz
 PYTHON_PTYPROCESS_LICENSE = ISC
 PYTHON_PTYPROCESS_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
