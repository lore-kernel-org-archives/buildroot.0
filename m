Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71076C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 16:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1495A411AA;
	Thu, 23 Feb 2023 16:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1495A411AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fiMCuRwCeTxs; Thu, 23 Feb 2023 16:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3100F40526;
	Thu, 23 Feb 2023 16:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3100F40526
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 758861BF334
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 16:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ED2B821B2
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 16:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED2B821B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KdjyIbfQtyB8 for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 16:47:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FA4A821A4
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FA4A821A4
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 16:47:54 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g17so1781336lfv.4
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 08:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qoEJtYLiYkfWW4b+AmbIuFJzpFngMjFONpgEvYQtv5c=;
 b=1wI0OPiCeUraTAqhmw49xA6yuufRs3VhXUpJ1Qhb1ix/tQo2B0O9wju2QFGzg4Xm6N
 cpc1JBwnCbvlZ7U3uLmlk8sn1kPSphMNQuxi1ED2Uqnpypwyx4BC13QeoqhtO6jpSddR
 VUs20O2vsDZqaT7xRdVoC7YeLBGS9+SEqW3Y2yR0HA7hYYbo/gNO2Y0/+UpbhpANamkF
 BG+J7vUqoakdbOEL7PcDDy2+VEZ1DJvUsrB4wFN6SGVPdT06vRQyt8YeyJ9Sh49YzfWF
 tJJDBVQmFg/cu06zZcTmIsUIvh/B+jq91d9Yd39sDAjDdCMMGQJiY0ryxCBoHs/0Mmvr
 BK/g==
X-Gm-Message-State: AO0yUKUkCf+D7GilhHBta28Ujic7ukIIZCmjwYAB6qpCUVT/cbfSkHgd
 u771w2O8Y4BYS4bG8MhFZy2s35r/aON2A8wc
X-Google-Smtp-Source: AK7set+l5Cy/rMmHm/+BTV8MItAetOfBMpb4/LkVkFN1jYJkbbp9wOK4jJVnnCPKzKoLMsJzlSkDHg==
X-Received: by 2002:a05:6512:33cd:b0:4b5:8054:1ded with SMTP id
 d13-20020a05651233cd00b004b580541dedmr5223973lfg.9.1677170871382; 
 Thu, 23 Feb 2023 08:47:51 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 d14-20020ac24c8e000000b004db1cd5efcesm439861lfl.241.2023.02.23.08.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 08:47:50 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 19:47:47 +0300
Message-Id: <20230223164747.1653580-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qoEJtYLiYkfWW4b+AmbIuFJzpFngMjFONpgEvYQtv5c=;
 b=Rs0ukPN+9NBfV7e6t4YydlVqWAdxqeeQXu/LTnKQHBK4oTrE+3QOVwc8hgboxOQi3S
 FDeKF0mlX4VztPL7nCvHxkKV75Tp1t7bXPND4X5VBWX5pAypm+WilSWvNUEKM+1TKR02
 62uzK9LWNWsLBzCmwKWS6xZjO4UnD3LRRGB0Uv3rNsGT3QlgZI1CeRXXnSvoP3FaUD+1
 tfkGLSDKY+HGwsyOgdVYrI5F9dAUKNAnz35SK8NPuPOjb4jzleaZxBpmECGIqD2t0lDu
 fUxJ0rDSh3KloymgMgjcSbxTA/cIajVJ8E8lRu74RZkzz8PeNM+tObtTEdzQbthQwcLj
 W3bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Rs0ukPN+
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix builds with
 missing sha384 hash functions
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SAE, unlike OWE or DPP, does not explicitly enable support for sha384
hash functions. Possible WPA3 build issue is masked, since all three
SAE/OWE/DPP are included. However, there exist other configurations
that enable only SAE. For instance, one such build configuration is
wpa_supplicant AP mode with mesh support.

This change adds upstream patch that includes sha384 and sha256 hash
functions to builds with SAE support.

Fixes: http://autobuild.buildroot.net/results/f349130985870f4a781cca56c3f551108f81aa3e/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 ...384-512-KDF-for-SAE-if-SHA384-512-is.patch | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/wpa_supplicant/0003-Include-HMAC-SHA384-512-KDF-for-SAE-if-SHA384-512-is.patch

diff --git a/package/wpa_supplicant/0003-Include-HMAC-SHA384-512-KDF-for-SAE-if-SHA384-512-is.patch b/package/wpa_supplicant/0003-Include-HMAC-SHA384-512-KDF-for-SAE-if-SHA384-512-is.patch
new file mode 100644
index 0000000000..d85e343380
--- /dev/null
+++ b/package/wpa_supplicant/0003-Include-HMAC-SHA384-512-KDF-for-SAE-if-SHA384-512-is.patch
@@ -0,0 +1,62 @@
+From c7f71fb8679c4cdd2607dbaac467a1d5efe9f0f9 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 17 Apr 2022 12:28:41 +0300
+Subject: [PATCH] Include HMAC-SHA384/512 KDF for SAE if SHA384/512 is included
+
+It was possible to miss the HMAC functions if some other build
+configuration parameters ended up setting NEED_SHA384/512=y.
+
+Upstream: https://w1.fi/cgit/hostap/commit/?id=c7f71fb8679c4cdd2607dbaac467a1d5efe9f0f9
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ wpa_supplicant/Android.mk | 11 +++++++++++
+ wpa_supplicant/Makefile   | 11 +++++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/wpa_supplicant/Android.mk b/wpa_supplicant/Android.mk
+index 0e0ce467c..bcdbd6c90 100644
+--- a/wpa_supplicant/Android.mk
++++ b/wpa_supplicant/Android.mk
+@@ -1361,6 +1361,17 @@ endif
+ endif
+ endif
+ 
++ifdef CONFIG_SAE
++ifdef NEED_SHA384
++# Need to add HMAC-SHA384 KDF as well, if SHA384 was enabled.
++NEED_HMAC_SHA384_KDF=y
++endif
++ifdef NEED_SHA512
++# Need to add HMAC-SHA512 KDF as well, if SHA512 was enabled.
++NEED_HMAC_SHA512_KDF=y
++endif
++endif
++
+ SHA256OBJS = # none by default
+ L_CFLAGS += -DCONFIG_SHA256
+ ifneq ($(CONFIG_TLS), openssl)
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index ed49aa972..69c80121c 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -1475,6 +1475,17 @@ endif
+ endif
+ endif
+ 
++ifdef CONFIG_SAE
++ifdef NEED_SHA384
++# Need to add HMAC-SHA384 KDF as well, if SHA384 was enabled.
++NEED_HMAC_SHA384_KDF=y
++endif
++ifdef NEED_SHA512
++# Need to add HMAC-SHA512 KDF as well, if SHA512 was enabled.
++NEED_HMAC_SHA512_KDF=y
++endif
++endif
++
+ SHA256OBJS = # none by default
+ CFLAGS += -DCONFIG_SHA256
+ ifneq ($(CONFIG_TLS), openssl)
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
