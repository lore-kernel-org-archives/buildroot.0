Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35157C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 22:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA68E415DC;
	Thu, 27 Jun 2024 22:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdw6gPhg2_3g; Thu, 27 Jun 2024 22:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFC2A415DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC2A415DF;
	Thu, 27 Jun 2024 22:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 579F91BF41F
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 22:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EF1541B40
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 22:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGac55XlyCB2 for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 22:27:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8630A40136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8630A40136
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8630A40136
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 22:26:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb6a.dip0.t-ipconnect.de [84.161.187.106])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A6EBA4C0298
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 00:26:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59362)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sMxZx-000000004Z0-3QYw
 for buildroot@buildroot.org; Thu, 27 Jun 2024 22:26:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 00:26:57 +0200
Message-Id: <20240627222657.636484-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719527218;
 bh=4bwSjsvs4GgfOHYa8lgj/4n4+IQaDNIE8qCJ/vDFrsQ=;
 h=From:To:Subject:Date:From;
 b=VBnZwGAl8MVFbpIE50RFeX24RstQysg3h6b2zbZA72gunyrIISLQwBfB3A6B55Qma
 HAnm/y0XvKaXRFTksITr/DQi5F3rFxTQxKDo+rH1VU9RKPmyhhwspFs7kJyPJPt0Hr
 Nxt7nW9e94oZ6gBwEdOyPrqBqe7BOgGw2+hpQmz0dyIcXi6AlOtz3KP5NoZE34gMsb
 cK4Fn/tv9D1BoJZ06E+IrceK1fIQ2VikbtDED2HWtIKZsiw6x9jEM052VVwRJjNjhv
 sczEgUecepe+Pt+9WPR/HRTxykvLPgM6kt/RhTvLqT4CrjlV0tYnGpF/tmdXxogL6/
 CPWeUZw+MuQ8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=VBnZwGAl
Subject: [Buildroot] [PATCH 1/1] package/apr-util: needs engine support when
 build with libopenssl
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

Buildroot commit 623d3bbe43e9193aa8e3395367d01af59071b859 disables
engine support when BR2_PACKAGE_LIBOPENSSL_ENGINES is not set.

Fixes:
http://autobuild.buildroot.net/results/e472618ca9ff4a3cf460f607a8dfa317832ca622/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apr-util/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index c1a967bdec..f7c119db48 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_APR_UTIL
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  The utility library for the apache runtime project
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
