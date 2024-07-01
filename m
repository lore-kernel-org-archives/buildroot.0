Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418F3C3065B
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC0AC81E92;
	Mon,  1 Jul 2024 18:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6sJ6FZYxNeZ; Mon,  1 Jul 2024 18:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1427F81E81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1427F81E81;
	Mon,  1 Jul 2024 18:27:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51AEF1BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E1F340584
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GE-CeoDIjp_N for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F8F0400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F8F0400DA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F8F0400DA
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:27:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0da4.dip0.t-ipconnect.de [91.58.13.164])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D8D6A4C107D
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 20:27:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46444)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sOLkV-000000000EJ-0atS
 for buildroot@buildroot.org; Mon, 01 Jul 2024 18:27:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 20:27:34 +0200
Message-Id: <20240701182734.3297884-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719858456;
 bh=y7Hgo8iQEwJBGlEIc+LQPe8DiC/Ph703xQ+9hBNsg4c=;
 h=From:To:Subject:Date:From;
 b=GNjy5rpzwv0+8mwoiKZjCuWi6RKhYISqPWLjiZKcvAOpdCJhWEJED53Av7UnpuABa
 I1NUDrO9BAjgPwsa589xSxhACiLSCo2Tq4Qtu3qP6Ouwbvh71fXTbSSrnQR73E+7Ta
 AozaxmhEHbjFgF3/s8csGA5vdL9lv1XkcrPfPIghDiLjK/r+zOU3lqKKF5WlUSO8Ov
 B3K0QsKG9FcmwPlyDa8q27Z/9pI+x9JSDYNgtPbUsd2FSEHySO+Tia/udIqrlgaZZO
 PXSSO8ZmXbsn9v7NrLzgjSw42ihQbvSmiEFAK9GsVBPJ+mZG7mf2GIjwRwAuJew5a3
 pFCqIgUBwSI1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=GNjy5rpz
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.60
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.60

Fixes CVE-2024-36387, CVE-2024-38472 (Windows-only), CVE-2024-38473,
CVE-2024-38474, CVE-2024-38475, CVE-2024-38476, CVE-2024-38477 &
CVE-2024-39573.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 84248761b9..bd503d84f9 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
 # From https://downloads.apache.org/httpd/httpd-2.4.59.tar.bz2.{sha256,sha512}
-sha256  ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e321323  httpd-2.4.59.tar.bz2
-sha512  209da0bbac5e2564d4590302515b35495be6402273ff4024aa93e85e44554c95e053201d606383936425a41e1b5b97e6b40055dcbb385eb691a5029a6f3158c2  httpd-2.4.59.tar.bz2
+sha256  7b1ec7ec5635da7cb01550513215a90f8b2f52bb7c90cf3e97ede936d3e55b0f  httpd-2.4.60.tar.bz2
+sha512  c1591389f76699beaa5d32b019729e25f1ed5b828311c82b52f1a4edd5d28b73e697958df384d7628b314521a831dbb0af418bc37cdf031cfe133e53c195d8ad  httpd-2.4.60.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 1b095c5eb1..39ccc3cf96 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.59
+APACHE_VERSION = 2.4.60
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://dlcdn.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
