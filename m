Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289BEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB97640942;
	Wed, 22 Jun 2022 20:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB97640942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZfFLcz67GRE; Wed, 22 Jun 2022 20:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EB4F408EB;
	Wed, 22 Jun 2022 20:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB4F408EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A9781BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 751BD83FE8
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 751BD83FE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNsS7xqkM1_c for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:21:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF4D83FE7
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DF4D83FE7
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:21:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id g27so18336528wrb.10
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 13:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abSspv4XqvfMW8RN3lca7PWCM9LMjSrPUBVyqC70Nzg=;
 b=E/1C/o7PW7+4cmO/5Yh9gb9gqhTIHZDVSxFcbnssjL0iBz5yP8l8iMTGkp8lKLLxuJ
 CsNwyxwR3iAhQ1/ZVC3+bFm+lUkhtfcl30mnLieqZirxvc6ChQBPUJI4rUmV+vFwjqds
 Gxv5mw/kyhQHLWWy2ooJ3iQjyBsdpiggfraaNZjEexem1VwFdMtsM41rlehYD3b6N4S5
 1ca9ZMz6UjCl8dj5efCUhIlHqpUPlamJs7cu1fz3UeEVm2JVrjYJlUqOp8G23kV6N0dJ
 dvNO5/PJ3hh7mMMENhwLFARZUxzgMUXF3uoVzhRPOglIezNxw0oJQHP7VMTJ03prSaVJ
 WujQ==
X-Gm-Message-State: AJIora8vT/D5xhN7lP0QiCEw+a94dWpsmByo4FwVGXTLNHqXqwihUuZ0
 CApY1ZpE0FS44tXl1bPrdl8B8KQCKXM=
X-Google-Smtp-Source: AGRyM1sjCahzINf1QT2pt99ZlvEJanGSYhASRrsHBghYqxHrkAvy4jyyZgN2hBGJWgxLPi9ENfmUkQ==
X-Received: by 2002:a5d:5984:0:b0:219:e396:d3d1 with SMTP id
 n4-20020a5d5984000000b00219e396d3d1mr4972628wri.701.1655929293297; 
 Wed, 22 Jun 2022 13:21:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a5d488d000000b0021b86dbad37sm14240306wrq.68.2022.06.22.13.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 13:21:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 22:18:39 +0200
Message-Id: <20220622201839.156919-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=abSspv4XqvfMW8RN3lca7PWCM9LMjSrPUBVyqC70Nzg=;
 b=VDX8wX7YfbZvtz/K/YZ05s1ZHUKTMG0+GD7i68Nn67uefrFczvrlZ0ToaHTV62ibcx
 SnitplYYBaSMGaW4QT1tjn3071Ev707vduAezlnC28pYJraU9KmU9ZWeDhfwHLQOF5TP
 irlnAeKp8PShWR5yDSKVnwA8C/ZnVMKzGCObEdT/pGJPw/6wqInQFBi7iS3nq+JIuKB3
 vhylrY4DVDc2FRurN1Mcm+92pDciIrRIlJBeBBdZg84y6IqE3Zar085oH9pw1wrmcU1T
 AlGHvqI0lIeg0RxaPp0qEEsa3PNCkocxh8APnt8d/89nH2C5uhbPmrZHWtJN0/bQBmXt
 2pqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VDX8wX7Y
Subject: [Buildroot] [PATCH 1/1] package/nss-mdns: bump to version 0.15.1
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

Update indentation in hash file (two spaces)

https://github.com/lathiat/nss-mdns/blob/v0.15.1/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nss-mdns/nss-mdns.hash | 4 ++--
 package/nss-mdns/nss-mdns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nss-mdns/nss-mdns.hash b/package/nss-mdns/nss-mdns.hash
index 9bcec08496..3ab546f965 100644
--- a/package/nss-mdns/nss-mdns.hash
+++ b/package/nss-mdns/nss-mdns.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	a2094101b735cade45048764ea594bdae2bfa9399837f3c852a5b264416e9c8c	nss-mdns-0.14.1.tar.gz
-sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	LICENSE
+sha256  ddf71453d7a7cdc5921fe53ef387b24fd0c3c49f4dcf94a2a437498596761a21  nss-mdns-0.15.1.tar.gz
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 77ab6c1ede..fd10fd8881 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NSS_MDNS_VERSION = 0.14.1
+NSS_MDNS_VERSION = 0.15.1
 NSS_MDNS_SITE = \
 	https://github.com/lathiat/nss-mdns/releases/download/v$(NSS_MDNS_VERSION)
 NSS_MDNS_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
