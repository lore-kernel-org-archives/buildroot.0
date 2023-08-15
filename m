Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2E5C001DF
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 22:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 999BF60B10;
	Tue, 15 Aug 2023 22:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 999BF60B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Vhxq14JDzXL; Tue, 15 Aug 2023 22:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 529B5611C0;
	Tue, 15 Aug 2023 22:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 529B5611C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8F01BF47F
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 22:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40EC34149B
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 22:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40EC34149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTlSe6wCOXAj for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 22:28:51 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CF5541499
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 22:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CF5541499
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68866e64bceso805011b3a.3
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692138530; x=1692743330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=P5+dSgQtAf2MUJWVt9Holu8yu/dQlKlqqOCB8XZtHN8BX6dGWA8Hz/B6JOLLK12yU1
 87/yufdR7ViRvL41sAcwfbZuUCnJXR26OucSAP57HpDSDLIsfHeznHkUE233E/uIgzCU
 QKy151BygcPuLzSQDMKbg4EJWaLBaC3XA+BcDCgcR5uwpBYn77sp66b5B5/TDEcG3lxO
 tPg6S+X63NEqVi5eFAZD4bdJH0501pjVXhriWIfSIe8/ViHxV0SMzjk6zkN/gGJi7ZWO
 RcBZqqjhHIY8m0M6PabG9xQTzk796NLsogTPOzMIGTwOvLECgnNbbXroEpHeLhkKid0F
 fliw==
X-Gm-Message-State: AOJu0Yw48LHLQK3vFT57xOlLg97N5XMpQtPMb2NQ5wc9dlCsdgbq9nuU
 HAI/wARmOPBNgrvDuD1qaHgDiIB9X/w3rhW8KlY=
X-Google-Smtp-Source: AGHT+IEGkeLvfNJ7f00MLxhzkLzISJTmbYdfkcIj+7zXacsm4a2BwHHv0D99QvyyXgJqJO6BJ/JUYQ==
X-Received: by 2002:a05:6a00:23c1:b0:686:5a11:a434 with SMTP id
 g1-20020a056a0023c100b006865a11a434mr102739pfc.3.1692138530244; 
 Tue, 15 Aug 2023 15:28:50 -0700 (PDT)
Received: from fedora.. ([174.27.153.162]) by smtp.gmail.com with ESMTPSA id
 q24-20020a62e118000000b006873aa079aasm10177758pfh.171.2023.08.15.15.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:28:49 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 16:28:43 -0600
Message-ID: <20230815222847.2460201-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692138530; x=1692743330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R1ACUUlx+FKydQ71T9VEOtN15HgUPnb58+kVIWcwcc8=;
 b=VL9eWN+cLz2ehgivbSTNtUkUmPUJG5m7Nxf8rXStFUZNMrICBpURDTHma7Va7xo+ym
 ld3k8rpMogxmlbwB7N7xy/D7G9uOIEXokmLwtl09CaqW9mXfY60zpfGmiutS4GCy9iHY
 JrXZjY86G2qk6vE06n3Kd5jF+ykoBafgfcxf0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VL9eWN+c
Subject: [Buildroot] [PATCH v2] package/python-httplib2: add host variant
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for the host-depot-tools package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-httplib2/python-httplib2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 1093ecab39..2f4eb98356 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -14,3 +14,4 @@ PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
 PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
