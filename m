Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CD7C3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 18:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63AFF4F020;
	Thu, 27 Mar 2025 18:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsFUF7EjeKD2; Thu, 27 Mar 2025 18:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7702A4F028
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7702A4F028;
	Thu, 27 Mar 2025 18:28:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84A341B7
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 621C34F01F
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zs9RooDFE0-l for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 18:28:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 179394F01D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 179394F01D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 179394F01D
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 18:28:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6caaa.dip0.t-ipconnect.de [79.214.202.170])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84C8FA4C027A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 19:28:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40580)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1txrxY-000000007Q8-3hRS
 for buildroot@buildroot.org; Thu, 27 Mar 2025 18:28:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Mar 2025 19:28:08 +0100
Message-Id: <20250327182808.944041-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1743100089;
 bh=GPI1ibCwTMOqeAd5U1wvaHF9dRyblrLpCy2dhj1zpq0=;
 h=From:To:Subject:Date:From;
 b=lTZsPVSzGja9PtZ4ws4/rCVjuvh8XzAfSDFfdrEOwySTtkXXMaDbbPLkZbENnEVRb
 adVLP9LmWEth4d2zJoAGaqpBwl3DoTYVnukgW4a4epKaJ9MVQAUssHTdn2r+fK8k0a
 uRO/sbz/aGdugHEl+LHYeeE6aUNgJtz9RS0tRaOItzg5oQfZbO18pkyNNfwotYtLYs
 nrJCuy3EbgykiKj6BYHf8A6QkQSnSHDO9lUTay61ZsRSM/WFfurnpaGV/qWGt8WWUh
 S5GQhp13kiHPN4Z/2PgeHdLohz/9OwY91cGPSofdCEaGVFC8JRx/v8yD+Q5ZB0Resh
 qO4u44AHHe/PQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=lTZsPVSz
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.16
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
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/stable-release-0-4-8-16/18062

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index d2e3cc533d..34c7c0f097 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.15.tar.gz.sha256sum
-sha256  5d5d99e21992c4c71af1afcef16c70f4c5e7ee021633ac138b2a2761be75064b  tor-0.4.8.15.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.16.tar.gz.sha256sum
+sha256  6540dd377a120fb8e7d27530aa3b7ff72a0fa5b4f670fe1d64c987c1cfd390cb  tor-0.4.8.16.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index e8e769bdef..5f376d136f 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.15
+TOR_VERSION = 0.4.8.16
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
