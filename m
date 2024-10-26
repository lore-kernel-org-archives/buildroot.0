Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6C7D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB50A8128E;
	Sat, 26 Oct 2024 21:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7U4_ldIQ2pgF; Sat, 26 Oct 2024 21:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7DFB81290
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7DFB81290;
	Sat, 26 Oct 2024 21:04:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C52BE5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5D2440166
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-kBmilH3vLi for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:04:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EE9B40003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EE9B40003
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EE9B40003
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:04:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 927EFA4C0C85
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 23:04:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40242)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4nx6-000000005IJ-3eSn
 for buildroot@buildroot.org; Sat, 26 Oct 2024 21:04:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 23:04:05 +0200
Message-Id: <20241026210405.2668493-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976645;
 bh=ylWsxEuepj3mlTJJ7fFGBPthqk+bUtof2A3mnfJkywU=;
 h=From:To:Subject:Date:From;
 b=X/RlxKaXZTyQCU7mz/5+W7gL46iPt1JB32AD/SX0+Xo3Si6ievOy7tJMg4vLEMGs2
 SJBS+cp8j3HF8adkTxgBWmBAOW0Vz+FiZbsN3ejonAMbNBkbBrwJ4fl9X3fneDhxC1
 rfa0Xkx0GXxGq5jng2GOnR9Y0SfGZCQQ6/oatEUvwMGTgsejrScZRqcr3fT9wszwwc
 7OqWS79bLJLw3Rv6klA8HdPLTIpc8Wyc7LRl8AAgWuPIu+QwZxCTVxRV5X+Sqp498c
 8u9Skl2oolaky7phy5DlsGgmsVRZ8pBVs/MZGxus3mE6fHBI/Bc1cUQmzfesW68CvZ
 IbxcMQzcWm2hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=X/RlxKaX
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.13
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
https://forum.torproject.org/t/new-tor-stable-release-0-4-8-13/15397

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index bea590b133..eb0ab728d2 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.12.tar.gz.sha256sum
-sha256  ca7cc735d98e3747b58f2f3cc14f804dd789fa0fb333a84dcb6bd70adbb8c874  tor-0.4.8.12.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.13.tar.gz.sha256sum
+sha256  9baf26c387a2820b3942da572146e6eb77c2bc66862af6297cd02a074e6fba28  tor-0.4.8.13.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 4d7fabc79f..042ed75a7b 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.12
+TOR_VERSION = 0.4.8.13
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
