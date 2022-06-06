Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D22DC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 11:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7C8F60EF9;
	Mon,  6 Jun 2022 11:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xdm92mPsSnm7; Mon,  6 Jun 2022 11:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF16360E2E;
	Mon,  6 Jun 2022 11:51:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD3011BF405
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 11:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC402840DE
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 11:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aW-Abwi5rfYB for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 11:51:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97EB4840CD
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 11:51:50 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t13so19524649wrg.9
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MQxbr+1u0mI/nLJ05U+L7Hyqh4CA5f0kToSUMZoJcDU=;
 b=AavOTmkXQ2m51mlEeArfHloLvbRQDPKUHm8aFUOYnyBff9OG3WxhybVVh/hZ+TnVQ0
 oLcqgAdrkYRH5ZKNDnmEIkl2DJFv7QLCDZnCajeWA4/EHuc7EBrZogKpvQdpUhzLrRFJ
 0FioJQ/omn8Rx4d3io6RekZbfkidZGv9+m6bVnRRzQGDTtYIlJIhcvXc2ZC+u9oEyKUI
 +iilPOC0Bo101ag1F2UAT72fJGqpRhNimu35RUrkHM5Zb/CD6DOt5ofOwbngYOoXp2TF
 6fso57ubxM25IP/wVg/0RGn7cWttZviziEyvkqLhhTntTR5p1/X+aeo38MPbCF8ArxjR
 yN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MQxbr+1u0mI/nLJ05U+L7Hyqh4CA5f0kToSUMZoJcDU=;
 b=Lr93X/5J6fC9L/F7fPvShkjwYMwKumEnfbT7PFIdmCJ3xjHueriD9PYr7YaqWf2k3w
 IlQ8IIwHSQusDWG1dZFMejR8cqQYOCoOPXgD4mvBShh6Ap575g8tDXFP4DbAR6Z2e56/
 r7K0czSqk3UjQTki12yE2rgICl57rSq5RQnQKD5/DtnwCahFBsskd2K4PLOjzDtih39m
 0i0Ov6QVPSQ6lT82CZaANZVEqr3ug2o1wzy5GZ7BEmzPhcdXyV0QU0yq/7wLDsExpAF5
 qY2Xf+yZNtMHBEIlKBJu8yjMUelv2wgKVlBzdZZZGbEB0YkIWN4nxVBfq0+U7N9BS3gq
 ukow==
X-Gm-Message-State: AOAM531baFHYxBU4fXGtewl+swVsXlZMYEJikthtqyX4KgIu7h24O42S
 3rDm8fc5b1cEMZ3nkKlUET/bjHbZA3E=
X-Google-Smtp-Source: ABdhPJwyikRiuPU9z3F1NHXOWW4ANCNXZgMPNqB3RpioqmC7hTxC2RzJ5xrdwgkGpEX4k7FTxushQQ==
X-Received: by 2002:adf:e181:0:b0:213:bbe1:ba66 with SMTP id
 az1-20020adfe181000000b00213bbe1ba66mr14666429wrb.325.1654516308517; 
 Mon, 06 Jun 2022 04:51:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b0039c45514f16sm7705545wmq.4.2022.06.06.04.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 04:51:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 13:49:05 +0200
Message-Id: <20220606114905.444147-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to version
 10.3.35
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

Fix CVE-2021-46669, CVE-2022-21427, CVE-2022-27376, CVE-2022-27377,
CVE-2022-27378, CVE-2022-27379, CVE-2022-27380, CVE-2022-27381,
CVE-2022-27383, CVE-2022-27384, CVE-2022-27386, CVE-2022-27387,
CVE-2022-27445, CVE-2022-27447, CVE-2022-27448, CVE-2022-27449,
CVE-2022-27452, CVE-2022-27456 and CVE-2022-27458

https://mariadb.com/kb/en/mariadb-10335-release-notes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 4da26bdf94..f7e3c7b744 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://dlm.mariadb.com/2117287/MariaDB/mariadb-10.3.34/source/sha512sums.txt
-sha512  46d4575ec1afb68510652a4bb31ca5ce83a2f5f61048a6e9c1487b0ba58f079465a8b72518d44043cd42c631b19ff50b5498584676ac6473705b138fe3300741  mariadb-10.3.34.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.35
+sha512  9355de944eccef4e0bc01b19ffc3c0c72cf88befae7385c6f0ee1ea47dbd98d23f6bb46af9c140acc48d9d9613552870684bc0b7ca1f3cff1dc09c1a2c801573  mariadb-10.3.35.tar.gz
 
 # Hash for license files
 sha256  084aa0007efac6dda6aafffb3f3ef8b66b105862dad7ee23f6a4b52813f84464  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 18667e7e70..06fd1484b6 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.34
-MARIADB_SITE = https://dlm.mariadb.com/2117285/MariaDB/mariadb-$(MARIADB_VERSION)/source
+MARIADB_VERSION = 10.3.35
+MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
 # https://jira.mariadb.org/browse/MDEV-12297
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
