Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB4BC71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 20:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39EFB80F93;
	Mon, 16 Jun 2025 20:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yn4hRuhcuDcE; Mon, 16 Jun 2025 20:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8495880FF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8495880FF8;
	Mon, 16 Jun 2025 20:04:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDB4916B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A42E94049D
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jvnZRomf8LP for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 20:04:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB060403DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB060403DA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB060403DA
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:04:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95867A4C085F
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 22:04:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34984)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRG4E-000000005HF-08ga
 for buildroot@buildroot.org; Mon, 16 Jun 2025 20:04:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 16 Jun 2025 22:04:30 +0200
Message-Id: <20250616200430.4097707-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750104270;
 bh=/YO0Wk6oOF3r5ylD0L5AtsZmXTXki9oTCYm2hu8royk=;
 h=From:To:Subject:Date:From;
 b=zwAtncjRxTnMlgESqUyxHKFJ0fpwfqpl4kH34wTsCzdcFcVhgnmkE23/lRY59GYlw
 n1UPqz/hd9EawIhqejRoRDYe6/Y+Yf5z5UUBgHxJBYwHTKXnPLVUJWnN5+x5q8W/nz
 RIJozBldQzmq1dUjAx29iY4221hP1X5ty/A65ALRwUaLcmgu0ZHrKBnVuDc/bL6+GO
 CFjM7cGD6l74RHniAx6gO3Z5GstffRueoa8uaLMXKnCeCawQ/g7iHmAybGpwuhpDmN
 lAkl1iIWdEkdo5QwAIJzlUZeOfYxeNMQAG+N6RSOQZEKcdxtzJRmy9BLpBIA06pYOg
 9mkJhLnQkh/Qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=zwAtncjR
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 25.1
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
https://stellarium.org/release/2025/03/23/stellarium-25.1.html
https://stellarium.org/release/2024/12/22/stellarium-24.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.hash | 2 +-
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 4c1e0c18a1..ada974b4b9 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  03dad30f4031bdc2d200146e7c587249ea75dbdb88c8ae13632829aac5540b08  stellarium-24.3.tar.xz
+sha256  610384311455ce75f9b02f0d3d50e5cc127c36e67008817ea8cbab0bdadeaf5a  stellarium-25.1.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 51b1688742..df74ea47c1 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 24.3
+STELLARIUM_VERSION = 25.1
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
