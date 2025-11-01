Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF96ACCF9F0
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 08:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99A674221E;
	Sat,  1 Nov 2025 08:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4WN_A4ZJgAq; Sat,  1 Nov 2025 08:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B975F4220D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B975F4220D;
	Sat,  1 Nov 2025 08:02:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3A43964
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5A0D40EE4
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uIxPPkRm8co for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 08:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EA41406BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA41406BD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EA41406BD
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 08:02:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b624.dip0.t-ipconnect.de [84.161.182.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1ECE0A4C5CDF;
 Sat,  1 Nov 2025 09:02:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vF6ZJ-000000008BB-0Voj;
 Sat, 01 Nov 2025 08:02:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sat,  1 Nov 2025 09:02:35 +0100
Message-ID: <20251101080236.305350-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761984157;
 bh=T3QjatBejlfqvMilv9UHLv5mfjFrSQUNegYMUdYA/mQ=;
 h=From:To:Cc:Subject:Date:From;
 b=1P9ER4W9jhTAGRm8BqBQH3+eIwCE3DSCLRmhVy8LjMfiktKdBp4Df7im78gfgzccN
 CnNNqt9cUhe3U2nc0AcM2epgHeG4MaXJkWlv5mT8NIJyFgnynSwhkO7qTaFB70nwDU
 XkBDOk7s83I3yA5Trsd3DUpij8WkNjhv1b3IZsqM/TQx7X06SQsBa2Nm1Qio1ibWbE
 PFJ/v/ssEmpfIWCXU6+JGYtSPhMkfkTb6nKJ7PXxtc/qhmUtB61/PobrfQO0sE38xq
 InakdlA8WGkL45+pXY2teOqLOUci7o6t5jXnondrOnuU3PDwCIo6WrfqnZQr6LkcCd
 3rQHrZcy4DfyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=1P9ER4W9
Subject: [Buildroot] [PATCH 1/2] package/snmppp: bump to version 3.6.3
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

Changelog: https://www.agentpp.com//download/changes_snmp++v3.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/snmppp/snmppp.hash | 2 +-
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index b66056ef40..e81bd8886f 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  034553f7cb75d7ce1fe70cb3ba06e88587b6bca4fa062d10344ce4555a1395f7  snmp++-3.5.1.tar.gz
+sha256  52c038426d6e13d627832aadb905549ee32b5ca4b707ac446bedac05abdfd1bf  snmp++-3.6.3.tar.gz
 sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 966bb340fd..9a84d74f95 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.5.1
+SNMPPP_VERSION = 3.6.3
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
