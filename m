Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8257CC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:20:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BAF860E90
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BAF860E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 171A782948;
	Sat, 24 Jul 2021 21:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXIffvFz2L3R; Sat, 24 Jul 2021 21:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F35782572;
	Sat, 24 Jul 2021 21:20:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 596CC1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4614C40130
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9UI29sbRQug for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:19:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87012401CE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:19:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id b128so2873837wmb.4
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qMdEf+aeinTRsEmRDS04ReB06ZsrKfWAsTyXAzvyrUU=;
 b=bJynS75QkzNOhDnVrCMcJNpDxGu43sXvIiK5CXHAhkkIScGMk7xD8f6uQW1pdCojwg
 nEejgKdZAMsRYD4bcTVUjyJb5s+t/zNraJ1Tala/dx2s5gphFQrBfN8GuTq5/go9Jlhs
 Prqpddx3byhcUmlMbOpA2RZIUCq2Xc9EobyMKdKdUqK1NTRKHdidmGHVoE7dvn5AJNJn
 92nsmNz4M61WQxP7uV+R0/CwNA8erMY6+U+WcG7JDzI/Jg/StXWZ/3ZTWVBcbTMkT7YC
 jwaz6ALuCeP/s++ShmFazyB5Y8CbxUGBfv67U1ReFyL87lhh5igW2eXRV7VTje9LF4Zk
 A+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qMdEf+aeinTRsEmRDS04ReB06ZsrKfWAsTyXAzvyrUU=;
 b=ALCNpv9Z+nedys5EVlsodimT0cZMDWyQkX8HsazWcOEQR5linzeApjOzIRQFtgRo7a
 VfhZg7Qd9ZX9+TwYEN0rHgfceADCfQRZtACKxEkRIc6mb+pLMIcrsoGxrUoHuG3rRwKf
 chr9u6+foltDsLy1LLiAUZpQXoPH7Swwjqznd+CmPl0MCSzBOZzw9LdFX6S/LcLvSZqV
 p8re35YTVQPAjK6zIUL5I6MTfa06FiJyuhT/WjLbLzD6l7oxnatedydctXj3nD+1dyN9
 GZfzvy0hXeWb6iuRin6ZMX6niCsughwFl246h2RUXZ1J+0QfH7WB1ipJDfFeUmkk0ZX5
 qJzg==
X-Gm-Message-State: AOAM533d9/A1HolTJOXFDLRQhlvsnBp7qFrJDRpTGJcfa/m/SVfcflWF
 wGAd0JuWSzrlvfKrFVQvhypJZbtt2es=
X-Google-Smtp-Source: ABdhPJz3CIiSextt5mmLMQALSLhAqVYc9FGg9FMDkeigkGdr8XC1gRwWq1k6t4UTJnJY889vUrCx5Q==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr20278510wmq.31.1627161566881; 
 Sat, 24 Jul 2021 14:19:26 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 by smtp.gmail.com with ESMTPSA id o5sm8469908wms.43.2021.07.24.14.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 14:19:26 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:19:23 +0200
Message-Id: <c7fa0b9edd4181cea247a8f2edac3ebd0c0458af.1627161553.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627161553.git.yann.morin.1998@free.fr>
References: <cover.1627161553.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/uclibc: add nconfig as a kconfig
 editor
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uclibc/uclibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 5c17eea8dd..180ed9951e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -26,6 +26,7 @@ ifndef UCLIBC_CONFIG_FILE
 UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
 endif
 
+UCLIBC_KCONFIG_EDITORS = menuconfig nconfig
 UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
 UCLIBC_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_UCLIBC_CONFIG_FRAGMENT_FILES))
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
