Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFC0D3DEA9
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 19:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0EA5801F4;
	Fri, 18 Oct 2024 19:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H587177jYDPb; Fri, 18 Oct 2024 19:07:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D3E81778
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D3E81778;
	Fri, 18 Oct 2024 19:07:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A1BD2073
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B17160B98
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id us4OY5rypwnl for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 19:07:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06EF560B8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06EF560B8D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06EF560B8D
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 19:07:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c50d.dip0.t-ipconnect.de [79.214.197.13])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74C6AA4C017E;
 Fri, 18 Oct 2024 21:06:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34292)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t1sJK-000000000JT-40Cc;
 Fri, 18 Oct 2024 19:06:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Date: Fri, 18 Oct 2024 21:06:52 +0200
Message-Id: <20241018190654.29370-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729278415;
 bh=IbBn62m0lU5//XsNwG7oIH9kmfWy5JRiekbzokBHZSY=;
 h=From:To:Cc:Subject:Date:From;
 b=lhnzxArKvaR20tbBnGsR8vpe1FmoNHchng3/fr7melnvtqbjyV/gGevbDCqmWfOSN
 RlQl1iLmq6F7p/P8fVZACBX2Rzu5sXpaNw9xtHxA6nYcU3nLEY2yKjnbNhhyISxL97
 wIIAGDcy2Q6jjVeVzq97nZIoOJqfSkzTMzDIl2LcWJlM8PAwFIKhrpvm9aOBVoS3WQ
 Y7o2uPOCcc24Qyqr3/hCb/itPqrexOBImvup6IWocRbmX4t894mZ/9Ivi4ps18s34D
 gWj68LRKh/vnHXLNr8wtwxRgP5Ynr8k3bJBzv11UlycOgfS2LLwquZH3A4r1D1lYUh
 sn5f6mW7DiN8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=lhnzxArK
Subject: [Buildroot] [PATCH 1/3] package/intel-mediadriver: bump version to
 24.4.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 16f02c1f12..9f653900ca 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5eb35a1dd601c75ccc3af3c5b21acc82b245ae79ac8d7264f99215be8d064194  intel-media-24.3.3.tar.gz
+sha256  334f3d3d8382dce7cafd028bd0f433e0328f25ffd8e9f33947138475c1757935  intel-media-24.4.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 3424d7168e..e16be8717d 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.3.3
+INTEL_MEDIADRIVER_VERSION = 24.4.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
