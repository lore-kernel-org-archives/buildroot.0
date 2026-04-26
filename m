Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DF8FF8850
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 07:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58CB660644;
	Sun, 26 Apr 2026 07:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1eFOtbaMlzx; Sun, 26 Apr 2026 07:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A1AD608F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777187999;
	bh=eTQMF1cIMGEgMFjKoRb4azwKsPZ5cc7cHCD6QRa+6cM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EoDQsVvfek4BTa7x1VTOMihB+FWzWgm5krXN2x5ODBdwPzEErQ/5U40YjVdvTynAY
	 WWcp1UqvGlY3U/UiKIgfN9s5rTiGl/T7ABgcTg4kDTA5IxaM8AkNYhaLTGcgRy3Inq
	 c15Aq37hOzvyUXbA9FtTeRezWZmTpWuQ3xaM6ldAUUpDYvKALHaK5E/NlDlKzqtE+w
	 HvR8ssoqeaqvV+eXzD60h9bFfO8A80qKWB/bdspFCrJfmCi/Icuus15yFflkYiY4kQ
	 Mps75TN+CvPr+WC/le0E5RLmjRW/TR6tGj1dCOlQYwYGUf0dcismLqUa3j3M6MfFIj
	 A0mQRbj/lPImA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A1AD608F9;
	Sun, 26 Apr 2026 07:19:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C873F369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE55E401C1
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEyKpXajApV9 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 07:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA5A9401BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5A9401BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA5A9401BC
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:19:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5BFDAA4C0CF4
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:19:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40268)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGtmT-000000004ER-2hce
 for buildroot@buildroot.org; Sun, 26 Apr 2026 07:19:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 09:19:53 +0200
Message-ID: <20260426071953.397621-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777187994;
 bh=PH07ZzuN7U3RQvtO1gbmtFG234PJsxL5buzD85miHTQ=;
 h=From:To:Subject:Date:From;
 b=r/re/xQZvnQvhs5P01TIesoonEFgBlHiZDlaAsXn+eX+xn7DRnIWoM8MqaV/1r0Et
 yQeM0NO+qK5puFzTvTAIkRfecZJmCPQp7FqTwFrxGRK92ZwVIhukF1JotW+VHIMiuR
 KCLwWSEzFnB6To9MGUdjXRkPMyeuig/BnQCnoVUvfq6/ww6WDQX0HPUSglCVuCM0WO
 3FnS1xGfpD5q2ATBL9CDaQXbW3uce/Bmi1b27MXKkCeh0EOll7PLxR1RH5+bn5djN4
 nyUMX7oY6rzlGEjZOLOqFFLZRDlp758pkQe3FCgeBQ6lI++sBxfRIrnaBg/MOgGbIm
 CNNcaT0UEmAcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=r/re/xQZ
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump to version 1.6.58
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

https://github.com/pnggroup/libpng/blob/v1.6.58/ANNOUNCE
"Fixed a regression introduced in version 1.6.56 [...]"

A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 977f8fcca4..c387ffbf02 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.57/
-sha1  866fb81e3355088bb885bb4ded39093ef80eb686  libpng-1.6.57.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.58/
+sha1  6263409a6907d180e7b990827ca84ee944c6cc17  libpng-1.6.58.tar.xz
 # Locally computed:
-sha256  d10c20d7171569804cae8dfc13ba6dcd0662c41ed39d43d4d429314aafb10a80  libpng-1.6.57.tar.xz
+sha256  28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775  libpng-1.6.58.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 0081406300..96afc684db 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.57
+LIBPNG_VERSION = 1.6.58
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
