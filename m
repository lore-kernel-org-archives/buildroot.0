Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6D7C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 22:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56B9760DF0;
	Sat, 15 Oct 2022 22:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56B9760DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iY5y8-Uxyjk0; Sat, 15 Oct 2022 22:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E4DD60DCB;
	Sat, 15 Oct 2022 22:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E4DD60DCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 698911BF35C
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 22:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 449E060DCB
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 22:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449E060DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQXogrko3mSr for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 22:26:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D7860D9D
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36D7860D9D
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 22:26:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j7so12881755wrr.3
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=96ELJqZCUxwjkaZrFZ+oYPLbF0wYuhu1+S5m3NLTbGg=;
 b=pd2KYeTtXpysV9Ij4cwSG29l2bF+2bEJwp+s9pCBHXZIk0FauTAVAiUPP9Jhg9jMzL
 EaZa97SHfu7Y/4FUlbbzPiUqASm3jJoDbFKN26kMpXBknNbgqM/aG5AtFEDoeHB6yl21
 YVvvq/Zti3AE8b1ONuHhihuTrCUrbdYM/AegAuBpuCsJ8xVA7AAN22pWTbxi2BjDWFVu
 NBAOOuW9EOPLEu0cWjZzkUyMBsW9mHqrgLcBXkLpJpKMEhyn363g3L/JvKXEf6dHZDJS
 raihSTTlLLMvlkknQhBSFBxsBj89Ia3E5Orz1i5OZXECp3WZ/6xBZAMATd5lgm97JRiA
 Iy4g==
X-Gm-Message-State: ACrzQf1DUA+/EdeUXwxPiKWm5C7eATMeJbjqAgPfE1tHqS9pYEkXb2vE
 fiXzWlUg0UblqygLjlnkCvIhZ/aLG0U=
X-Google-Smtp-Source: AMsMyM5lMvQrXaYFoGPFAyEQWHAPbXj7D0LNtiADJbuW+Cc7/WwS/iD+e5qcpCbUVaTiAV6blTuCuA==
X-Received: by 2002:a5d:59a4:0:b0:230:eaa4:88d7 with SMTP id
 p4-20020a5d59a4000000b00230eaa488d7mr2477146wrr.35.1665872770117; 
 Sat, 15 Oct 2022 15:26:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b003c6ee9e254dsm3177428wmo.32.2022.10.15.15.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 15:26:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 00:26:05 +0200
Message-Id: <20221015222605.171104-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=96ELJqZCUxwjkaZrFZ+oYPLbF0wYuhu1+S5m3NLTbGg=;
 b=kANVLyRjAhJAU7nA3hghgGQESvkEOG7RozC29m5Ds3OcJVpyD/pSrM+2UGkfoDcb+z
 P/MQM3ZMv1nbW+u0qDSR6SyZFyLALOrf4fHle/pzMPV5rKN9gKxb1K//+lUlKaLsuBBW
 Imuuk6ZjdBkHvkNnBjvE9QfKqyk0wnK+t203v3KahWMfItc6XjiLWMx2NpF0DCruaCTP
 BY4529D038y37vAbEWuFDaEMPssEjmNWz50VFmx4xIJ2+jqLYwfIkrhHEBR4K+cStGh2
 c31pGW1hSMVvPzYZR8hRqxF4udeQkQ9NRSYV0KKV9WJ4F9lfE02sfglNpeB/dhbaZwr9
 NrYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kANVLyRj
Subject: [Buildroot] [PATCH v2,
 1/1] package/lrzip: security bump to version 0.651
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
Cc: Sam Lancia <sam@gpsm.co.uk>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2022-26291: lrzip v0.641 was discovered to contain a multiple
  concurrency use-after-free between the functions zpaq_decompress_buf()
  and clear_rulist(). This vulnerability allows attackers to cause a
  Denial of Service (DoS) via a crafted Irz file.
- Use official tarball and so drop autoreconf

https://github.com/ckolivas/lrzip/blob/v0.651/WHATS-NEW

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop autoreconf

 package/lrzip/lrzip.hash | 2 +-
 package/lrzip/lrzip.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
index 19295383c3..cb03ff07cc 100644
--- a/package/lrzip/lrzip.hash
+++ b/package/lrzip/lrzip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9b6b4bb1ae76dafbaab96ec9d50d41af5fed45a6c4f2e06feea828c2cd8025c0  lrzip-0.641.tar.gz
+sha256  48bd8decb097c1596c9b3777959cd3e332819434ed77a2823e65aa436f1602f9  lrzip-0.651.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 27d9fde204..0375696414 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LRZIP_VERSION = 0.641
-LRZIP_SITE = $(call github,ckolivas,lrzip,v$(LRZIP_VERSION))
-LRZIP_AUTORECONF = YES
+LRZIP_VERSION = 0.651
+LRZIP_SOURCE = lrzip-$(LRZIP_VERSION).tar.xz
+LRZIP_SITE = http://ck.kolivas.org/apps/lrzip
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
 LRZIP_CPE_ID_VENDOR = long_range_zip_project
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
