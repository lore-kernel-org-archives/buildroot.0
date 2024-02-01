Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6270C4828D
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 21:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2225F4DC33;
	Thu,  1 Feb 2024 21:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2225F4DC33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rWtuwMQovNAK; Thu,  1 Feb 2024 21:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E61F42D6B;
	Thu,  1 Feb 2024 21:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E61F42D6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0687E1BF2B7
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 675784EC91
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 21:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 675784EC91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1lpkl3bMxxE for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 21:43:10 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 688FA4EC17
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 21:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 688FA4EC17
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fc52c2ae4so1292715e9.3
 for <buildroot@buildroot.org>; Thu, 01 Feb 2024 13:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706823788; x=1707428588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WidgsoEhL1t1X/Ao1l6TKhDeNjtjp9K/YWizBlGn3CQ=;
 b=fggI1ntDOiokAVER1rGG1b3HDp/7beqA+sm918f4PcJ31IisIBMpmYsmZjpZOdqGN6
 F0TykRI/s8AGl7Y1Vluvz/OVVvNmGJuntxRDgEMDFOTbuRE2x511eyOKeoSn55LLKRQI
 O2jDHYbJyqAuyiDWUJu6PNMcV5V+yS4yip15DUGhnEHcEyBZkmnkjL+NUbwZ7p+ElkFN
 1j5Unb+BB9y6U7LS7sY1N8Qe59gPF1splzY2SgoLjajnusAmOnQv3z9U6NEmP+EW4svL
 O7e22G3Qfm27RZNtPGugvs1GGwM0k6M5Q+2E6ZkV+vpIHkbsrVQST2DzptEFVsDREp9b
 kzPg==
X-Gm-Message-State: AOJu0YzAZgMyHhxrzhqusqkX4v/9sUvL157NrYfywherNQnLl+kj7kp3
 hQvA6WlpqT4FYs41fu5L3ADv1pQAG5oWnISHfH0dlVMhUSmmqBm0Yt4A79s+Q4E=
X-Google-Smtp-Source: AGHT+IE0vnOtkvQmNEiJ/hYiWoHAaVKqREi4c89Iuvng2WhPJyJSC1N/jdc2H60RDQy4r7DZFNnDmA==
X-Received: by 2002:a05:600c:4504:b0:40e:fb69:8ff3 with SMTP id
 t4-20020a05600c450400b0040efb698ff3mr219897wmo.17.1706823787934; 
 Thu, 01 Feb 2024 13:43:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z12-20020a7bc7cc000000b0040efb503d58sm5501058wmk.28.2024.02.01.13.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 13:43:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Feb 2024 22:43:04 +0100
Message-ID: <20240201214304.301544-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706823788; x=1707428588; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WidgsoEhL1t1X/Ao1l6TKhDeNjtjp9K/YWizBlGn3CQ=;
 b=cgczQk0jS+6Hq4Ceh+HFkQR1W1z3soT31OhMhkbKe1XCl8LndodgNHWny0cYECn6M5
 UQbZniV1sTIHlSRO2hqzEJUcoyVRncqQMrgHETlo30ZdWa4lpi1sjMRbV4aWBDPHsQOL
 y6TYgceCkRbwPEcnU2sOd3qXAmVB3+J6tRaSOYyK+xwaCW1f37gb4AJiytbP4rj3lQJy
 OVNd8ljJmjLm7KOBeiJ3ltDK1x/EefgGicFzvRCJv2XrZOlS6OoK0UiRZdB9e4PxxePa
 NodBYz0UlZqEmvx5vFH4NOBql5FFQM7hQesawT0Zmom1RcZLmrtwddoMMNBM/M/uL/sw
 ZuBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cgczQk0j
Subject: [Buildroot] [PATCH 1/1] package/lvm2: fix CPE variable
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

Commit d70da0be78779699a296e21532665ee149a2a3b8 wrongly set
LVM2_CPE_ID_PRODUCT instead of LVM2_CPE_ID_VENDOR

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lvm2/lvm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index ee43cb6c19..02ea748439 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -10,7 +10,7 @@ LVM2_SITE = https://sourceware.org/ftp/lvm2
 LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
-LVM2_CPE_ID_PRODUCT = redhat
+LVM2_CPE_ID_VENDOR = redhat
 LVM2_SELINUX_MODULES = lvm
 
 # Make sure that binaries and libraries are installed with write
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
