Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0C1C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 14:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28693810E5;
	Fri, 17 Jul 2026 14:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBgQXl5aj_gx; Fri, 17 Jul 2026 14:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8FCF810CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784298337;
	bh=0u13VqhLBZiolFG6tHpjM8NhunIBdngNEQBnGBTAIwg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=isWIhtbIs8m7/qr6UtS3IGKRPrPxNF6Cls1mJExttstntuLqV9Lp0q7iHAuPd4/uJ
	 HXRrie8vECdd/ZTO7YeM4QBcoOMY3SDeu6eXQrosueOSyzzitFCd8H5nTmD37k2UrB
	 C9nXGmRq3zdyPm4NMGabYK0pdjN3R6n9ai/jxvOODOuegLU8ISTAU2zHBkqphMeBmr
	 u1QhtrGBsVews6J9dfbvg7Ad/SNkuisa9qVhR/Xiv1E5XjAZeFsnE3lnuXxUxv3f1y
	 CudpVBZ9tOFZ4vdjGMBJ6FoVfR2rtRVmWSRVgB302x4ypdVlq8s+LadF0/4N0NiH0P
	 pX+K9SuKCwJGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8FCF810CA;
	Fri, 17 Jul 2026 14:25:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B002320
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 14:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3112B6065E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 14:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WjZo5bCq2FB for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 14:25:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BEF1560678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEF1560678
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEF1560678
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 14:25:33 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5b15d5e986eso1477125e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 07:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784298331; x=1784903131;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6QzWOsE0GUmtgyGuzWjRqlEAy0U+W5cWuCvjnVTysr4=;
 b=Aj6xmju3KoxFbgQIYeU6TDTwaEdVWnXKiMzpB3/cS5p+BChY3ZmIWcLloFXz/s5xlT
 hhSutB6/dKyk3uzW6Nqp3gRhpbRLca1g//EhGhtJn8Wcay/2Okj0f9qJ2JFaH4JIV1Q0
 No6OX3G+iOgI2XKoahnh+9sm+KMo+UvxrFP662/aSMJXay/PZqyUzt3MiVgWYtAPZPST
 /82tehcTKf7aSb4WO5DxQU/s9T85QgEi/2ji0LDgJIfIrkZ+K6D0vNS0H9jL+hs5cUy4
 nMnAFAUx89Wrm700DlpWoJxcydLsp6+MR4KSVfB8tYHfn0ZUXmhr7L5x9rY+KgezOXYY
 /tZA==
X-Gm-Message-State: AOJu0YyGsq2LGAMzWuWr+zd/pVaRTeo87OFBeqjUv5YBzV2tefi7474n
 Mk6rqdOhR2SrbdAESakIMyMhrgonOxOmmCCes9bMyl0acWyiYQQkyZ9qs47w1w==
X-Gm-Gg: AfdE7cmipIp2xsNbcTMjsnGMKqr7ShDEYQSF2WZfJvte6oZmobBV8J9uTdCJSDiPH17
 DSs8wnQeAyxiQT4cXu2Cd4RRoCYx+JK6vFz8T/7YIycDot2vFWs1OgnRa8nAGMS8San4rVnSSnj
 ZzS/GlVLEnpaCJER3mSvs4Tv1fZrOBTCqKZuklM9CyEifuhTHodWDy71UHsreMj24050PgNGoe/
 XH+7JU/0vz9iLLrBNfyP6fnf2xW9IHLXTWKpy+9HoYjnUz2zLxDhf0jtnymmndRvT1AeM6sixTQ
 gXpJ0ZKlOOh1xCYS5AAAtIzn2idr++jpzd9+Y4skwkEMaSf4ZsM1mvW6cuYnkxuCBD52Y2dTBee
 EkeTCDl1INuCTTgOuwdr0AqDBJv4sIumjrpKLUKKryG4+eFs36+gYcoOqBRF3FzxJeuL4qapICu
 1eyEXOw2CV2RiSWh/3XdK2igJkB9bmNWBNWGnQhBSj
X-Received: by 2002:a05:6512:65d7:b0:5b0:1139:71e5 with SMTP id
 2adb3069b0e04-5b28f873305mr404105e87.2.1784298331014; 
 Fri, 17 Jul 2026 07:25:31 -0700 (PDT)
