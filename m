Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5828ACA0EC0
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 08:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 188CA81EB8;
	Mon, 11 Aug 2025 08:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvC0_Vz3lEic; Mon, 11 Aug 2025 08:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 416EB81F1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 416EB81F1F;
	Mon, 11 Aug 2025 08:19:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FE54154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71B0781EB8
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Lmo8PAeDO3r for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 08:19:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8544581E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8544581E44
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8544581E44
 for <buildroot@busybox.net>; Mon, 11 Aug 2025 08:19:42 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a0dc77a15so1155315e9.2
 for <buildroot@busybox.net>; Mon, 11 Aug 2025 01:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754900380; x=1755505180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FGMbbakjEJcsz7MWutm/qWkXUbxcggHo4nIPMP5kmhk=;
 b=NpXCczwGkKeU+n1VbHX4SpZ+uu3U82uNMpNZUoFCzFKJTnFxp94IcYGGHcaV5MfEi3
 xBuXGCl43yNpxFUtQma1x8cu/pCp21YyCGomLIN0sgXSJyRrgKsZtRc7IorVQgJ0qygu
 me06vXMImX7RlFY8KINDIy2CWhRuUf+0eZDaltZ1EjL/5CIhp5Hu4XXTNLEv/EUYMrT5
 14CFZWkrkzVFC+MWzvnsrL3gfGA7z2I3HVMdC/sDJmpygqCnFdW7NoWQOTNqWLV04KRU
 46S+ZhBC1dG5E9DtA3+rtIqBkpb32fLH/PN9U4XB1aVKZaOkclV7LhsF6LjRLfnrWimV
 TO2g==
X-Gm-Message-State: AOJu0YzenYlMIe/Zg7KtkQYynqOKp1X6t98nM2b0o31UdtzcIQLET6aX
 VGB8n3D3FiwrqefWs5MvBRGNVS9CrAbS2epLvuPmXlzzpkcQngXVlqZnrwQwJBAjTkfqHUQ8q1N
 z1sTADA==
X-Gm-Gg: ASbGnctsDJN9k60UWQEFdr5VhSoLb73aziHdKy803YdMXt9mZhBA+E+kB4gTld2Qcmp
 x2SESSs46/pfQIf4YnJAvg74WQGUX8kqseg19+pVAVX4bur/lswuGbATmOFGltFLcdPuchHtjap
 qAXi3t2LNUbn8w6PaKmZd9wBschDGuFBa8cJ0bSdHRdGKiFKlWaXkv7RIc5xs7Q6BNgVYafKmGe
 Fo9/x8uwKyCh/jqp8d4aHAOZbQsBbcC7rvdFrTW1IIbUIL/aY8pNSLXxLFKuJ2gynrdCtSKq7YO
 tWQJ/IpucxSzMkZrRRcr6AU4d/L/wHFInRZXRysI34saL/cEq7hTP6VRG/RXBzRSDzVxQjjjVLB
 dNZo1bL8KGgdf96aX7jAOKQVnfrRL4U5BWWq/eOPmKzONS6CSLLXV2DyD
X-Google-Smtp-Source: AGHT+IEBmKTlyZifa0Q3spGowemGRzYjm50JqiuidTXuuBHoFpvGkcCKpgCke33A34iQzPNOiMQI5A==
X-Received: by 2002:a05:600c:c0d2:10b0:459:ea5d:418b with SMTP id
 5b1f17b1804b1-459f4eb3fcemr64649005e9.9.1754900380012; 
 Mon, 11 Aug 2025 01:19:40 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5869cccsm265982975e9.17.2025.08.11.01.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 01:19:39 -0700 (PDT)
To: buildroot@busybox.net
Date: Mon, 11 Aug 2025 10:19:32 +0200
Message-ID: <20250811081933.2353281-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1754900380; x=1755505180; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FGMbbakjEJcsz7MWutm/qWkXUbxcggHo4nIPMP5kmhk=;
 b=ORS0Cl2O2nX3pNXbmb5xztzqNzYsOcMv9WtFt8AhR2GzwlIq5Ql8kdM7PqPQbrul/n
 o3re6yHhB3zTK2MIZMRYg5SHldCPvaRwm33G9PBcEAmO2hlUtU8oKSmREI4eyGQtwYQI
 +s4WU1fPPmPme5BSeadXtWmvHzIrWwi5EYzl6tpVrrGtQTbhfOdX2lyds4MelyLQLo+Y
 yoPI1IyPVAtBr1faCkfxBX7EUqSr1S54/stliA9OQP7bkJbImV5ovEOcclSDJRIDQfWb
 ZubETE7ygbT6H0Yk4LPQ3Eew4aFb2BGjyl9LK1IoP9JtGTwjakfz7XgXP1VMW9cSn0LK
 UpWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=ORS0Cl2O
Subject: [Buildroot] [PATCH] package/lynis: bump to version 3.1.5
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lynis/lynis.hash | 2 +-
 package/lynis/lynis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lynis/lynis.hash b/package/lynis/lynis.hash
index 1027fb21a..3e387e2c0 100644
--- a/package/lynis/lynis.hash
+++ b/package/lynis/lynis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9932147acafb1c5e13289a8bd46e8d330d4a97473da30ec04650ad019e497cd0  lynis-3.1.3.tar.gz
+sha256  02e16e452a926b6dbae5bfc28b0592d42c8af24c572180f444ac865e0e4f4bce  lynis-3.1.5.tar.gz
 sha256  57151f0fa287550534af08facb1c6693ca803ffa65b512da38b55c3130810bcf  LICENSE
diff --git a/package/lynis/lynis.mk b/package/lynis/lynis.mk
index 13a883bd5..d6b3371e6 100644
--- a/package/lynis/lynis.mk
+++ b/package/lynis/lynis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LYNIS_VERSION = 3.1.3
+LYNIS_VERSION = 3.1.5
 LYNIS_SITE = $(call github,CISOfy,lynis,$(LYNIS_VERSION))
 LYNIS_LICENSE = GPL-3.0
 LYNIS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
