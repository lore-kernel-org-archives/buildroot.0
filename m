Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5942DF531C7
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 19:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3502C60857;
	Mon, 13 Apr 2026 19:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxolsYboA-7r; Mon, 13 Apr 2026 19:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E52B2606DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776108617;
	bh=q9PTjeZCYG24MPFihSrz+3FOHbvA8PdLXy3j3zfE4TA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lY/3jKh5sMhaQHTJoyOG+HvqB3o9rnEofDMs00EjpCcTQVTZMjh9WUIK2yZnqImPs
	 rBZtDNpSrFIXJ5E7ovyLvmKDx0o+ZScp7Q0PZqWFki1Tq6EQTLLRzW++a32FtFQ3ln
	 B5eAtyG5Q3Kj0H0CCU+DAdSrmaaN2ETWmNRfZj7aLGje2tzIpvvfbWnEoWOmQC48jV
	 FTYcmkmwZAoBKap2jtVtCd0iEqU4QRNMFfQqAi9z0nplAwN8wfbyfX3Lmfo6uSWWOt
	 Dwv5ClLk8i13gg2eOX4f8Zqv0ZVjFqSJFEs/qQam2g9GBOgg+BB+W4sSAABg0r3lvk
	 eHzqjuSFlnw9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E52B2606DE;
	Mon, 13 Apr 2026 19:30:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55875283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46E3B8062B
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUJYRQJcA-qe for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 19:30:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B9428062A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B9428062A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B9428062A
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:30:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488ba840146so46544415e9.1
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776108613; x=1776713413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zsuP7o6S50HZXlJl0A2N1Lt4r7CzxoOPF/FLKlnz8Kc=;
 b=OhW7Pk08fBmGoWtSn2wtSbUXwd0sBx58ibyLkCvS3pMu7Rr7NfTqz+GACN2nSEfCRd
 SyFQLO77zO5wUhoZHSVEijLZegEUKIQyZgliPQFTskpRbOQIeW8hrkvX2/q/zpd2uWB0
 5t3n4eBDLCXPV4vJNGWxq1/XgCQJoO4hGcjY/h7sqS9/MT9gg1FGken21OmNwjS9ZNBK
 nuwfnzGnS7yIFN0ExI0v99cmSqigsqo8kET8DXq/BHECjAwHT1HtlnuTQolhFPeToehT
 5+uPpIe7ZwTf7pG3BQfT8KM6rsPDJVog4yXcSe5hlguSMIw/pU2mkFW45tF8GNCY2ocZ
 g2nA==
X-Gm-Message-State: AOJu0YyYl31uKmKq87aXjtQgu38/aJBOWJc30sNhVWeCPPuOvTC0uUcj
 9/kRPKoe+ps1hirDxImjynYWuI4344np9s3fyVtYyYgdhgsDFlTx9gECOGiouSKFWBSAy2alnj6
 YOu2u
X-Gm-Gg: AeBDieuKJdNLfpWs3JA42DIZQZz/YpOMJw/yMErcCPduUJHV6nrPEgQ4waz7rHkeV7F
 SeQcw3cxuD/MmtUwP6WIzJQmDBeB2qzgyA86mUYqdyFg+1h8vMQR0RmaROGis6Ix2aWVpS9t8Yk
 jl9ugg72tiKqjZz3Ca2zQyRJoMdFcTE+of6Bd384vUCjwKycB60WfLVtuPJqjZe3Od3hk99pPiY
 +zRWAk0KYtl0pIK+RGhx3Tzhm8YReyF2q3hwuNcjXhFM2es3pNkhOIgxJKITFfurkvINB5cJBxW
 VNrB/dsDr6ZhNf8Z9mTurw0ZY9PZbm2gwAZW/oNNDyarlDgUCc7Y0Mhq/kqBWyJknSsb0KAv5y8
 iRENj0HCp9TYvIPYUmb0kdfJ9roT0q1CXK1FHRCeQJaqJZI/M8DIn7Ht0oE32NN1HgttT59+HCG
 tgCWSebdje4k2zMvmEQdef9f+SdrSclmmI1hOH3+42i2iFSTl1Nn+nlAO++CT87aWuYAlY4N6Qk
 kIXlrYn+W4LzWThfC1x1wtQs8i28pXx3MVzn3Q07hkzglRF
X-Received: by 2002:a05:6000:208a:b0:43d:50c:6f2a with SMTP id
 ffacd0b85a97d-43d642aba5dmr20946366f8f.29.1776108612505; 
 Mon, 13 Apr 2026 12:30:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d762decf6sm21565238f8f.8.2026.04.13.12.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 12:30:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 13 Apr 2026 21:30:03 +0200
Message-ID: <20260413193003.1909496-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1776108613; x=1776713413;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zsuP7o6S50HZXlJl0A2N1Lt4r7CzxoOPF/FLKlnz8Kc=;
 b=Q/piUjLgImB6HPPd7vacXLIWe0ck7dNTsvhX37+cMTE/ApHWzSYBlJ9i0Cbd78fQyx
 Jc8NxIUB6zEvggByirLqQWXN2aSU46ryUGQph679ZGNftRUQL5jJuKY7zqt3OBhZSKtr
 kbzJB1xSpkH+HOTJdLt4+6Ui9PoXFtLhgv74Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Q/piUjLg
Subject: [Buildroot] [PATCH v2 1/1] package/mtd: bump to version 2.3.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 2.3.0 added the fsck.ubifs utility, so support it with
the new Kconfig option BR2_PACKAGE_MTD_FSCKUBIFS.

Changelog: https://git.infradead.org/?p=mtd-utils.git;a=blob;f=CHANGELOG.md

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
- fix the commit title removing the 'to' word

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/mtd/Config.in | 4 ++++
 package/mtd/mtd.hash  | 4 ++--
 package/mtd/mtd.mk    | 3 ++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 0c95e3cc54ae..1054106f81e5 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -58,6 +58,10 @@ config BR2_PACKAGE_MTD_FLASH_UNLOCK
 	bool "flash_unlock"
 	default y
 
+config BR2_PACKAGE_MTD_FSCKUBIFS
+	bool "fsck.ubifs"
+	select BR2_PACKAGE_MTD_UBIFS_UTILS
+
 config BR2_PACKAGE_MTD_FTL_CHECK
 	bool "ftl_check"
 
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 0eb90a5118be..5f02e698d1b9 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
-sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.3.1.tar.bz2.asc
+sha256  03d9dc58ad10ea3549d9528f6b17a44d8944e18e96c0f31474f9f977078b83dc  mtd-utils-2.3.1.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 77050e7e40b6..6ffa3fd626f8 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.2.1
+MTD_VERSION = 2.3.1
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
@@ -145,6 +145,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDBITERRS)	+= nandbiterrs
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDPAGETEST)	+= nandpagetest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDSUBPAGETEST)	+= nandsubpagetest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDFLIPBITS)	+= nandflipbits
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FSCKUBIFS)	+= fsck.ubifs
 
 define MTD_INSTALL_TARGET_CMDS
 	$(foreach f,$(MTD_TARGETS_y), \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
