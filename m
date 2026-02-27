Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE12FD530A
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D9640CF4;
	Fri, 27 Feb 2026 19:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUw-2fG2tmdw; Fri, 27 Feb 2026 19:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30A4D40CF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772219194;
	bh=uNkugMpYn69YKRdaNJ5uHmSs2/V/pVIDn/0Ja2Py4B0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CxE4Y8v4lE6fTOxZLOphcB5qmhLGAf7OY1+Upq1U2xbo9BZXLx2AI9Q7/hjfFpEuk
	 Djr/6nPhExN3ENJK4zfnAWbAVrSa/6PGpuGX2dhXskNUFS+vLd12REQ6hgLvtXT3kB
	 vW9N1UKtx5YIofaLeqA9wgJV2gmEloI3/kUO733M3wgvHgrGWwcJ1ELUB3a8/RP8a4
	 SAUeYCLcK7z/f85Q24SaUjvMEzmWfjYhlkImItwHrXB31jOGUwNCr+psnhC+O5peet
	 JED33C1KzGN+kyv9xqKrFWY1K6f1gMRkxTxoI2gXDoidAvSLl9tAO1lQu0HW/y8WsK
	 DPSw8d6e9J/aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30A4D40CF9;
	Fri, 27 Feb 2026 19:06:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 698611F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B0EE40CF4
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtlaGaDCeNLt for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 502AE40CEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 502AE40CEE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 502AE40CEE
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:06:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15F2FA4C2FE0
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:06:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59570)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vw3AS-000000001Ep-03la
 for buildroot@buildroot.org; Fri, 27 Feb 2026 19:06:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 20:06:27 +0100
Message-ID: <20260227190627.2008481-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772219188;
 bh=caUx5CXVc0BgSeo6YI+CejjEc+q3t52rNqud9WMy/BY=;
 h=From:To:Subject:Date:From;
 b=KWx5T8E2UdHKnwfjUP1xt1DbaoaphFhWCZTiwbB7O20E8DcIB3Zr2dFzbmAHnp39w
 I9L9UXewbsekUdj0VeqPpZwrLi1JkEyMqHBVZ4VK9keksaUJgG0NRe2U60HtP8Dj6K
 7mZq0ZFIkRPrOfcFfT9/7YT2tJhRLCKUfaiGMNKGLkk/q8OLb07EUR3lXP2SZsaofr
 F1Dta8ITmLYMlsg5levM2HoruiUwY6JJt2OR2/vSgwv0owhELc2q5B3ctN+zfzZ9o6
 MyWct7dJB5/A1is7WFVnRntmPdH21jmJjAV0S7S4r1gHBr3Ia0DuoBlOp3/5xGZB0Y
 Dbh2HS+i5+xEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KWx5T8E2
Subject: [Buildroot] [PATCH 1/1] package/flashbench: fix download URL
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

The original source is offline, switch to forked repo and use the same
tree as before to only fix the download error.

Fixes:
https://autobuild.buildroot.net/results/eec/eecf2cbaafd8a170b5f5c6c24df552280a530204/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/flashbench/Config.in       | 2 +-
 package/flashbench/flashbench.hash | 2 +-
 package/flashbench/flashbench.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/flashbench/Config.in b/package/flashbench/Config.in
index a50f482ac3..8f64275745 100644
--- a/package/flashbench/Config.in
+++ b/package/flashbench/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_FLASHBENCH
 	  SD cards and other media for the Linaro flash memory
 	  survey.
 
-	  https://git.linaro.org/people/arnd.bergmann/flashbench.git
+	  https://github.com/bradfa/flashbench
diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index 274d890f2d..8b087c2a10 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b5f95d2d057270adbce0f1a784b6a88db339b67326b6ca92474edd99f9fd4774  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-git4.tar.gz
+sha256  408a2642700b7f8daf4356a49948b921137ad15bb6e0fd05b1cb8dc700c154dc  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index f5791c3e95..28ce7f7dd1 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
-FLASHBENCH_SITE = https://git.linaro.org/people/arnd/flashbench.git
-FLASHBENCH_SITE_METHOD = git
+FLASHBENCH_SITE = $(call github,bradfa,flashbench,$(FLASHBENCH_VERSION))
 FLASHBENCH_LICENSE = GPL-2.0
 FLASHBENCH_LICENSE_FILES = COPYING
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
