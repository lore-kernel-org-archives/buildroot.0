Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C086C32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E1F640CC7;
	Wed, 28 Sep 2022 21:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E1F640CC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BusvAD_hDDNv; Wed, 28 Sep 2022 21:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C57FF40C6C;
	Wed, 28 Sep 2022 21:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C57FF40C6C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4F091BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACD6240C6C
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACD6240C6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SkWaihkYAZXf for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:36:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99C2B40154
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99C2B40154
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:36:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id cc5so21723999wrb.6
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=cg6/J8xfW5YDXLv6zxni/CUccfbsQtyGwhhzrpu8NYg=;
 b=qzR5entJxgr5ACzEaER2D5AkW0Fo13GUqcv2CmGPfaspebNfF6mVC6IlfcpMhcDk5v
 nv9tWqwtOmi15vZFcEWdoUzScH8AEH/QyhWk9/a7o51t6N6xYeaNUSobiEwc7OSf/vNi
 UcxO6GpkkULvkJeA15+hyvzqQ/S+QDC5vCiasQbZZ+ElNd4xCTVdo52JMzb2ge97Exh+
 ythvhSAwrv4lHNq6JKdGPGRyWAjt152nMgLT7I65LQMbZYO8pQ1To7eDNOOQR8iPbLZD
 4JmCI5T3Wr4k/hSWEnWVhijXIawJQQV8ZFVsam+8HOvguuUdoKU40H97DSmVn7VSA5Vo
 nf6A==
X-Gm-Message-State: ACrzQf3iNTUUFk+MUJ7v0nrrA2N/6lowYk8fIaOmuFIUeXVZe1VIUZnY
 vD/0eVYcm3naOwk3bepYH4rnvAe4H3U=
X-Google-Smtp-Source: AMsMyM7kQiNOUXZn2Scb+YWI1gs/+9gGA5Ew7HN98AeR1mxFxwQxCsmm6xUg9T5bJ/gz75UUWYOx7w==
X-Received: by 2002:a05:6000:cf:b0:228:e37b:361b with SMTP id
 q15-20020a05600000cf00b00228e37b361bmr22472411wrx.374.1664400996314; 
 Wed, 28 Sep 2022 14:36:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5d4d43000000b0022762b0e2a2sm5095545wru.6.2022.09.28.14.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 14:36:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 23:36:31 +0200
Message-Id: <20220928213631.14450-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=cg6/J8xfW5YDXLv6zxni/CUccfbsQtyGwhhzrpu8NYg=;
 b=XatFXSmeZuQa/rJNnbz7s1KUVwcb9oGQfycH9U3OoEW2sxK+U3WE1hLpK6KNA2WmFG
 9j7gB6ZMlZGOsGjtk523J9ZqcA3l9yQ9oVmWB3e3xfYjsUeGJmdm/YRXC02iMmsYLHLF
 7GCDlGgUy057hkn5mlCKdPWz8OPGSchHaPUIqYfNQbEYSwSlMj9PSZM8ZN0DoGRBqK2x
 lQe4ZzukqlIo7uY1EA5UQ2dHK0ASzyH4V/cFy4n/9cimryQgBHhjReo69nrpj8z7b24R
 YQxTXwpWTwpzrD5/7TpQWrxN9ryYCbOYfWsy8f0OsxVvGqOL15CJ5azEXQj5YjChZ2ai
 KCUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XatFXSme
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 5.5.1
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Denial of service attack and buffer overflow against TLS 1.3
servers using session ticket resumption. When built with
--enable-session-ticket and making use of TLS 1.3 server code in
wolfSSL, there is the possibility of a malicious client to craft a
malformed second ClientHello packet that causes the server to crash.
This issue is limited to when using both --enable-session-ticket and TLS
1.3 on the server side. Users with TLS 1.3 servers, and having
--enable-session-ticket, should update to the latest version of wolfSSL.

https://github.com/wolfSSL/wolfssl/releases/tag/v5.5.1-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index f1401e4cda..3849ffb9fc 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c34b74b5f689fac7becb05583b044e84d3b10d39f38709f0095dd5d423ded67f  wolfssl-5.5.0.tar.gz
+sha256  97339e6956c90e7c881ba5c748dd04f7c30e5dbe0c06da765418c51375a6dee3  wolfssl-5.5.1.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index ca360312c9..95d4f47952 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.5.0
+WOLFSSL_VERSION = 5.5.1
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
