Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7866DC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 13:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 098878402E;
	Sun, 18 Sep 2022 13:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098878402E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9czCUnoQzAu; Sun, 18 Sep 2022 13:07:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DF3783F82;
	Sun, 18 Sep 2022 13:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF3783F82
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D89561BF426
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3B0A83F82
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3B0A83F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCKKry52UJve for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 13:07:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5E5283F40
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5E5283F40
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 13:07:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k9so43171441wri.0
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 06:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=0MiWI7DPoYt3phdwJFy4+VS0AKjW3fdYH6CVOGQVtsI=;
 b=P3zL2PK/WfOjuMh17xe+aq9bcl6qK/OBGquPv+1nnieJ8r2Igzu9fq2U8pvY+cD1bZ
 f25VcpBr94aFkXB9mnv6SmM+8hnEZtERQQl7nUEO0MkMD4N2xL9AQAuNS+iDKxOcmxwM
 0vG9LshFsYy+TOHkU+QX8DD30xJAUGK8VB8/D+gDFWBy0s8E7rbBTuRnRwoAsRp2SR0q
 A/lH6oi6N3q4rveyNgHWzbY8dmf1WOvSL3LtoHXG338scKyh6ngdLilItFAa2HxZ/BBY
 ZaZ2xEk20cQKseW3yW7q/2p3OgvchP09MLXV2Ig5zIasa0BE0grEtQwzGld2oR4P1BBM
 rWhg==
X-Gm-Message-State: ACrzQf2wU6Hr4V7VRV4Nlwy8l1PFyvm1tWeOGsqUS//W4zAAhLXDGQZT
 ozHRQbN7DPCR5ba+TwjrJ2B9XSL+l6o=
X-Google-Smtp-Source: AMsMyM6cxkYwgWyxvvv7koSgDRDYuWRevjaNQz4IgaIOECRghMDUbEb25YvT8CAEwCL6nYD/aMIvrw==
X-Received: by 2002:adf:de01:0:b0:228:62ae:78bc with SMTP id
 b1-20020adfde01000000b0022862ae78bcmr7848787wrm.41.1663506460363; 
 Sun, 18 Sep 2022 06:07:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 b13-20020a056000054d00b0022abc6ded45sm10567431wrf.13.2022.09.18.06.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 06:07:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 15:07:35 +0200
Message-Id: <20220918130735.295874-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=0MiWI7DPoYt3phdwJFy4+VS0AKjW3fdYH6CVOGQVtsI=;
 b=O6F1nI08N4feqPo/JJ4BmyHgmIukgPRGznZ7h2v0sWp4yd+4I2rvfuqjEEYnBUyGOH
 AVhCBSacRgfCrTDrZ6z74c7JBIwznxw6bvKmuNpS+eqqAMNP35Iojh/P9GjtuZEOU6Iz
 tkL5K5f0YbZeyXQOlxOe/iielsTCn0BJubjub9i/MvfINU6Zgbf2HRlpGQAUWrmTJxpR
 xAlHxOynzhEq1BMxKkiZ62pY7D5cPypMXCzbdT254pvN8FJAMaEzs7pjtXjaTPX1KyZv
 ImOLUBo5ZJ0I0s75S/wniF06bgYXpjZoinZE4jt7WYrGdFDpxWBgHvSIGPk+MG+SZFRA
 reNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O6F1nI08
Subject: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.43.0
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

Drop patch (already in version)

https://github.com/PurpleI2P/i2pd/releases/tag/2.43.0
https://github.com/PurpleI2P/i2pd/releases/tag/2.42.1
https://github.com/PurpleI2P/i2pd/releases/tag/2.42.0
https://github.com/PurpleI2P/i2pd/releases/tag/2.41.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...pd-Fix-the-build-with-LibreSSL-3-5-2.patch | 27 -------------------
 package/i2pd/i2pd.hash                        |  4 +--
 package/i2pd/i2pd.mk                          |  2 +-
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch

diff --git a/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch b/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
deleted file mode 100644
index e9f905b7ee..0000000000
--- a/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 0a1e302e8a242bbd1d39556e5ef05aced1b3b504 Mon Sep 17 00:00:00 2001
-From: orbea <orbea@riseup.net>
-Date: Sun, 8 May 2022 22:50:44 -0700
-Subject: [PATCH] libi2pd: Fix the build with LibreSSL 3.5.2
-
-[Retrieved from:
-https://github.com/PurpleI2P/i2pd/commit/0a1e302e8a242bbd1d39556e5ef05aced1b3b504]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libi2pd/Crypto.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/libi2pd/Crypto.h b/libi2pd/Crypto.h
-index b02778141..726bd0a1e 100644
---- a/libi2pd/Crypto.h
-+++ b/libi2pd/Crypto.h
-@@ -29,7 +29,9 @@
- #include "CPU.h"
- 
- // recognize openssl version and features
--#if ((OPENSSL_VERSION_NUMBER < 0x010100000) || defined(LIBRESSL_VERSION_NUMBER)) // 1.0.2 and below or LibreSSL
-+#if (defined(LIBRESSL_VERSION_NUMBER) && (LIBRESSL_VERSION_NUMBER >= 0x3050200fL)) // LibreSSL 3.5.2 and above
-+#   define LEGACY_OPENSSL 0
-+#elif ((OPENSSL_VERSION_NUMBER < 0x010100000) || defined(LIBRESSL_VERSION_NUMBER)) // 1.0.2 and below or LibreSSL
- #   define LEGACY_OPENSSL 1
- #   define X509_getm_notBefore X509_get_notBefore
- #   define X509_getm_notAfter X509_get_notAfter
diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 99c474a2e5..98c0db243d 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.40.0/SHA512SUMS
-sha512  58d10417f3fd2c2fb427fb88b30ccd3e03053c84aa7ac6d3e346c388f2376d1768846bec5ee8d5134dd62d5712b20f890af11083634f94095b1117f6494c25fd  i2pd-2.40.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.43.0/SHA512SUMS
+sha512  7247850cd47cccc540346b4a1becc6dba5f40bcb333cd722e9fc59fd8b0beddee700376829d29add05cea6b84bb34303ed37e01914a1a41cf8cd94fe5c826e4a  i2pd-2.43.0.tar.gz
 # Locally computed:
 sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 2b5c6a1f54..b99212be47 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.40.0
+I2PD_VERSION = 2.43.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
