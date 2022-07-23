Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D580C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C39AB40AEA;
	Sat, 23 Jul 2022 12:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C39AB40AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhhNtNwUHZlu; Sat, 23 Jul 2022 12:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF3B840AE6;
	Sat, 23 Jul 2022 12:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF3B840AE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AF531BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51A83848F6
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51A83848F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id faHMCYNi2xbS for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:15:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3459F847EC
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3459F847EC
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:15:57 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id sz17so12751126ejc.9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=EiNFcWZ4kp4rPsluw6XjClUoj5dlDx/33rRp6worVLY=;
 b=jmQJZKvzUBPAq+zVGx+KVYN7xs8qnQScIYhh5bf1g8mnTmqujr91ZFoOkRKjQmX10w
 wlA3492cozzuf5StBebEGmlBVlOvFNTMfe4mQ33NrafZEvzJkWjkavr4FIoldxAvSiZx
 OdbwOeuvVHP9AHqI+rqYPJu4Yvj5zTzarHRCMcLaub/VWQXtpeQhPvWP5fM1/hjLIgSw
 BFiCZQM0JI+gbz33p8Od1xFUvbB2mTlNZrYfQT2uFnqxK1GibR/WnodB8SbKT352xUhw
 1lQwqxGrAAoTiA1MjwjRcNgL4GBydwcGW1KZZmc7FsOrOElNoHZgYi23KGv8XdLL6yTK
 ss1A==
X-Gm-Message-State: AJIora8vXwr06FgrsPF6kalwEZOvOCEboNqcCAqW4ixwLXS0fQQiIbvM
 ap0uOFYUF3EA7/XfylaEf3/raMltwwlueg==
X-Google-Smtp-Source: AGRyM1sKFjS+U8N6jpTw6KGLwuiHop2uoYnJnwhU62/Ll+swQq5Wy26igbBvvc382ANpBJC+h7yZPg==
X-Received: by 2002:a17:906:6a26:b0:72e:cee5:d1b0 with SMTP id
 qw38-20020a1709066a2600b0072ecee5d1b0mr3338205ejc.404.1658578554429; 
 Sat, 23 Jul 2022 05:15:54 -0700 (PDT)
Received: from t450s.mch2022.camp ([151.217.111.208])
 by smtp.gmail.com with ESMTPSA id
 b7-20020aa7c6c7000000b0043a78236cd2sm3995632eds.89.2022.07.23.05.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 05:15:53 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 14:15:40 +0200
Message-Id: <20220723121538.14409-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=EiNFcWZ4kp4rPsluw6XjClUoj5dlDx/33rRp6worVLY=;
 b=iSKoEWcXh0NQBqg/+uKPPOpZMVxiKtz8aLQVBDPRo8tGvj9CNoAf/hV8WgR/sWAwX7
 937dXuSBbYf/tpxC4XWP+mA8sHMUf6q5F5t5G8vPUXkFTRvq4jVGZ/BXmUws0UylaY07
 bEnGtYLkQpDKRbGuotpBFJVMrRuKGxhGM6USoftyfLvpFD+cxwLnPEuZL8C+wbOqhrM9
 VVvFeKQTW3pPRhWq01lZKw5ybQKZlRZvF0mvte2nZMVMxh2/8tEKQ1HD1YYCnq69CnF/
 /7iKZ1QyPDsxPAClFAxYIZDW0qqPs82Zm6MXRFppfbh7L8MV4lrFeoUl3qwhosNAqCA1
 34xQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iSKoEWcX
Subject: [Buildroot] [PATCH] package/nettle: switch _SITE to ftp.gnu.org
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The former _SITE is not longer accessible with authentication.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/nettle/nettle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index c3d5fcec64..05b8b0bea5 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETTLE_VERSION = 3.8
-NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
+NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
