Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE1EC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 10:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A64574031F;
	Sat,  3 Aug 2024 10:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYxmPh4qKCUC; Sat,  3 Aug 2024 10:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FC4B403DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FC4B403DC;
	Sat,  3 Aug 2024 10:45:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16ABE1BF37A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 051C16064C
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 10:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1xBbpBn2HKf for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 10:45:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CD7D60626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CD7D60626
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CD7D60626
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 10:45:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfa9.dip0.t-ipconnect.de [79.214.207.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54791A4C013B;
 Sat,  3 Aug 2024 12:45:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44730)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1saCFw-0000000033l-1nLY;
 Sat, 03 Aug 2024 10:45:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 12:45:00 +0200
Message-Id: <20240803104500.2574099-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722681901;
 bh=pd9CGdFYBEaw3+d5xESgxBmqr1er2XbRROrn8bvvP5w=;
 h=From:To:Cc:Subject:Date:From;
 b=q7Oe5FAIz3NuVT/DW+3DFrXhm02HQks4AYwzJCgmfinyukHijpT6SEZtaI8EVKUIQ
 FMW2joVYvg6pZtawRbz8e20vh2ngUWHssP+zH7jFFHnu2jGiE7l0nrKufdI9DBOBcF
 EVgiUNYk2pVDgxaQzEtH6iOZnwtsd4wE6ogxF9+eqnIXuZDQvdxqCy+kZxgW70rF42
 bcRGPkdSjV9oukmOBSRTx84HtFhqtzks0PEPlb53wVU2zEybc9fgOzYQkCPSVJ0cBQ
 Xfxf4wd3UR/Bm48vuF8DlVwSDwhTVetLduGCiOuPQtFF3FBqiStsxoDEvKrf5QcbtI
 O4IqLfUDe9hVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=q7Oe5FAI
Subject: [Buildroot] [PATCH 1/1] package/libxml2: security bump version to
 2.12.9
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

Fixes CVE-2024-34459 (2.12.7) & CVE-2024-40896.

Release notes:
https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.7.news
https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.8.news
https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.9.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 086bb41098..73fd0ecedf 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.6.sha256sum
-sha256  889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb  libxml2-2.12.6.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.9.sha256sum
+sha256  59912db536ab56a3996489ea0299768c7bcffe57169f0235e7f962a91f483590  libxml2-2.12.9.tar.xz
 # License files, locally calculated
 sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index e7ed6fb752..b69722b21d 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.12
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).6
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).9
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
