Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51592EED619
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 17:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C76EC6133C;
	Fri, 15 Sep 2023 17:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76EC6133C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jit8aZ7FoJY4; Fri, 15 Sep 2023 17:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 133E061355;
	Fri, 15 Sep 2023 17:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 133E061355
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F45E1BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5629E4038E
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5629E4038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y58t1cq3HDg0 for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 17:16:38 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 579CB4018F
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 17:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 579CB4018F
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40472c3faadso21476585e9.2
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 10:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694798196; x=1695402996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N8wm5KOyTKCb/OHLqcjXOJvBuVHWFBFsh4Qv9+rOuPk=;
 b=EpaQgdkSFEXP2DDAFFpzvhcdw+fWh4cJGj50axgD6bfjSaP1BdUE3RtVMeyUr5gLF6
 fawAg9dXBVzO6VkY5tkHyt4EEkIB6wV6Vg709OBAh/rTZmgHHEA0I03aw2EWjg8kYCwN
 wF1uojKbs+DHUUG8hQXkhgJU5LFS0UWvJOSRfaGv3AQdBad/cYj9saPb66ktYYmVP6vI
 lthra1zQijJEpBp7Qyiql5twaLQLdnuVR2ZP1OnFXq4t2yfIy55JmngJ2XipH1FTIqmy
 eA4iDXlefKbqS+nSNKJKWByGvASvtiQI2YHQlm4whDlBuLkEyRezn3yOpi4dZORxoR9K
 j5JQ==
X-Gm-Message-State: AOJu0YwgLfscGMIGPboYmP1GZPZw83Ve17t+EAVnaUqhbJf7D/Ovu9AO
 rMhbqYWRRHY3li0UVkZ99s9ioj/glgg=
X-Google-Smtp-Source: AGHT+IEoN8s1/CY1yULDMT+xk0Tpsb10F9HL6el3VDc/cZRw2Ke/M2zZMvmjk2e4Jz7NvYHKofpjPA==
X-Received: by 2002:a05:600c:3ba3:b0:3fe:1f93:8cf4 with SMTP id
 n35-20020a05600c3ba300b003fe1f938cf4mr2027530wms.8.1694798195993; 
 Fri, 15 Sep 2023 10:16:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t9-20020a7bc3c9000000b003fe23b10fdfsm8018061wmj.36.2023.09.15.10.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 10:16:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 19:16:31 +0200
Message-Id: <20230915171631.896844-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694798196; x=1695402996; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N8wm5KOyTKCb/OHLqcjXOJvBuVHWFBFsh4Qv9+rOuPk=;
 b=aHiiVC5yTdt9HfwR6ciuKefUr/UlPID5jFcTT6p2jFdMNNPJZnjy9BFSB+mGMzAYTy
 wUk/Hr4vafgEqzY4bYfYz6vejR0M9uC85wdQPpkx/r9EyHHE3VSoLSiIR8u5bnfKCvNJ
 sCZa8BX8XvR/my4vrVOhHw3PC6XFB9xYE74zEk6zAiLzkLk/8a6pSe/9ooy/Yo+u7wxR
 3Up6jl9M4FsEIzVhY/ajniPbyQsLbdpK537ajkC01qf7dLzPNzQtSINRgiEteGjFtrH/
 wsIB3kwQqPylgMV4v02HkWP9HKiNTP7lS6n4CRKHNXkzlpcFXpQKwZeTYOYtq0mo19e8
 1U3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aHiiVC5y
Subject: [Buildroot] [PATCH 1/1] package/sngrep: security bump to version
 1.7.0
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

Fix CVE-2023-31981 and CVE-2023-31982

https://github.com/irontec/sngrep/blob/v1.7.0/ChangeLog
https://github.com/irontec/sngrep/compare/v1.6.0...v1.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sngrep/sngrep.hash | 6 +++---
 package/sngrep/sngrep.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index 60a32022e6..c9b9c8be8d 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -1,6 +1,6 @@
-# From https://github.com/irontec/sngrep/releases/download/v1.6.0/sngrep-1.6.0.tar.gz.md5sum
-md5  1519ca6cd1167c0722debfb96e2ac173  sngrep-1.6.0.tar.gz
+# From https://github.com/irontec/sngrep/releases/download/v1.7.0/sngrep-1.7.0.tar.gz.md5sum
+md5  ee3cc7bd75adeb713411aa678e45ae4c  sngrep-1.7.0.tar.gz
 
 # Locally computed
-sha256  fd80964d6560f2ff57b4f5bef2353d1a6f7c48d2f1a5f0a167c854bd2e801999  sngrep-1.6.0.tar.gz
+sha256  2e5ba3a4d6486ea00bd73d2cceff383ba162dcd6d0170ae74cfa3b1c206e2cb1  sngrep-1.7.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 0e344550d3..b86d7e83f0 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNGREP_VERSION = 1.6.0
+SNGREP_VERSION = 1.7.0
 SNGREP_SITE = \
 	https://github.com/irontec/sngrep/releases/download/v$(SNGREP_VERSION)
 SNGREP_LICENSE = GPL-3.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
