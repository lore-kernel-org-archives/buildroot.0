Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0176C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C5B60D52;
	Sun, 14 Aug 2022 23:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91C5B60D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDwger7CnAIX; Sun, 14 Aug 2022 23:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B092860C0A;
	Sun, 14 Aug 2022 23:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B092860C0A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF2281BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA7A981C93
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA7A981C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kExzagyegc3Z for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A6D781C38
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A6D781C38
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:43 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id b81so3012910vkf.1
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=iuQ7kY/klthJEHzFmZTIo6yozbAki68AZEmvBcDC+LI=;
 b=DuZk+kGo2iI7tIshPX40Aso5YqqRYSDvv/rPzxVGqocIrrmttef9B9kVDyqZKoTghD
 WPDeFnXhQ7V/avBMytAi3mmtr5zNv468MF7C++QFrc9gZzzQvEX+xt9guEmTIj0LPie1
 bXdLXa0R6vRwmY8EMKbidP5pM8x6rhqsAujWaV7h02BNzkH1kTdpy03h3IvCB0aCAV3Q
 sf9sTGQTVWKk9163saKZj4jJoQefgTOXfvd8LzxrRj4CJzTk8mLaqcHFr8yd6HmObWbC
 5MTu+C+Rr3UQZwQjLX2d6uA3OP4QpwhQB+678lQRf4hu+mhY7Qz5sLOG+5EwCOfDBxUf
 H7jw==
X-Gm-Message-State: ACgBeo3dG/Jh3x9CEHG3Uv5VnksokUp/GVbB0kFONi7q6bBIpd2pzHhY
 smzM7TGMuvCM1mT/r0/TmECgw6omHh4=
X-Google-Smtp-Source: AA6agR4/1WIhUbVUp5WTNXwLGIG/lleRpI7lUPixNybfKLmKHpszWSKSYT4fq9wy0ba7nv7ZWnJyjA==
X-Received: by 2002:a1f:2c58:0:b0:37c:e649:135e with SMTP id
 s85-20020a1f2c58000000b0037ce649135emr5560487vks.14.1660520382020; 
 Sun, 14 Aug 2022 16:39:42 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:40 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:22 -0300
Message-Id: <20220814233845.2247022-11-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=iuQ7kY/klthJEHzFmZTIo6yozbAki68AZEmvBcDC+LI=;
 b=GSTkBebRH2OGGcTNv9rjpJQXSIkgZQ0fNCawGbwTX4yvZ2meh/UP35FBtGWbA0LUV5
 HGD9qI7j/qXsg1HAfZiKG6G05gIApvgL/0fGfG9ka+CSiIgYy/3F7TNpac0byhdBZOtx
 sjTkqPIeKLKeqmcpv7QRCGg2Rmyk7v6lF1PQQVodQMU50JHKsen4CwihlrYcsjCzX/qE
 ttoAPuF7B4YhUSys3epmKkM9Eg9jMNbbM+B/65ZGqi9Zd0sSAPcNC0HBNa8+1V2eaR3U
 QC+G1QAVZqUVaEEa2ykfTwC2+AQzpay10L5ahv324P9u4HABuvuhpdFdmVYUzOI1xUp9
 KjCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GSTkBebR
Subject: [Buildroot] [PATCH 10/33] package/freeswitch: fix typo on
 BR2_powerpc64le
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The typo was added by commit from 2016
'0480bbc1a0 package/freeswitch: new package'

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/freeswitch/freeswitch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index c576e5f267..24c1ee4dd4 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -80,7 +80,7 @@ FREESWITCH_CONF_OPTS = \
 
 # zrtp supports a limited set of archs, sparc support is also broken due
 # to a broken ld call by gcc, see libs/libzrtp/include/zrtp_config.h
-ifeq ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpcle)$(BR2_x86_64),y)
+ifeq ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le)$(BR2_x86_64),y)
 FREESWITCH_LICENSE_FILES += libs/libzrtp/src/zrtp_legal.c
 FREESWITCH_CONF_OPTS += --enable-zrtp
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
