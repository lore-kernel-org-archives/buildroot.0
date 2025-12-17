Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B0AD66B81
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 18:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A833B610C2;
	Wed, 17 Dec 2025 18:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rEneAEF6k4S; Wed, 17 Dec 2025 18:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3489460886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765995203;
	bh=296hjvJ0MKhUr9eJWvQR2LFtsVf3AU7Sx999atopWD0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S5gfApC9P2zRIuGnTijNxyx4btkx7lfv4MjJHxvt5jbbUS3skOlCDnKSF3WQCOGtZ
	 l2GD1doO4QI4yDjunLQci1CbZ5IPxITwyV3TxTS9DuitCeQUq3cj5l2nMSkothb1uO
	 ADJobCqJL1cXJHKnZKMGLxDwazkWaersMMoiS6cseu7oraDXgKkyQWqPttD8JtLlIl
	 GqvWGsfhQBJaJQ8PYmkVsa3PgqDSYWLKRgdR4vbPe2nvtiBFb2OVjGikXeqejJgkhR
	 2rzcvTSeVAnIMuUQbKWaT7xHC/0bim3t6+oHe+PrjENXBkTtLlW83bzhp+FjGjeb6V
	 lIhtoToVgU0cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3489460886;
	Wed, 17 Dec 2025 18:13:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1022035B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 18:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA0AD60886
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 18:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQtYFNK0n-d0 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 18:13:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95CCF606E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95CCF606E8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95CCF606E8
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 18:13:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2582A4C468D;
 Wed, 17 Dec 2025 19:13:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57016)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVw1S-000000004z5-1XSO;
 Wed, 17 Dec 2025 18:13:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 17 Dec 2025 19:13:14 +0100
Message-ID: <20251217181314.3675513-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765995195;
 bh=WQNyWR8AdzAFNYHcjtrYRUi8RTxXAPU5c6mlT+kOUDQ=;
 h=From:To:Cc:Subject:Date:From;
 b=gXuTha1sX7ZqBcBBHjf/qdwLEHrS5eEwi5KXQbntrFVhhcQg935L6NL7Bb07ynv4G
 T4gzQTJJxuVjvvbciF2zHr1LMbZ7vPl2lcXd85YKWqa5XDoQEFUXGFmV9h78z4vyz7
 qLpDo2Ms9vr2ED3CGbG/mkU6n/ERpskaMxHlyMoHzQrzqjWFGJlnGbuczn6BNfLoMa
 ZcukqTFbhOxuOiiE6fwdmo3xYRyPhQ/HdmfZ5F1oqzQtHo6wSojwSnKqVnWCAMdU/K
 L49IMeB8e13p7ysSR2/SaEVD4lB9kuKYltaOyIBRuh/7IE4aM5AACc5anku9o3sMoe
 tH6QvrlyN/4Pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=gXuTha1s
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.1
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
https://lists.exim.org/lurker/message/20251217.151548.85d1a2bc.en.html

Fixes CVE-2025-67896:
https://code.exim.org/exim/exim/src/branch/exim-4.99+fixes/doc/doc-txt/exim-security-2025-12-09.1/report.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index dd20fb805a..f9a62e0188 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  5df38b042ffa9a9c8d31b20bc8481558070e361b06f657608622a62a327adcba  exim-4.99.tar.xz
+sha256  eae967bd49a5f879933b8c6ec88c30475a1c6646232135f37f05b55dbc4e3447  exim-4.99.1.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  06521aff437dfe99c015606d2cdde76eaf6e4d2f03779b07fbc0e7d06fe0584366cae9c3fa7d73a86c348f0d25336acd06c42bd5b8f18e5a969de9849088e3aa  exim-4.99.tar.xz
+sha512  41a280673b23a79684124dba9ba1db4da57047eefd7bac8560fab3e399659698160386c5369deb4aabdbcba1ba9278fb0a61fc1667dc2745c280b3004d02f45d  exim-4.99.1.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index d9adfb59d5..47fe17b372 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.99
+EXIM_VERSION = 4.99.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
