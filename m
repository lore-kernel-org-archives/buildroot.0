Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04C3C5AD2C
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 13:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BF1180DAE;
	Sun,  9 Aug 2026 13:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COEa51O1Wz5M; Sun,  9 Aug 2026 13:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFC4880DB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786280681;
	bh=JKXvf9JAdLMN170jIVG9SLIt7T0TO1oVnsRbA4TDqIQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WU8AYyBs4mXVxkvyQnEVl4t4VMaYTsVx63jkNOiCPqeHVlO1A2MtuvReCj01HMm8E
	 73TR4kpL3Mx8I1c2sRsqTxE77DrHMQAKmIgQUH/AJL8YigkuUcGgDN4aRY3+ZT9zCv
	 +dAfV07BMaVdzNbytlPLiZB9cZXIYQTq/LB7+xdHdyXiQ0ZUZR6W/h2HSVvaWAGVeZ
	 7xPyYeP7TerU8QDc5uFxmhn02E7OqDCv9antkVIZX+2D9BbDJne03qCC/wFOsF4KY2
	 M/gkaO2JXi8PUON5rPQhAplEO0Cmd+lrbCErg8fIOR+SDcZxxJB8qsvDQc/zrZoh7g
	 RtVXWHL+DTQWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFC4880DB2;
	Sun,  9 Aug 2026 13:04:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8F03296
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 13:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF3F8400D1
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 13:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yL4F4IK5F0vu for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 13:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7B9D400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7B9D400AF
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7B9D400AF
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 13:04:38 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1EDA131E0B0E; Sun, 09 Aug 2026 15:04:36 +0200 (CEST)
Date: Sun, 9 Aug 2026 15:04:36 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <anh65LhHJZT8yMcO@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1786280676; bh=7P+9U2RXABn0456cBV5Cz0lXqx0FC0G8eGhtRchkR4U=;
 h=Date:From:To:Subject:From;
 b=JaQVixmCiRlMZSqEQaIwfBPSZJcMa6jde5Pie4fgJjI0nw4T+9c4/WqmsQMLZjDvP
 MFGvDcyQhg2KhGXlhd8G1+T7TcuKLpQlZVCopPUdNphxZdy/NnDOz/11IGCh9Lkzn6
 JJP1wKrwtnTW4gYkH0twLvHR36JHRPGngtnzDBLWYS38vAJpSKE5iHx7A6capWVn7S
 kpRbKp+MKw/DudS5BQ5Opz3oZ8TtMV9wOFR7Kg5jOXQ/K6Uz3XITwm9ZOhq2ChgX/N
 7iSBrY3PC1Qzg+phWxLHVmJ07a5U8agMdq1WRyQ4GVPfpIbWhuaSwwhC0QzI9Z2BnG
 Gf4uhE9tYkefQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/stunnel: security bump to 5.80
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

Fixes following CVE's:

CVE-2026-70368: Fixed an out-of-bounds memory
access triggered by logging attacker-controlled protocol messages longer
than 1,024 bytes (thanks to AISLE Research and Clemens Lang).

CVE-2026-70367: Fixed a SOCKS server mode bypass of the localhost
destination filter using alternate local-address encodings and
interface-scoped IPv6 destinations (thanks to AISLE Research and Clemens
Lang).

Complete Changelog is here:
https://www.stunnel.org/NEWS.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 572f226861..f966e19f05 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/archive/5.x/stunnel-5.78.tar.gz.sha256
-sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
+# From https://www.stunnel.org/archive/5.x/stunnel-5.80.tar.gz.sha256
+sha256  6d0841d48de07cbbaf4a055919065bf7bb5ebc63cc15c97a2c76caa2bf285513  stunnel-5.80.tar.gz
 # Locally calculated
 sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index ef93dc6073..a8eb652bff 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.78
+STUNNEL_VERSION = 5.80
 STUNNEL_SITE = https://www.stunnel.org/archive/5.x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
