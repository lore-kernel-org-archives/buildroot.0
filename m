Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DF1D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5C3605EC;
	Sat, 26 Oct 2024 20:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsjhkiUNmPpu; Sat, 26 Oct 2024 20:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5550E605DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5550E605DB;
	Sat, 26 Oct 2024 20:58:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 212BA5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01C2340003
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9urWkp7_KtA for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:58:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 857224010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 857224010F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 857224010F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:57:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9B6A0A4C0CE0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:57:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60512)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4nr9-000000004NT-2bVs
 for buildroot@buildroot.org; Sat, 26 Oct 2024 20:57:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 22:57:55 +0200
Message-Id: <20241026205755.2664552-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976276;
 bh=z6VEmx02su5tIxtsT6uGaeh7yCEW4WMUWpWlbA/QhWk=;
 h=From:To:Subject:Date:From;
 b=epjHFcFjUZcSWCKa3lEglL9rJLhKItOUJtx9xWHc3///x9aaTOJ8yaMxZ7RA9KsYQ
 azcIZuWcnxHSSQHZ4EFltFF72i54X/2Olcuubm/MDO1Vlm/TLbujtsByYnrc1zj+xC
 zhXh96zIlKWGA0SNxtAmMDJjtJcjkmVBJrEneyj+KKy/UwNu5haaQlbkZ5Fi8RbgLz
 B9PWOk36RGHnN99GMUAi636/P9Xaka961g5hxm2ua20v5PjUmdud+kKqqFaL+GVTEJ
 phPxQP92KYN2naKF3DIl6ZWv1nZPsaf6MpUOtYwH+9KonKz/RfZt9anguWdEpmd7x8
 oA61S9dU2vrRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=epjHFcFj
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 24.3
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
http://stellarium.org/release/2024/09/22/stellarium-24.3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.hash | 2 +-
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 6f831f2919..4c1e0c18a1 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  f9e8e114e34265194ffff0c2a2806a6fdc998449192749c4ef60b0a5302101af  stellarium-24.2.tar.xz
+sha256  03dad30f4031bdc2d200146e7c587249ea75dbdb88c8ae13632829aac5540b08  stellarium-24.3.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index abbfe72aad..51b1688742 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 24.2
+STELLARIUM_VERSION = 24.3
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
