Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A26F31E27
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 15:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 490818186A;
	Thu,  9 Apr 2026 15:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqwwL8Ftl1qZ; Thu,  9 Apr 2026 15:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BFDD814C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775748332;
	bh=n3abJkfnoEGoapVII4hGYrMVoH4FQc5MHum2mlG0/xQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ayUTNUAofRywf7ma2uQGTOZiR+mavlnFXc8vNXw5VtqP03sZ1txFemJMnp1pCjCWn
	 3dS+GWfX7x+YgvKFWSuh9EUOFEQxYj9OCCAgXsQyHAJCSz+ZJbIZil9YCMA0vlZBWo
	 jKmAWjh/5aCKItqvtF8LgvuRrLfVzBus3MFixGykhJ6HkSWgNeYteZKNdDAs05JFGf
	 ji4J3swFL3xIb0A3nkFp8BcNb/YkLDYEWYQ/v3GC82/PCuaRz2zFmiKY78svVb6ur0
	 kjXlk1+pTwxvqAddNoqCDU0qV2aZzMOLxAC+Eu1PGFJjySN0vkzxO0/Y7yU7uGcmhK
	 EnNR/D3FGY5eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BFDD814C1;
	Thu,  9 Apr 2026 15:25:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB891D6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E92D840D26
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szoK8CBxyvPD for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 15:25:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F022840CEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F022840CEC
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F022840CEC
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:25:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43d17bb1c65so671379f8f.0
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 08:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775748328; x=1776353128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRuWQ27x5AGOuGroQploelo+VgNipRI/TcWSoES93Cw=;
 b=loEahdNTofx/Wlobkqeip1Y24AENnGkMTq2GebhbLokYyXDEGJk+S1RgnmKHJmqtYu
 WalSMCLK6clurh99Z/yDnNqsyZP1F+8LgCsCNzwhdP1nPWNkbNRf84KJoqD/E0Quij5k
 t0KgKz2EbKXy6oZdL2qxUhzDREtRj/wyCiZ6kQYcadaYzW5zTwKycKY8XHhvCa+kpQW9
 HcxyRgl5uT1FRbZquGp60vfgo3IXEN5E64cpu7xnkGdiLVTCtBP8ymJ3hNrPB6N9THa6
 en/GsAWDIP3c6Rnhw24P0gZiUZJ+BBVon3Zb8HZW6HKH74bZCdQF6PBdMAnXOZlXuMga
 UbtQ==
X-Gm-Message-State: AOJu0Ywk94nxd5Eur9NDLni70YW344nAwhGpo6P0tWo2iP1Vn08puAaT
 eCuxvpqHp3TA27LrjZl8QEOOwdGagwn+KlZ2NthYThS84nPACFOGHKppf2UzBzoI
X-Gm-Gg: AeBDievKkCb0zvyw4pIFu9uqPtOQuewVBF3ChnLdNabCxw+DroPZ4RMNmb00aWHpWru
 rtdUS4MgUzwre/CPJTbUTbt0aXFiYE3wv+txs3ZwIvF/Ww7fsCEfdxNMVEN1wxxrg7HG1odQmZe
 V7LkMYvz0DbVgZDteSCZGYn78aB7Gvtx3+fiCTanImHbT8wKxR3wVKhsi9QID8NBcQwu0P/wYzA
 f8/i4/YmQJLvy5+vGbf5VLuV8PvIIRW4ypFPp6O+9KQsg5xZcprmM+X+yqFRbUp16TmCb4n7f0t
 A9UdWflWGFNMFE/6bpihplG9gF6Rh+PzMLTUKXpMoX6dOvQrA/AAG2i+HEb8lp3fDCPVFvbvQIk
 oLJX/oad7XTbqEHgKiQbSFh4zQ2aM5J3NcY6KfoV1fctctSfvY9wR2Jc3u9CYcKZ16BvuXuQiKx
 StsrMG61XtQwx+bBqTBmBiP2gQWlrkJ/DYQE6D1xUan3mA8RdkIf7Ib05LPLOPBZ1ZysSMRof6W
 oYx
X-Received: by 2002:a05:6000:240b:b0:43b:8fa4:1937 with SMTP id
 ffacd0b85a97d-43d2927648cmr36911610f8f.5.1775748327577; 
 Thu, 09 Apr 2026 08:25:27 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.173])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d29bbsm70309655f8f.21.2026.04.09.08.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 08:25:27 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 18:25:20 +0300
Message-ID: <20260409152520.5894-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775748328; x=1776353128; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eRuWQ27x5AGOuGroQploelo+VgNipRI/TcWSoES93Cw=;
 b=n91504HnBciOvxpranZ/CrGSbPZoT2OSR9FzeC9Y6z7vtOG+mXEvtykqAPmAUbHWCs
 NWgcI0yJ4zt+mQVz8gD7kapoxmj0cqIy5Ff2ZZFk3cDk9tUiDz7Huazno4OqNAPTMUzq
 Np/30RL2fOxc/kW1Ms5fKf9/Slhk7G6VfcTBeYfCSFXQBQgkmzg1iEy6StXyXDxII273
 f17MzdVbQ3wp9TJxItG78cfIed61F6AMk6WOZC7HGLUGC1M8fNkqhNc1U4MqvdYPfmTf
 9RF1ga0bmP6zpDodrhsXPlHUK2b5MomJuB4UaQ1etF5lmAm9ucT+VnprPs/E0hf6KXrB
 6eoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=n91504Hn
Subject: [Buildroot] [PATCH 1/1] package/python-snappy: bump version to 0.7.2
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
on the project homepage, hence the bump to 0.7.2.
Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 package/python-snappy/python-snappy.hash | 4 ++--
 package/python-snappy/python-snappy.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-snappy/python-snappy.hash b/package/python-snappy/python-snappy.hash
index c4dbc72077..13cce0e484 100644
--- a/package/python-snappy/python-snappy.hash
+++ b/package/python-snappy/python-snappy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-snappy/json
-md5  fc84cfa3526fba06d66f0d0b2e764300  python-snappy-0.6.1.tar.gz
-sha256  b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a  python-snappy-0.6.1.tar.gz
+md5  04a4e58b0a932403bb285900e67c778d  python-snappy-0.7.2.tar.gz
+sha256  04bf182f9d9f67b7a846dae2f1df36180ceeee8d3380e4b6799deff5272c4978  python-snappy-0.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
index e80aa861df..b1bd8ca6ca 100644
--- a/package/python-snappy/python-snappy.mk
+++ b/package/python-snappy/python-snappy.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SNAPPY_VERSION = 0.6.1
-PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
+PYTHON_SNAPPY_VERSION = 0.7.2
+PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
+PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
 PYTHON_SNAPPY_SETUP_TYPE = setuptools
 PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 PYTHON_SNAPPY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
