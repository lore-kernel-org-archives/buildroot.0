Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25D2C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 21:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 671626FA3B;
	Thu, 30 Nov 2023 21:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 671626FA3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKIAT7h1alSm; Thu, 30 Nov 2023 21:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4CF26FA2F;
	Thu, 30 Nov 2023 21:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CF26FA2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18C3E1BF2F0
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 21:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1CE641FB2
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 21:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1CE641FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Dqhs3ZLUQmn for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 21:19:19 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E5FA41F96
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 21:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E5FA41F96
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35d42541c63so3412465ab.0
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 13:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701379158; x=1701983958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k9tJ41Q386LAiI8Y7GCvZLnJCf5/1xoHBzWkINrX98Y=;
 b=qIB+8uf3JbrdnjbMJf2+WFSTnog0/fahHOmu92Z2cZlUOArn6L3h0qwoXP82Tiupud
 i8pzTEzW5ORJaV7XbVw98NHlwcVU89Cv3AXBAlfXIUNPBDvQo//ILoZ13Z/AABuhKuXy
 u3VyRlqxVwWPyVmAwuN9UFVI8hSV3RzTfVWbpJYLgZmZpjTHwvlAToJ/e7Jz4wn8akta
 si0gNHbUz/SnPDoRpqrSjCHp6PdYJk/Iv1GvidqrTwhnsNx1ddk4YW+uFJMawEaZU7re
 4Rl5Uci1AkOSCOunEUYESjXL3fkmbTSbD4A+/PFJBtexTbHBB80Rr561I3MMltYGdRDT
 1Hgw==
X-Gm-Message-State: AOJu0YzU+jt3Y/YAd/+z+4FXai5mVWN2kgU3//7QAtcZUl50hNRCGwA0
 5bUOgm6sKzHZh7q+nTHyfK04wkmfaD8=
X-Google-Smtp-Source: AGHT+IGrfJLLN00Wwa578rYugprJU6bZzvSGuqeOXX1s2rbe3UNa9m3NXHqAkJfLNMMDFzCBUvgQPg==
X-Received: by 2002:a05:6e02:12c1:b0:35c:c916:892b with SMTP id
 i1-20020a056e0212c100b0035cc916892bmr17132805ilm.4.1701379157893; 
 Thu, 30 Nov 2023 13:19:17 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 bz5-20020a056e02268500b0035cdc44b1a7sm600447ilb.86.2023.11.30.13.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 13:19:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 14:19:10 -0700
Message-Id: <20231130211910.2298144-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701379158; x=1701983958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k9tJ41Q386LAiI8Y7GCvZLnJCf5/1xoHBzWkINrX98Y=;
 b=H8BlpbCQfgEDDvn9f5dvRJGPug5Fhb7U4Pxi+PCUuPmWhPRXrCgWbo8ULUDWvV3MID
 4CoOgb1pyOlVuzs+DV94D7kqCR/ZC0x+a1/Z+euCd5bAFF6imxnYgKtsH071xBhO6DbS
 /c1Ce9QtWIva+8rVZKd8gtcPvLGA/78pi8Fe3Y4F85dq0/kAwN3R5iYcCu7nI9SNDLQV
 SIGuT5skyWmOvcymZxGcL/6DDp1NDeiLm8xw9aS8PD9CB6LOiCMPHJjFPSB1IkB+0MLM
 ApTtf3+PPIouszu3SJ5DhdxO0eGg+31WisxQ92UaXeJVCz6Sp0ts3F0oHVFbuwXDXZON
 AGYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H8BlpbCQ
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: use a set comprehension for
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This ensures that we don't have duplicate dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 021c99a172..5a58550145 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -411,8 +411,8 @@ class BuildrootPackage():
                         for req in self.pkg_req]
 
         # get rid of commented lines and also strip the package strings
-        self.pkg_req = [item.strip() for item in self.pkg_req
-                        if len(item) > 0 and item[0] != '#']
+        self.pkg_req = {item.strip() for item in self.pkg_req
+                        if len(item) > 0 and item[0] != '#'}
 
         req_not_found = self.pkg_req
         self.pkg_req = list(map(pkg_buildroot_name, self.pkg_req))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
