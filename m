Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00380C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 18:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A83F5409EF;
	Mon, 13 Feb 2023 18:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A83F5409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNe6QW9YYJJc; Mon, 13 Feb 2023 18:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7D52409ED;
	Mon, 13 Feb 2023 18:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7D52409ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DC821BF289
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E790C6103D
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E790C6103D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9pUYbnMjeloQ for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 18:20:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 252086102A
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 252086102A
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 18:20:20 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id p12so6986009edc.0
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 10:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ai6Vt/nhMwqfWElU4sq20Mv9NQ49kqZEvNj0Sut9YMY=;
 b=qh8rG4/n/V4/LB3/eBxLxQWdKxTIhYE6I5ytlx4YztOaRywXagVh+NaQmyuf6bJDp7
 vYcjp4sbGDvl8mrQH+cmwwkNR0YtWswVcyqhaVfzviVUKMvf0L8ogNUQPz8DHgv/vvsR
 eopOn/QP9kUQTaIDsFsh7JDidhX+IttroZyDgpJxubB99ZJkw1Ppb5jusw4OqJsPL4qP
 tCzQ+1UFbco3dl0rK5CgsylixXAQj8775mFmeFMxQzY1HIME+WV9+d98/ywUYsVuevvi
 jt5cXi8qgCJ1JcebIW+b3ChN91+XtWsfjVQWr3bfErX92vNM36wyw1PNTdKBgnbb89GX
 P5/A==
X-Gm-Message-State: AO0yUKUYsIwFQx2OcCEcpbO4gB93jgwKNpcbLW/xwuPMlKa3Z5k+2PfB
 9NBIkCS7Glf6ErhjOFTC5vEOkTy5uGxmCA==
X-Google-Smtp-Source: AK7set/KuNOdY3T84O3429z5PniTt+a0m3F/UPUd55MfRWoo+tyRZiqIYZOBMOJmb+CvUAyvvAL/+Q==
X-Received: by 2002:a50:ab0d:0:b0:4aa:a39f:65af with SMTP id
 s13-20020a50ab0d000000b004aaa39f65afmr23793445edc.42.1676312417858; 
 Mon, 13 Feb 2023 10:20:17 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 v24-20020a170906859800b0088c224bf5b5sm7145165ejx.148.2023.02.13.10.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 10:20:17 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 19:19:45 +0100
Message-Id: <20230213181944.10292-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230213181944.10292-1-heiko.thiery@gmail.com>
References: <20230213181944.10292-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ai6Vt/nhMwqfWElU4sq20Mv9NQ49kqZEvNj0Sut9YMY=;
 b=qmlbl1ap/18AyChLrVmAYB3411KDv7eqyFV7jCInejZsyMtU1YeOHrwksOBKGs66rz
 D7uJfU6N1CSuZLaCZ++8yGvnEoUqd1wlHKoxEUZj3LZdxaOfd8FwGrg+4gWCjHD6xwCd
 DJj+phIqyLI09g072HMwLUS1nY5kY0mzf+Q2D9ue2RIDYNKS/dUR2tAFzEBXqNeIgUYg
 uRPxOvOz5e6SrjrKFGt7A/3MNDXjyViCRfvj/OCqapHbDbjg2wJARVZ/OslhfRcfIU/h
 BnOLrxvW4ps5j8I9B0HWYXPZtzQ6g8/GUt+HEbb6ECRKRsFVPrVJJWs1fi2oUHHHGur7
 Wa7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qmlbl1ap
Subject: [Buildroot] [PATCH 2/4] package/libnetconf2: bump version to 2.1.28
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
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libnetconf2/libnetconf2.hash | 2 +-
 package/libnetconf2/libnetconf2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 34e934089e..675c76a500 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2f1a6559e8e43ea18ea337ab5f194f8443695c7ab4dde5d7b2560603f9bf702a  libnetconf2-2.1.25.tar.gz
+sha256  72e9a6461fadbd22f0cf0d23ba68d62b297c8f564f7f2bee069748fb67fc3a24  libnetconf2-2.1.28.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 0d4294d8d3..e349c1bce4 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 2.1.25
+LIBNETCONF2_VERSION = 2.1.28
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
