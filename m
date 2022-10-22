Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91218C04A95
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 20:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A2AB4015A;
	Sat, 22 Oct 2022 20:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A2AB4015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhnvKTDiS1MQ; Sat, 22 Oct 2022 20:53:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 784FF4013B;
	Sat, 22 Oct 2022 20:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 784FF4013B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5782E1BF3BD
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B64781D18
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B64781D18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52IfE2FEnWDo for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 20:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5EA281D16
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5EA281D16
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 20:53:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so7464188wma.3
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 13:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1wD1sydAkYcGT3HszGWlaZHU21C6kLW0raZgav1VzDk=;
 b=1j4AOZUjlGn0hY+dt14QHK3pW5lyXsIYYov9IAI0IEkn3SxTyGQEbO9TchYYkSK/7o
 bv03rvFY+OwVZMfTqTZJsTsy4iwjhBqFP5IM55dKlH0V2xv3Cde8lwxEVGy4gjUGh4Ah
 wCeYXBV44uaKGw0BYSa8BotWEARiuY2zsaYH//Qb2SR2nEGEHytx/+JqBjAWi1bP50bY
 WHEhRHDghN8d7aeJhIPf1v+iH87qyHPUuHUk+CLNo8S+cevI69OY55WEwcATAL9TTx+J
 kKer/eKs6AfblaLg+GMHRVv3jlLxD7CKIRtw3CPGlLWoH6fYyYNGQ1Ttzw6L5Z0z3nxa
 7cZw==
X-Gm-Message-State: ACrzQf0CngI2xE+HEJlTzg8Uj6H6l+TOGX+pcUjfgoqw/RGSfgCTYsaI
 V5V/PTxySCq7SAvwsSDiIGLnr/YZFh4=
X-Google-Smtp-Source: AMsMyM7ImMnNrUv0qNpEvQjvNxw31giPDo5En9V0Wwa0mahOoZWh8VNahk/Znh3IrVHwPMjXHUtPjw==
X-Received: by 2002:a05:600c:354d:b0:3c8:4b2d:f3fb with SMTP id
 i13-20020a05600c354d00b003c84b2df3fbmr4672776wmq.188.1666471994642; 
 Sat, 22 Oct 2022 13:53:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c3b8400b003b4a699ce8esm3879618wms.6.2022.10.22.13.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 13:53:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 22:53:11 +0200
Message-Id: <20221022205311.152019-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1wD1sydAkYcGT3HszGWlaZHU21C6kLW0raZgav1VzDk=;
 b=KAEfeOXV4bXO2YssaWy6Io3nn+mUWeNJPWHnOXcnLtNI5fQvtNk944sax0FzowqsWu
 ZHWxrU8Ljl1lV3zjO5DUjVqHuZKHqj6aJVwjCtc25O3uPNJ+LSzOVHRJaayUXkoMxLTH
 l0poe9iQf5/GOEcpjkFfR4ES2cxvR2Qp5eLgttSXIGC4YX6VcfiNhNe4Ivv2+RLAdqPm
 OWOFjF5Y7HxvI4xBo9iZEAmb7550alMtuFUjY4Fuh79/r5SmDLUUp4y8bc1Yem6bmBSI
 99aGRDNQQTGstGJBX5kGEyYFPX9jfVFX0J5TWhkUw6T5Nuj7Pl7LkOTF210tpGYOS75+
 u1lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KAEfeOXV
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.5.14
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 3b5bbee23d..fb140fa198 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20220408T031931Z/pool/main/w/whois/whois_5.5.13.dsc
-sha256  62e613f116d5635aea6684238db00b030a6602ffc79462e4a0a8e62cb184b5d7  whois_5.5.13.tar.xz
+# From http://snapshot.debian.org/archive/debian/20221017T031443Z/pool/main/w/whois/whois_5.5.14.dsc
+sha256  bf9c2cb307d5419b34ad401eecf2820b8f69660db41cf0762e5da71fa2df68e8  whois_5.5.14.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 42a9e83954..5a85bea358 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.13
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20220408T031931Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.14
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20221017T031443Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
