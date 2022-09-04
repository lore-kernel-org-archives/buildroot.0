Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EDDECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 20:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F0A14086B;
	Sun,  4 Sep 2022 20:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F0A14086B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNiSg1UDzUiX; Sun,  4 Sep 2022 20:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E2AA405CE;
	Sun,  4 Sep 2022 20:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E2AA405CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B71A11BF38B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F1DB60F41
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 20:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F1DB60F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2v8e0mPijv22 for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 20:14:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 308A160ECE
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 308A160ECE
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 20:14:38 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bt10so10562016lfb.1
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 13:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VznHBFXYda1vjWfeezgf9ZFEd1QEFRCqqYcMS2j1fwI=;
 b=OS/bN9s1cypPW1FKrOizltwNHJJqZeBSYkEh+t7KkzSTDLsBNBBe0oJNTUshyfTmZj
 gToWIEPmC0n8B1iZrLahuYGnm0/MJ7M45UrEHL9P4aPjE4pxZDRabG1hI92PrL2tv+xE
 gw7x7w/UnJy+aG2UkGU6IKR5EyXpvkFEAnh7tvG8ATEKskvxotN3xrMBs2hSAzhQJO9C
 tV0zrz+hHzNEjugZ5JTSWJEHS1ZthqBweMkDRVxpR7ZG+XD3/U32RAG9teEU0KNr/frv
 BSYnxNDdviO+VomQZeQJodbq8LjU28ZZRUpehZFZZbAmbUMIYHY0TxH0Rarh9fh4W++j
 DjKQ==
X-Gm-Message-State: ACgBeo2GxxHc4oZtGjumUZv33EVWiuto6FfNhQxnGjrUWDnUNnqb9siW
 at5BYvomGv9ZIHYNbVnZ8mSNcpGUWcI=
X-Google-Smtp-Source: AA6agR50XCbQJRJEy6wQ4QQvtGOBQiiSXe1mhzjrJGt3BJimFI7h2yN30Uid/szebJNCGL7qX2tyqg==
X-Received: by 2002:a05:6512:139d:b0:48d:3e4:6802 with SMTP id
 p29-20020a056512139d00b0048d03e46802mr14085547lfa.424.1662322475798; 
 Sun, 04 Sep 2022 13:14:35 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020a056512071600b004945c1c5cccsm1004179lfs.268.2022.09.04.13.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 13:14:35 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 23:14:28 +0300
Message-Id: <20220904201429.1480971-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220904201429.1480971-1-geomatsi@gmail.com>
References: <20220904201429.1480971-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VznHBFXYda1vjWfeezgf9ZFEd1QEFRCqqYcMS2j1fwI=;
 b=jDGG9wFZAv0HhRxHVgdxLjqpTUTq/7SLrqARCxy2Mn6OuyCz4glbEkTUy6St+PNlYW
 3ViaWrJS02WC+qsgDHNTdzegoAyHx68QOEOXfdy1pBgnhmE417aNhS2keJm0lw80tUaG
 YjolH2K+FpAvFhX3S/Ed7dFX00ns3Dl+HRoN5c5nolAumDTAyUV8VAOaI1jewNPNCrhz
 0hPzrzM7vHHcuHqUK/32jk8/ykpuVaDZjpaNSjGfQ3jVfXyUQHCiqlTK8ULGtleZyXuT
 dmJ7l/a17VTR+M9Da69Q784p5RI6YrONBMXUxokDO7XRAzGaNU6ctvRLGqiv/aVULlAE
 gfIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jDGG9wFZ
Subject: [Buildroot] [PATCH 1/2] package/hostapd: disable build with static
 zlib-ng
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Static linking fails because both hostapd and zlib-ng define functions
with the same name 'crc32'. For now do not allow to select zlib-ng as
zlib provider for hostapd in the case if static libraries are enabled.

Fixes: http://autobuild.buildroot.net/results/9901df820d3afa4cde78e8ad6d62cb8ce7e69fdb/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/hostapd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index f4206ceea5..3a88a9d276 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOSTAPD
 	bool "hostapd"
 	depends on BR2_USE_MMU # fork()
+	depends on !(BR2_PACKAGE_ZLIB_NG && BR2_STATIC_LIBS)
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
@@ -12,6 +13,9 @@ config BR2_PACKAGE_HOSTAPD
 
 	  http://w1.fi/hostapd/
 
+comment "hostapd fails to build with static zlib-ng"
+	depends on BR2_PACKAGE_ZLIB_NG && BR2_STATIC_LIBS
+
 if BR2_PACKAGE_HOSTAPD
 
 config BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
