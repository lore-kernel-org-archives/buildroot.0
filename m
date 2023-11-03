Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA47C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 16:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68FEB4012A;
	Fri,  3 Nov 2023 16:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68FEB4012A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37bazYeSEh7f; Fri,  3 Nov 2023 16:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A32BC40124;
	Fri,  3 Nov 2023 16:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A32BC40124
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E34941BF681
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 16:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBD7782004
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 16:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBD7782004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPjrKTyWz3rn for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 16:34:09 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B0B48200E
 for <buildroot@busybox.net>; Fri,  3 Nov 2023 16:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B0B48200E
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c54c8934abso32539391fa.0
 for <buildroot@busybox.net>; Fri, 03 Nov 2023 09:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699029245; x=1699634045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CXx4F9JCQFnrKrlQOmCDZAGyTPqk2TkLfqkKzzHQsNo=;
 b=kz7Me7CskDW+O7HQ1INw5U/NcYHP5LYRb6vnL+FUwnF7d87eKtqkSVpBhhm+rifVHG
 v4a18GW9EvZulvQsEBCiU+Le01tMeHfYQ5GNVcLuQdDQtg9FL2xu4nZbO+S6+HuWWeTM
 gvtdldoLVinSzgd6lh9lqqAkysQlENu0MxsZeDBgXWdul0387C4YCoqkofxfcsa/k4NB
 Kb6xzSlnFRx892cCaDag1uRJjNyY3axNcvR5sKWP+AFqeUw0VXTJiujUngKERP7BHhfU
 Ua3OJYvaPNGjI3J74c6jeN18hT4UnCL6q9zewkQbW7vJqVjPccEFgw2Wa2syq7Zna57r
 V6zA==
X-Gm-Message-State: AOJu0YwCzLTh8XX+eRFhbVz6dTBuwgCDLD4yeBLDsA0CMls7rTxyWOiY
 Bng8TiJtS8HT3QYVrvCpiI+zhEFok10=
X-Google-Smtp-Source: AGHT+IFO1xD8dnc42+Ig0mvV2NinTn8zoURelKvopsuIthjT259e+8/Sc+JYb0j+TVZWJWu93eOJZA==
X-Received: by 2002:a2e:a7d2:0:b0:2b9:4b2e:5420 with SMTP id
 x18-20020a2ea7d2000000b002b94b2e5420mr21203770ljp.52.1699029245247; 
 Fri, 03 Nov 2023 09:34:05 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 a11-20020a05600c348b00b0040813e14b49sm3153096wmq.30.2023.11.03.09.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 09:34:04 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  3 Nov 2023 17:34:00 +0100
Message-Id: <20231103163400.63805-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699029245; x=1699634045; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CXx4F9JCQFnrKrlQOmCDZAGyTPqk2TkLfqkKzzHQsNo=;
 b=jWCgohTjkvPI+bwDG7hQTYrqnaVej9A2M7bgWJRhobKbNNsq07jpY1xqoaq/dEculD
 SA8uLuKbHKpQXfdnQNu7Lld/W+gDCWLsNBH7IhPpqck32iue1GRiWktdM8rmQ3Aq0gmX
 kF5ynpi9FSFpy1wB50QytqQqn7mJniTparrEGepDqLvI/QCcf6DU8Am33uXaDhaYMlSR
 vxf95EkGNtkcCunu9DInarF57ubZi9u/LeN5HlqOUl1Jnz43prfilV75FWqnqcBvMuLd
 Q4fDY1YVd0TFp4TOAIfM57TmI/TUMU0hS2MCvoHbnyg8L6lmsIVsXOKnETMT+G6nJrxl
 3r1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jWCgohTj
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.8.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 76a5acad6..40b49dbb8 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  7948c856a90c825bd7268b6f85674a8dcd254bae42e221781b24e3f8dc335db3  libressl-3.7.3.tar.gz
+sha256  6d4b8d5bbb25a1f8336639e56ec5088052d43a95256697a85c4ce91323c25954  libressl-3.8.2.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 1a63a0f34..b72f3b38c 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.7.3
+LIBRESSL_VERSION = 3.8.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
