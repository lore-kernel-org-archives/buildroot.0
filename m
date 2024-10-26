Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45054D10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 090484030A;
	Sat, 26 Oct 2024 21:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBF5RT56FrI2; Sat, 26 Oct 2024 21:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA865402AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA865402AC;
	Sat, 26 Oct 2024 21:00:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB235C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A4E3402AC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsGR7Q6pnTmA for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72CFD40216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72CFD40216
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72CFD40216
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:00:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A560A4C0CE0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 23:00:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36256)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4ntg-000000004lq-3RLQ
 for buildroot@buildroot.org; Sat, 26 Oct 2024 21:00:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 23:00:33 +0200
Message-Id: <20241026210033.2667139-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976433;
 bh=jYKeK5RJVYoL3UZpQ2DoB/5k+6DlV3dkF5qgbh2lLgg=;
 h=From:To:Subject:Date:From;
 b=qfynQKQ0ifKB8/bSXkfm1uuDJ1JsADFbOC3YlF/pAZolB2Dg7GzAjqrQtyf00ZG8C
 JQuuWXHPAxe2PODElmX8aDw8pi2Hm8Y8tEVrhRQ0Sy1+YScboXbTudNUmzzaaRfcGU
 dpihckRZ8JANO43r4WA51xK0F/3+YWbHCK2nveOmAstSsaLHPqJBDKly51QFO4Zf8f
 7aynTjIbnU0ZzPG8Jw6jTfLaYtPKt070NleVWi6U4XE5oJg9fVISZCPI92ejhnzOnL
 9MyQh3E8ZgcINP1Z8ILTuCxzfm4eghPYjwFhA2WkBZA2j6trqafpGaoEpgXghTuiPX
 wZYFqKohoGTQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=qfynQKQ0
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: bump version to 2.4.1
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
https://github.com/cisco/openh264/releases/tag/v2.4.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libopenh264/libopenh264.hash | 2 +-
 package/libopenh264/libopenh264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index fe98b7773f..6eb78e2009 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a44d1ccc348a790f9a272bba2d1c2eb9a9bbd0302e4e9b655d709e1c32f92691  libopenh264-2.4.0.tar.gz
+sha256  8ffbe944e74043d0d3fb53d4a2a14c94de71f58dbea6a06d0dc92369542958ea  libopenh264-2.4.1.tar.gz
 sha256  dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 478c29d7a8..e371e4cdc0 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = 2.4.0
+LIBOPENH264_VERSION = 2.4.1
 LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
