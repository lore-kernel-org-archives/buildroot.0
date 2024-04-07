Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B84CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD80981FCF;
	Sun,  7 Apr 2024 11:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvz6NZHweEZu; Sun,  7 Apr 2024 11:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C03EA8204E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C03EA8204E;
	Sun,  7 Apr 2024 11:46:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5540F1BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 355F2405CE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZllHfp9qbdT3 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 778A2405C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 778A2405C8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 778A2405C8
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:46:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8EB4FA4C2DBD;
 Sun,  7 Apr 2024 13:44:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx5-000000005Wv-1VNO;
 Sun, 07 Apr 2024 11:44:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:31 +0200
Message-Id: <20240407114445.683504-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490287;
 bh=+2mAbrEtxuqPmtKogcdaygljTDjPUNN3TO/8wzDSBPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vdRfq5uYlWoUsGpcIfIMHkgmuGFBHGpvBaCGCViUnDYF8oo8wo5F738GV1Q16KSxf
 2kXy0PNGVS2JR7tiFG3DT7YILnOlDBgVOV8rT2MUvGrqsYARhfDb6qipn3rzQjqxlV
 0lO+AdezVa23F0UBDq66HzaDGWgQ8Tnn2xdkSwmSMk8jIqea1mKZQcj4WgI6OiTi8g
 hAAzcF2wuU5v6uDlFNljvG/5PpP+hJSBQiIyJQwhLS2sJTMa7ybd3Vwq2IKwAxFDHY
 Z1eto5VwQE5UW4O9COnrnd8XcHpncW/VGSz5M65/VpoeiLUb8ldvxkzi/0tXFmSdyP
 6C3msqyTM6AQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=vdRfq5uY
Subject: [Buildroot] [PATCH v2 06/20] package/bento4: bump version to
 1.6.0-641-Omega
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bento4/bento4.hash | 2 +-
 package/bento4/bento4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bento4/bento4.hash b/package/bento4/bento4.hash
index b9391aed6a..b933c74d2d 100644
--- a/package/bento4/bento4.hash
+++ b/package/bento4/bento4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4464cd47b597e6dedbfc231bb6eb097c45cfe5ee0051082460d9ac53e9d74dc3  bento4-1.6.0-639-7-Omega.tar.gz
+sha256  f1f8cfa4f7cb651b609e587f825607cb4b06fe5b08af876fd0154a434f9a5315  bento4-1.6.0-641-Omega.tar.gz
 sha256  7daae92c8628ada28def8d096fe2fde298b72ec3e2d64a3c408afce38edb361b  Documents/LICENSE.txt
diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
index 8aefc401ef..569e320a2f 100644
--- a/package/bento4/bento4.mk
+++ b/package/bento4/bento4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BENTO4_VERSION = 1.6.0-639-7-Omega
+BENTO4_VERSION = 1.6.0-641-Omega
 BENTO4_SITE = $(call github,xbmc,Bento4,$(BENTO4_VERSION))
 BENTO4_INSTALL_STAGING = YES
 BENTO4_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
