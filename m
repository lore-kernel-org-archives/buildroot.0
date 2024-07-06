Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55588C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 06:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1110E40848;
	Sat,  6 Jul 2024 06:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5yT3bhc2xwq; Sat,  6 Jul 2024 06:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA8724084F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA8724084F;
	Sat,  6 Jul 2024 06:59:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 805961BF28F
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 06:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D50340930
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 06:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaEVnQLvWQ2k for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 06:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E36F140141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E36F140141
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E36F140141
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 06:59:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a063f.dip0.t-ipconnect.de [91.58.6.63])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6883EA4C0BFC
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 08:59:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38146)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sPzO5-000000001Ej-0ZaR
 for buildroot@buildroot.org; Sat, 06 Jul 2024 06:59:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 08:59:13 +0200
Message-Id: <20240706065913.631436-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720249153;
 bh=TH4z9EGsVg32QzSe12K4hJxYYx1LpX+S/9Ho5G9tDQc=;
 h=From:To:Subject:Date:From;
 b=DyOu3tJm24i4Ilczpw2CQwg9MJTs5G3ga8QYljsiJWtWyGjk994aNdjhkTbBtDFs2
 B5Dg5Vt3Eod6M7qqbw53eVopqRoNKEywopHOruKxBHM7hbbfmJ5tCbS3VgMJ99/4AV
 Z6HHNDG3e2EfxvdRy8K6g1LgF9ggCXpTAznvqN+LbgjXAyLwBB7TIP0u9vwc6crmNk
 KxwXZ31gXkANwKr/7E8eS0+B3ZYs496Srnvju+OWFI0R7FNfsEITVf5wJcDa/N/+TN
 CIT+iA+gHVNusjd/fMB4WpvPwWiC10HKW3RKMKOih637ri827oRTQ0Q671QB6XJCdn
 XjBwJFG0XdR8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=DyOu3tJm
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.61
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

Fixes CVE-2024-39884.

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.61

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index bd503d84f9..2ed9c17f9a 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.59.tar.bz2.{sha256,sha512}
-sha256  7b1ec7ec5635da7cb01550513215a90f8b2f52bb7c90cf3e97ede936d3e55b0f  httpd-2.4.60.tar.bz2
-sha512  c1591389f76699beaa5d32b019729e25f1ed5b828311c82b52f1a4edd5d28b73e697958df384d7628b314521a831dbb0af418bc37cdf031cfe133e53c195d8ad  httpd-2.4.60.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.61.tar.bz2.{sha256,sha512}
+sha256  ea8ba86fd95bd594d15e46d25ac5bbda82ae0c9122ad93998cc539c133eaceb6  httpd-2.4.61.tar.bz2
+sha512  00656220ecc2b80788f539536553f0a3a57602fb981be22e63af87d0f98ffe5da3056e722ce52ae8cf9c2111ad1922b3aaea1fd7d69d0ed76795199203d593ff  httpd-2.4.61.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 39ccc3cf96..0319a96815 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.60
+APACHE_VERSION = 2.4.61
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://dlcdn.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
