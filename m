Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B01D767FF
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 13:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A40184037;
	Fri, 19 Dec 2025 13:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q64rlvb5wmx9; Fri, 19 Dec 2025 13:10:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D4308402D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766149806;
	bh=Ej6jo8OXT3ABapjJSrtkv+naSXApafF5afXoxvsGJ88=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cV6t+sqcrpJM0EdQ+LZD9BplMV5hxyb+Adhbk6z0S8PLiZLSitQ5jB9c1j7Be1yoU
	 ZsTEmn5yAd7dQV/Dd0K7n1N6cjng/2xrn5MR2gx/VIZSIoGTrql1oFhMTdP0mOYFAD
	 uXCj8FFUhY3yv3dCaD8xE+k98j3mp0oOEe/dwWm2m4QN50Ylr1mPGJxrL0TKC6hC2/
	 xSgA4xcqxOVXPyzMzi3dX4ps/1mDwuK061BLmRxWDYNLubxbnftLN61Io21RW6tpSo
	 MNgi7Z37PNCdzVszDnBKvRfcxWmX4qTPn0iFIix0m/oX/mN4/dARaNQam9mTuNib+7
	 020leFb0HiwIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D4308402D;
	Fri, 19 Dec 2025 13:10:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0517E119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 13:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB2F68402D
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 13:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDgRG5v3x5uk for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 13:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A59F684031
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59F684031
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A59F684031
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 13:10:00 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WaF3vRTMPlGpsWaF4vhZoc; Fri, 19 Dec 2025 14:09:58 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 19 Dec 2025 14:09:56 +0100
Message-ID: <20251219130956.302918-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCQ6reZgX1zqg8aDvisBDqoAc5lqkHfKKvXuIEwUozcBEqxvYWaJua4fA/gftmflhvuYwTqtOIIsqPS24nwFDI6FZD31RPF0byKtxmeOFGncYqQ2Y5IS
 p9Tnjz7644nqfUsSCggVbQlgHfqJHnye9Jx3k9wKFrHckGNUJScsfugk22CsbZ5zL/ushIzS8WXwRX34jr1Eo57JxsqWfBKSn1h6nmtVi0lri9N8xMWX9vfd
 tldJqde3uRr3WrDPAU4h0/i7JaEJO/3dB9COBcGCxkE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766149798; bh=NNaJ5jg8ljGerv7WKJF5riHseDQhNEYda2fL+dUitMM=;
 h=From:To:Subject:Date:MIME-Version;
 b=Dlof7keuqwqDi/v3wnbZPoLOUyHuN4L8qPvA6r2Sf0ZWsFUkwicZX5G4wSjnL0rO8
 U7jp9DOcFUwpHpxKucBO4FxRYSEOHG+mJ5pEIKyVqEasxa/0YfTbA6OymFPOTOo7jn
 zRDrMXMvA52Xnl7HeHRHQAQqQivJCxk3JHHlL2Cz3QCA5ftqkZq8k8iUKpWqr3Z2Oj
 GdGWGeQVuoYyUzV6A4gPtWQXTSXYNPZjPh9uV7fo2nrycU2nVvwTd25D8I1QXF/LXK
 UaSVU8vjmRYZUmtXXD7Ab+KE/uuFG1tdmdiRqZRpa7CTUr22qeWmuRRA9FEnK+58Sn
 vorOE8iIMSIzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Dlof7keu
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.18.0
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

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 1091dbd6c1..b4d252ce40 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  dd21d1545c05e73ada594b93fe593351b7dbf10940fd93b934b9395513108b34  libfuse3-3.17.4.tar.gz
+sha256  354b001b112bafa956005d242f6fca9c3a2a03433eeea874e8a44fe2a4a36e7c  libfuse3-3.18.0.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 6a6111a065..6a9d0097bf 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.17.4
+LIBFUSE3_VERSION = 3.18.0
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
