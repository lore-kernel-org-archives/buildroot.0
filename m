Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96F4C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CA8417E8;
	Sun,  5 Nov 2023 21:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92CA8417E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WzuFd3xUk3AD; Sun,  5 Nov 2023 21:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBF74417E0;
	Sun,  5 Nov 2023 21:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBF74417E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF0E1BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2914A61057
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2914A61057
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xuw3pj_7CRGo for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:52:30 +0000 (UTC)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 854F861056
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 854F861056
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5a92782615dso45947157b3.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:52:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699221149; x=1699825949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MlQkjwiroj3/FzoRhevvxeiKdLfEDw1YBIpwqAdmuOY=;
 b=AvYk2fCnCOXgAW34z++zWyQ/mdH0Bhe4ZLxe4lAYQ+MPvf3N5TeUBCoXzQw8rqr0Gf
 EDCyb+dpfd4OOZRE2mvnDMXsaKpJDFnfEYrYVRV0l23yJgoCBmRHqkowPld2zcbpy91+
 v71cOxstm2rxCW8Gz4azZD0JgDh1Rrkr4o1AVVzx8DeN+pmMj44QvbRM5M5+lHG4pbBc
 7Kdbe5BjPzku6eKLzfSevuWToYf5YvNmZd2b3PvUVx1y/T9ts528o+F0PY9tvgwH57+e
 9xs3XbsvO2LC7x26l5IrDOXlysQsX4fD4lRAyW/PkGCJPYcylQCKvd8OoszXSI1wncKN
 TCqA==
X-Gm-Message-State: AOJu0YzCX9AGetXbZ9nzfWWPB9SAsjhk1TT/fhs4e/3PNEno2YDjK+88
 Yt0cACr9rZrWlFZjNhpO0AizIO8+W3ejDsoo1NJkTEu0
X-Google-Smtp-Source: AGHT+IFOp/nuEjbwhz/FAcmq/tBksUFu8LHAAz6udt2mjQS7VqAocbbQBGAoOYTB4cXDgf47l5frXQ==
X-Received: by 2002:a25:ab73:0:b0:da0:48df:cafa with SMTP id
 u106-20020a25ab73000000b00da048dfcafamr25386541ybi.16.1699221149052; 
 Sun, 05 Nov 2023 13:52:29 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a170902b09600b001b8a3e2c241sm4607175plr.14.2023.11.05.13.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 13:52:28 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 14:52:20 -0700
Message-ID: <20231105215221.1602465-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
References: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699221149; x=1699825949;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlQkjwiroj3/FzoRhevvxeiKdLfEDw1YBIpwqAdmuOY=;
 b=bLQRLwx5y6fWivTALvLquhucOSVqRWife4QqgdjtHMRklcRP24y218KIJEZYAsS+DX
 kmhjcB1uqsKHiu5Nysblwbga8hiZbtQ0u2kj3rvpqgXxAhyCHS5qMidHvN76JMIGrvAM
 fZjFg+YIJTOuCi8FxP70DfB8OMCL08aIWIxyA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bLQRLwx5
Subject: [Buildroot] [PATCH 4/5] test_python_django.py: fix timeout
 calculation.
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

timeout = 35 * self.emulator.timeout_multiplier
[...]
        self.assertRunOk(cmd, timeout=timeout)

Gets re-multiplied by self.emulator.timeout_multiplier in self.emulator.run().
Drop multiplying the timeout by self.emulator.timeout_multiplier to fix this
issue.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 support/testing/tests/package/test_python_django.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
index 0b7d35bb6a..e1ca50f6d8 100644
--- a/support/testing/tests/package/test_python_django.py
+++ b/support/testing/tests/package/test_python_django.py
@@ -6,7 +6,7 @@ class TestPythonDjango(TestPythonPackageBase):
     sample_scripts = ["tests/package/sample_python_django.py"]
 
     def run_sample_scripts(self):
-        timeout = 35 * self.emulator.timeout_multiplier
+        timeout = 35
 
         cmd = "cd /opt && /usr/bin/django-admin startproject testsite"
         self.assertRunOk(cmd, timeout=timeout)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
