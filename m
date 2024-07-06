Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DA7C38150
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 10:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09712409ED;
	Sat,  6 Jul 2024 10:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOiVhtkBIgdp; Sat,  6 Jul 2024 10:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D54FB409C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D54FB409C8;
	Sat,  6 Jul 2024 10:23:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 313F01BF95D
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 10:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A38A80B42
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 10:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4n1h4pvz8TYL for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 10:23:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1AAD684184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AAD684184
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AAD684184
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 10:23:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6c1.dip0.t-ipconnect.de [79.214.198.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0828A4C0E6A
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 12:23:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32952)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sQ2Ze-000000002ET-3RHJ
 for buildroot@buildroot.org; Sat, 06 Jul 2024 10:23:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 12:23:22 +0200
Message-Id: <20240706102322.3127779-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240706102322.3127779-1-bernd@kuhls.net>
References: <20240706102322.3127779-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720261402;
 bh=66SztbuKORBsnCs9ELMyC/ABszm+U3rjAr0+YKTcpqQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bgugsbkLFCISrjs19EgWtNWJ27cimZLk3k4CbHbBiZOtj8lCEqLYYlmd36wPnz707
 UbfNqtgfApfuFYKBaBCtCFsvlQVVcI5TdNLmzYqJmFB9RFCUsfPfnsno/6ww/Dp6ci
 GaIrymKFxe48DJeasJgJglfd205lLRJqDm2eXkdgAdIJ6LXu+bXl0coQtGHoeDbVA/
 qk6kTUJwTz/LVWchyLJPejlhsqtMtqRq4LNnXRVtVJF8sv5o80/NSDrxUt2S2GhNwP
 A5xbz6HMthXpzdUPAExvaq/59CFnHZIeUAIoEHbbMExAH2Hq+XgF3m3V9kIknD9Ird
 5ByLs/3EHbXxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=bgugsbkL
Subject: [Buildroot] [PATCH 3/3] package/hwdata: bump version to 0.384
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

Release notes: https://github.com/vcrhonek/hwdata/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 92b7eaab6d..7d8959990a 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b98ef646d530d5fd3afa3180efbf7c8e22d3da0088f5836f41ee25380d87b092  hwdata-0.379.tar.gz
+sha256  caa496a6203084ee3404c688a75ea05b4b10eec93340c503199647216127f347  hwdata-0.384.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 555fb58f14..3394dbd015 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.379
+HWDATA_VERSION = 0.384
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
