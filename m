Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5AB109190D
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 18:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9010D60BEF;
	Thu, 19 Mar 2026 18:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1fjdlNeZi3w; Thu, 19 Mar 2026 18:52:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA6F60B09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773946361;
	bh=htI0zAx1SJvDvEkVeSzIP+Hci2hhAgDEsuxxZqt+/64=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AQRq1Uc7i6NC5KaqZ0t0uh7c6Oh2N7aTbv4+7vUe8hGPP5OFpdmTAomDaz61pSC3w
	 /mvzRo+lxrPGG3WL3EVerVcYZb53TwrDliTQ9KQ1NWK50gGPTfou0nr8q31JFGuKSJ
	 6mzPUzT5iPpambkiF7MBdJZSBEkcCfmYT1nNM11iiGkd6J4IrIRyiNcJWkMlqTKM+o
	 DvTHkt1vSqpyzdeQ42odTAaHYbDE/xT4VIPaUR6S3D/NtlnpMl12IDUnZRn6Vkos4a
	 lESdrvHkXAdXfq0w6cNQV8szxxmLIca8Dr1dK6Bkl06XpDcKjDOOWnc2iLs+y7Otwq
	 6NvKcXSmDCDBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA6F60B09;
	Thu, 19 Mar 2026 18:52:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33F2E1B6
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 18:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18E4060B09
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 18:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eO1QkuFFBBp4 for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 18:52:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF8C160B02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF8C160B02
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF8C160B02
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 18:52:36 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 3ITvwkmv3BhI93ITwwHgf6; Thu, 19 Mar 2026 19:52:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 19 Mar 2026 19:38:14 +0100
Message-ID: <20260319183814.132401-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFQ0Vch4T0yYHA5LQOvrTiAFrI2IuMBR6/WxlMhrrtQ7ziGr52KkuGzBAZxDBHaA+QVuBoSh7Xdt+tMMCHI+4ndku+IvBUpcnN6Uyczdi+VtHJUjHUfi
 0XLTyRGpBDCTkKVnYaj1jrP/PfgQVh2tGbKzhaPemtwAopFd7xjLyEeNUnfcxffGgnIlwJiolMYiecA/b4Xte8pxd4lwE5xcE9q8LnGTmnfgPmu7MNwfbbHW
 GaOAPITtVw+d3W84eZPbXUrxPT/1z78BKDO7NrJAm4A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773946352; bh=qs+Uj72YMGeuLhx9jy9bwOOIl+Nsp9/TNK7JJiT5dWk=;
 h=From:To:Subject:Date:MIME-Version;
 b=EKH4Kxv/ST3wSvdw5qP2hWwF4bHpjrjp2WxvSzXdqP4i/MAXYNT95OA1yTflWwhlO
 VhavPHXOMDZhksH4ZiQebRJai4OCRKPpu4JsGIvIog9wajhJ5MudGO0JOS215k6qwf
 g8inuf3V4A7HezBda7gQg2rsujIt8Zv3GKqgafOonwXrCjnGNlP5/HXmUVZMxj/UUY
 USGVBUdXNbFkeq3Cj9Xs6TQQ+6vj5cD+EEjkveEzvo+GI2twBjBdFVTJ+opZuwPJlH
 vmdz28Ffx+nciWta/KbtTV8roFndIRFgWueKkvSk1DhPKfosDpUl4+3yO00ywEbG/t
 5EZ3mcTFyxiSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=EKH4Kxv/
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 13.2.1
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

https://github.com/harfbuzz/harfbuzz/blob/13.2.1/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index e9683f19b0..8642387392 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.1.1
-sha256  e7f3b8bac3fdcc529985be8e84fbd65c675ac47ee58512b15a5dd620c79ffe2a  harfbuzz-13.1.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.2.1
+sha256  6695da3eb7e1be0aa3092fe4d81433a33b47f4519259c759d729e3a9a55c1429  harfbuzz-13.2.1.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 6cedcc0fd8..df05596b1d 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 13.1.1
+HARFBUZZ_VERSION = 13.2.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