Received: from gimli.addiva.ad (h-158-174-22-6.NA.cust.bahnhof.se.
 [158.174.22.6]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b291e0ea1dsm361762e87.43.2026.07.17.07.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 07:25:30 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 17 Jul 2026 16:25:26 +0200
Message-ID: <20260717142528.2709557-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784298331; x=1784903131; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6QzWOsE0GUmtgyGuzWjRqlEAy0U+W5cWuCvjnVTysr4=;
 b=giUzTGM/O7AfBnPMfA5L1F8lbi/ol6DbZKjH7KukfFHTJG693bSnXJJwhTVh6qDTf4
 b0IWCQV591HIF71d/1De+H7Tx1zXCbQn3K4PwOpBWMc7rPWcj6VWAL4jOmkPsC3xr8vq
 sqgRGfuNGWrGEmI66thKRzi6kMXo458vqZXoF/bAWSLDPrV0gAiwtWCww1bR1cA89yd3
 IOzWqcMlzIK7/6eXMXD4AZNr6DOnftBqZMrP0FwyXXSOZESClsAjrWxH66pt2ePwIyoj
 X29rqsKLNTATbllO0kVNtHh6kH+DuL502PMBML8woeuIdwllSLVxGoz3BR6mbLL/a8Zj
 /uBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=giUzTGM/
Subject: [Buildroot] [PATCH 1/3] package/mdnsd: bump to v1.1
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

This is a major update of mdnsd, for the full release notes see
https://github.com/troglobit/mdnsd/releases/tag/v1.0 and
https://github.com/troglobit/mdnsd/releases/tag/v1.1

- Update package description to match mdnsd v1.x capabilities
- LICENSE hash change due to update of copyright years

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mdnsd/Config.in  | 23 +++++++++++------------
 package/mdnsd/mdnsd.hash |  4 ++--
 package/mdnsd/mdnsd.mk   |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/package/mdnsd/Config.in b/package/mdnsd/Config.in
index c83c090595..f0d3652e1c 100644
--- a/package/mdnsd/Config.in
+++ b/package/mdnsd/Config.in
@@ -3,16 +3,15 @@ config BR2_PACKAGE_MDNSD
 	depends on BR2_USE_MMU # fork()
 	help
 	  Small mDNS-SD daemon for advertising services and device
-	  discovery, similar to Avahi and Bonjour.
+	  discovery, similar to Avahi and Bonjour, at fraction of
+	  the size, ~90 kB.
 
-	  By default, mdnsd runs on all interfaces that support
-	  multicast.  It reads services to announce from
-	  /etc/mdns.d/*.service, a few common services are included
-	  below.  To override the defaults, e.g., path to services,
-	  TTL of multicast frames, or the default interface, set
-	  MDNSD_ARGS in /etc/default/mdnsd
-
-	  Note: currently no NSS integration with GLIBC.
+	  By default, mdnsd acts as a responder on all interfaces
+	  that support multicast.  It works with both IPv4 & IPv6,
+	  advertising services from /etc/mdns.d/*.service (common
+	  services included below).  To override defaults, e.g.,
+	  path to services, TTL of multicast frames, hostname, or
+	  default interface, set MDNSD_ARGS in /etc/default/mdnsd
 
 	  https://github.com/troglobit/mdnsd
 
@@ -22,9 +21,9 @@ config BR2_PACKAGE_MDNSD_MQUERY
 	bool "mquery"
 	help
 	  Scan a LAN for mDNS capable devices, or query specific
-	  records, similar to the mdns-scan tool.  Useful for
-	  verifying multicast connectivity or locating neighbors with
-	  link-local address.
+	  records, similar to the mdns-scan and avahi-browse tools.
+	  Useful for verifying multicast connectivity or locating
+	  neighbors with link-local address.
 
 comment "Services to advertise"
 
diff --git a/package/mdnsd/mdnsd.hash b/package/mdnsd/mdnsd.hash
index 6ab0676702..024dc87cc1 100644
--- a/package/mdnsd/mdnsd.hash
+++ b/package/mdnsd/mdnsd.hash
@@ -1,5 +1,5 @@
 # Upstream sha256 from GitHub
-sha256  1af8742ab82a0af88d99d0b15508358ad4305879ab039631bea889138f5c87e8  mdnsd-0.12.tar.gz
+sha256  b3f242415b2f29c510e709c862126ecab09d77e8dc1eecf1aefef879bce29003  mdnsd-1.1.tar.gz
 
 # Locally computed
-sha256  2969546227b58ce1b431cc4c36c9a9b45d604e6b94fb8b787ea5d3696f3eee3b  LICENSE
+sha256  89a722240ac1fdc0366696eaa5469968397ae274a0003e09a88d0686eeb3cd3e  LICENSE
diff --git a/package/mdnsd/mdnsd.mk b/package/mdnsd/mdnsd.mk
index f5a5fb93fb..c938890508 100644
--- a/package/mdnsd/mdnsd.mk
+++ b/package/mdnsd/mdnsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDNSD_VERSION = 0.12
+MDNSD_VERSION = 1.1
 MDNSD_SITE = https://github.com/troglobit/mdnsd/releases/download/v$(MDNSD_VERSION)
 MDNSD_LICENSE = BSD-3-Clause
 MDNSD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
