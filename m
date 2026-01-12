Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83326D2505E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 09:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40F35843B4;
	Mon, 12 Jan 2026 09:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGhqLpzYEwCj; Mon, 12 Jan 2026 09:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38253843BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768210164;
	bh=ROyPwHoIop20QD3I7GJhMqvbi9YeQodWu3vFHHaKo/w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iFvL4IcHDTtgaFI6Ln7WjlgHxRz2xA8MUSdtC8ddJWIiVsmuvcRO5qw2tQJTRxitM
	 yiTX8xfV8jN4lBnEvsgqlKDihtqSmGmniRKedxbcx4pv/H+/qcVuKNJc7lRTBMi7QW
	 U/hlHQ+Xo1ORXYffPa6iqLcxa7+/r+A0seaGfst3BqS1k1+v3ZTJkWix0Ak73HE5q8
	 GQDxlpGMWODnitTKfqRx/P1igPdea15YJJWlpkTIlzX5t2qkdZmqsqm5x/0Z9b5fKx
	 D/owMDnoHSZs9lsTbnNH3weOoItZj/wkosJg94vXhSIFIaRJxARp53iP3eblIxZPH1
	 z/xzSOSvyPNEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38253843BA;
	Mon, 12 Jan 2026 09:29:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65A4518D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5808084460
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdL2haAjmtxO for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 09:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BA22843B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BA22843B4
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BA22843B4
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:29:18 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id fEEdvU7jPdarQfEEdvB5nY; Mon, 12 Jan 2026 10:29:16 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 12 Jan 2026 10:29:14 +0100
Message-ID: <20260112092914.669618-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHIBvJ7I9JCjWZZqhzn7WuW2pO8OyoNRid9aohMWk+T5DFISun8T+QbNgdvHvjAbTa58zHO7q/Nselhwr8Cz6Ycmki/UCo7/E5HZPUg3rt/mk+7piUiL
 hzOu5sThAhpOTs16UPuZWaHXXU28oZL2x9BKxQ+lqZtIs7IpK80L91sMxioQFRfYlKn4yu5rS7nIFwrX09atenwH91TB6kr1WOehBZIr9VZH2RkieRgdgtD8
 h8tLFpQzT18g/pBiCKxIwESt/RblikPasyz2Z0bukvHVHkVKuDFLdiwMLJwjMFDpk87NLEOPKSiZHFf+01Giog==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768210156; bh=ZZW85zBmFlHd7sbcYuZEBoKrKoytOPk/Quk+EcfXpME=;
 h=From:To:Subject:Date:MIME-Version;
 b=jPc6I5HawS53/FWEjOn9L0PghLI/jEdRfxDKZ+Nhvvq6K4pCRx9BeEX/DLjYwqLIk
 olLgn+eG1QuO/fmAcc8ZanRDUbjZadF9QSTjNQ6XLVEF28ZTFxCSoO4/x4lEKqHBHy
 13Bf9FbH8jKt7uIOiwvOakR0Fsx2UWbvMiotYOrpL1NjUPoFrdgZQKV7Tp4EeAJciX
 U2mUk9TD+gNswDkDh06gKbM6qgXa9LlUZW73ul5/n2oFB3DIUHhQ4D9GzUB8xcS9K7
 Lss2Z018VYy3NL8A50AhS+NFF79HG/x2GBTajr9CWaYM5RMQKFfUZezbpUS6s74WYd
 7iXC7FOLYv2Mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jPc6I5Ha
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.120
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

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_120.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 0581592c63..dd0724f8c7 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_119_RTM/src/SHA256SUMS
-sha256  1387b8478e6c681c533b1f7b0f4d4ef7f58307c1f7e3a353622ddbf841328283  nss-3_119_1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_120_RTM/src/SHA256SUMS
+sha256  7ce5f5b3a172a41539ffc118d8ef4834974d0a6a782743e4a05a4e208dd6d22f  nss-3.120.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index b6be6dbc8c..5883663873 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.119.1
-LIBNSS_SOURCE = nss-$(subst .,_,$(LIBNSS_VERSION)).tar.gz
+LIBNSS_VERSION = 3.120
+LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
 LIBNSS_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
