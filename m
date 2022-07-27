Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB500C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 363B060B42;
	Wed, 27 Jul 2022 09:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 363B060B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmR7En9jDR8T; Wed, 27 Jul 2022 09:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6366060B3A;
	Wed, 27 Jul 2022 09:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6366060B3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD4061BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 869F0408CF
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 869F0408CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id blz2k1-H2578 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C2DC408CC
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C2DC408CC
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:21:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i8so376480wro.11
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 02:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wqLAPTukMgqLxsBIVOghRglBDUEq+xmqFu8CX3MvYdA=;
 b=FRdGvb17zeSGBGTApXU5YiekiYzOMB7C+llexSE1oR1xVweINoSz1/gICPEVvbRJa4
 JeA0azRwTxA786jB61aahM5yjPzZARERsBY7ar10qfBzcrFVRqj38X95TYf0D3uvLV77
 dZGMKWisdzQHN2HKx7DzhwBI1fvo3JaxEP79Kx1m7Z2GbqOyOc/710aROONUAZYMwIcT
 cY/D73WGJbfwDiMmfCN0MrCVkaF4gEX8QKSaC1xr2gh6oDu2xGHwldYL5zS4LqXrPzAm
 /OznPvfYM/FUT3DZvuiNZfw6mPrynNvyQcNyKfGQrZlmwEawqO5AxgMZPJHEycFmuc6d
 asvw==
X-Gm-Message-State: AJIora8r/ZO3VylJ3lrxrN6FOMptC4qzXhE6/e7VXaFgMQ8NWzDk6q1N
 Uc8vtgGeaHqUtSpB02e+SmHxUtzeEuY=
X-Google-Smtp-Source: AGRyM1s5ZMUKN389w5wIOVjAXLbtFBMaNNUlMYaEJNGwOWDAhvbdfHYtj1npHppQQ80yASHsJwtljg==
X-Received: by 2002:a5d:528a:0:b0:21d:7c04:2ddf with SMTP id
 c10-20020a5d528a000000b0021d7c042ddfmr12938943wrv.422.1658913686043; 
 Wed, 27 Jul 2022 02:21:26 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d568c000000b0021e5cc26dd0sm15119704wrv.62.2022.07.27.02.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 02:21:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:21:23 +0200
Message-Id: <20220727092123.985892-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wqLAPTukMgqLxsBIVOghRglBDUEq+xmqFu8CX3MvYdA=;
 b=F99bJpK1JQJ5aUg/fky7X3J0ZG9x841lkzVyklv5dzHt6FFNOBME2aVbZJMllMg7wg
 35TnmjqGyS0yVOzyd23T0tgUVrbdTixbx7DgMUZ2VF2ipyoAi7+O67VJy8Y2snNTcLtS
 ARNfMLEHxZzxst+gy7DeGZmLGtnz7Uc4RcWDsN4UmHq47x/saR8nfEhvoiK+Zqi2q9nx
 17D9mQhAkdOBLSXSSqtrAHJNngT1DmwQ7cUrRzT0oW+1hDQ9Im1TXYRrk/WxIDVGQQUQ
 Bj+lrFx8k/X0VsGdF3ZdBXApS1pTqzRShP6kVT4Hd6Z5jwTDNlreVpy5qZacnRCqHbhl
 MF7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F99bJpK1
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: bump to version 9.21.4
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/LINBIT/drbd-utils/blob/v9.21.4/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/drbd-utils/drbd-utils.hash | 2 +-
 package/drbd-utils/drbd-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index 58d282714e..9bdfd69538 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3827bfed6630f8784ec558a8ac3de68175d544876d897c0810ad141a61487cad  drbd-utils-9.19.0.tar.gz
+sha256  730d68b9ee48df7b2e3ddff38bf54a5bc405651bac0ece180b4f22a468e543b3  drbd-utils-9.21.4.tar.gz
 sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 2082810a37..3ab3246f49 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 9.19.0
+DRBD_UTILS_VERSION = 9.21.4
 DRBD_UTILS_SITE = http://pkg.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
