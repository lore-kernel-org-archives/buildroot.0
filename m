Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808BFC7115B
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 06:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 113F560770;
	Fri, 20 Jun 2025 06:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1vMACUuMby6; Fri, 20 Jun 2025 06:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DDD660EF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DDD660EF4;
	Fri, 20 Jun 2025 06:25:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EE0316B
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6221283ABC
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wJVPbq1cFEh for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 06:25:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B1F783ADD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1F783ADD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B1F783ADD
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:25:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F539A4C0D9B
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:25:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56170)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uSVBk-000000000tV-3FqF
 for buildroot@buildroot.org; Fri, 20 Jun 2025 06:25:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 20 Jun 2025 08:25:24 +0200
Message-Id: <20250620062524.20688-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750400725;
 bh=BVo62cT8ceGq3w+oBGK5lF4SQn6gzwY+26hOuhb18dc=;
 h=From:To:Subject:Date:From;
 b=ogbHqJyEKagTNG20MSmrYmc23s7MDEU2IXT4Ds/Ir46CXLgDR38eXVZofgttzEyWJ
 JWkiYf2wqn0+7S2dzpTeixcFlq69F76bj8rrS+rem/1qoS2vK6oaboHi8XnE+n97ec
 ysucICPF8hzj1lhuJVpTS25jBi9Lts/ORJ6vcwYX04/47zX+sLZvNfHaLkoOqA1/Bh
 NSlhICtfBwPLqBnYPrannxRLLAUzrvhYXZDlb/DQZeokofBR10RweQCWL9YgIYrJeI
 DWJrndadFqbOpmCPwq5N6bIM/dv3enoi1XnGh5J6hmJNGIfD5KNzq4Er+n79JZ1ixj
 kbn74kXt1tJLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ogbHqJyE
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.5.4
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
https://sourceforge.net/p/fetchmail/mailman/message/59196377/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 2a67bc1e22..71c0756b15 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59193648/
-sha256  d74e893b78ef29ebef375ab7e726d2977140f8f1208f5905569395cbdae4c23d  fetchmail-6.5.3.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59196377/
+sha256  c859156e9bff841d4d984cb3fdcb8042b6b31789fc3387c2649baa95a88d698b  fetchmail-6.5.4.tar.xz
 # Locally computed:
 sha256  e5768c44445cf051dd88e0cf8bfc16d81f7b1a7cc28f4e0204a4f8d81cd16977  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index e3fad2f4c4..90345edf62 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.5
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).3
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).4
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
