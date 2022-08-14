Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BA0C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CBB683ED4;
	Sun, 14 Aug 2022 23:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CBB683ED4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qs-u-yzLXUZP; Sun, 14 Aug 2022 23:45:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A1581498;
	Sun, 14 Aug 2022 23:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7A1581498
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 259CE1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DEE181CA3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DEE181CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zfz1HQ1yggqI for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F7F81C38
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71F7F81C38
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:28 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id v128so5830372vsb.10
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=y4HcDHf2s7BzhG0/ZjuCISGwz5SqFxVGZeE4SAhNne4=;
 b=m/zobQ/TVe5XIrEevCd7TmfGDB3H5kbr44/LU1yL1GBqzM+dqEe1uKa4673I4GvKmi
 6b8h5vCk/F3UZWaZqEt4Qavp44h/1Atl3GI+egSHHxvo+ZbsF4FneHrzN0JkeKv4j6Np
 NpwvYcGbfVydhyA377IG5SHXdorXNE+J2k9ZZv8McNDmas0QVzN9UaVAkPSeVUdjHGTG
 M+xbWhiAsDuRWWWtmLtRdrFdvaHN7Ea3H+71CyLae6ecBo4SKddO5hFnl+7YfVmsaw4f
 YBcsU2kT+yYdh+j6SHGW2mEfenjofRsUYMncOk7VdnGwRa4m2Cg4O0guB/jtO3ynobE+
 W7Dg==
X-Gm-Message-State: ACgBeo2+gbHykPGCZDU/uhwriXG6gEPlwaooKGBZeGb/xrPeWUqt/WbO
 RVIkqwOvgWD8afoRUNT8lawTr/SSdSo=
X-Google-Smtp-Source: AA6agR5f62fmXNUXs0fSNmtpRD8B6d9mgFnESGdIb1hSHCoSQST/Xx3rA5GIY74JZ+fEch1Lr1yCuQ==
X-Received: by 2002:a05:6102:224a:b0:382:3bb7:4a0b with SMTP id
 e10-20020a056102224a00b003823bb74a0bmr5412051vsb.29.1660520427920; 
 Sun, 14 Aug 2022 16:40:27 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:26 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:40 -0300
Message-Id: <20220814233845.2247022-29-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=y4HcDHf2s7BzhG0/ZjuCISGwz5SqFxVGZeE4SAhNne4=;
 b=S1ye0vPLSXG8PcwIEzbOG+djaRqYHYn3V2yFpJEYm3itF3JI8HJK1GTW2AU6/lCctq
 4yOMfuFfQXfv4OQCtmmKUHsKOpUOBdMrezDnvOdv5lts0sBpOeJFvGxHEwXkvU995f/y
 q5sZ83q2oeywOroxuSkt8oNvHGLLC9OAS2WujMeJkC1lQLCHWR+eVl7SkpQm5l8tJ9Rq
 TvKVN9Wu5SHnHYMUfGGUUhhA6sNseCV8wMHOWwzWA4y86iyd9CSJoGNZV099DUGGFbm7
 VGa1n4ftcPp2flFIFBtvudAug4WWjS4Asv66qgazUN5Jn9ri6yxtm3UXr+KVfXbleVP5
 0sIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S1ye0vPL
Subject: [Buildroot] [PATCH 28/33] package/directfb: drop bogus
 BR2_PACKAGE_DIRECTFB_CYBER5K
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

The inexistent symbol is reference since 2008, see commit '8a12bab608
widen options to configure directfb, patch by Micha Nelissen
<micha@neli.hopto.org>'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/directfb/directfb.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 56a396ab99..094e87e7e7 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -67,7 +67,6 @@ endif
 
 DIRECTFB_GFX = \
 	$(if $(BR2_PACKAGE_DIRECTFB_ATI128),ati128) \
-	$(if $(BR2_PACKAGE_DIRECTFB_CYBER5K),cyber5k) \
 	$(if $(BR2_PACKAGE_DIRECTFB_MATROX),matrox) \
 	$(if $(BR2_PACKAGE_DIRECTFB_PXA3XX),pxa3xx) \
 	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
