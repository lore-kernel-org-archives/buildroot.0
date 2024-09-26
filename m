Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43121CCFA07
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 06:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D050C410AF;
	Thu, 26 Sep 2024 06:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSONwkwwVTqD; Thu, 26 Sep 2024 06:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F25E410A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F25E410A1;
	Thu, 26 Sep 2024 06:15:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 787DA1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 06:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73A2042718
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 06:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Os_bVflWHsFR for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 06:15:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FFA342717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FFA342717
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FFA342717
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 06:15:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf66.dip0.t-ipconnect.de [84.161.191.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9A6C8A4C2307
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 08:15:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48428)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sthmS-000000000Qz-3D4J
 for buildroot@buildroot.org; Thu, 26 Sep 2024 06:15:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 08:15:12 +0200
Message-Id: <20240926061512.13021-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240926061512.13021-1-bernd@kuhls.net>
References: <20240926061512.13021-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1727331313;
 bh=xf7n/IMIfP1NDwI+XeVM1NJuCDT0VIjFw8y3b1K0y84=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Moqgvcj9XY12tSy9clUK3mGBryAF9/s2e+0haVr96nGrP3Hul9zGayN1c1kWfiKWb
 Ibb8KiLwJ2GqFL2SnN46h1kN+q1Aa2eGGQI2dDX8+JENTuK97y1Ap0G3H1Az80zkb6
 tc7dy2pGm0wAssf7MX3dLSWyf8VyJvNS93RLrDp+kyCaprwS3VgwKmgbe9CEo9QjVu
 /lobv3VgMD0nVGFHoWk9CavStBrKK0Mkwr6ug3FhCbGGGdDeJwy3PBttKKHMDIe3kN
 A8lbNUogwRifvUTIDvjwCFEHjd9hylXgvSS9JHAODHFDrcLCb7fbaeJzeaWLmNmaai
 Uldanmwrb/oHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Moqgvcj9
Subject: [Buildroot] [PATCH 2/2] package/libilbc: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libilbc/libilbc.hash | 2 +-
 package/libilbc/libilbc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libilbc/libilbc.hash b/package/libilbc/libilbc.hash
index be88d6f9c3..dbd1795765 100644
--- a/package/libilbc/libilbc.hash
+++ b/package/libilbc/libilbc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe4827a548e96f0549dd8f30eb6a48c6c55fd4535de6c8e9c6e4f38bea6190bf  libilbc-829b08c7902ceb87a261279fabb36b6d523c6e07.tar.gz
+sha256  a09a244e5e24607303478aa9995765d2b26c52b15c2721cae5a83c109ed51ed3  libilbc-51d3cf8e157c3c80d7169b738073865eca83f5a3.tar.gz
 sha256  b7f4cbb4a12cd11a3d1aeda9bd17c99f59b054de4b3ee53045531cd2fa74dd2a  gips_iLBClicense.pdf
diff --git a/package/libilbc/libilbc.mk b/package/libilbc/libilbc.mk
index d8139ba205..089215f204 100644
--- a/package/libilbc/libilbc.mk
+++ b/package/libilbc/libilbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBILBC_VERSION = 829b08c7902ceb87a261279fabb36b6d523c6e07
+LIBILBC_VERSION = 51d3cf8e157c3c80d7169b738073865eca83f5a3
 LIBILBC_SITE = $(call github,freeswitch,libilbc,$(LIBILBC_VERSION))
 LIBILBC_LICENSE = Global IP Sound iLBC Public License v2.0
 LIBILBC_LICENSE_FILES = gips_iLBClicense.pdf
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
