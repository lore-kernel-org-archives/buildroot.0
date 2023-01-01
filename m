Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E704C3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC188149A;
	Sun,  1 Jan 2023 23:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBC188149A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0lwWY3YQp0Sy; Sun,  1 Jan 2023 23:43:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 311208143A;
	Sun,  1 Jan 2023 23:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 311208143A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68BB91BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51CB460C2C
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51CB460C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBRSPJxbeBse for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0EBC60BFC
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0EBC60BFC
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:52 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id r130so23852626oih.2
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aM3LALrpcBI7BpnV57uxmc/YeUHqG7HEEKBGNHRnwNM=;
 b=kCosOCLxgrDjhZE9htBg3/tP/0rHIIpd/m+yPpBIgRwuyekwt3WiTioyheQ5+6jImk
 wMNpkIE145ESzZJ1K3e8bDPeHQyyOWWBKgUlZjvutv1rbR8ShdHGderzlGz6kK0SSyCT
 lJOgv1ZZ8e8GGwLuWYjziU3zIFaWvssLhecctC11t69LW7/eQxXh/KA29jrq9F/88MlK
 O1JGYweMLfF2JIGPcxvdECMLkRB3qwV0HgRGaUgfE96RsRUJGZHy7zAMeOy04fyyjOIa
 fd279SmHWz+RAikQnbaNi1dCABKnvOAgsE1MCFcpJMSFo15Klj7oELx1/O1Ow46evvGV
 rzwA==
X-Gm-Message-State: AFqh2kqX8zU43xP1e4t2jWoM/2q34C18XaRiBxF26LEqHqO6mrJZWMLx
 G2tRFFE3mNLNTPMzBSgrSz9oL0x8Q7g=
X-Google-Smtp-Source: AMrXdXvHPVAvVqeMJt35ZrhTrB5m7tUNgiCOGWF0AJhk3yC2VDvmFZJ1ypm7RTt4jt9VKs1dUH4oZw==
X-Received: by 2002:a05:6808:607:b0:360:e96a:8748 with SMTP id
 y7-20020a056808060700b00360e96a8748mr16029806oih.15.1672616391807; 
 Sun, 01 Jan 2023 15:39:51 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:50 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:43 -0300
Message-Id: <20230101233653.487175-20-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aM3LALrpcBI7BpnV57uxmc/YeUHqG7HEEKBGNHRnwNM=;
 b=ltakjd/6gM8b8R+ZYszsKQflvOEhB3c50R29Y1RqOu+X+QQZB4g2uZBDEeZlsoOfJl
 2xSPaSyAG6aTMqykUXdqmrVrSMIWqI3h6T6idhGWgvuistrSknP4fWqWsfAKSi0Jadqk
 6lHJOdrrFtdOv9S7AQTp+e5HPL92Dyipds8z5Y2wXOSKN/Eq+0Xi0SoUOpRLN1ZVT3ai
 ewiPsXK7q8wjrmhbobcM6G31giOZV2HTuciCndIVcrxLnJyUFfrvd3r8TRXu/3qPA7Dw
 hUQadwIHKlLvaISKsRje8eCpYSBsfvIJFxz3H0VZdIbDSazk5iksPeN+cvAhEfbAIZLM
 8NNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ltakjd/6
Subject: [Buildroot] [PATCH 19/29] package/lrzsz: drop bogus
 LRZSZ_BUILD_HOOKS
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "4f3f291a3b lrzsz: convert to autotools infrastructure" converted
the package to use autotools infra but added a define that is never
called.

Drop the bogus define.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/lrzsz/lrzsz.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 45c88619e0..3897975d73 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -18,10 +18,6 @@ define LRZSZ_POST_CONFIGURE_HOOKS
 	$(SED) "s~\(#define ENABLE_SYSLOG.*\)~/* \1 */~;" $(@D)/config.h
 endef
 
-define LRZSZ_BUILD_HOOKS
-	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" prefix="$(TARGET_DIR)" -C $(@D)
-endef
-
 define LRZSZ_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
 	$(INSTALL) -m 0755 -D $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
