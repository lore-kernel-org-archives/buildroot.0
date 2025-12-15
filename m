Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23119D5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 18:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57C0B81AEA;
	Mon, 15 Dec 2025 18:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5NGup7oqse3; Mon, 15 Dec 2025 18:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720F7815E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765822716;
	bh=FpWvd00J3Fr4Yzz4D58c1TNkImm/rut8Cl/B7xphbxM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LAl74KRzWlB5F4odpTGvNjgRKHUKIgj500Z+Y6N/pVQvGKTLY0msoFQQvK2GV8scK
	 1zHqutH8bs+h3p6J21lWwunPnDb6iA9ubJkLdvMKqTRVNpMVkl6uiFWUfe+q/NrWJu
	 b/cio8Y8Ue8JketnMWdvpIIYqZwnJzVuoFCPZwVaqsvq5tx1aCQavog9NiSM2E2PWf
	 HcCI+QG8K/8me9RH6SWNZZfXj1mjbA37gOJxSGqxjcfeuLyRAO3sGRHJiSZlm370Lg
	 AShsGZ2aRVQJ9QgbwHYfxWNRG14Vgubh8UcU246nXKrOBsw5WbOGs6vE5FYNT2ity0
	 6M0UajeWUSRaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 720F7815E7;
	Mon, 15 Dec 2025 18:18:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82FED72
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 18:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7501D40687
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 18:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d30dccg1swoh for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 18:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA4514068D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA4514068D
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA4514068D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 18:18:32 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id VD9RvtZODcq1hVD9RveQcN; Mon, 15 Dec 2025 19:18:30 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 15 Dec 2025 19:18:28 +0100
Message-ID: <20251215181828.3206337-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHZNwCT25xlnZJC/akppcpSpOvhy1IstWUuQHFvP6WcyfkYZUyWD1CTkCdW8kVspTOc1sMDp1M3Tcbu3BC2VtdEtR5H8pQBYWSy+c6lHE+zvA9iGGsbh
 OI98m+W+GDREgKBCCafw88e3hWVK6DYuMxWeXQh3p0sSdovEwDRTcEoS25iWujakwfQi07w5ULMq0EAL6i12+n8bo3KuP1NSLzyutss3uQUnswomYEKidbKa
 FEcut4JYYb7aq/IIlLZ6q/uS5/ac7o15ZPjDaYBkQMgvpUbDKiwhPUX18JEqkpzHytsNUoY8wguxw33qaaoBKg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765822710; bh=/dffBYlGIpXLk3j+h4h9SqZst2+19qtrub6i+rxenF4=;
 h=From:To:Subject:Date:MIME-Version;
 b=F4g1Zv59kfC3IohIuq2PWr9i4dStNJPdb2ie8Ao4zi6YIrH4cKtOzuwftVQzXnhQd
 k1iMwYCu1zsZIfJD/8C1VAPkXf/v8uRxgfVD342hnvOZoMHHXq1jqoVhpU3UQEV7tP
 i0NlYyOqXp10gtDsfoThMLn2xrOvQwGcAXYfzzCie07BckGHbepLYOBb4xRFOOxFaQ
 ew1xM9iU5AbIXl4t5BIiljnKgnn+Z5IBFR45eRhCH32SKumqPHb/8ukhSruxO9Vks2
 LQrgQaxFaLWG3ywn85CRjGmH6GvIJUC8dc5GA9FTkLT0quArC6/pSZN7ZB6zm0G804
 JBOYaq5wk6pwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=F4g1Zv59
Subject: [Buildroot] [PATCH] package/rtl8821cu: bump to version 2025-12-14
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

With this commit it builds with Linux 6.18

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index b9869303de..5ff86f439c 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e7fc5b598b81006fb07a5a3534aa4288cb387ed531c71f3734e55e6cae729b0  rtl8821cu-3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae.tar.gz
+sha256  c471f8a73efb5985b4e880e40de439ac8837241c74d3b7f8cc06a1bbfcc85075  rtl8821cu-7f63a9da2e8ed83403f6f920e9b1628a37b38ef4.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index e1ef396110..45d1da3750 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae
+RTL8821CU_VERSION = 7f63a9da2e8ed83403f6f920e9b1628a37b38ef4
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
