Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854CCEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 17:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16AE460F08;
	Mon, 17 Jul 2023 17:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16AE460F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfHk9BhJDUIq; Mon, 17 Jul 2023 17:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DFC760EE9;
	Mon, 17 Jul 2023 17:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DFC760EE9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97BC41BF337
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 17:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC5FF81854
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 17:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC5FF81854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vHxJakSgo8vT for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 17:56:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F3E18183D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F3E18183D
 for <buildroot@busybox.net>; Mon, 17 Jul 2023 17:56:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbea14700bso43542385e9.3
 for <buildroot@busybox.net>; Mon, 17 Jul 2023 10:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689616558; x=1692208558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cC+qugXenj3wgDg8qluXbcTyCjw5YxDymSE2zXMD3Co=;
 b=ickproyR6shJuCMN/uwaQavA7yA8cm8MvA6IcwpXwsgPgLVEcN/W1E8FI0qj0DO6zh
 ItDXbDU2LczCorgPNXlMdkZyBX7odmjbwCsr1UVq1sPCkkL+1DcWc7y0Nm/4AjDviCpA
 upreLsVrLPIUXTcB194swVt3CFaGMlZoKjEVwQS8mkBQoBcqkWMPz3D0oD8x0Y+ObXwx
 GGTx6k0icyT4f1qxjFmSU5QUqD7hyuyBzmf8U8KidBjOHQF+dmp8/jzUx11e87ekhDCr
 ZBRqQ/PUidsoX/6Kvt1oWiKfFA18Fb2Db+KAnvZ7kGWWTgCxTusSHoc9Z7FLX2BRueZY
 J7gg==
X-Gm-Message-State: ABy/qLaYoW5SQPMFLb4RRkiut+CJOW2GRbyAZCBANUvpEH+/unXZUjuM
 5PWPG1GAyAwbv+hx/Jsa5rz8UqrM6EA=
X-Google-Smtp-Source: APBJJlEvjy+umoVe509G1UuBQ/w48aZrkMHSVRClz2YIwibCz9+xyAnQRhYOJKRnTXM1DTHngHRQGA==
X-Received: by 2002:a05:600c:224a:b0:3fc:62c:8447 with SMTP id
 a10-20020a05600c224a00b003fc062c8447mr86801wmm.9.1689616558126; 
 Mon, 17 Jul 2023 10:55:58 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 h14-20020a1ccc0e000000b003fbb618f7adsm329789wmb.15.2023.07.17.10.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 10:55:57 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 17 Jul 2023 19:55:47 +0200
Message-Id: <20230717175547.781816-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717175547.781816-1-francois.perrad@gadz.org>
References: <20230717175547.781816-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689616558; x=1692208558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cC+qugXenj3wgDg8qluXbcTyCjw5YxDymSE2zXMD3Co=;
 b=AN9kI7GIJoAO5JzYiRlq85sN8BlgWf65KuaOPj1p4Do1LPRFRetxxCUl15GhH1Brzj
 2YOhjvBWrfL74EVhw5gxvTWb0SBpZv3AMGUlFdQv6JbWiltprQWWQs1QXDR5U03SXAGq
 4pvVjsUktxpez4ibRV3XP+2PX0PJFoEwzRK/n5d60ClkjH0e+wMSG28s8sT0MZxJ1gcj
 Yd9cnYsxjg9xY1MdR2EbbLKu6g02z2mPxW27/rpxPmu3gXYG+hmf/PGgQcsNAgcDnBnw
 +T26O3W0b5wWH6CASHMAnsKUBN74WOAoJMsdmCI0XxVqxAqCBNnNfxiaNGPfTLYugpWA
 FZUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AN9kI7GI
Subject: [Buildroot] [PATCH 3/3] package/lua-livr-extra: bump to version
 0.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPYRIGHT:
-Copyright (C) 2018-2019 Francois Perrad.
+Copyright (C) 2018-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-livr-extra/lua-livr-extra.hash | 4 ++--
 package/lua-livr-extra/lua-livr-extra.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr-extra/lua-livr-extra.hash b/package/lua-livr-extra/lua-livr-extra.hash
index 747004cfa..7f8f66f05 100644
--- a/package/lua-livr-extra/lua-livr-extra.hash
+++ b/package/lua-livr-extra/lua-livr-extra.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  42fef357db3e05e32112ddebcd4296f040a825dfac77ff2fa03aedbdcdaac729  lua-livr-extra-0.1.1-1.src.rock
-sha256  96751dc604608ecf2357d1599bc2d2e9f56382793a6c218dc98d460759adbf07  lua-LIVR-extra-0.1.1/COPYRIGHT
+sha256  363e571d001b2e56eeafe2379c20aca65d67b5197199c957f9bb2a0c169aab5a  lua-livr-extra-0.2.0-1.src.rock
+sha256  ded97ea3e541833b9c2c9bf9b266f037a83b57e2e2847fecdfbb9397818f5623  lua-LIVR-extra-0.2.0/COPYRIGHT
diff --git a/package/lua-livr-extra/lua-livr-extra.mk b/package/lua-livr-extra/lua-livr-extra.mk
index 0a6378dbf..ce783f519 100644
--- a/package/lua-livr-extra/lua-livr-extra.mk
+++ b/package/lua-livr-extra/lua-livr-extra.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_EXTRA_VERSION = 0.1.1-1
+LUA_LIVR_EXTRA_VERSION = 0.2.0-1
 LUA_LIVR_EXTRA_NAME_UPSTREAM = lua-LIVR-extra
 LUA_LIVR_EXTRA_LICENSE = MIT
 LUA_LIVR_EXTRA_LICENSE_FILES = $(LUA_LIVR_EXTRA_SUBDIR)/COPYRIGHT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
