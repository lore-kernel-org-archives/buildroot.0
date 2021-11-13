Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE8FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:04:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEBD560FE3
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEBD560FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6D2440154;
	Sat, 13 Nov 2021 17:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wef2t5AKALGn; Sat, 13 Nov 2021 17:04:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C43C240282;
	Sat, 13 Nov 2021 17:04:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 912A81BF299
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B0844027C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:04:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcXKAoNXjmNO for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:04:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B36C40290
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:04:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so9054002wmb.5
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jv62B0ycEFKrvw6l2KUcSqTZ03HSQUqsePbq9zmZcSE=;
 b=drVGs7HqNRLgJAdFfrxgDU9UOIDgl0aJ2E0qeqEIK5w/EVgEUNj26JDneqUOLO58qB
 Q2YkiMseahHVGJLstU3u8glw2JqbO2R5Xw3UVXhD6IVQ9NlqdctmAvlifrH2iBVnZ5sJ
 dLyGyP1KRL4/WenssWZl5xllDrHBa1bBLJmwboNmPEDjps+rtw8651wVcO6snSXx4l8G
 /lCzXJCTP3PxUBiJQWx9cuf9PSTchtGdkE/aE9/VSa7w/bbfcRrGxHm9PFrlSvEtqR5/
 W9LIk/wje8dicCOZRHzAWDcBL48rvNcg7O67neMM0HeVRLcZWI5EetD57TRjaKu35ZQT
 Gyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jv62B0ycEFKrvw6l2KUcSqTZ03HSQUqsePbq9zmZcSE=;
 b=cgC2FNAr4gf4BgIWQkDJGtCAkehd+5xjyGN94o0GgdtE5UG7sm+tpzf440TM8q4f+2
 tldtkfVFDzJd+2TMB31MH0x8ZS/TQLyUT68gxaFB4cFGXMJo1xh2GxpES/FMJksEcXgc
 cM+mghMSH2lqIua5MySUwmmNM2WI3JFlN0xoD3VgL/BNFmwXvX6L9TWma/Y9Ea/iaeXy
 Il73BCevL/MjJYhc6LXoY/rHE2/eQn8HC/FpoRGCjnPM5v2t83vDYTihpLkY7ivwtCVF
 csPccoshe1JFqDM8asaHm5WwV1+rmOWC5jTPwZDw96YAg6WucDzEKN0hJ69mfjdSaAWJ
 YcuA==
X-Gm-Message-State: AOAM53366MXX+FGNQyB2A/e+bYQmSFAQztLkDZ2e8ngKbMRaN4sUUDNg
 2e5NOsha/AaxydBwpCDk9OCK7vZg5Sk=
X-Google-Smtp-Source: ABdhPJxI1xnUoAAoRaEClcaqydpcjjoPrwq+XsVTpr1a1sVBw7wdv4LLZiT660IKzDQR6MsZOeKXFg==
X-Received: by 2002:a05:600c:3541:: with SMTP id
 i1mr29095036wmq.124.1636823043349; 
 Sat, 13 Nov 2021 09:04:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id l18sm9167423wrt.81.2021.11.13.09.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 09:04:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:02:01 +0100
Message-Id: <20211113170201.576108-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/tinyxml2: bump to version 9.0.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinyxml2/tinyxml2.hash | 4 ++--
 package/tinyxml2/tinyxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index 3c59d159b5..ff799bc2eb 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6ce574fbb46751842d23089485ae73d3db12c1b6639cda7721bf3a7ee862012c  tinyxml2-8.0.0.tar.gz
-sha256 9332252e9b9e46db8285d4a3f0bf25f139bf1dca6781b956d57f2302efca6432  LICENSE.txt
+sha256  cc2f1417c308b1f6acc54f88eb70771a0bf65f76282ce5c40e54cfe52952702c  tinyxml2-9.0.0.tar.gz
+sha256  9332252e9b9e46db8285d4a3f0bf25f139bf1dca6781b956d57f2302efca6432  LICENSE.txt
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index d760d54a2f..0a857e5732 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 8.0.0
+TINYXML2_VERSION = 9.0.0
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
