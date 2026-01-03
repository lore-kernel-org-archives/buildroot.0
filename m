Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DB1FA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9DF3607AF;
	Sat,  3 Jan 2026 11:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fy7I09N4K87g; Sat,  3 Jan 2026 11:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E99B1607F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767440472;
	bh=TcoRT5dh4mRKXHaJYXPaN20F4Z6sTpjQ19dAx/tVKNo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=G6tykFXhDhMoPW0eFuIm9Up8mZcNDbKfBHYhBtKXeWD4HAia1RKrErOFtY79F6YQ5
	 ENZPqoFonVKHP8TzYkvf20H1fkMcypo2E8Z2AJ68keX0zcleezw3XQ1Y0dVOrn4oat
	 gPSVPDAkdgKWnuQ2Sk/A7MpkvMBc9FDAaEKTzw9Z9nl7S1Dl86PsZoIKYxpL/C29IF
	 yUKT4aJUZybSMr08Go9mgP5a4JFNGLY7Rqs4HAWsQrhbS7zG17j/cHu81nRcX8qVDD
	 /54QvSguS9ylqvYIQoMkwpwFf/XhL4GdXVOpjWHBweV+WPnyc3x0VHK3pb2Sr3p1zZ
	 kv/fGP3UvfTFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E99B1607F3;
	Sat,  3 Jan 2026 11:41:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB4B0440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A232540416
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjHh3TFQXMmS for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:41:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8FBE240059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FBE240059
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FBE240059
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:41:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.22.237]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wys-1vYikH1cdI-003pwz; Sat, 03
 Jan 2026 12:41:05 +0100
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sat,  3 Jan 2026 12:40:46 +0100
Message-ID: <20260103114046.2461857-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:pMooS7/tF3X2uxb5Kmj09e6hVSoiF5leqfmdzBhpXLrU9DtPdCm
 +4XyqQtEoVitVgzAWsGs7Aau4at4DMG9W8N6Ja4zPDVZMaMo5+6RlG2x/c07/Q+0o1dWJEQ
 P43eTu40Zi6ic8BDxCNwKjgRtQQcJxOMI14usm56LKWfNPJhDRBhf8io+vvUG3my3c6wcdQ
 x5xEnmito9xjI1s4b6a8g==
UI-OutboundReport: notjunk:1;M01:P0:dkIfEKCGPTk=;x+1ZbsL/Bhs94yYES3jWpjF6h1q
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767440465; x=1768045265; i=fiona.klute@gmx.de;
 bh=vh1za6tKckdvjVpHL5aBKzmF6RBT0Aj4D70ZlfT7oYw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=r6FDRM47ay2omcUNVNQ3hosVA6kWn5cpxcF+v7Lof6TXVKNafEYNSmmvYdJmCXn7
 rpGHXFKI/VwOe57rSOVh/oaSlZEyjYPjJIwnB7MsEKZIGySvMB812i1H5FQiwNeuM
 KSQGaZwefEx7Oe009zvgb2oxuhLEzOIMECDNujuHsNDGiQHsCOzUk/CclZkWYcjnZ
 RKRqWUx1ImTyu/6E7v8Y0OvD6h+CMAaa5zhnWignQN9AB0NNY7jqmoXeyRgQR7UIY
 Ofrklpo5buFZk0noWbkqNojCGYkKBJ+Fh7wwx+PznKDL3qQBaMB4RblEoxRNERdcb
 +Y7fXDFsL/ua5LbaBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=r6FDRM47
Subject: [Buildroot] [PATCH 1/1] package/squashfs: bump to version 4.7.4
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream changelog:
https://github.com/plougher/squashfs-tools/blob/4.7.4/CHANGES.md

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/squashfs/squashfs.hash | 4 ++--
 package/squashfs/squashfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index c921d638bb..eb9bc34282 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-tools-4.6.1.tar.gz
+# From https://github.com/plougher/squashfs-tools/releases/tag/4.7.4
+sha256  91c49f9a1ed972ad00688a38222119e2baf49ba74cf5fda05729a79d7d59d335  squashfs-tools-4.7.4.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index f2cb0ab25e..04b328ccab 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.6.1
+SQUASHFS_VERSION = 4.7.4
 SQUASHFS_SOURCE = squashfs-tools-$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE = https://github.com/plougher/squashfs-tools/releases/download/$(SQUASHFS_VERSION)
 SQUASHFS_LICENSE = GPL-2.0+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
