Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD27C636CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 18:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 809F7409E2;
	Mon, 13 Feb 2023 18:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 809F7409E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WWgS2WdSQNLB; Mon, 13 Feb 2023 18:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D61409EE;
	Mon, 13 Feb 2023 18:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D61409EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B9C71BF289
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42CA881281
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42CA881281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0TllLMnx2O9K for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 18:13:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F96A8125B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F96A8125B
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 18:13:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j23so13220727wra.0
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 10:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m3WLMb0Dr5LVBJHGE7hqxYzxVuU5iWGLqSsbiafn4r4=;
 b=yOkGpzqbJ05QYVU59eEDhwSWxfb9yOxbTJKb/AzYEwvOwxwPsrlK+lW7rR/YohjXuM
 NCM5XvMI4Qlgt+XjeF7zkf82GiEm1YeQY5FaOqakS/cfeabd6xVL661bMvMmiT2ogXyn
 uJ5R1FwnxDfpyJAJgXETgon2owy9Hg9p09uqAzSG/e/Femzc1XFXX/klYlWZCx0AhsJA
 G+KG9Sqxc6wXibC3Ogg7tGkyaKbWBfoce9EOlydP4lnowfYbirLbIuqYDAB25jzw+JRq
 R1D/FwIl6fbkeqK3M0ZHD7E+adPOyI0R2Zz33wKLiWHHvVCuHthZOosDo9IiGAWi7d2J
 ysTw==
X-Gm-Message-State: AO0yUKUw2lfQ38JVDzyF/gzwRvXuAAPi6rrKIQuaxLtv3EZCWVa4EVTn
 t0mQmdLLJjSyp9K6EIFvsd7MfW5lAz8=
X-Google-Smtp-Source: AK7set8OCxT/E7OOGQ5eS0xGfp36a9zCCB/tDeEWUVPjheLdC8L97I2URVLSsZ9uRmhA42uoSftHTQ==
X-Received: by 2002:a5d:504e:0:b0:2c5:4d8f:7193 with SMTP id
 h14-20020a5d504e000000b002c54d8f7193mr6476130wrt.56.1676312016898; 
 Mon, 13 Feb 2023 10:13:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4b84000000b002c55b0e6ef1sm2146544wrt.4.2023.02.13.10.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 10:13:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 19:13:32 +0100
Message-Id: <20230213181332.908961-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m3WLMb0Dr5LVBJHGE7hqxYzxVuU5iWGLqSsbiafn4r4=;
 b=p78NdguGVb6TGaaHi9Uax9huYetyv6RbFb+cOzVac2lvygeyTG+wV0pjRqOdhLaPGI
 NoeQjyfGLdNLxtI4YNbkETYiJw+0TPNyuZlCeA9mO2mPCDXUCDvhq0AMIKDyTmrBleWQ
 e98iKixsHA/Z0/X/Wf6czMlBGRexr8mhFO8ziON8C8Thvnslneoz2WNpMSENHr9lOoyY
 n/Tlf7CrYhiBUuCCKmh/HrG7tV89Jfl8+9wdsBJ2wvnyj8+Y0xl1pKKIneFX87/MxczT
 szHvJy+3D7zhg1MOz1MnzlgCiqtBdnHtBzYZweeCnmYuY+rjoJI8ShZR3u2T86Dyi1q+
 Kijg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=p78NdguG
Subject: [Buildroot] [PATCH 1/1] package/apr-util: security bump to version
 1.6.3
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

*) SECURITY: CVE-2022-25147 (cve.mitre.org)
   Integer Overflow or Wraparound vulnerability in apr_base64 functions
   of Apache Portable Runtime Utility (APR-util) allows an attacker to
   write beyond bounds of a buffer.

https://downloads.apache.org/apr/Announcement-aprutil-1.x.html
https://downloads.apache.org/apr/CHANGES-APR-UTIL-1.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apr-util/apr-util.hash | 4 ++--
 package/apr-util/apr-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index 59ef590109..7e2793cd77 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,4 +1,4 @@
-# From http://www.apache.org/dist/apr/apr-util-1.6.1.tar.bz2.sha256
-sha256  d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b  apr-util-1.6.1.tar.bz2
+# From http://www.apache.org/dist/apr/apr-util-1.6.3.tar.bz2.sha256
+sha256  a41076e3710746326c3945042994ad9a4fcac0ce0277dd8fea076fec3c9772b5  apr-util-1.6.3.tar.bz2
 # Locally calculated
 sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index fb0735f5e7..02b6d5e277 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.6.1
+APR_UTIL_VERSION = 1.6.3
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
