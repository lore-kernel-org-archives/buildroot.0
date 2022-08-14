Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AD4C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 09:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7E60404BB;
	Sun, 14 Aug 2022 09:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7E60404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJd3LoJJEoTf; Sun, 14 Aug 2022 09:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1027C40497;
	Sun, 14 Aug 2022 09:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1027C40497
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 284CE1BF361
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 09:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 108F4823F6
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 09:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 108F4823F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6mIeS7h5C9z for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 09:06:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0787181D47
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0787181D47
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 09:06:45 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id j8so8891476ejx.9
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 02:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=upuScxCPlFxTxFL/fjAYz4+j1DHSFCN9Xp94dRwR0eY=;
 b=eWsg5GxUE1eB0R13K2jAsuBiRvk+mYkqra+FNeIyTRniE2PStnsolbJnNwFGM+guf9
 P9itBdOwTdQxVOtaVlE3LATACSUQ2S8PoDfWKC+wZvHAxbZP7kOcCRT+bZJF4iYkJRjs
 /4UOtJsXmVuOQFvSAB+o6VSFCSq1Mr0V4uVIb4AET9F6EbMESvQmaHp1MRpS5sPfJHyo
 D7oRtp3MJ02IsfwE2KfvyJ07cgDvlbhEvZnsd0q4brA96KjbxMPL3fQuvUZZ1bPvTDVR
 0a0jg/B5YlsGVibA0n/fe2Be49qtFTSycHIp7h6yTNaAelZtId4Zju6O2+gBTckNs5hv
 E/mA==
X-Gm-Message-State: ACgBeo0NxCfu86Z73fnu3bcTiTCMUPMdeQ/bMw0M3PB9xwORNudpUb8W
 GZjufNaDlA0a7Hom7plvN4Z57GrH/U8=
X-Google-Smtp-Source: AA6agR4xELK94TKlLPGIYbrAkZ8bADY+TSXCzIydFLt1ZtXPzpkJYgHsRdMQ71/+LMgg0h14RCtFiA==
X-Received: by 2002:a17:907:3e17:b0:731:56ec:d8 with SMTP id
 hp23-20020a1709073e1700b0073156ec00d8mr7321233ejc.447.1660468004103; 
 Sun, 14 Aug 2022 02:06:44 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 ss28-20020a170907c01c00b00730a18a8b68sm2732565ejc.130.2022.08.14.02.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 02:06:43 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 14 Aug 2022 11:06:39 +0200
Message-Id: <20220814090639.1226553-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=upuScxCPlFxTxFL/fjAYz4+j1DHSFCN9Xp94dRwR0eY=;
 b=Jq2Zopp0CVqBTezJtZ7AL3sGbO3wdoES1RqFkrQOoDQnspFrb5CcMjL7pQfO1l75cP
 +wVGqbxnfGmFRCmQ92GUgLFlv3hZakRtm45HWCJWR1Fzq+DSscNcTf/NTCdxGOdJwrKN
 ylUzDRRox7El6B8tB0KxLf4HRusmqPK3xH8C12z9UyaxXuOg8fMlgrBdadDS5SfU5a0A
 8mZdi/oZs13AsXHQAyKSb9lmBS/lzNdTnClGRHl2I7dnmsWGEkDUQQnIJ6M2x1iBGC+U
 74XkxWQgQJMfMRZk7ih0fOTHQwtiuJhD+TJWRWYLN5XVSW56T68j/boU3lm8st1t8txV
 EFMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Jq2Zopp0
Subject: [Buildroot] [PATCH] package/gnutls: security bump to version 3.7.7
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

fix GNUTLS-SA-2022-07-07

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index ff191278c..46dd99291 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.6.tar.xz.sig
-sha256  77065719a345bfb18faa250134be4c53bef70c1bd61f6c0c23ceb8b44f0262ff  gnutls-3.7.6.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.7.tar.xz.sig
+sha256  be9143d0d58eab64dba9b77114aaafac529b6c0d7e81de6bdf1c9b59027d2106  gnutls-3.7.7.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index cd2c6b45b..56dae4c6b 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).7
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
