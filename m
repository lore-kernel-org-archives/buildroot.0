Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B58DC2BB85
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C515F40550;
	Sat, 22 Jun 2024 08:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVL1xx_iqC0v; Sat, 22 Jun 2024 08:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82ABB40594
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82ABB40594;
	Sat, 22 Jun 2024 08:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC5401BF865
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAD566063D
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6okjpPm0RLf for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8BA260628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8BA260628
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8BA260628
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:42:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8889CA4C09C5;
 Sat, 22 Jun 2024 10:42:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43162)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwK9-000000001ar-44P3;
 Sat, 22 Jun 2024 08:42:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:42:17 +0200
Message-Id: <20240622084217.10423-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240622084217.10423-1-bernd@kuhls.net>
References: <20240622084217.10423-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045738;
 bh=vFOeHLgpvaF9v9aWkWLP7CbcUGoBgpayG/W0tr0rfJA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PQr8H5Waf8QzTAjh9q5+5jdEjCa7jCJUGJ/GzcL9jfvHbqCq9B5vQTTXKqjov7Pn0
 s4xKgOntv1KXVN7MdCNyaUXy2/fKyYz5HdIDHMK8/BLY0M9Q2a4QTPo3mmoGIUjGFU
 dXv0YCyQBhLMa5QqJWrdwIvcGSgyuiG80mjDv8SI7krdlo6vaayD53IlPEcobFXAmh
 s8uqQJ5kGKhfZTNXL2ITiUHf6LFxZtBVqgyWzlG+2NwL01+qSjLG38Dd1inRLCzdGU
 WgREQ9kpVjlyd0B/Q7i5D4+MBhfG7eet9rOJBmbAvhdGBiOHZH/0BWpVzJobUjSNB5
 3ld7Ma277m+Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=PQr8H5Wa
Subject: [Buildroot] [PATCH 4/4] package/intel-gmmlib: bump version to
 22.3.20
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index aadf01a169..ecd5427b77 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ea9c418b0fd84a982850f230cb2d783dfe2e1f9923065f54b2fcaad1e9b33417  intel-gmmlib-22.3.19.tar.gz
+sha256  227c1614d4817154b4e6fbfb667ba2b231ea7aa53796d91f1800af9aeb703f59  intel-gmmlib-22.3.20.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 74e19e93fd..86391e9ade 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.3.19
+INTEL_GMMLIB_VERSION = 22.3.20
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
