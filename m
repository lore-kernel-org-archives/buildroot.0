Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB86C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:53:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA5FD60FED
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA5FD60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85848403B8;
	Mon, 27 Sep 2021 19:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jmzg14mbmpEF; Mon, 27 Sep 2021 19:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF32C40270;
	Mon, 27 Sep 2021 19:53:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D12FA1BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE1F980F77
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8TyjTVYRPC9 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8B3581000
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 c73-20020a1c9a4c000000b0030d040bb895so875564wme.2
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Ch1IgMcAyqlWWrNjcWj0pTtCHEQpLU5rIZl2cJb6ok=;
 b=c1M4H727wyuaQiZp3uBLdNRw+jqxIM0sA33DHIJQu2ovkAwwX5zJujJrJRloTyouOM
 AIpLAxQbj5KvKHgOGYuDKVQNaEDVSXtG0N0PNKYCRqS9hmEhEsVE/fvuIH+HswMskeQn
 LG4WT+1ROB5vk1avJgby/As1al9M8mATLbLHNLEiH6hHDq21jOW6dtOiNq2zoT8+RRoX
 56LDjNQmu9vx16iJnTnaTiHtfxe6waWu/VHE1bxQeM3OweiOKgMVINNWIkRDPC9Pn1sM
 GoEr8MzQIvrEqmgtCkb1HqrLCF5ZSczI/fhnr4pn295wYvHVAalGiksWYy4B1xF+0Zfq
 z2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Ch1IgMcAyqlWWrNjcWj0pTtCHEQpLU5rIZl2cJb6ok=;
 b=YvGMMMqvY8qf8Tq77Mkv3SSNVleciYEJqwDOjOkKd/+Y49BxJvS1eJK5M6JyknXigZ
 KnIiPByQzZhDGbfhoYw1TlontIIZfD5hke7tFD4l/zpe8eom7CCrPqEtZtO+b1SJYuwl
 y+l5DGd6U1K+ltSnYqHqgiJySCXSi/MFwr/xRuYaae0tJcpJNdD/gfyUlze/05JhGScw
 /4hff2TkURAo6o9Woj4y9Yvl4vyR5PrmTUv/HAi98PZ9oa1EWEpgsUkBJMK0A8mbI9+J
 I1nsqpubqly2tjnuX0/TvW7zOaU7MiWpHsVZ8SiucWEN4q7jr2VIoBvEFrdKz2ttwKWZ
 gd4g==
X-Gm-Message-State: AOAM531s3fkBCZ3LwGXql4JnA7VJ+K+BIDZKxw6oRyZwaa1Z0bIKlnq7
 3WFrXTBI3RannTpRa9Rn4NVE8RABN20=
X-Google-Smtp-Source: ABdhPJxyjLKz+rmi/hCFQoPbS8309jO1wRHSKKoHDuPnQldr4BIeNWKs++oO2i8AZC+cJ+MR8FD7hA==
X-Received: by 2002:a05:600c:22d4:: with SMTP id
 20mr924374wmg.82.1632772314842; 
 Mon, 27 Sep 2021 12:51:54 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:54 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:33 +0300
Message-Id: <20210927195136.549542-9-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-dpkt: bump to version 1.9.7.2
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
 package/python-dpkt/python-dpkt.hash | 6 +++---
 package/python-dpkt/python-dpkt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dpkt/python-dpkt.hash b/package/python-dpkt/python-dpkt.hash
index b8b53fd04b..e5e986628c 100644
--- a/package/python-dpkt/python-dpkt.hash
+++ b/package/python-dpkt/python-dpkt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dpkt/json
-md5	b204a5434fe29749de539150e00e762e  dpkt-1.9.2.tar.gz
-sha256	52a92ecd5ca04d5bd852bb11cb2eac4bbe38b42a7c472e0d950eeb9f82a81e54  dpkt-1.9.2.tar.gz
+md5  ac3ace1c5ee12a74f12a863ac9082b59  dpkt-1.9.7.2.tar.gz
+sha256  80f977667ebbad2b5c4f7b7f45ee8bea6622fb71723f68a9a8fe6274520c853b  dpkt-1.9.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256	4c5ffde575425591cbd51410219a6b98bbbb717e0c5784187e356653da8e5095  LICENSE
+sha256  4c5ffde575425591cbd51410219a6b98bbbb717e0c5784187e356653da8e5095  LICENSE
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index aade014f68..87945d67c6 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DPKT_VERSION = 1.9.2
+PYTHON_DPKT_VERSION = 1.9.7.2
 PYTHON_DPKT_SOURCE = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
-PYTHON_DPKT_SITE = https://files.pythonhosted.org/packages/1c/25/0aebea939ea70d31a7ff8884e5ca577eddb9cfeac626398fe782d4e2f6a2
+PYTHON_DPKT_SITE = https://files.pythonhosted.org/packages/95/51/923b370880eff9b62fe4fe965a916da709022a02669c670731da69088e93
 PYTHON_DPKT_SETUP_TYPE = setuptools
 PYTHON_DPKT_LICENSE = BSD-3-Clause
 PYTHON_DPKT_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
