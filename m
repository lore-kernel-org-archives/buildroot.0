Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6908CCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 18:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86FAC60DB6;
	Mon, 13 Oct 2025 18:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hppjtWestjZi; Mon, 13 Oct 2025 18:10:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C346A60ACC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C346A60ACC;
	Mon, 13 Oct 2025 18:10:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 041EF294
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D894480F51
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZMAyXenf7p5 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 18:10:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E924B80F30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E924B80F30
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E924B80F30
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 18:10:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13017A4C67B7
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:10:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51932)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8N0B-00000000853-1Xq7
 for buildroot@buildroot.org; Mon, 13 Oct 2025 18:10:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 20:10:31 +0200
Message-ID: <20251013181031.289433-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760379032;
 bh=8sPv9UOpEbEf7DUnd5pjk8NbQV+MwXj7Ufq+punVSug=;
 h=From:To:Subject:Date:From;
 b=gcMCxEh43dJ3GUmUpSTi8x7gG32QhEF9r2R29lxt4mqmKksqz8dNosO2EDCmh6POE
 F3SNdM3c+v9JfLVGkFrYekaxM70Un6PUuGeI2MrS+TMcakwaw978qt7xUf91CV2U3F
 /bmZBY74X0wK+0yGJ/j5e3caajhhpKrZVHZK3tJ7NRViZw9rT/nwR5NQAGVK7YTqBO
 OErwBnoCHnyvumpHZJPnd/18XE6+XVhejGBkWgTsm93zrLupeqy3wHgunUpR/5gXF6
 Rc4HaiPXzj91N0l/bPCyb1M6asEcMNiPyNOdW8kjEL5IZjZamgo//9JI0TH7w/m2qi
 OJ3kBCDnH93AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=gcMCxEh4
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 25.3
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
https://stellarium.org/release/2025/09/29/stellarium-25.3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.hash | 2 +-
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index e4e832699b..6c8e2a850d 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  5423334212a6d0daa006d44e1bc039cc212fbc990358c7b6636a7a2aac67434f  stellarium-25.2.tar.xz
+sha256  1cdebfa04220656a956270425e06c6c522579c07d61c3440f6b11ac3f09f6db5  stellarium-25.3.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index f342652a4d..ec792bf20a 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 25.2
+STELLARIUM_VERSION = 25.3
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
