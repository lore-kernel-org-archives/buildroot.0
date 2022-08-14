Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA94C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93B7C410AB;
	Sun, 14 Aug 2022 23:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93B7C410AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2L3KDcyJjvQ; Sun, 14 Aug 2022 23:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7077A408BD;
	Sun, 14 Aug 2022 23:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7077A408BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 147CF1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1E7081C38
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1E7081C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swE3_3negZMS for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B3C181BF5
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B3C181BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:49 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id v128so5829415vsb.10
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EQPVDwPDBkWXLD8xc6SFhbMqrPvuzucFqLZwWbOKuxk=;
 b=yZDL0Y70bLEAqmW+8Kn912dKIstKIl7E1rDMjZPnDd0MBv0qZz0dP0kVTZSMq9EZnD
 lRTlIYC3DPAK6GW/DdT8GJOncm0Wy1q53yaAYh+ihHWVidKxbCRaWNOubLa1YxjS8vn3
 ZBReZIluzlBzAfghgfcdbYNx3OOabuWN8MWiaMlBOqn5yBCFzYwuy30T9dAYIw+LK/+i
 WDMdMxHe2bRFuGdvSBdgnRWKFgT42kJSSBsLNJLA7i2bLpNdbD5qbSDDNLPU9PR6FpQh
 Y15q57okKOo6iMUeWpjqOwDE5Pp/xcw52/ZRD6rTPFmhUTtcsHrjjcFPrnplxltR5wsO
 nW9Q==
X-Gm-Message-State: ACgBeo2fR3GUQwOZT4QQvZSyXGogjlKD0mJHahdykFYWHzp4pWrsLHs4
 fXy4p0nep5xi8zGJwPU0/sR2BJEDBaU=
X-Google-Smtp-Source: AA6agR6Jady0uJrr1JnULcXq93RP3vsKPG+vXr6fidCaddUY/FzJLfNXy7/1zKcw18B4QXE/jPxf5A==
X-Received: by 2002:a05:6102:34d:b0:386:e5ea:a931 with SMTP id
 e13-20020a056102034d00b00386e5eaa931mr5090031vsa.74.1660520388091; 
 Sun, 14 Aug 2022 16:39:48 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:47 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:24 -0300
Message-Id: <20220814233845.2247022-13-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=EQPVDwPDBkWXLD8xc6SFhbMqrPvuzucFqLZwWbOKuxk=;
 b=S8pW7LBAaafDIlu9yoN3nyJHu8JB9d7lKhoB3F725JwAUTIIHDeSSlRPv1bRQjoSx6
 Dt46NZRT0C+WhE4pMMXA8C5ov1e05gxjv8sfI/E4L2phEx3hdevB6R99JFX9EdE1ZkkO
 TX6QI4c8P99c98ROAiDy4nV/Ae3/ZcV09/jxwVusEEubxBPkQJfNP2YuBd0X21Hla0cB
 nMFoW7V+2de7AmBqz7hqHBtB9S5x2DfJONntBUwiuHhMjfJR6U4Pgh6Z39g8UcrNw4wK
 eUStzhI88yoM3gTwFTbrQbn7Qv1FIF8aHoYa2AgS3WRrI0W/1Q5hE8HnK0PxGOkQjgQY
 /N9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S8pW7LBA
Subject: [Buildroot] [PATCH 12/33] package/tcf-agent: drop bogus
 BR2_powerpcle
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The inexistent symbol is referenced by commit from 2018:
'd0d04b4c5a tcf-agent: new package'

Cc: Eugene Tarassov <eugene@largest.net>
Cc: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/tcf-agent/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index 50e58642b0..8c7aab0c0b 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
 	default "i686"       if BR2_i386 && BR2_ARCH="i686"
 	default "i386"       if BR2_i386 && !BR2_ARCH="i686"
 	default "x86_64"     if BR2_x86_64
-	default "powerpc"    if BR2_powerpc || BR2_powerpcle
+	default "powerpc"    if BR2_powerpc
 	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
 	default "microblaze" if BR2_microblaze || BR2_microblazeel
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
