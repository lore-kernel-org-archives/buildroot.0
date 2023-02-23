Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2340CC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 12:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3E6741081;
	Thu, 23 Feb 2023 12:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3E6741081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tj77TRSncuel; Thu, 23 Feb 2023 12:52:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2F604046B;
	Thu, 23 Feb 2023 12:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F604046B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A48FE1BF573
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 12:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EB4D60E0A
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 12:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB4D60E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UH0oIGHrYHAw for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 12:52:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1363660585
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1363660585
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 12:52:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l25so10200421wrb.3
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 04:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AWDeuzUwwYucaSfu0EcrYzjqGYr9mkUonjAx4cL5q0s=;
 b=FVYLEw07RiDD0nPm2QWYGoPJNgfD+iUYsuwnnDGkWuD2V/csHum9ywYznNjPKmPVKj
 cl5g2dB7V2fUrefDo+39jrcV13eXnkxmfxguQBBk1ecC+blWmLCwrQFr8GmAQo7ESZ7C
 qsPjEzqOW9PkK78uKnF5xF17QX2aHefF/wiJNoxcfXTp1yUOqxue6fwgTvqB6Kzn/6sW
 vGXOlNLXoHwB0OPDkDDHfs9eR+KS46M/MjDd/mM+DCQN4OBPhvsvmFESbzC8eOiN1nJZ
 9aOMW/0l5YER1pE8qJZ0/P2IdMWjyphN7XCqjYDovMfHI9NGLI+AUXTI/hz3zq8ITlCG
 NvEw==
X-Gm-Message-State: AO0yUKVf17G5NI6ZqNK0fYS9a152/8UmlGWNv2LN0QuwR6L+8VzU9VY7
 9J9GHAJTYlng5EpH0bkxbolsmr1eiZI=
X-Google-Smtp-Source: AK7set/xsHDCVWMmeDPrlEYgoMLX0LtS9aeD1qSo4hFhGVWU0KmSIB1AIeVPisE/IA6FePN+fhFC9w==
X-Received: by 2002:a5d:4c4c:0:b0:2c5:8576:867c with SMTP id
 n12-20020a5d4c4c000000b002c58576867cmr11917120wrt.43.1677156765940; 
 Thu, 23 Feb 2023 04:52:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x8-20020adfdd88000000b002c58ca558b6sm9699113wrl.88.2023.02.23.04.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:52:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 13:52:42 +0100
Message-Id: <20230223125242.411118-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AWDeuzUwwYucaSfu0EcrYzjqGYr9mkUonjAx4cL5q0s=;
 b=Kxc+2okVPx2rcxhL9jNA7fEgRyuT58e7oT5Ilq/MUa3GhpZhLnk5v97eg9M1ciI9Xu
 WzqsVwaha13mdxljnLlBjgNRKccVuw6lC9njPep+CtHDHHubxJqox4DF3YvcmC+C5GRM
 hpa7zg/HLluC/W1EruFNXuA1IplCxkQQD3eb/b+AFbLSlr5W17X49rCJ9LvTaKZDDY4e
 gHkr9mgV2BAvJqWigvKvNeeEiV/btoKjWvoREjYFfFlL/RbsG6TNwdRvbog0B+i8+3iR
 flo0wamqwCRmvWFy/all14+qK+/IncM+g9COqVP/XhaQEbyfhgleg9ti928SXZpoOsKT
 eUXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Kxc+2okV
Subject: [Buildroot] [PATCH 1/1] package/mender: force libopenssl
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mender raises the following build failure with libressl since at least
version 3.1.0 (and probably since the addition of the package):

vendor/github.com/mendersoftware/openssl/conn.go:103:61: could not determine kind of name for C.X509_V_ERR_DANE_NO_MATCH

Fixes:
 - http://autobuild.buildroot.org/results/2b032d2a4e7cfbb20444c13821003120a4d00abd
 - http://autobuild.buildroot.org/results/621c057c0b8b627c8140456a2b0af4f95d239dcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mender/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index cccb46361b..7d768cebec 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -4,8 +4,9 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
