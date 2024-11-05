Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F30D36107
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 19:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5420480FF8;
	Tue,  5 Nov 2024 19:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Uk5odvyVkTh; Tue,  5 Nov 2024 19:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 611E480FFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 611E480FFA;
	Tue,  5 Nov 2024 19:02:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C510AB8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C017540042
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkOuRaytxt0c for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 19:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD15B40136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD15B40136
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD15B40136
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:02:53 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-288fa5ce8f0so2890931fac.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 11:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730833372; x=1731438172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LS0JAQPMnwAwrnK+nbmHhpcBoldczn3isAq6/pXzMJs=;
 b=bosy58bQ+QbDB5JGCg2TT+GHCXp/IWB+QMod0/Jt77YOZDk+D9iTAmzjD3W3F7N2Cx
 ijzvGlLb1fJWMAbrSlBDYSfousyxJRoKcklK62Zud7WT4vP5RL2oYoeWaSEYZcM2z+ie
 XXns+9ldw7B2BJk15JJTVehwR9DX2sCbX/TEZvJmPA7RzadpyUUeU5o8m4J108oUZFDS
 f8EorlE8m1X2RIihEwnYr4t37IDwTuhSDeqSg9sesaEcWfVNi+KoB1elaeQjTkwhmVVH
 5sX7CpPOAgaBJwYg2tUA153PVwJbYpRSbselnk5Ycgv5t+dozwI4dZpuqrQHrg4EGRf6
 yIHQ==
X-Gm-Message-State: AOJu0Yz8+887mZpP7nMUWN5/Q5MwR0D7OSjtv1BePQObD5S8aN7TTOB/
 J+81Pu/FgKaPkyYL5yiAAIavWysR3ji70Gjq5ZLq/9Ef0CSbSSrPyfarIg==
X-Google-Smtp-Source: AGHT+IEt5w/yB88/XOERPzLuY6XbKt3hVkz+9pVgd7DxRbp36KFtVQ8o9W3Rx10w6HEbzVguvMY9WQ==
X-Received: by 2002:a05:6870:1697:b0:288:41d5:bcc6 with SMTP id
 586e51a60fabf-2949edbae80mr15496647fac.15.1730833370922; 
 Tue, 05 Nov 2024 11:02:50 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049782casm2524679173.101.2024.11.05.11.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 11:02:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 12:02:49 -0700
Message-Id: <20241105190249.1554024-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730833372; x=1731438172; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LS0JAQPMnwAwrnK+nbmHhpcBoldczn3isAq6/pXzMJs=;
 b=IMgCkxWFqQcTz4F18N3o/DYGyYjHFd8l8qy4mRZaCoqeRU719D4QhWuSKzbeGdkJ4Q
 GZ+RqXLRXFG0pWaV+OuAUox8wS5KmBf2maiQr7OUqZTsecWl9omyB/+jKgUZd6Jxges2
 lkfLtJX31mVXPOJTeTP8sGkyD8E/bQH/stbUt5tei1qalzd3Y4g1WE8mg+6VESJK0prz
 EvK1VQKq3TkkfB2IFF6BNNMzdeZ1mHFZiXsbW6luxmfkTuroj0G85YdmRGnyeH7u/HGM
 9f0He2VjD2XG5juX6D6cSzzLmcs5lb2hLefieNZN1F6zY4BG5LHjeL/MInwgnYvJ9YZR
 Awzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IMgCkxWF
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.26.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 2ee1c5cfef..76e05eb20e 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  5617ab9b3785c52ffc07f19b1125d24e6062179041a839be8e7d1ceaa378c522  python-pydantic-core-2.25.1-cargo2.tar.gz
+sha256  c9a9e5970fbe54f24023635743dfe0f9a0adbebafb467729b674399f06a2d0b5  python-pydantic-core-2.26.0-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index b1d0a21e15..865c7d0c84 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.25.1
+PYTHON_PYDANTIC_CORE_VERSION = 2.26.0
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/38/f2/88e2e8b3903be9df15207bdcab90987d16fb98ee794ad1b3cfdbce9815fc
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/98/85/0ac4f8fc632fa1bb3f473e4dfb1cd520ede11179f76a028edfd2ca989ed4
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
