Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFED2C4338F
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 15:17:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 649D3610FD
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 15:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 649D3610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31EFE60646;
	Wed, 25 Aug 2021 15:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MGjjnhuun6bH; Wed, 25 Aug 2021 15:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEA48613C6;
	Wed, 25 Aug 2021 15:17:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CA701BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 15:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88E92425AF
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 15:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxzk_eAhzs6h for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 15:17:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88F79405E7
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 15:17:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i6so13255342wrv.2
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 08:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hYZaZGGNm0/s7wKakr3eBK2OpbXYlTssN+Rk13kWcUA=;
 b=fqsifdJUoxjYX4/bqMUxyntHBp5pF7p8qcge2azSDP9xDf45/s+jj0NMgPGDRXUhu/
 ko5zfRNQakJeFds0vE9uCIS/94XC57R5889ng/KutGIQ1wv4eSPI4H1PJvILBy8Igyjo
 p6zGlEygRGTdlw5BY1E8ky7yS0xBLIO9ZVlHfBd6aFFMJlC7V4YF+/8jg7xpji0n1rjG
 +6edtA4r1ojZ1RVL9Ro2zSj6pPNQuEQzPbds6kIK9FW3RdN8jgityintIlUl3PP7WmNC
 xeKhXTCYBWgTe9CabQP11ES+A9jMkd+mWO0jjCQCyhMWEIKIYIq/A9S9hmIfxTdvucQe
 F/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hYZaZGGNm0/s7wKakr3eBK2OpbXYlTssN+Rk13kWcUA=;
 b=qeFDNZuG5pdFQqT5V0cikbEeD527PYcFRVdYMjB5TkMlPmHTHkh5t5kFf/pQsIFxC5
 LGF+/3Cw6Qr7SFF3Ij8RIiIiYf3S2kv9y6axU6IqPUADnO4VgBnrdRZBx6xtzjkQay5T
 3Y/pLyJx1zkoFa5MXxl+LBXoNwPl1K0LH3kK/uBMFu63xJpM0EPfVNog/1YRcmOzAXSM
 s1Lh/CcrRqL4ToShYVjmRh0EIi+v+cm1J2SIEBzCx+my01OhooCMPz6r8hC9FKBXmyqk
 oH6mFMFCoeeILsKJawVPgeOsNonJrOahSS3UolPEpdJ5rttfGJrNevbC3tFCFoMvzUsj
 COSA==
X-Gm-Message-State: AOAM532uP4bb6NaKDTPH2YnRqJ0QsiB8tI9ekmM8U1mX9WktrLtD5ne8
 NjS0ruocM9BurhUTik+MDCyWNYGi63KYmg==
X-Google-Smtp-Source: ABdhPJy1s+4C/aw9GR4UZR6K+meaJwel007yoSxVh81AS+6ZMJQGV2UGOX/KKBnoZm1JFF2HHtQZBg==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr21107974wrt.413.1629904631548; 
 Wed, 25 Aug 2021 08:17:11 -0700 (PDT)
Received: from localhost (cpc76906-dals22-2-0-cust400.20-2.cable.virginm.net.
 [81.106.81.145])
 by smtp.gmail.com with ESMTPSA id r10sm239632wrq.32.2021.08.25.08.17.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Aug 2021 08:17:11 -0700 (PDT)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 16:16:59 +0100
Message-Id: <20210825151659.59671-1-glex.spb@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: Fix alsa-plugins
 compatibility
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Previously, alsa-plugins would not work if alsa-utils was installed
after it. This happened because:

1. alsa-plugins copies some files $(TARGET_DIR)/usr/share/alsa/alsa.conf.d
2. alsa-utils removes these files during installation ( rm -rf $(TARGET_DIR)/usr/share/alsa/;)

The `rm -rf` command was originally added as part of the fix for
https://bugs.buildroot.org/show_bug.cgi?id=1573 11 years ago.

The intention might have been to allow for unconfiguring some options
and then rebuilding alsa-utils. However, this is a scenario that does
not work anyway.

The simplest fix for the `alsa-plugins` compatibility issue appears to
be to remove the `rm -rf` command.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/alsa-utils/alsa-utils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 2658c827a0..427280c1e6 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -77,7 +77,6 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
 	fi
 	if [ -x "$(TARGET_DIR)/usr/sbin/alsactl" ]; then \
 		mkdir -p $(TARGET_DIR)/usr/share/; \
-		rm -rf $(TARGET_DIR)/usr/share/alsa/; \
 		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
 	fi
 endef
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
