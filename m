Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68434C0015E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 12:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BA1D400EF;
	Mon, 17 Jul 2023 12:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BA1D400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CIiygpAnxYmg; Mon, 17 Jul 2023 12:29:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4153040159;
	Mon, 17 Jul 2023 12:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4153040159
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38F1D1BF34C
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 12:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12C8C81326
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 12:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C8C81326
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lh9NZZDyhrp0 for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 12:29:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7328681320
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7328681320
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 12:29:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 910F8A4C0931
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 14:29:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55028)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLNLo-0007M2-08
 for buildroot@buildroot.org; Mon, 17 Jul 2023 14:29:16 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 14:29:15 +0200
Message-Id: <20230717122915.3548507-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689596956;
 bh=nOqg8pAOI63rK/jk6XfFf7kMPIdhdo4+c0Xl8sGAI10=;
 h=From:To:Subject:Date:From;
 b=a1M2XGpkyEF4STAnYzFYAe3s4VP+8bto2CObI+JaD/5KnocvUE1bDALH3PNcb8dxy
 3C8fQxgzK6yQliTrxUhSHmWCraoCJ9O2xasTrh3TFR6q25H/L7pd0QM4l151KGOHLs
 sUXFHT2CcsYD70mxS51BkDvZkKQhHFY5nodfx4zx4bDoFPq1yS2nXa+LOm/9xUgJAX
 lrkSiyz7pKk00apGvK1pvU4rPvFJjK/a5/r4gAFtlKodVLZzUs4fUxYv2KEf/0UNmg
 jL7YVqZc9oy6loNifgTVy74K2eGRE0xDnlMA5JCJyiJ4gDIW/gXe6yPLnlpM4C/QyK
 ZsRXbJao8ORtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=a1M2XGpk
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix gtk dependencies
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

Buildroot commit 80793107a65d95f8dfd0317a726d3a737c78ef67 forgot to add
packages needed for gtk support:
https://github.com/transmission/transmission/blob/main/CMakeLists.txt#L40

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/transmission/Config.in       | 2 ++
 package/transmission/transmission.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 84bd85eeff..d6567c6452 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -38,6 +38,8 @@ config BR2_PACKAGE_TRANSMISSION_DAEMON
 config BR2_PACKAGE_TRANSMISSION_GTK
 	bool "transmission-gtk"
 	depends on BR2_PACKAGE_LIBGTK3 && BR2_SYSTEM_ENABLE_NLS
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_GTKMM3
 	help
 	  Install transmission GTK-based GUI interface.
 
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f3a200ced3..b2d554e742 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -74,7 +74,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
 TRANSMISSION_CONF_OPTS += -DENABLE_GTK=ON
-TRANSMISSION_DEPENDENCIES += libgtk3
+TRANSMISSION_DEPENDENCIES += glibmm gtkmm3 libgtk3
 else
 TRANSMISSION_CONF_OPTS += -DENABLE_GTK=OFF
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
