Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB587C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A691410D5;
	Wed,  8 Feb 2023 15:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A691410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qWYbfH7VrFtQ; Wed,  8 Feb 2023 15:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37F11409A7;
	Wed,  8 Feb 2023 15:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F11409A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D03611BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB43C40C20
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB43C40C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3oPlrXD0gns for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:57:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C6EF40BAA
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C6EF40BAA
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:57:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r2so17240494wrv.7
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 07:57:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EIlgBZcnSFohOe2GNQZaZheSGlMIroMbJjJRVrIZun8=;
 b=pO3C6H5KqFQvT5hemooZJ7aexN3wvYchaxJ+6j7fxNGd1T65uXalI1Pv+q/IW/7Cel
 FaCbJXEnsbzTct5ZW7WooNY+5dYo4U9Gw0l1USkR24PFFjOgeb8Qboko4ERlHZob7EUz
 UTl+sJLOeYtsd+MzAqUcY6YucVBHzEGSVmjMXbzbpzk01inNsgkhIzJ+UOWlRSNY67lQ
 spOwYPTiuyiLwOIewSlf1TOJE/Wzz+KIzU4iIFrSFSmx+YIygmQc3R0sxfrtYsucYpuT
 b2g+jNHNJiEQZ7+T9VbccjbM/OKESqg/h1padFMT1ypCUsiMXkjFKNERP05JD9ZNI8/I
 pixg==
X-Gm-Message-State: AO0yUKUTgA0+RS7S7wo6D6w3hC/n4psePC0cIiwi2U3tJXD50pLav2sm
 TAfAMqj0ZLBtGoUxtWCYy0zDUs0jSzWMMhbxYP2C6wC0
X-Google-Smtp-Source: AK7set+xi0Rcrw0bwj930wlvBLlJ7jTmOrP5V//cIh6QOVQgoWZ3/R1faWfytjo02GtlnGkZdfGuVw==
X-Received: by 2002:a5d:4a4e:0:b0:2c3:dbb0:7260 with SMTP id
 v14-20020a5d4a4e000000b002c3dbb07260mr8516858wrs.71.1675871877158; 
 Wed, 08 Feb 2023 07:57:57 -0800 (PST)
Received: from wintermute.. (77.109.114.132.adsl.dyn.edpnet.net.
 [77.109.114.132]) by smtp.gmail.com with ESMTPSA id
 p27-20020a1c545b000000b003daf681d05dsm2469043wmi.26.2023.02.08.07.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 07:57:56 -0800 (PST)
From: Frank Vanbever <frank.vanbever@mind.be>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 16:57:51 +0100
Message-Id: <20230208155752.73981-1-frank.vanbever@mind.be>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EIlgBZcnSFohOe2GNQZaZheSGlMIroMbJjJRVrIZun8=;
 b=gsdzBAd8NdTvSTJNcL0ApL17v324C76/uF3DvZ/CZYr16ViewFrkSrt3o+txbdMk3B
 bihiHQNSXskNACI1FndGzT0o2Mvqp+wy7ZyZuwU5U+sZ/qkDb1f5/9q1FymH6kZfx7Yk
 MJjJDI3L0rkGBupHqr1zqVi37Nw9KqXmqp2TUYBdBgYDZ2koWxAa+8SSMAo97pOGIzw+
 E8GaUCJ4zdWpBj072X4AbvVE5XD5ZwSYnLxxdpPwQuo8rPGYc6cRWent0b1s79zD6J0v
 WN+97uGKDEdd8eZjcfIyGorIFYOBpii0BAXEk8apf4MJ26fPzzxHiaMTptuZceNTzIq5
 3XkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gsdzBAd8
Subject: [Buildroot] [PATCH 1/2] package/nginx-modsecurity: bump to version
 1.0.3
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
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
---
 package/nginx-modsecurity/nginx-modsecurity.hash | 4 ++--
 package/nginx-modsecurity/nginx-modsecurity.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx-modsecurity/nginx-modsecurity.hash b/package/nginx-modsecurity/nginx-modsecurity.hash
index fbaf1ca239..0cd2ee07cd 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.hash
+++ b/package/nginx-modsecurity/nginx-modsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.2/modsecurity-nginx-v1.0.2.tar.gz.sha256
-sha256  41a6660c50508c60df59f8f09c444d18ef8112a4c118cdc791a3992390b78c32  modsecurity-nginx-v1.0.2.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.3/modsecurity-nginx-v1.0.3.tar.gz.sha256
+sha256  ae811c7208ac029cb7a99d6f63e03d3971797607517187f47620df39c1f78add  modsecurity-nginx-v1.0.3.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nginx-modsecurity/nginx-modsecurity.mk b/package/nginx-modsecurity/nginx-modsecurity.mk
index 90ef8ecd51..a00c200469 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.mk
+++ b/package/nginx-modsecurity/nginx-modsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_MODSECURITY_VERSION = 1.0.2
+NGINX_MODSECURITY_VERSION = 1.0.3
 NGINX_MODSECURITY_SOURCE = modsecurity-nginx-v$(NGINX_MODSECURITY_VERSION).tar.gz
 NGINX_MODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v$(NGINX_MODSECURITY_VERSION)
 NGINX_MODSECURITY_LICENSE = Apache-2.0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
