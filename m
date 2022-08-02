Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C7EC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 17:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C0DF40943;
	Tue,  2 Aug 2022 17:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C0DF40943
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLJPr33ibC5Q; Tue,  2 Aug 2022 17:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56E4E40942;
	Tue,  2 Aug 2022 17:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56E4E40942
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C89E11BF5DD
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 17:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3CE881322
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 17:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3CE881322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qf7kmphqRxi0 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 17:34:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 014D0812EA
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 014D0812EA
 for <buildroot@busybox.net>; Tue,  2 Aug 2022 17:34:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso871651wmq.1
 for <buildroot@busybox.net>; Tue, 02 Aug 2022 10:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQK0KOJ0AErPA7yCXTC7uPJ0j0ofayvu4vJmNB2yyX8=;
 b=6M2Ry2NSesPTvxRKARxGxFGImoMDDPd17Up/YwYY6rr+ySsQ2IavXjoA7Bs4XX9hlZ
 0reknp5ZNIOdK8/NIe5yKcxO3mQF3j/IJBZ6J73hdZsVwPGwi6Z46xwGC4URyDiEDM3v
 gIrpHS8dIv47a69hIZs+gFbcxYnzFuuJNrQoXRu9yGekyK4iCFFfo3y+YtI7hXKtvq/4
 2TQr6fYOl1hnYO7+OX+vY15HTlwkR2EoBlGy4i6ONWfNUXKdUtHjBMFumZfIvVFBEHUa
 5tKBZgqM9VXxQClDjhjof5FqS5MxidXjBBxAF0fsbP5u6Y0BlR/ntdf+FwFDuBe9+21y
 L2zQ==
X-Gm-Message-State: ACgBeo3MTLQim8Y4hVFWF6t+SQTNjPGXt33vmSzvOkNVAcYIXl0mxnBR
 fmD/awPge2rvid6bg3ND/QOgM87aSWloHA==
X-Google-Smtp-Source: AA6agR6BQLCYmGDkAYsVwP9NKzkcmkz6/FMTfuGyoEaPOGaPAw3rAZCzgsa5iKnYYYyV+KqHBpoK1w==
X-Received: by 2002:a05:600c:434b:b0:3a3:175a:a964 with SMTP id
 r11-20020a05600c434b00b003a3175aa964mr363543wme.2.1659461660905; 
 Tue, 02 Aug 2022 10:34:20 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 ay23-20020a05600c1e1700b003a4e5f85087sm3594215wmb.38.2022.08.02.10.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 10:34:19 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue,  2 Aug 2022 19:33:30 +0200
Message-Id: <20220802173330.15176-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220802173330.15176-1-guillaume.bressaix@gmail.com>
References: <20220802173330.15176-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQK0KOJ0AErPA7yCXTC7uPJ0j0ofayvu4vJmNB2yyX8=;
 b=HqU5HnadNu5vWBd/5gg1n2HSJkCUSYUZSJ+U6GydRGFoNmuCFTQCJ8RlJBu0y5ystw
 u+2I5Lk1neuk3712RYEs8CjwjuEnmXuxbi95pRsSh31RiNUZ46aQQpGb8qGYNoeg51tl
 TwwKIekiXMC5FPL/QJc236S1La/ePEwbnXFwJJgdEc5g6oonLEU4q6Zew7CFb5+JAody
 0klIo7O+zPMtI7Vjiom1JbJsWVWlM9EH8lAPezHHZ6A/EkdlbH+Alqzeo4MbbezzzxDF
 7nnlG+umt+sSh6ixrvgP8Ii40LnFG9neKakbyW/dz+PnAwhOU0iORBkCK9nmjBlzFd98
 0CmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HqU5Hnad
Subject: [Buildroot] [PATCH 2/2] support/testing: test_python_scipy
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Test io module, to demonstrate the runtime dependency is correctly matched

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 support/testing/tests/package/sample_python_scipy.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/sample_python_scipy.py b/support/testing/tests/package/sample_python_scipy.py
index df0c7ce5fe..d36f2273e7 100644
--- a/support/testing/tests/package/sample_python_scipy.py
+++ b/support/testing/tests/package/sample_python_scipy.py
@@ -1,4 +1,5 @@
 import numpy
+import scipy.io
 import scipy.special
 import scipy.integrate
 
@@ -10,3 +11,6 @@ assert(com == 15.0)
 
 t = scipy.integrate.trapezoid([5,8,10])
 assert(t == 15.5)
+
+mdic = {"t": t, "label": "example"}
+scipy.io.savemat("example.mat", mdic)
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
