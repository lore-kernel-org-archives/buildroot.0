Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A6FC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 19:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AE1D83E38;
	Sat, 13 Aug 2022 19:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AE1D83E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nc6Nzmrbz9_Z; Sat, 13 Aug 2022 19:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9692082C04;
	Sat, 13 Aug 2022 19:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9692082C04
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73A991BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 19:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D14841696
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 19:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D14841696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHkpn0WOYUMo for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 19:41:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE1941687
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBE1941687
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 19:41:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l4so4551567wrm.13
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 12:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=3VYmPcNOJXqjYBSzKpBc79SRckvshJGGZCa4+me87WE=;
 b=MhiGFsom4h2nRP28nC0usa1gQIqDyYzMjLhIraqdXV/Hs1toU9aJVHbPdqqhR4eh5d
 Nmp2GHQMw5/VU/Cp7xzoAvsCG0znl2dZZqumYwcluPIFpqkXbP8t2n/TMBn9UAWuff4g
 O5Kn9PYWNwXOxqVjj21k+yZG2Im1zYtphdZlzl1Jd4Tq/VTsHyMa6GtlrDBlxK8VZp5L
 NCMCwRnOy4/RzGGJ4odi9nXZRlUwqlLHvfScsRWCTOgBcRNO1PA26qvAC/0Vy4Uu5jIo
 MY2TLuzKQTcXGKWsSR7RYI9Bs5Ay7uLJ6xEPlXSfuGaqdFhxjvVwQlKBWUbi42pEwBlD
 iwTQ==
X-Gm-Message-State: ACgBeo10MRP+vJUP/FoWBHx1ZlzIvsDpA00j+4YbagjoWgc40Ipf+rLj
 Hg8OK54ChemwOowDaL7wHNo1jReqs6U=
X-Google-Smtp-Source: AA6agR5Yo6Ubv+/uE6HHAtpJfjZbzj7DQOWiNAbEVhf5FmDT+x6CXSODv/UcWyzhx9WgkeQMT7GbfQ==
X-Received: by 2002:a05:6000:18a1:b0:222:c477:e919 with SMTP id
 b1-20020a05600018a100b00222c477e919mr4942578wri.301.1660419711440; 
 Sat, 13 Aug 2022 12:41:51 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00f2efd4a33b7d07e8.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:f2ef:d4a3:3b7d:7e8])
 by smtp.gmail.com with ESMTPSA id
 ay3-20020a05600c1e0300b003a5537bb2besm3873112wmb.25.2022.08.13.12.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 12:41:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 21:41:42 +0200
Message-Id: <20220813194142.2389181-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=3VYmPcNOJXqjYBSzKpBc79SRckvshJGGZCa4+me87WE=;
 b=H+3PxDaCwDsPRIGUZ2WXODLm19tibax2lVVlSisEyVBVSvIVuFFlxuy+awDkX0jVxO
 61NWrP+xV3jK/sG9viwmyGMKfDX+L0GvIOb+5kttnebbl/d2rsDf2e9ojn6FuIhofs9u
 Y+MCqTyXUlghE4x8sPPawCheJnyBAwN/ORSjNdHTilU63QiIz72YC6+DNUOVxRK8WgZG
 NB8uuqmLoyF/yjOHcfNtI4McFczLqzynPUQSX/LPZalzNCsGvRrSLxOa+J6ZXemj/QbM
 j/GIGYYhUgcVQbYLn/54/aj+dkarI8P4obBhXd2wGAjab8fpBtmxGWJ1mkEbltfK0jWe
 FrMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H+3PxDaC
Subject: [Buildroot] [PATCH 1/1] package/domoticz: needs minizip-zlib
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit fdd6fe927b8f2d99dbd0a5f5c58b92430d20e1be wrongly added minizip
dependency instead of minizip-zlib

Makefile:575: *** minizip is in the dependency chain of domoticz that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/c51bed081b9ef9ecca809810cb41e1474d8fd9ef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index f21c52d432..bc4a2def41 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -17,7 +17,7 @@ DOMOTICZ_DEPENDENCIES = \
 	jsoncpp \
 	libcurl \
 	lua \
-	minizip \
+	minizip-zlib \
 	mosquitto \
 	openssl \
 	sqlite \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
