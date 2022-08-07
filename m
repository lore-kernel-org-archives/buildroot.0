Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBCDC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B06E8132A;
	Sun,  7 Aug 2022 12:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B06E8132A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K16dMMEfIxpQ; Sun,  7 Aug 2022 12:41:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F1168131D;
	Sun,  7 Aug 2022 12:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F1168131D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 314D51BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1958D81329
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1958D81329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eo-UhyGtvc88 for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:41:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5E638131A
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5E638131A
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:41:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z12so8080343wrs.9
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 05:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Wem0KtF2iRJLSKQZ2ow5j2FoxCaYQgQDL80Kx/aTdC8=;
 b=rj0fLQfTW44ScsRLcgKJ7TWp/EXmI2MDlSCH1zGd09cODGdxQSsmUVt1Oe9Y2HZlkc
 7o5Sxd+7h7E+efzgkmJDDpT3QRgQoJKSxS2RsV6X3sT8ChjI3yyNQ1Wh1Q9DlnSwqWxt
 3BtVnw6E3+aaB+3+zC5Jm4F6hNRYC39fBqBEECVnsdQRRnrtkPE4zufiuPKFyz36ItQp
 /5hVME/crpbeXpJjiMNICpCyabKj9FDfwMRIZW3vwvuMKnXBDCIps9a7CFT75ZhRzdY9
 IkOp8JARldsKD0NF+zYXkzuZ1PXVQTjFyoqGggBDUhHyxhntMwCCbXuTnnoQFYdNegRb
 N13g==
X-Gm-Message-State: ACgBeo0L8L2B1lWOkXbU7H39KxLjDzMmMUtI2oYJWfy0wjngQ5Zt73d+
 JUySLYHHPUx4i3ea+Fh0YWEmeJK0DOY=
X-Google-Smtp-Source: AA6agR77XJRqWC23VgBY8GB9XdRCQ9i5QQGgOXrFwXUPRegozTrRt+aVDzNuA1RkbxqvKMLwc0yccA==
X-Received: by 2002:a05:6000:1888:b0:222:c96d:862f with SMTP id
 a8-20020a056000188800b00222c96d862fmr1311104wri.706.1659876068902; 
 Sun, 07 Aug 2022 05:41:08 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v128-20020a1cac86000000b003a327b98c0asm10810560wme.22.2022.08.07.05.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 05:41:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 14:41:04 +0200
Message-Id: <20220807124104.3750685-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Wem0KtF2iRJLSKQZ2ow5j2FoxCaYQgQDL80Kx/aTdC8=;
 b=KzFIvNsaSGLZT2E7ohpG18zAMdVcyiXmpyImrYXSgS5MzLqZJjxFCI5DZw/DltTHPd
 V/aFuw3S9djjhvRMmm7iEn0Fa5KZjkzzyB0fMtHwS9xySkjKPEhE4vzroId1+5BgmlNR
 XM+FdcyM5oqmOMs/EpkjYIjsqjN6PtVuA2vVeVGN9INNx42loMcLNY8fzt0yWwlcUuAe
 68bGUVGA3aodvyLwTQfig8VS1RMuOZ9Kmo/6g5D3GYQiVmd+X0Wp51bHS/0i196KHhMA
 TGTm22IkKjmCuq0ZpSh9iJPRmOFVCqtCEH4W2xLmTuWDSjeidW7z89laTkKxUw/7OiJr
 eaEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KzFIvNsa
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: bump to version
 3.2.0
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/freeradius-server.hash | 4 ++--
 package/freeradius-server/freeradius-server.mk   | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
index cd0281c478..33ec09e7b0 100644
--- a/package/freeradius-server/freeradius-server.hash
+++ b/package/freeradius-server/freeradius-server.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking
-# ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-3.0.25.tar.gz.sig
-sha256  4883a68bb3cee46025359a97c1691ce655e8babfd6dc3c021d00e109a2ff4c10  freeradius-server-3.0.25.tar.gz
+# ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-3.2.0.tar.bz2.sig
+sha256  a3071cd78ffcb4706217561d822ee4c760daeb277a63f36a9f11d412c3c39e56  freeradius-server-3.2.0.tar.bz2
 sha256  0a0e46014fc2efd5144a30359c0e6e1ea9fa3dd407d3318204150efd7b4caf6a  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 4c526d2342..65a72ab532 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-FREERADIUS_SERVER_VERSION = 3.0.25
+FREERADIUS_SERVER_VERSION = 3.2.0
+FREERADIUS_SERVER_SOURCE = \
+	freeradius-server-$(FREERADIUS_SERVER_VERSION).tar.bz2
 FREERADIUS_SERVER_SITE = ftp://ftp.freeradius.org/pub/freeradius
 FREERADIUS_SERVER_LICENSE = GPL-2.0
 FREERADIUS_SERVER_LICENSE_FILES = COPYRIGHT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
