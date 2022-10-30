Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B28FC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 09:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 888E84028D;
	Sun, 30 Oct 2022 09:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888E84028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGR4z-gJ61r2; Sun, 30 Oct 2022 09:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF3C1401A3;
	Sun, 30 Oct 2022 09:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF3C1401A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB951BF336
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 09:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 550A081297
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 09:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 550A081297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1h-8jq319FB for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 09:42:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4185D80F50
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4185D80F50
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 09:42:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h9so12142323wrt.0
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 02:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iFk5ZsNXL8oTiM34kJG8ca1MyLctkWAbtQ4f9HadSm4=;
 b=aNkVB6ymX/kwEe7I6PIMj9WeEPKYgC4is9e5vTrZlAlxBi6PRDakwEBHr5NHlYqmxx
 ixUeNLi+p31xT+3/m3ANjb8lIP0O1TmXmm2oXqL3RmpwOWRE0tRY3enpvmEdOGwYLuHD
 IQuzVORzcUTeGiiCbIt33SZMZMvkegMlvM6nZVno1lVuJsdisXv/zusniCxswqvnjvPy
 fUxXy/EIbe7gEv2MuhNGO/vD9wJBd1ACv1QsvvFN5phE0OOPq5HpPoZmqjHkQ1OQ3SiF
 qScpmt7LC/hpCiWxy62UzXkJ2qmVHBtm+fuR3FG/j0BBb/beWx96ifQV0/t7bEhAX5KC
 IsMQ==
X-Gm-Message-State: ACrzQf3GqztH7SCbAgYg85lx2ETCnr+UQoWutslHzbZHf9R9lOj1DnfM
 H4tsBq6whukIcdSb578mKW+hmMW2+Tg=
X-Google-Smtp-Source: AMsMyM7nQD9y6gXk71l9RSWVKmXXHojc4NLGfiXN76nb0utvJy8xOYPqOTjx+8OP4kUbwuhU2Gf66w==
X-Received: by 2002:a5d:4303:0:b0:236:c6c9:2c4c with SMTP id
 h3-20020a5d4303000000b00236c6c92c4cmr734730wrq.630.1667122937091; 
 Sun, 30 Oct 2022 02:42:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 s4-20020a05600c384400b003c3a1d8c8e6sm3914742wmr.19.2022.10.30.02.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 02:42:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 10:41:55 +0100
Message-Id: <20221030094155.53225-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iFk5ZsNXL8oTiM34kJG8ca1MyLctkWAbtQ4f9HadSm4=;
 b=h4BLYmsnP7qg9FoOjv3BVI5Um/wHGybIoF4a0sn3g1kQNbUKaGD8aTNhzW2ECELyTY
 WZkUKvvIwTkPQULFh/gwDTk1eK4nK9XYqVruRAbVEIVYYzUV3o0smwJGZw0SO0d3swg3
 dQZsgDhrw5AdQRidntC/Pud3Xxa0xbF4sIiL4wvBg+eVTHhqdVr1fPGMtX0ifo/fyDbd
 aNE/tieEpFNTIjpCgT1uVdjG1DoPDmYRI3hr0J5wVWUWGEn8KsHxB3EdNoIsKPCo5+St
 NzRQFx0jmDrFcoMBJtMN35s4E7xPgyTFdi8TTeMHs6jyL1Z0pXfIh4UYsP68q+t2DVYJ
 VDqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h4BLYmsn
Subject: [Buildroot] [PATCH 1/1] package/libmodbus: bump to version 3.1.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch site to get latest release

https://github.com/stephane/libmodbus/releases/tag/v3.1.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodbus/libmodbus.hash | 2 +-
 package/libmodbus/libmodbus.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index b676d261de..83b0c3a012 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7dfe958431d0570b271e1a5b329b76a658e89c614cf119eb5aadb725c87f8fbd  libmodbus-3.1.7.tar.gz
+sha256  b122f2bc29f749702a22c0a760a7ca2182d541f5fa26bf25e3431f907b606f3c  libmodbus-3.1.8.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 46eb860392..2f8c1735da 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.7
-LIBMODBUS_SITE = http://libmodbus.org/releases
+LIBMODBUS_VERSION = 3.1.8
+LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_CPE_ID_VENDOR = libmodbus
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
