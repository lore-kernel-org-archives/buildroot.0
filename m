Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D220C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 17:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA64281FEB;
	Wed, 23 Apr 2025 17:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gu2AbTyO7qzE; Wed, 23 Apr 2025 17:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C25918200A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C25918200A;
	Wed, 23 Apr 2025 17:34:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC7221BC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 17:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D06E81FEB
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 17:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXb5AeSEP0qX for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 17:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69C7281FDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69C7281FDC
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69C7281FDC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 17:34:04 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so74510f8f.0
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 10:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745429642; x=1746034442;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nVn/3CqkMv82AQciuvQc2/aDopZ5owUaKlqEo/iF9XM=;
 b=ZjH2FzI1MZOZeipRM/qva1Zlferdsx4aDV8jydFZCUILDoDVfqheYg8LqRLEjzeFq5
 iwMD4QRG4AlRW9jNzz1EVUF9wKWiL9TVqp3sqCpmayonEBtbD3aH3JuRAEiRnvRGZjzF
 evgkQ/BJjJ99/L2/eKRiwWfZYURN+Bb9EzPhqxBPI2AgAVNeDt0oigS+Uh5JKn4HGwRj
 wlqqSyxrb1ZkJ7HkxiDqwaq40QgmMMWyGuMa868C+oagNcYFNkmLnP5uLig2pYXmlpEy
 2hwLY6hx7p+DKz0Ik6xTe3cJuMGi8NgzhwqCZCHuBkojhDeoa0Nyi9vqmb7rsd/aZ7Wd
 IDMg==
X-Gm-Message-State: AOJu0YxDnkzQkpR8CNcX3Ol+gq7o/f/1ZmZfaEkxZ9p1kPp7t6TUDgVo
 U3XEGyxmq+46l9LjdNsrA8a8SBJZLTJ8sJTz40hgBaszmjD4KPVsUTvgVooyr803elBt5XLgB8d
 gY5s=
X-Gm-Gg: ASbGncv5xDrpgtK/8OeWces6ZX4E4w2gLpv5AaQ0RpPSYa6VSNEjglWzSRoIjLow7bs
 EcUB+8wxy+AFiesMS25HFbLdu//QaGt0uUwRh/6MdkVfEemBqA5Emxmw8lHxQVZ3YH2ZVjKxYoY
 C79SLCJ2KSQkYnirs87NsVH+DlefyotVkYzkQoWRZTvXgBe2b3aZg3nuph+cce5+VfaFIHzCXl8
 pBnmotPwfuaPeChtubiAcoqAzsX1BEgulralNWsgeBs612n2EexCDPL1v8idWiabGbMZ+sx+f8p
 4BnrMe52WZM+9391LNvNqg8Gzbds1epc/318yJBWMmbNWfN8JrmDxN8=
X-Google-Smtp-Source: AGHT+IHPuBxni2epZngNFzNiuhH02Z/OMr54PbOERfPoTdI++OapXNDBbDgLlEELM5y+7D8B9axNwA==
X-Received: by 2002:a05:6000:438a:b0:39c:cc7:3db5 with SMTP id
 ffacd0b85a97d-39efbae03cdmr17236729f8f.40.1745429642212; 
 Wed, 23 Apr 2025 10:34:02 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa433133sm19174930f8f.28.2025.04.23.10.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 10:34:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Chris Packham <judge.packham@gmail.com>
Date: Wed, 23 Apr 2025 19:33:49 +0200
Message-ID: <20250423173349.474898-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745429642; x=1746034442; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nVn/3CqkMv82AQciuvQc2/aDopZ5owUaKlqEo/iF9XM=;
 b=GH/9OpXQizGplVDVLEdN0hGheJP+hYIb/l1O/0hZ5dV0iKk93Mcilm7WbRLhOVi68c
 ItEY/SsdNMQuzsN7uqKDfGdtWS1/G+adNr3MvRssP42OeMF+WR2osBTnthwezCS4djVA
 3xolDtqoGablaZduPFgjHBbUYqXyFpLT0DnEIeu/lO1sFr2IjENYJgYHMFqlsA/3Tm+W
 zlzZvehONoFmYAc/rrkKrjZDPAf33UlV3rrvkZcmT0nzZPZXIm/dNaImIlzpHp8+HH4+
 9qCUW0ivb+MyC+eFQk3DvaP/K6aj2BClzeBRoYFGpi2qUDwRVvhj94QPDbjf2qYv7R6D
 aL8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GH/9OpXQ
Subject: [Buildroot] [PATCH 1/1] package/micropython: bump to version 1.22.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version bump removes CVE-2023-7152, which was incorrectly associated
with the micropython package in pkg-stats.

Although the CVE fix was already present in 1.22.0 the CVE only applied
to the preview version of 1.22.0. The CPE ID of the 1.22.0 matched with the
CPE ID of the 1.22.0 preview version as well.

This patch bumps to the latest patch-level version available in the 1.22.x
series to include additional fixes, rather than just adding the CVE to the
'MICROPYTHON_IGNORE_CVES' list.

The LICENSE hash has been updated, as the licenses used for the ports and
libraries have also been updated in the LICENSE file.

For more details on the version bump, see the release notes:
  - https://github.com/micropython/micropython/releases/tag/v1.22.2
  - https://github.com/micropython/micropython/releases/tag/v1.22.1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/micropython/micropython.hash | 4 ++--
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 43551866b9..bbfde0e89f 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  a042764f0b6f6d92b267454c5bd5afcb83fc3900119f2583672aac571e661924  micropython-1.22.0.tar.xz
-sha256  d9e0e0395867c899090e150213bc2b417e970c17355a8d48300089875b3c8037  LICENSE
+sha256  bb3ba34848a7620663b6a7cba22af45d3056fc79328c2ceb943874b5478d8756  micropython-1.22.2.tar.xz
+sha256  fe63a3fbd0731f6530e0783224763bceef972e516cab4b8513ca4d7b05be9713  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 125a0edcfb..558ef86534 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.22.0
+MICROPYTHON_VERSION = 1.22.2
 MICROPYTHON_SITE = https://micropython.org/resources/source
 MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
 # Micropython has a lot of code copied from other projects, and also a number
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
