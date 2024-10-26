Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BE9D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF124033D;
	Sat, 26 Oct 2024 20:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oX5A_s8D5T2j; Sat, 26 Oct 2024 20:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29DE1402AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29DE1402AC;
	Sat, 26 Oct 2024 20:59:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 864505C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7499F40216
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOn8eCc5B8UD for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:59:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13C1B402AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13C1B402AC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13C1B402AC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:59:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 23E57A4C0CE0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:59:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43288)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4nsx-000000004el-1sGa
 for buildroot@buildroot.org; Sat, 26 Oct 2024 20:59:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 22:59:47 +0200
Message-Id: <20241026205947.2664708-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976388;
 bh=7xpKEieaM3vEUcPTt9xU0XgrRx8fZHe+WXNJHbHm4WE=;
 h=From:To:Subject:Date:From;
 b=QPfNuMRJ2rk/00jt4cb4T8qNMzUb0dqM4/yL9LLPZpNoM1zTLEquE/WKaIL+1GHX6
 pIj2x6JTYBDlvJtQMtCu+7MqHepNvQTlwB0zp+ZKwpp+dJ4WnlFu5yp1BKtaF8aJTc
 SYhE9VhMjBjy2+csaAa30MMczQE9JIOrib1NEOFF+mhTH037iLqREYlpsW3RX/nFvR
 pH4EiT2WeTP8hUMN11r6eQMGf91JxhWZ+g5kFPm5OD5OoZme1zR1QWsvBIfa+fTQdB
 xwaEXnYxpErIPw791gcnM6xjYPRSdnJzzB16o1uH2TxdXtsn/nOiGKs+/ufK0xubj9
 Z/sia4c1KGMeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=QPfNuMRJ
Subject: [Buildroot] [PATCH 1/1] package/libldns: bump to version 1.8.4
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

Switched _SITE to https.

Changelog: https://github.com/NLnetLabs/ldns/blob/1.8.4/Changelog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libldns/libldns.hash | 8 ++++----
 package/libldns/libldns.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index ff86ae348e..ffdfbedc13 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -1,7 +1,7 @@
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.3.tar.gz.sha1
-sha1  2796cc49636f68260c9662b60d5a7c9e6eed195c  ldns-1.8.3.tar.gz
-# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.3.tar.gz.sha256
-sha256  c3f72dd1036b2907e3a56e6acf9dfb2e551256b3c1bbd9787942deeeb70e7860  ldns-1.8.3.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.4-rc.1.tar.gz.sha1
+sha1  43d013b904e6df5ac5e28001cdc91bef537f3f6f  ldns-1.8.4.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.4.tar.gz.sha256
+sha256  838b907594baaff1cd767e95466a7745998ae64bc74be038dccc62e2de2e4247  ldns-1.8.4.tar.gz
 
 # Hash for license file:
 sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index d6af6a2b97..0740d09fab 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBLDNS_VERSION = 1.8.3
+LIBLDNS_VERSION = 1.8.4
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
-LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
+LIBLDNS_SITE = https://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
 LIBLDNS_LICENSE_FILES = LICENSE
 LIBLDNS_CPE_ID_VENDOR = nlnetlabs
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
