Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51D8ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 21:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3063A60BCD;
	Fri, 28 Oct 2022 21:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3063A60BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vewlv9yywFvx; Fri, 28 Oct 2022 21:15:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B09660B3A;
	Fri, 28 Oct 2022 21:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B09660B3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA2B1BF855
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 21:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE23560B3A
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 21:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE23560B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nViDu5-qlH95 for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 21:15:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBE7A60760
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBE7A60760
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 21:15:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j15so8145309wrq.3
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 14:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pkWNkRz/QErRpq8aYwDPu6O/5UbmWZ25mpsWMxXNlDk=;
 b=2xPDcFMUzPjzasq6MMdAdfLek39W8q3Ynrwm0Ulkr7Siu9pPvr+I1lJydMfBftLyNy
 KZD6cY1KTeYogVAvGDVPE+DemGD5V5Qxnclcvzn9TW326f7RIQPkDB8FBdagnCeG0sNP
 XJMl11Mxdm4GaOl607yqi1kvprGObyAnZDvd/NRLSiL2LeV0ZX7Rh232FEu/nKQlYBHB
 oySDe3IiSwvKL/UZ5AD6c9Lg90uuIHQdwFevv/NrnHFvPrchj1BvDrHR01eAPcpwKGoU
 z/8GIG7tfsbdJzGV6/BqHSfC7NWimtffcTLVQySFya/0rrOPY/nZeV2o1NS2QlJj449k
 fIyA==
X-Gm-Message-State: ACrzQf0Apc05ad6cRbOASmQmtx6zl6X9ICjlFLcC7E0ugqmbJ6zxS5kn
 oESNga0gz2aA3yGcWdLBHAfMmygPpZ0=
X-Google-Smtp-Source: AMsMyM7G5/MJ/RrOlREPT9aEZU7PdlpUj/7vf/Iosc6+OTVRK3kDd3yM1xFfZO2wnSfeX67kqMpC9A==
X-Received: by 2002:a5d:4fc8:0:b0:236:9c57:248 with SMTP id
 h8-20020a5d4fc8000000b002369c570248mr680086wrw.193.1666991751219; 
 Fri, 28 Oct 2022 14:15:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d58cc000000b00236705daefesm4395910wrf.39.2022.10.28.14.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 14:15:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 23:15:46 +0200
Message-Id: <20221028211546.220832-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pkWNkRz/QErRpq8aYwDPu6O/5UbmWZ25mpsWMxXNlDk=;
 b=leP+b8V8A2JqDRiGRUfMroTRDdpdRz/Ylmg8zie7l3Za4+BPR61SW7h/RWj2lcbC6u
 71O20VdfzPbOFoEW59wfliowHcJl1Bq64upv6oNvF0LrY35tbwh7yyrfK05VTkBM4/v6
 +uDbewfT1iRWdkn4P8V9SrEWf52EBnjgTbUE5OeGSsHGWuHS8J05xS05BrTsSQv/lyNx
 LosFuX5OxPisBLH4cHZ7vEAmD7MYoXQL08InHa1iJ3rkyimNqGJNXylQeOmhxWnVFTWl
 g+8AIxqs6H94zSZrQhxmWXL8+F4ONNJ0meAZwsTOsqLTkhNuKpuGAwjPw9Tsf9vjzGgE
 ddNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=leP+b8V8
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump to version 1.9.9
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

https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 340a9edbea..4326822e41 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  502d80c557ecbee285eb99fe8703eeb667bcfe067577467b50efe3420d1b2289  pcsc-lite-1.9.8.tar.bz2
+sha256  cbcc3b34c61f53291cecc0d831423c94d437b188eb2b97b7febc08de1c914e8a  pcsc-lite-1.9.9.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 34950dd866..0b92380ccb 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.9.8
+PCSC_LITE_VERSION = 1.9.9
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
