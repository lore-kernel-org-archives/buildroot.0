Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F94C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 21:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D26C81390;
	Sat, 29 Oct 2022 21:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D26C81390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CRNpy28xTQgL; Sat, 29 Oct 2022 21:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5925A8138A;
	Sat, 29 Oct 2022 21:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5925A8138A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0BF61BF4DD
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 21:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABE2D8138A
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 21:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABE2D8138A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPqxjd8F_85v for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 21:05:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4026F81389
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4026F81389
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 21:05:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id y16so10833981wrt.12
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 14:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7aO+9Vg4E/gaxFgftIXeWZNIr/gVnx1NB6C908v9D0s=;
 b=EElVjvXJtEhJb/KnHwi7QGLM7oWpi5UKEsxckEAvqP4/hfj9tLFVVU62d6PUi8KkII
 5tp3X4nrSQCGv09OpVNCxYKBtJ1F7yuoFRY1cXR7Xic1OGJZdvMh9tv/xBTH8/RkaD9m
 vXfNAomdT5MwFk1SKao0T699dJcSG7sEwnNS+2vtnbnk2h8yPympazR0aTFlBK85z5Mu
 I85LLl41UZ+bTrm5s57LVOQ8XJRah9z1B4oVAkdwC9nn7FoIHm4wc69D7YcNo/JEr1J2
 9GjoBx+BMcIPj/H/36tsFtkkTDbt38qrtYy54aaQOKalpPCnuXzV9DeHMxWHfICZBPCG
 nYtA==
X-Gm-Message-State: ACrzQf2oK9yiyRkNV3VBpf1WZ0EzbdjMaZomoWbEurDCgi5shgOzywGx
 xZJvzwOcZHKVNTwTSNV+UypoFVWNeio=
X-Google-Smtp-Source: AMsMyM4YD4E1jWyI7LMuY3U65wtKXq8Sls/pC14MIWjVQwwCHx+pP1jjvt5WKxdvca8goEW+Uio6UA==
X-Received: by 2002:adf:b353:0:b0:236:5814:f4dc with SMTP id
 k19-20020adfb353000000b002365814f4dcmr3072153wrd.189.1667077512155; 
 Sat, 29 Oct 2022 14:05:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t18-20020a5d4612000000b002368424f89esm2385881wrq.67.2022.10.29.14.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 14:05:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 23:05:09 +0200
Message-Id: <20221029210509.265825-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7aO+9Vg4E/gaxFgftIXeWZNIr/gVnx1NB6C908v9D0s=;
 b=gQEdGrp0OWrZmvRs9Rr8PSETqZFlhynGIPzlAShI3oZtJMUZnhQcEkms1AFEtlfKRv
 GTbg4Y+VYyaYCh/0EXuNIkeS/5AX5evh2pJnay+ZBbRkD7WebsTkv3pWqQX/IMEnbFW7
 NF3/N9jfQ/ovEtxCO07BXPBODJbohlRGxNqWfF/GSDGA3pXn3fByslPjJP+Hl1pOzYIL
 GUgaB8Du4ePYhTkinXgb+S874YQN1pydGBaa0I/rEczjJl8ZIFu88jiNcMjCgNPL5iBm
 jj+d7SHbg9LQfXV4gHPbIl5kV0JIvmtkMmZRBCfPyKy9ngUGK+0kDRJO+bYk7alXXuQD
 SgIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gQEdGrp0
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump to version 2022-08-R1
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

https://www.kismetwireless.net/release/kismet-2022-08-R1/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kismet/kismet.hash | 2 +-
 package/kismet/kismet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index fc5f854b7e..725d24e551 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aaae4747f14734a73f601af013c0eee26e13680f5e3675dfce09b7de2e68b8a8  kismet-2022-02-R1.tar.xz
+sha256  2149cceac5526508653f4d02dcf7a694e3da3dc000a2372a1ee4bf9988279781  kismet-2022-08-R1.tar.xz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 3992a392f8..8def78ad2a 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2022-02-R1
+KISMET_VERSION = 2022-08-R1
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
