Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDE5C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 09:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E1FB845B2;
	Sat,  6 Jul 2024 09:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5edUObdicQa; Sat,  6 Jul 2024 09:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 741AC83FE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 741AC83FE6;
	Sat,  6 Jul 2024 09:27:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C41021BF83C
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 09:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD3AF405C1
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 09:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lgyry2eyAq5q for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 09:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D015400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D015400D3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D015400D3
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 09:27:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6c1.dip0.t-ipconnect.de [79.214.198.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63C95A4C019C;
 Sat,  6 Jul 2024 11:27:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53700)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sQ1hU-0000000088L-3upt;
 Sat, 06 Jul 2024 09:27:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 11:27:24 +0200
Message-Id: <20240706092724.36092-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720258045;
 bh=qMjNIvwR4d3CyXDUXIE2oYwO7Sn36QAz58+jkYcx4z8=;
 h=From:To:Cc:Subject:Date:From;
 b=VPMl5zrb89BmeIIExu/pBPgiGm8Le5LdHqhmhWQ//1nyqe+5d0YmEj95qBGJ+qjoE
 eL938zNstt7B/5SylVAEhLEjHJK/JHRMn+s6j1yFpQkZk0mvZB7ovizzDMZB9qQXQU
 VMRNId3GJLizY7WcsEeB5oVDVkiBpREs4+c+vXn6SLoZn+OaMa/nUzeBKLKEmamM8S
 t6Pb7+fe7qGcrS2LnnopuXT3Udf8FoNlWb+5W+48yZ2SlX/Rhpp9S9o0yELiQkF36j
 KJCqi1yA8KgKdo4+1ntdCNv/8Nk7c6+FTVP9qrYU3fwsSMbkloIMCA2LF2TxYmcDgU
 XuaBqphG3ngbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=VPMl5zrb
Subject: [Buildroot] [PATCH 1/1] package/znc: security bump version to 1.9.1
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
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2024-39844.

Changelog: https://wiki.znc.in/ChangeLog/1.9.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 8d59c7a1dc..7bac128af9 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8b99c9dbb21c1309705073460be9bfacb6f7b0e83a15fe5d4b7140201b39d2a1  znc-1.9.0.tar.gz
+sha256  e8a7cf80e19aad510b4e282eaf61b56bc30df88ea2e0f64fadcdd303c4894f3c  znc-1.9.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index a910655195..ec6287e6de 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.9.0
+ZNC_VERSION = 1.9.1
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
