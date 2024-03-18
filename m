Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDBCC54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 20:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7376D608D0;
	Mon, 18 Mar 2024 20:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ELVUE44yWrFp; Mon, 18 Mar 2024 20:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 128916086A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 128916086A;
	Mon, 18 Mar 2024 20:43:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 928B01BF427
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 20:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E10681284
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 20:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBCFzBIAwkSs for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 20:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0620681A50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0620681A50
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0620681A50
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 20:42:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id mJorranLDY4MEmJorrOM5L; Mon, 18 Mar 2024 21:42:53 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 21:38:55 +0100
Message-Id: <20240318203855.404507-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK9xR2X6/Gm/AQmARTY8jW5+CQ8MHuB8Uxw+OjfAXjNhP59NF1JoJ5HYcpPA1CDEm0GgAsMmOGvTXexXYZtPz1vMW9HQ/Wb7Q+loJGAJ9dnv5PxWjmdt
 LsehpVBMaIBCHFt5Hibtsbpnmk+Wk7PkMiy9XU7uzzZBiSd4A0hovV/NngXoz0q/ilncXVR0mDVltTuktdAQ350ULR+orBZFXQLdC7b07Nhm3B1gEh95/L+2
 j39M2UPHo4VODnWh/cnLZDlLgtbyhsK2j1+cV8Pq+4Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1710794573; bh=1LBO6AWHe8oPY2B1oBe2ThVZvAthfPtEtyUhL6oMiu4=;
 h=From:To:Subject:Date:MIME-Version;
 b=gc20W27csRXfZ0/IEomahH5DzzSUsgmfLL8mb6SiW7LW5HmAFjhvyt0smmW1nzSdy
 WDJ4fl0Zkw+MlUVfSz8/nvyUlquien7SYtKpD44NS8IjB55RCBhagplZDRPNDkXLt9
 vlwb41OuL68nuQ4LzEAoxwbH7QnpblGMd1Bxn/JTggAKUNVRet6e0sYbDMsNcUttwH
 FQ2xw1enZeq+zSRjosvek2yI3iIM8uFHiVANlssbbD0ygyvDbByxtTwPkhRrV5eXZD
 6lEqgU/HGVJew85ZyMOhHKQXk4MXdQeQxKJ8TOU88UbVtNbGURWmzojqlwXGIzDQHw
 /yw0OrXVSLa2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gc20W27c
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 8.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index fbe890910a..f107aee8c2 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  109501eaeb8bde3eadb25fab4164e993fbace29c3d775bcaa1c1e58e2f15f847  harfbuzz-8.3.0.tar.xz
+sha256  f73e1eacd7e2ffae687bc3f056bb0c705b7a05aee86337686e09da8fc1c2030c  harfbuzz-8.3.1.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 599ea548d0..e3da4add43 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.3.0
+HARFBUZZ_VERSION = 8.3.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
