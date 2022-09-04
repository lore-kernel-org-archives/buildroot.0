Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E204ECAAD5
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 21:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE380813BA;
	Sun,  4 Sep 2022 21:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE380813BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tQ6HCmxakqmm; Sun,  4 Sep 2022 21:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E869D813B1;
	Sun,  4 Sep 2022 21:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E869D813B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1F71BF35E
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 21:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A7DF60E73
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 21:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A7DF60E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ami19FGXzGcQ for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 21:11:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 038F960DE5
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 038F960DE5
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 21:11:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bp20so8496451wrb.9
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 14:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=P+dhMjIGBRZflLgCM582NCXNwonhCBju/eGuCEpODVk=;
 b=WxGZ5ftKdkm7cBTYmNU2KgmbOd4YKC0Paf3CWnPRNOzpumrPviAZiyw9Xd3vuHfAn5
 NUB447KrPo9ilOXS+3/B0IANJBNHwyWHAxwdZMktmz8ZlwgyNWWweYbaTqYg7MnXT2Bg
 HHZNMetRrWzqlXtDyYzrV7RCfXJxXzfefZHS/SFgW2IRQGV4FClTwy6pYsFJnjHkloY1
 I8RNpa34XkxcN1tPGW2/Kl01Tr3JFEAWQTtJ1e8zw6JoF89SBtbZLNOXdr66pNF2qTvn
 TigqCTBka1h/qnyE3i4Y8e1hbXtyesMwwRKQWiS1D9haw5OCR3m58zrwrLxbmsUte1Tj
 k+GA==
X-Gm-Message-State: ACgBeo0/qeNNybf26EhMDwbow642dvrg7Wzi8uM3ZP6/NjF1LCWf72gV
 V4IZupGyFW3G3kmnM/KlhgYtZebnvdY=
X-Google-Smtp-Source: AA6agR6IG6nAM+nIpaLa7VrBcL63uJm24BGYVLZWR3nnF8vIt73GQ+RbIkWz+nTey8hWvMXKkkORJA==
X-Received: by 2002:a05:6000:178d:b0:226:ffe8:72df with SMTP id
 e13-20020a056000178d00b00226ffe872dfmr7782168wrg.496.1662325880876; 
 Sun, 04 Sep 2022 14:11:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l16-20020a056000023000b002285f73f11dsm5616644wrz.81.2022.09.04.14.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:11:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 23:11:17 +0200
Message-Id: <20220904211117.218817-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=P+dhMjIGBRZflLgCM582NCXNwonhCBju/eGuCEpODVk=;
 b=Xihh2WGuMsPGabPJRtwBhfYmt+m4FbNmjruLt+L4Q1sULp8yLbj7INjnxYLWRz0aq4
 HKR4I2VS7D1+Qch2gzZhn+gOz4+5oEu8qInOBPX1U1Ux+CAnBD+Rq5UhimZ6mb7qABKH
 qwyvFESMs8EEvLS3M6K2oCPJZ+6uPbOZk7jp/LeJUlJJ7e5fO0z2jk7jIDMmmWfge6wb
 V203mpYhH4AA4SL9Jn3K1xEONYt4ejXADgStgMvbAs6VHgm6X16aVW8B+1776nuUuC48
 aeecy0EIJqZ245iRP5tjFt1kYTeRwdfm880o1cg0wiDZ/LVXrG44k/nNhguAF0mMurCp
 M66g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xihh2WGu
Subject: [Buildroot] [PATCH/next 1/1] package/minizip-zlib: bump to version
 1.2.12
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

Update hash of README (version and year updated with
https://github.com/madler/zlib/commit/21767c654d31d2dccdde4330529775c6c5fd5389)

https://github.com/madler/zlib/blob/v1.2.12/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip-zlib/minizip-zlib.hash | 4 ++--
 package/minizip-zlib/minizip-zlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
index 4d2c5c29d3..e6ca974e2f 100644
--- a/package/minizip-zlib/minizip-zlib.hash
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
+sha256  7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18  zlib-1.2.12.tar.xz
 # License files, locally calculated
-sha256  7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15  README
+sha256  fc2c3368901700f0acdeb1d8afeaca5923296768ec6824ecdf627aac396001fd  README
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 935877678d..ec0c3da7d6 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_ZLIB_VERSION = 1.2.11
+MINIZIP_ZLIB_VERSION = 1.2.12
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
 MINIZIP_ZLIB_SITE = http://www.zlib.net
 MINIZIP_ZLIB_LICENSE = Zlib
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
