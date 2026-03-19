Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF2B1090220
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 12:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E34D4841EE;
	Thu, 19 Mar 2026 12:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgN6HDxCVQcb; Thu, 19 Mar 2026 12:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD6CD841D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773924197;
	bh=1SrtHX0CcS1R+CcRu4tRQW/XtVLX5uasFr4bytxxElE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UDTxjdD3zWGfMO5DP7j7U2EayITq0/Hj/1gyB3W4CU7aRd+hsweNo20nqIbHY46ao
	 hATmHWNBtRwDMMl7K/W1V7fvwUT+RWkdl0cMLin/8G0n1uWHckXg6TMHL34DrwamFx
	 yitJxRHrBI/tOvc2tce/vUvop6Sb8q03c6WM4sGOZkJJ+1T6CpYLB6bbXNMeonsGgH
	 nn2M2wDtaep2Au5DWXXB9tr6oU3BG1IxwBMmTlNf09oCkisZuAT4t72d4Rca777UtD
	 YWWIvE3S7OPUcHrGH3rpi8/ROUlvJ9hgzn04/abONiOgpVYc3GlY4vZp6JBB8xo/zi
	 NbOxYEQg6Du0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD6CD841D8;
	Thu, 19 Mar 2026 12:43:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6BE11BD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E476A841CB
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWZhnhMQQmkw for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 12:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.144;
 helo=esa1.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC057841BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC057841BC
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com
 [23.90.104.144])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC057841BC
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:10 +0000 (UTC)
X-CSE-ConnectionGUID: rNxwcGOmTD2Brth11jWCtg==
X-CSE-MsgGUID: etiwXM6TRB+XD3UUEj8orQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
 by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:43:08 +0200
X-CSE-ConnectionGUID: 9YqRDqc7T2GmTniZZypzQw==
X-CSE-MsgGUID: JW5w5oLVTf+tKfwwDg075w==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.3])
 by ces03_data.me-corp.lan with SMTP; 19 Mar 2026 14:46:11 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Thu, 19 Mar 2026 14:43:07 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com, Quentin Schulz <quentin.schulz@cherry.de>,
 Bernd Kuhls <bernd@kuhls.net>, Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Thu, 19 Mar 2026 14:42:40 +0200
Message-ID: <20260319124247.2973165-3-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
 <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773924190; x=1805460190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EIYOB9LM+giAJ8eXj5PkkmcqFomB4pGEw+vEcmxlX90=;
 b=r7p9NQpkGbh9N6qN+Hm7Jy+QNuCTMxIqyJkIcGS90y5cGx7zcJnABlJa
 Q4Dk8sv06Msyk8JOHaUONdm57srfHVXPPTcFsQkdHbMk35En9PHFkEo2t
 YHCf5Kt+AhXO6v8bsnRbc36I1ckQMz8/druEw+9hmM0uyXHzcqoMj9an7
 XYn0k3mcO9yb0hbe6ZY5SurizNC4wIszcqkrpd36h7aSph5184zZONRH5
 8jKtp98FyFox7DSEbJCPpORDg5Ldl/DBtPrIGiVx0GpXiwEbQxp5X5XBb
 gY4JmCZd2PwwmOGK8MRz4GKqwTrRKvEFYn0tGcZCqGi+wqLZa8QzuINuG
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 2025.02.x v2] package/libopenssl: security bump
 version to 3.5.1
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Fixes CVE-2025-4575:
https://github.com/openssl/openssl/releases/tag/openssl-3.5.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e97ca416c61e912d98b9d3439674cb40510cf160)
Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
Changes v1 -> v2:
  - cover letter added
  - patch prefix corrected from [PATCH] to [PATCH 2025.02.x]

 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 9f8b23005a..1675d72fb2 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz.sha256
-sha256  344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0  openssl-3.5.0.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.1/openssl-3.5.1.tar.gz.sha256
+sha256  529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f  openssl-3.5.1.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 5e785e1bf0..f3521b3cf3 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.0
+LIBOPENSSL_VERSION = 3.5.1
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
