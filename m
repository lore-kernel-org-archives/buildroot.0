Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4363C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 23:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF05811CD;
	Thu, 10 Sep 2026 23:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sG9OskKwITe5; Thu, 10 Sep 2026 23:02:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BEFF5811C5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789081341;
	b=Go+eBIN1u43RybHnmhimCVYDrU9LdutOpCS+6lDyou0jEsdeA1zBsBod80pe8klveN8O
	 k330bq+YR02ni+KNeAM5JHHSM26aGcrweKNGCr+mF6U/lHcKg6Y3j4lWvn3iTebWBqDd3
	 R9jH96W+Hb6tKcl+NaDOaSAmsrxGs94DVlpAnX2tYQy4bKX6Q5Q043mMilpL9hoSqBbuP
	 WZMfJaa27RvtUm9AykRxS+LPvsANjqbjf4hlw1DSXZY1AephlHtJ/6VocPyfgRnUdA6aY
	 1NNnOynYCYLiPA2MfJYjaUzoJQm9ClPhrA5A92oQ/kl5H1HyCR4eJ8EafTpcJl9nHuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789081341;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pwj48BaPgwc9Z4/wAJLejXMgM9BIaqLx9GEOh9gmwIc=;
	b=IUBD1SsHc/VzAjGt8WeIGgRuh6Mb3kJOWk6EJ0r8WlqEJN1RXU/44r2B2Pp+c5UBFH94
	 RcOfBLFbKb3KGVYQiQKT1OrTKe0eRr+IxarD1YeRGqRueCbJek02fbv7zz9o9OYQIDV8i
	 9/P+2XIv2pw4bxFKX1ouIaBGLIHi31RJns02UaU7CATJmZ4n1I3iSxZ0EOLFAP+cEpoVJ
	 qqD956MifkS1ywmnQJ0rAYo6ia5WsVIzFnl0NRWryuVqA7Bi0xUCqeYU5tyR8bpzMid3v
	 a7hQ8JtfPc2+KmlaHsvR0KBlWC4f8yfo6Qhnxw1ErH9ZkdkAEEV73he7GeAvyrNfrwA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789081341;
	bh=pwj48BaPgwc9Z4/wAJLejXMgM9BIaqLx9GEOh9gmwIc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rFtGUohUI7O5I+9jhOPGE+qWMTDT45Qmq79u8r3uE2dQdbGaufaAVqhga+fgn4E2w
	 hvx+R0Jvi1AQlwQp4Nrri34LhWGsX12vRqskLVu9fwcD0z3SM8zL3G38/reNRsoa54
	 FtdXxO+Pc7Urbidgp/Q1oiNEzHk4lor+MXNRGfOW+k0Tlg38WyFBD+/uy9tb4PKYRE
	 DakOV2gwFz1J/Dq02gdTZd0TMkSlw8B/MyXGuLbi+R/A7J5O7WjJLyoJ1xZcL6jI3c
	 +Viy9gSLnVVhQp6TvVH2WCZdG9HcM3qLM7BeDugE6ryb49pZnEK9esLv41/u+8EJzu
	 4+8uTu/Oo4BKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEFF5811C5;
	Thu, 10 Sep 2026 23:02:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F06C362
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5503960805
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrpCbisFvekt for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 23:02:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 04DC5607FF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789081337;
 b=lQhQevXhu3l6/Kt/RDHfV+n1nKstzpT8Y0hTQMYVpyniHJyD7gc45oTaZj5Ja02IYKyn
 GESl8mRKeHEpOqmCMl+2z4EIQOWq7L+q16nQecglx7Z46QNj10jmQM4PgGQ0TK2nkTy1V
 5zbea0HFfmt1afHhtvY1eHLS2agNip3/uGuxqrSTUDEv9eoqrE1yeKFgIiDPLj/FRHRL4
 5UT9yKPAKs675RwhIXWTTiNiwLfwL/Xig5zP8OZeLFJLbx2xzXSPX2r/ZtmjRVtjE/nI5
 33r3OHk3GmZqNE+/iDHd4efB+hL1bCzdfmp8br7x3IBnM4NlWN3wKsIq729gu2KfSYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789081337;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=SX64XNvIE53ZHGp2lgButNqyYtreabq1a+cHiTBG30c=;
 b=Ti5mD33e+jWsxsZm0BZX6DDM5iWih19JWhcLh63qaG1HKfnCjYdKUrefJ9R2LkwPhKEb
 NaCmnu1C1oGRYiJH6IHdMpbUz4rT4iBPrVGfkIFslS32eJs9N8sZzJaUmr+SwYwVlhaUK
 P2NEuHGoYVessvEdQORZmHCClGXDADyv9kTdlETRvCSXt2FEOVRpssQyV9K1PXLVu9+lC
 hITeHA+cu0znerCvQTUjCC8Op6Q/VnyVxYbemMFR3q7CbvyGaQejC8F87RsRBV0Z+WgP4
 amt8BFGoDMJrA+Flgj4AM2yB4nejEJKuxXh7w6pKJunQVEHOA0RR2Bux2EGsQAiiasg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b="a/jRWIdD"; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=a/jRWIdD
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04DC5607FF
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=SX64XNvIE53ZHGp2lgButNqyYtreabq1a+cHiTBG30c=; b=
 a/jRWIdDlAw6kRhwnYBOgjxepe0b3BZtEJpVFtnqhJRO+KU0zDdb0Zwi7zGT9eQJo6Oxocv/XP092
 GfgiDkPOCq+UEu5FcQo2QiA9IG4k3J3Jj1cjL3G/w15kgrZgYvYptFmehe42EcOKYjBDHx08w6oLb
 lGl2hSyb3bF9NCLewF0OLKeLlo6euH7jOWm5Y5gGgy1f1gkxB0sZfyYmoTaOYw2ae7QMGAOI23IY2
 2WVektjqv0jtUklcdXIm0wde9Ch+MrY5it9vBmBfbJ0yT2q23Tqk+wt2RuZHn+AuKFYKYXQk+boe2
 VFX0yGgm0Wr3WSR7Fa+RcOLLKWItmbckOA==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x4nmR-000PGQ-PZ; Fri, 11 Sep 2026 01:02:07 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 42cdaf28;
 Thu, 10 Sep 2026 23:02:07 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 11 Sep 2026 01:02:05 +0200
Message-ID: <20260910230207.1934197-1-aperez@igalia.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cage: bump to version 0.3.1
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

This minor release fixes a crash that could happen when a surface
requests to be fullscreened right away during startup. Release notes:

  https://github.com/cage-kiosk/cage/releases/tag/v0.3.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cage/cage.hash | 2 +-
 package/cage/cage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 4b05602822..34585cda28 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
 # Locally computed, after checking PGP signature
-sha256  cd2510f83bef3e08e660d99492ca7761b218ecb53ee01cdbbeee3d6aabc7734e  cage-0.3.0.tar.gz
+sha256  edafc173b6f56a3e1564933e272a54aaa9fe158d330e6a415d57b44ab880fe2b  cage-0.3.1.tar.gz
 
 # Hashes for license files:
 sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 4495c59b4f..4372c4667c 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAGE_VERSION = 0.3.0
+CAGE_VERSION = 0.3.1
 CAGE_SITE = https://github.com/cage-kiosk/cage/releases/download/v$(CAGE_VERSION)
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
