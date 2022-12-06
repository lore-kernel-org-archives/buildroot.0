Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C02BC352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5F9881E29;
	Tue,  6 Dec 2022 22:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F9881E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYo-aCPWoj06; Tue,  6 Dec 2022 22:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EF7380C65;
	Tue,  6 Dec 2022 22:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EF7380C65
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 206F01BF39E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFE8340904
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFE8340904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxnYrfPK_8d4 for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:17:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1EEC405B0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1EEC405B0
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:17:41 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h11so25491237wrw.13
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 14:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZOMy166vH24b6RU/t7ZxU7DpXOiTAF3EgUfcSi1yqS4=;
 b=yt2hctloHD8ohHucX/i8z58WmJK/gDkeSYgf5sDlIWYbbiZqqCJgpqVXZk1wELO3mt
 tRk2IYEIimCJENZey4J9ED+HLe9suXNTMii0DO4jGZ9auLM+vdHrgyuxCS0bTsUaF0WM
 BFdCTLtQMskUWt/s4G+UDoUXQp4oFt1yF5li3Rys/ZLaeNJuPKe+qkLsQ3U42Xhw+Jrg
 GjNQ9KKUzgUyYEX8Cw8WSDQdGuxJUj3F1/j77gxaErVDBHx1G7CuRYvYJIFxwUPSNjDF
 ItXYWQLxMGdvvsSw6ua/5S1uy8r41pk/RlO4o5zImDBSghbDUJTMml+VozlzAE+4M/se
 pIiw==
X-Gm-Message-State: ANoB5pmul6Gy9IdqQmLbJeQ3lWBElbixmR/y1RJTgvNyWY7ayEUoCOGB
 rMTdUiB1h0gwSRInFoZHFNW7IB7wyCc=
X-Google-Smtp-Source: AA0mqf6umdl1ivEl2vg7FHvte+68WkZ6ecDbPRhxhYEjmPb0Pq+TavcvXRCgTnX0wqd942pxqOOOHw==
X-Received: by 2002:adf:f3c5:0:b0:242:5caa:5fbf with SMTP id
 g5-20020adff3c5000000b002425caa5fbfmr7464397wrp.300.1670365059823; 
 Tue, 06 Dec 2022 14:17:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b00242710c9910sm4700278wrb.8.2022.12.06.14.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 14:17:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Dec 2022 23:17:35 +0100
Message-Id: <20221206221735.1359325-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZOMy166vH24b6RU/t7ZxU7DpXOiTAF3EgUfcSi1yqS4=;
 b=n1OQabwkv1qMlQ4F5NFiPxty2VWPvmLwxBHqJUEMu4SATFydlQB8wVVYP9unAaoTVG
 LnAuHZnK05EZKfUpqI42R2dcsq6h0VfdZ6qyJjxY6QFCvF1TN+EQT4VZnU7NY+K/YB/2
 ehm3TO6ZwBD+ppYP4dfgYLUNpVjYTQhbPuxossTJJxFpy98qCfQdv5dBwj64nROTF9YW
 62EqaJAuxr+YuejWzpqvLXHTTDtauy9+gNQXOW/GSf3EWBSMnSp2pEaFY+focj9Lk5us
 UoIaegmosO0chSrd1ulQntI6QwWWTGh8GufYo9+JgUaNXigwVhMs2y6OgxmTgX2KoyHe
 BH6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n1OQabwk
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: bump to version 2.88
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2022q4/016767.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 78127ca714..fd015d38ac 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.87.tar.xz.asc
-sha256  0228c0364a7f2356fd7e7f1549937cbf3099a78d3b2eb1ba5bb0c31e2b89de7a  dnsmasq-2.87.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.88.tar.xz.asc
+sha256  23544deda10340c053bea6f15a93fed6ea7f5aaa85316bfc671ffa6d22fbc1b3  dnsmasq-2.88.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 46a40c4bbb..3945e4256a 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.87
+DNSMASQ_VERSION = 2.88
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
