Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B606CC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 17:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5201C60F1D;
	Tue, 26 Dec 2023 17:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5201C60F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0WprcXCOdDPk; Tue, 26 Dec 2023 17:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA3E060F47;
	Tue, 26 Dec 2023 17:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA3E060F47
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7B11BF5EA
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 17:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0707560EC5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 17:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0707560EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSO0HQtUEuvd for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 17:24:04 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E30AA605E8
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 17:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E30AA605E8
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3367a304091so4549605f8f.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 09:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703611441; x=1704216241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eueMTI8XjE1aadgh9ee7kWzlsQwQRHK+ZHrqr3nV998=;
 b=PmW8RbT0+PI62qhnGKJkmg28JUV5A+2tsKO7afM5tBaalbB9UVJT7LG9ox6oc6IVA7
 HH7hDDyRPCWXGayAj5Qv7Dx4CFp28QPcKDrwPxSLL/yHjGzpL0iF01daWBJW5mObsb4+
 dGUuWlrGsp1xFOMzjPaeQjUA9YKgV7seIF9D4CIkB+HyjeV5Mpj8z9WGwmFdFVknSMNS
 GTwlZv9euWPkgiLBvqLKpLZr6tRPWrnxAIPpWFl+ArI5TeKFMcu10D2VtTs7WuKDZrF5
 eo0GZhdI8Wb82BcSfWIZ7ujUjFf5NMWu3QOxIU/u7IwH3oS9ARVzCr1pVM2vpm6xw3hC
 x4+g==
X-Gm-Message-State: AOJu0Yywp4lP6xjZwJSyVSzsE1BJdb1Z/wzqEf21tGzkrB6/cJBjhzGU
 VJQQeKIdbZhO2wJDAqK9j6qz5Crd5NI=
X-Google-Smtp-Source: AGHT+IHrEoAjkq1VsE5uHX6wuKuH/xcVYz2icGkE49kWhABV5GFfirseURCEmsxE2/19pBVdsF4Dkg==
X-Received: by 2002:adf:ff8b:0:b0:336:66ff:2031 with SMTP id
 j11-20020adfff8b000000b0033666ff2031mr2792399wrr.170.1703611441519; 
 Tue, 26 Dec 2023 09:24:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ch9-20020a5d5d09000000b00336e3660d82sm1840605wrb.48.2023.12.26.09.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 09:24:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 18:23:59 +0100
Message-ID: <20231226172359.876319-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703611441; x=1704216241; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eueMTI8XjE1aadgh9ee7kWzlsQwQRHK+ZHrqr3nV998=;
 b=TENWu3DKMhVlHT67AjqQd04KPksbeM0cbtv8KAvs7hE4ky+69kKJIgdnSpMLU8k8ch
 0z83qjaNYy/Wy1u/4UARxLfC3o573Hf43uuTzsZ8PfiHe0JeaMpwXaxx3lCegGbNwKzJ
 Wa40ejD9WaV9e69BWzc+Fk53jWVG4pMcWL1TjizPdiPrZcGzlMgPovdHeayNx4oKUtos
 z4BFbYbYlVstgTtJIH9D5Ui8thZ/Jlr/5i0xJ5KTDeix56kcIOv2farRmZIboFMjbR3a
 /i8/zLS4JdyTqPT4WLP/CNMb8I+1FLRiuHNILsk9KBR3NiiDMbAjMzsKfz9p8lU8GcBD
 xLkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TENWu3DK
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: bump to version 0.49
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

https://raw.githubusercontent.com/MusicPlayerDaemon/ncmpc/v0.49/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/ncmpc.hash | 2 +-
 package/ncmpc/ncmpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index 17bc6e3ace..1d288294d1 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  61da23b1bc6c7a593fdc28611932cd7a30fcf6803830e01764c29b8abed2249c  ncmpc-0.47.tar.xz
+sha256  65bbec0ede9e6bcf62ac647b0c706485beb2bdd5db70ca8d60103f32f162cf29  ncmpc-0.49.tar.xz
 
 # Hash for license file:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 5d4702de78..bc8a62daea 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).47
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).49
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
