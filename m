Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48323C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E19EF40881;
	Thu, 29 Dec 2022 09:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E19EF40881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKpOkX9n5aCQ; Thu, 29 Dec 2022 09:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC1394047D;
	Thu, 29 Dec 2022 09:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC1394047D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3203E1BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0597581846
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0597581846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jihdND_LVaA0 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:25:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C152817C0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C152817C0
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:25:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so7310459wmk.4
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 01:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AF4mV2FixHMcnTzthB1fzXVymYpoGJAEL75rEIYY9E8=;
 b=cYRfBRycaIr+Ey0K7975OMmFAqMguxI8sTtUnLhWnl5iPdICYsvjOmw/ESld3YEfCV
 d50EqCZBOZqx88a7fQe+yy4jFy8ia21oRgzKx5Kg/N2iy1tiroLOPyQ6W9LfUSkVkBbz
 FxEs6N1CloxumXrtoY4FZUVGaGMbQhB1HodM1fNQePm2jTwzfDE+0ECdatZO9VICPpeN
 8H2ZrHcTLNT8QOXB7UbC5X8too5Bjaaxogo0n+vHplCBWCIsDI5ae+99mhJfSGDiQgUN
 Lpu5MpgjSTTU7YlBpX1a8D0oscjvVQbaieEJtnWMMcxrm+yccauTl8/64NjrgrnvFSnM
 R1Tw==
X-Gm-Message-State: AFqh2kqB8qKpBdZqf6a2pEmZ7UvIXI8YbUb0LqtBPgUfnQ9ilfJ8UhP8
 rGdFDsuGT0D0NJ8ucQ0A83dSzlXeqnA=
X-Google-Smtp-Source: AMrXdXvMv2C3QOQALlTNAGxB1IZduqAX09+Uix2G9Z3VCFWCI1znH+3b1KHCLYn1fFdB08+OToC6Nw==
X-Received: by 2002:a05:600c:4fcf:b0:3cf:360e:f37d with SMTP id
 o15-20020a05600c4fcf00b003cf360ef37dmr19336262wmq.22.1672305950243; 
 Thu, 29 Dec 2022 01:25:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c080500b003d208eb17ecsm22479148wmp.26.2022.12.29.01.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 01:25:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:25:41 +0100
Message-Id: <20221229092541.236778-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221229092541.236778-1-fontaine.fabrice@gmail.com>
References: <20221229092541.236778-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AF4mV2FixHMcnTzthB1fzXVymYpoGJAEL75rEIYY9E8=;
 b=LaLjC6Z7ZzP4/+ASXLZNbAep5OCMxYipOwo2d+ZVWDpjI2PeeXRcn+R0PpHwDd0Pn+
 EwwBb+4a5XmPRUXuHnaWFlZnOMb6tJqxbjbyPyA0A/lfVFjpJcSVd6FEAG7kOcK1PpQt
 Lq/Fy84ok5jVSRMizRA3zDWFVvO81LaJzXMgOoZyDLb4d7akiQGNQyqFWAaGa20B4qig
 gdLW1BTB8PIlVvLRO6ELPWtJjuI0SNcoFSznV8TX+KfZ9qVfrPL+FQ8iiqRweD8pqkx4
 Nas5YHsblX1sMvlpeHcoY57OCqc37UbzW4jQevC4+iFysAJxbUQtxDamyL7RugfjEo5w
 2kVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LaLjC6Z7
Subject: [Buildroot] [PATCH 3/3] package/rsync: add openssl support
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsync/rsync.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 9c7824f575..d2fa47d39a 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -18,7 +18,6 @@ RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
 	--with-included-popt=no \
 	--disable-roll-simd \
-	--disable-openssl \
 	--disable-md5-asm
 
 ifeq ($(BR2_PACKAGE_ACL),y)
@@ -34,6 +33,13 @@ else
 RSYNC_CONF_OPTS += --disable-lz4
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RSYNC_DEPENDENCIES += openssl
+RSYNC_CONF_OPTS += --enable-openssl
+else
+RSYNC_CONF_OPTS += --disable-openssl
+endif
+
 ifeq ($(BR2_PACKAGE_XXHASH),y)
 RSYNC_DEPENDENCIES += xxhash
 RSYNC_CONF_OPTS += --enable-xxhash
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
