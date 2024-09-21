Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1C1CF9C69
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 17:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9418E40499;
	Sat, 21 Sep 2024 17:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TGhd_BoClaw; Sat, 21 Sep 2024 17:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CADE40538
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CADE40538;
	Sat, 21 Sep 2024 17:26:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED7EB1BF479
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 17:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5448402B1
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 17:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GRMTkA7iHuq for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 17:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E62F40279
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E62F40279
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E62F40279
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:26:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0be.dip0.t-ipconnect.de [84.161.176.190])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F44BA4C2463;
 Sat, 21 Sep 2024 19:26:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46298)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1ss3sQ-0000000042U-3SQI;
 Sat, 21 Sep 2024 17:26:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 19:26:34 +0200
Message-Id: <20240921172634.3642820-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726939595;
 bh=fcrhAbb5WIbaKOKVrVre4Ok8GCDIUks1V7QL55HyDLU=;
 h=From:To:Cc:Subject:Date:From;
 b=IpaNaGVQVR+4i3gW4CjroKCzMINo2Gjq2CpM4v5VvUwt+f5Tsv3zisCdlzQLD7y65
 4WlluDTVJAe/0vrmNe6pWncGQGqhkZoEB/Eu3lI7joeED7Y3CBoV0iFtPvroB3omCi
 lQpXhJV+VqiFnBnG9ltkNICo3uL9kqQQfJIhOfQ0En4CA1tacxNddV617AP/aBSV78
 3e42lW/RoCvOBZgLynxaNM5sYBaS1WCZhEOmkZMyo7zwF6ava3NkwMoW774S8nWuuQ
 9HU/kELeucibnPDSGbXcWbhVjyG8+zga/25jUuuoa5zaL5XpCFYXbqm8kXAWkNUxuq
 IUyojRtfH6HGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=IpaNaGVQ
Subject: [Buildroot] [PATCH 1/1] package/libxml2: bump version to 2.13.4
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.4.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 7b9ffc5d47..ed6c20e948 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.3.sha256sum
-sha256  0805d7c180cf09caad71666c7a458a74f041561a532902454da5047d83948138  libxml2-2.13.3.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.4.sha256sum
+sha256  65d042e1c8010243e617efb02afda20b85c2160acdbfbcb5b26b80cec6515650  libxml2-2.13.4.tar.xz
 # License files, locally calculated
 sha256  c99aae1afe013e50b8b3701e089222b351258043c3025b64053a233fd25b4be7  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 068ce157d5..8a5d703da6 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.13
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).4
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
