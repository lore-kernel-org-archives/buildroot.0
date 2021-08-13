Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D18DC4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:43:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81E786109D
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81E786109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5446B60BD0;
	Fri, 13 Aug 2021 13:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBhlvNFU-Uay; Fri, 13 Aug 2021 13:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 677FE60BD1;
	Fri, 13 Aug 2021 13:42:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5566D1BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43E29400E6
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2N-RA6cb8JqP for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:42:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A00A401FB
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:42:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o1-20020a05600c5101b02902e676fe1f04so7738647wms.1
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 06:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R753dUqENUeN9Gi5r8tv+VcSHTo08H1wxYm53Smzptg=;
 b=EXeWfRjxlRpZnaLPkMdppxp8wUCvJdn6w2Pv9n3YtEkHh1BqwNFYExUsiFZXeYvuPn
 AR+0DUUcwY0tqX2HP3j3N5kXItPxQZfFlJsZE+lyzd2rAl/hUXOlOdg1t8C285HSQaRx
 Fi4AQQP5Rk/MxGn+afRhtoyD8ii69JJdtEtDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R753dUqENUeN9Gi5r8tv+VcSHTo08H1wxYm53Smzptg=;
 b=XwayyBIkqPYPvU/PJ+fVJgMaWDBK2afZyhR6lmasfU9gI5dBpqBaN2AB0ajllODYwU
 d9BSJW0ceU5SU1F4FC6Hk+2KTZD2GofsxVxd5Q1XyFjjhye1vlWp+lZbyTK0KneMgDy0
 zEHRUBmZp5K+9Em1nsR1rTQLsBy0hRH8bX4eA4eggpvmyPhneB7A/0KnW3xFdJRs7yaz
 G5h/RC+sN/HZcRFDQFsyVAcbTaJhC++fEGH1sTqzeBRtZ6NK8F9flCDQIy6nfDA/MxGH
 TQDKMiowoFqG5pKqQrs592Kupns0fvxrUIkXZMZ9QZ84uDctHx2rtQ9UxvhqRuQKv7DN
 d23Q==
X-Gm-Message-State: AOAM5338Vbxy0RSVfFynN7EzAEG1ydqpWOOz1kWSpYiGncwJ1PBraq8N
 mH6nc2pCQKQT45X225uaO7tqdCuGcdCbUw==
X-Google-Smtp-Source: ABdhPJytIf1h2xyW9U2f1Aa4yKxyHn4D3FdgUOv/v/fKSH/akP0ipBJm+71w823sdWLS8gljMjmX8A==
X-Received: by 2002:a05:600c:d8:: with SMTP id
 u24mr2847750wmm.44.1628862153472; 
 Fri, 13 Aug 2021 06:42:33 -0700 (PDT)
Received: from localhost.localdomain ([37.160.221.226])
 by smtp.gmail.com with ESMTPSA id d4sm1650468wrz.35.2021.08.13.06.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:42:33 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:42:28 +0200
Message-Id: <20210813134228.1100864-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813134228.1100864-1-angelo@amarulasolutions.com>
References: <20210813134228.1100864-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] linux: bump CIP RT kernel to version
 4.19.198-cip54-rt21
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patch bumps Linux CIP RT to version 4.19.198-cip54-rt21

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1 -> v2:
* Adding hash

 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f10fab8c75..3f00680a09 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -50,7 +50,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.165-cip41-rt18)"
+	bool "Latest CIP RT SLTS version (4.19.198-cip54-rt21)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -127,7 +127,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.13.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index a834fbf31e..ee5946e61f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -11,7 +11,7 @@ sha256  7f235d454d703112e86574150652807f42abead92f3837da32ea86b4f148b371  linux-
 sha256  f2827d0506622fcae0dae0bc72b2f016469210f50c2d3dd1bdd1211a813dca27  linux-4.19.202.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
-sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
+sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
