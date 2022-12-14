Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01FEC46467
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 22:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35E2481F89;
	Wed, 14 Dec 2022 22:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E2481F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfk59jjwNzuq; Wed, 14 Dec 2022 22:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B8FD81F83;
	Wed, 14 Dec 2022 22:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B8FD81F83
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEFA1BF425
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15DFF416D4
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 22:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15DFF416D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KipyOJD17__M for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 22:20:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD9D041558
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD9D041558
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 22:20:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o5-20020a05600c510500b003d21f02fbaaso470297wms.4
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 14:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1gr+98GIcSUcgOafjTrXyplSSqIrydK4ushGn0zy/O0=;
 b=vQeod3KlHKyXmlp3Rfqt4Zl+YFjlPD44bb4am1Uu8LBXQ1YUxArDRY8hWVFF4s4cnE
 wEICoXGY5sVjSk3LkqPlcOwuKxNBJjJ3BiUMrHvYivWWokS3rVlJuxOa9xGuBbBis+Wb
 9uSebvLJ+m0adg5LDcTnWBuSaJCaQ0ta5a6aNNG8pO+BdHJ61OhCBc7kWRNVDiqRtLa9
 2PGL3a/hF1meJI895Rsfr+rQYvLprU/vzUjXMpDPrTzzYaCrB4qPg+MMW5i/KSz8gh5P
 3E43strM9pOkWeiEWJgnSIUsnXdrgNYZ4176VaNiWQeUJOJFjQpFms+N8OGibWW4wT/i
 aaHg==
X-Gm-Message-State: ANoB5pkRZLMFFOyrI09UkfND4BUgLPGOXHZ5Soalh5U7349I8/ku9KwT
 EXDsmxyLvPw3alBfrENHOKOezreXWlc=
X-Google-Smtp-Source: AA0mqf4VYUjie4xqsB9ocJwrD4Ale606Fmm4cFpCrAbeIN11QufUM4tokrWBtAXspLNdqM2xI/2T2Q==
X-Received: by 2002:a05:600c:3496:b0:3d0:878b:d005 with SMTP id
 a22-20020a05600c349600b003d0878bd005mr20094316wmq.41.1671056416636; 
 Wed, 14 Dec 2022 14:20:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 iv19-20020a05600c549300b003d09150b339sm4927818wmb.20.2022.12.14.14.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 14:20:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 23:20:12 +0100
Message-Id: <20221214222012.8019-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1gr+98GIcSUcgOafjTrXyplSSqIrydK4ushGn0zy/O0=;
 b=oYTLXuPWe0Z7dI2+Vz5JKwMYuWC038vaONwFmYP74NwQIO5j+8KZzi6tW7ydg73WLO
 TX+CVn3Ju9N6GdpaNASY0e+GBLNL4VMHti43nRapW/3ph6I88rqw7nUf6wHxrJGHj/UL
 avk04HxFDMwMug3XiFqYYrEcKmfRduEFxskHiSshzYyL9l6KwwTHYo8/6jRKNqeb2Zj3
 spu47W72LSES8cVLgN3gWBfSUGDRETOzCLHNkpKIis6Y+M9e2cNEfKd6i7vZpDuO6bqF
 KoEXUuOzPDkXFKlPVE0Iu65cQnkDp1jBTE/a2iAEoUzmBvBrxIUM3uW7vsObGwaqesjj
 X+UA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oYTLXuPW
Subject: [Buildroot] [PATCH 1/1] package/arp-scan: bump to version 1.10.0
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

- Use official tarball and so drop autoreconf
- libcap is an optional dependency since
  https://github.com/royhills/arp-scan/commit/923f123a281139f1ec3daceb1db4bc7317ec6978

https://github.com/royhills/arp-scan/releases/tag/1.10.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/arp-scan/arp-scan.hash |  2 +-
 package/arp-scan/arp-scan.mk   | 12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
index b18c6ceb38..3a2977f906 100644
--- a/package/arp-scan/arp-scan.hash
+++ b/package/arp-scan/arp-scan.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b9b75ceaef6348f5951b06c773ec7a243a9e780e160eafebc369f9c27f6a7d3f  arp-scan-1.9.8.tar.gz
+sha256  a078fe8711ecbb8b99121c3d8be26ae7e7f339f11010ef61318be4f33394d012  arp-scan-1.10.0.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index 73d1b99bc7..89644be9d3 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-ARP_SCAN_VERSION = 1.9.8
-ARP_SCAN_SITE = $(call github,royhills,arp-scan,$(ARP_SCAN_VERSION))
+ARP_SCAN_VERSION = 1.10.0
+ARP_SCAN_SITE = https://github.com/royhills/arp-scan/releases/download/$(ARP_SCAN_VERSION)
 ARP_SCAN_LICENSE = GPL-3.0+
 ARP_SCAN_LICENSE_FILES = COPYING
 ARP_SCAN_DEPENDENCIES = libpcap
-ARP_SCAN_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
 ARP_SCAN_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
@@ -17,4 +16,11 @@ endif
 
 ARP_SCAN_CONF_ENV = pgac_cv_snprintf_long_long_int_format='%lld'
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+ARP_SCAN_DEPENDENCIES += libcap
+ARP_SCAN_CONF_OPTS += --with-libcap
+else
+ARP_SCAN_CONF_OPTS += --without-libcap
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
