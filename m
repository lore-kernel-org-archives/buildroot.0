Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EF5C43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 15:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A60C81B3E;
	Thu, 21 Jul 2022 15:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A60C81B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0_YiEWkr6YE; Thu, 21 Jul 2022 15:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A40B881415;
	Thu, 21 Jul 2022 15:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A40B881415
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 293C51BF404
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 15:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5917D60E33
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 15:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5917D60E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kR1D9oK33Xhf for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 15:19:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A3A60EBB
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7A3A60EBB
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 15:19:30 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bu1so2736418wrb.9
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 08:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0WDsguYZFrHmjA73lUt1lZ5LxoNUI1hw3raaY+9HRs=;
 b=SYTj4WfE6TBXcNpp2l/QpUK+g6PSuBQw29PR21PJbIn5vL6PACf2zSs9qj5oueXjeG
 7LRRjldcGXJoSgL2QmYjnMq2LKRluYV1Ay887UnArCcQOCN029ypfIDr+ppmvFcFyOqr
 R8jC2MGoPYgZj1Mgw8PuybgzrjibmzCcswTpzPKXVygje5E7aa2Q+k/DawH2BTIW0CUa
 V2qZ4I4+QaCHGZqzzfisWKaYCrfYP0Af1oArxNyKqEhyXrT+hcWlaAeik03vUXBlByLw
 OIVr+FkKR75VkfSwGaS53AMRXLzEK+6DjIVUeTLv9C2iR0Ft/d+uNIVQ0AGHnVsj6NkG
 7dhA==
X-Gm-Message-State: AJIora8w5uUlpHkcKYv23N6MT8AMJBeBhF7hHUofnsXDb0HBufSaotu6
 9iTaRSwPTdAnmIt/3W7Au+hmPQYobXc=
X-Google-Smtp-Source: AGRyM1sgzfeI20yEbpHXx/qXwxhFTzAI9ZKTscpAps5QVVSaIhjRtvP7G8RjpyTMwN1d1n9JvQHK1g==
X-Received: by 2002:a05:6000:1d98:b0:21b:aead:9b6c with SMTP id
 bk24-20020a0560001d9800b0021baead9b6cmr34908223wrb.531.1658416768814; 
 Thu, 21 Jul 2022 08:19:28 -0700 (PDT)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 h6-20020a5d4fc6000000b0021d76a1b0e3sm2183059wrw.6.2022.07.21.08.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:19:28 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Jul 2022 17:19:06 +0200
Message-Id: <20220721151907.212216-3-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721151907.212216-1-nolange79@gmail.com>
References: <20220721151907.212216-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z0WDsguYZFrHmjA73lUt1lZ5LxoNUI1hw3raaY+9HRs=;
 b=INU10zR2mJGZXjiyICkzE9+sYjA3cUqljxrlrz7NY8JWlt9OETbsGBSFr7ZXCzxHxK
 yDR1ldXtcQiz+7MoWnJfjf44wtai2+A8SwN1VXXEtndc1+wziQbnvR0Yy9j0wrxJMmj1
 4JolqWXX+dlsZ0tjEAPoMf2wR+JsnsnzyqE7uUoqovVhoGeVDBQGh9Gs+bPvEhjXsPW7
 YfPz/DdoLn4B7Qw0Ujw5+K5wvTUDOeQy9t8ndaaB6xqK3HtiPzBUW1iHCQs4F3BaEhZ+
 PsjjFSSHsEgA+CwCdETe3JQYAne+/++VCAVtPzSyGIy7nhbgOAKP+1ApY//AX5aS/qIO
 lkPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=INU10zR2
Subject: [Buildroot] [PATCH v3 3/3] package/systemd: allow package to be
 used without init system
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allow systemd to be built as normal package, this is usefull
for repeated rebuilds.
There doesnt seem to be a technical reason to disallow it.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 9f1a778e59..e0f5dbce0d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -16,7 +16,6 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-	depends on BR2_INIT_SYSTEMD
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # kmod
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
