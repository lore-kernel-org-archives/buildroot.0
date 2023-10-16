Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A855ECDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 20:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43B46400F9;
	Mon, 16 Oct 2023 20:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43B46400F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBQfoPGy_haX; Mon, 16 Oct 2023 20:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E48240176;
	Mon, 16 Oct 2023 20:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E48240176
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F38DF1BF34A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 20:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC77760F4E
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 20:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC77760F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9j4ACz9yMjO for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 20:42:58 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B96E460F24
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 20:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B96E460F24
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40684f53ef3so53359205e9.3
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 13:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697488975; x=1698093775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s6ewcR1so79vc8tHpljEWIK/eEgSsjkCYZ9t+wl6KTk=;
 b=Dl6DouCyKJ3/9cUa/BIUa+r7YIE4K7rI5Wb1fziSZhl9SYah0WvOJcHpFpxSyVpWn8
 2U1BAfqOtM/rThQKUZNd9xPO9pdf2ISGqS8ulPXjBOUXMtLbBrJXl3k0clWT4zPvVCK7
 24MOzGH5BdP7v/z9thEtixjmFvSNvx9fhtJxuLYWgdJRjxTYoHHQQs4gm6kX0WEMzZrK
 VAEOypNBXCWThbk1d4tNOYevw2OzbrO6Yo9kz+4aejMSRCLeCmi6Xx4wm/XTCbbqsoXE
 zI2zL6wnqUt9T1Za/mXiGns0wHwAl4BjOy97dJuUa5xYHUgvhyt+qva2psopHCAGwmvs
 abfg==
X-Gm-Message-State: AOJu0Yz3dZFa0rBr8JFnSF3blP+dq6IC9Homq25jm06d8UO78fMtI4vI
 UX6t1CNFuIP8Eus68Xhv+uIbavicPSc=
X-Google-Smtp-Source: AGHT+IHvy3Z8EbIlCz3XuggiKeJ4zh7lqiZ0kH3xWxek3CXK/98mQSrfjZb2pFkybTq6s2+IpOtSgA==
X-Received: by 2002:a05:600c:3595:b0:3ff:ca80:eda3 with SMTP id
 p21-20020a05600c359500b003ffca80eda3mr186192wmq.10.1697488975335; 
 Mon, 16 Oct 2023 13:42:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b003fbe4cecc3bsm8021798wmq.16.2023.10.16.13.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 13:42:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 22:42:51 +0200
Message-ID: <20231016204251.5449-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697488975; x=1698093775; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s6ewcR1so79vc8tHpljEWIK/eEgSsjkCYZ9t+wl6KTk=;
 b=D3q6gJ6tgxZHkfVyEJhYTnl1CgYwAjpA3tHPyIv6dLy/mC7EyoWRDjBA13TOWqSevS
 w9iuzPDMiMzPjI1j4Vjiq+cfxf93iAdlMpAxe32ILYkmX2XOyfZBXZKVu4YGyz4bmgN9
 9utKitmRObgBVt7YAXzccXaMWuZoK8JSvcz3luMQEXR7FyxNG1zI9//Pb0wrhfqJMyGQ
 WT+37a/PD3AC0v3qv2yautVl6olQZGaAm0flQFgz1Ev0tMckdLdP8rxwz8Oi8eXGju9V
 PKHBj6PppDVVNXqv2ZIoirzdasyMGQP/Ftvdauj/BJz7/jhh+vqUbyQCj0lXFe22OUSt
 sLvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D3q6gJ6t
Subject: [Buildroot] [PATCH 1/1] package/oniguruma: bump to version 6.9.9
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

https://github.com/kkos/oniguruma/releases/tag/v6.9.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oniguruma/oniguruma.hash | 4 ++--
 package/oniguruma/oniguruma.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index 89befe7dbf..ac1d375b7a 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,4 +1,4 @@
-# From https://github.com/kkos/oniguruma/releases/download/v6.9.8/onig-6.9.8.tar.gz.sha256
-sha256  28cd62c1464623c7910565fb1ccaaa0104b2fe8b12bcd646e81f73b47535213e  onig-6.9.8.tar.gz
+# From https://github.com/kkos/oniguruma/releases/download/v6.9.9/onig-6.9.9.tar.gz.sha256
+sha256  60162bd3b9fc6f4886d4c7a07925ffd374167732f55dce8c491bfd9cd818a6cf  onig-6.9.9.tar.gz
 # Hash for license file
 sha256  70ba5469ea0bab6e18a32d7009068f996503168d27be57747e08da34337ff26f  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index e81190c0c6..1e8a119cf1 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.8
+ONIGURUMA_VERSION = 6.9.9
 ONIGURUMA_SITE = \
 	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
