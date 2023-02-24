Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6715C61DA4
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 13:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A0361006;
	Fri, 24 Feb 2023 13:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A0361006
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rL0uAZKHZiPw; Fri, 24 Feb 2023 13:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E3960FBE;
	Fri, 24 Feb 2023 13:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E3960FBE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4ECF41BF30B
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 13:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28AE081FB5
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 13:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28AE081FB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVlALfke2A19 for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 13:40:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23AF8815AD
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23AF8815AD
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 13:40:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id az36so1845337wmb.1
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 05:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UNJQslaKI7lpP/YyelcgVK4XCFfGjel4KQC4hbk7YgI=;
 b=iAHhRbj3C4symJULyS6zzhUOZ5W8qCYLhfVFbFqllBZeX/2Vbf7vlmZhm0SFBwsO62
 nlfkhSaS2idBPnH1B5OfdKf6wC+ParAOkDMXzdfk3qIahR3TPeFR+TqTqqCXg7eWeMsH
 IvX3vfyc/F0NSJXleArdgJnfjLZa0BuCsDNzCTqe3mIT3dwHOP9mLTouRHzxcej/0CQi
 XPN1DO5tq4DmKQutyJojBI2kMPLg/0W4Ufnk9I5KyahcASjPO6zss+2C1oupqhCXSZEL
 lFOel7ZUU1OGPzCdvrgjhyEVYHoEdEUmodEZrMHI/j8a366xjmtJBLkaF7/+yNcaT2SH
 8O8w==
X-Gm-Message-State: AO0yUKWWPwwFokGqwnYhBclhaCC5PrtlJFXl0CtVi4tWeqPXqrulQvky
 fAc+P9L44awTOqGWSI+ZoLQhQl5Ylp8=
X-Google-Smtp-Source: AK7set/+UuWDrwIuM8gBgIl9hRa7Rajcn1PZWMtaFoqOrVu8gfUUTsx46peHitGkLVJ3WBbx/xzdAA==
X-Received: by 2002:a05:600c:331b:b0:3eb:2da4:f32d with SMTP id
 q27-20020a05600c331b00b003eb2da4f32dmr668855wmp.26.1677246031595; 
 Fri, 24 Feb 2023 05:40:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003dff870ce0esm2899557wmc.2.2023.02.24.05.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 05:40:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 14:40:28 +0100
Message-Id: <20230224134028.307983-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UNJQslaKI7lpP/YyelcgVK4XCFfGjel4KQC4hbk7YgI=;
 b=KkZldCiKHNInQCYkQvlAm6ahehV4sGvkYkTTOlVmfnM5pPAoBaZADCod6ZZz58PFZx
 8+0XgYumAKLe4wYstVVydUc/UCfazM2DP4L9ZEeAT+xsEv4AMzoazOUqMFmo6n4MRktQ
 Vbv4b+q7BPZNAkVBzdlf3JsoEjp8FhQNnamdJSAFod111y/AZ+Yd/p0GPlJvAZfQ+tyU
 i7xXWzuYu/HCt4YD1PR9OsLsVFL33kgzGIUirZ4zqrbcOku3n2xNuAcgF4Uofanc1LS+
 cBcYPY1ZIR2r0eGbTW425HyKAc0gOQvV2jBpta7LlyHb9HguhBStvgYYAn3uAFYnQ1ja
 x+wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KkZldCiK
Subject: [Buildroot] [PATCH 1/1] package/hawktracer: update URL in Config.in
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Current website is down:
https://github.com/amzn/hawktracer/issues/87

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hawktracer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hawktracer/Config.in b/package/hawktracer/Config.in
index 7648707404..bee9c27b7d 100644
--- a/package/hawktracer/Config.in
+++ b/package/hawktracer/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HAWKTRACER
 	  profiling tool built in Amazon Video for getting performance
 	  metrics from low-end devices.
 
-	  https://www.hawktracer.org/
+	  https://hawktracer.github.io/
 
 if BR2_PACKAGE_HAWKTRACER
 
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
