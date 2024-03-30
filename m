Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B203CD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 08:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE76D40B58;
	Sat, 30 Mar 2024 08:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ns9P-R-2qac; Sat, 30 Mar 2024 08:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B286C40B61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B286C40B61;
	Sat, 30 Mar 2024 08:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 333361BF41B
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 08:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 208E3826FB
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 08:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYKr2ZclA-Um for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 08:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 381AC826B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 381AC826B4
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 381AC826B4
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 08:57:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4155bc085dfso580655e9.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 01:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711789063; x=1712393863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=27bjj4HYA1I8nAsnYsUFV4FXN2P+AgPQICNMEwCcQNM=;
 b=f2PL2xCKMALCgPD+/7zUMVf73hd1vwuS6S1YktSUNVRwc4SYMm1ysLU3rqked3q1Sy
 zXa5h5cAjxxP/nxyfv896G8fFktSKDJ19LJR51RsQznByLIJJ4z2SkOW/WfIig39rvv6
 QpLDLW7iBfwFXKw8mNx6OcDPboIwiV1D67l7GSbnfIrjfy7GhwcJIkZxLserulBH9e+A
 7hs9McAZLo+Nw5/1+n+M9X1eewYBnq8jyGTK/IKo5aFHgUiucbg456c0ZL1oX5zyY/4s
 9w4aQNgUk+DanbkLH8iZu7hSaPkw+i3Qv+Oe3H5jT2/VQLrVTYPbelNbumC7PZD3hRfV
 Rs5Q==
X-Gm-Message-State: AOJu0YyL1ZjYIS44fOP/NXdIJ4KH2l8ARfhoONiVMDAzYNkR52oPJjiQ
 gPJkYUser43vy0xchmTCHcVg13JESpiIFDfbIOMjwv8A/eXUrLYUQQjqiQqK
X-Google-Smtp-Source: AGHT+IFdDt/YtaJINPOgLguvwnXn4AoRssvXT+KBbnPtKZWfQO/golpomvMHIGVhzOuSPbz0oX1L8g==
X-Received: by 2002:a05:600c:45c7:b0:414:86a6:f9ff with SMTP id
 s7-20020a05600c45c700b0041486a6f9ffmr3790825wmo.4.1711789063061; 
 Sat, 30 Mar 2024 01:57:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b00412e5f32591sm7847212wmb.28.2024.03.30.01.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 01:57:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 09:57:33 +0100
Message-ID: <20240330085735.564225-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711789063; x=1712393863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=27bjj4HYA1I8nAsnYsUFV4FXN2P+AgPQICNMEwCcQNM=;
 b=Yuspj9hSxJocDmYUw8KqLpH7jf7FQalNQui1kJHo43T7xB7fSHrqf9EuVK1nm/WZLi
 +Q1Zej6dhaIVMLKR265/TLt0/4uC8fYtaCjATqGZqJWLaVUKRihDCfbINr1wGSAeNbT9
 KYvEPapYPC8VVFnvfvKuLM1kP5g7VvjzXtZywCFkDB1k9Hvx6K4v4fdgcbQNjYG/vR0X
 FyQPa/+zkYEHbrbLTO7I8C5wHk2YvBlgovruj2j5SpMu9c5o4FkfN5q01SNmy3HsX0g1
 qyE+xLJKZs6iQCm/OKxvpMjNSmKPOhw2jHfCAoh1R65kg7B/zT7x4WnSiGWv2ckPfeLg
 2Pxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Yuspj9hS
Subject: [Buildroot] [PATCH 1/3] package/php-xdebug: drop unrecognized
 variable
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--with-xdebug is not recognized since the addition of the package in
commit 7b7dffd0984e1b274273f5638a975165606384f9:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --with-xdebug

Fixes: 7b7dffd0984e1b274273f5638a975165606384f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-xdebug/php-xdebug.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index c5a1e10ebc..62ef3fa997 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -14,8 +14,7 @@ PHP_XDEBUG_LICENSE_FILES = LICENSE
 PHP_XDEBUG_DEPENDENCIES = php host-autoconf
 PHP_XDEBUG_CONF_OPTS = \
 	--enable-xdebug \
-	--with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-	--with-xdebug=$(STAGING_DIR)/usr
+	--with-php-config=$(STAGING_DIR)/usr/bin/php-config
 
 define PHP_XDEBUG_PHPIZE
 	(cd $(@D); \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
