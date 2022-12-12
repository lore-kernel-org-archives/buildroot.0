Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A41C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 17:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45E5081911;
	Mon, 12 Dec 2022 17:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45E5081911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PkNICsJ4UP44; Mon, 12 Dec 2022 17:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942BE818EC;
	Mon, 12 Dec 2022 17:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 942BE818EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2BC1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27582818EC
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27582818EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KwLy7WTV6UzD for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 17:27:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDFF1818D7
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDFF1818D7
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:27:30 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bx10so12891436wrb.0
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dHYI3KR26sTqtUmPH5xw7IjmxoWm8nhLoPjK+tl/TJs=;
 b=M5E12VFYK4Djn+ZvDVmwNyDH7cWo/7gUWYRt6U3u6xyzCrFGcAuGqlUMIrjf2zP9vv
 +BoSI26FP7MnFCNcevnZUGZL/mCV3+XttAmCYJKUZdZ8xHrGofkSlE574AjbALF711mn
 WPADYvNnct7xfsd0AqmMTaf/FGgcY83J3UibuDoAZ4tpsAJTsZolc+0Cw8NARBImp3mg
 zxaixHAeucxULEblz35yP6DyTOrLpx6tZ4afPSY1JP8RZa69/dWA4yWjsLqH1ISrbC/n
 DyMAfU4dhZ2ETGHqF/VkczDATsMtheolt8ni9iVhhi+zJh3MavbrfIu742si8pQIHgGA
 kROg==
X-Gm-Message-State: ANoB5pno0oLZ2rI12HJYmeA3jnsOW90Fd5fmW0Y8rRXtv9AzZFU0+01L
 PhJhIc1LXZEn7/zjW+zIZ7PgXY8c57c=
X-Google-Smtp-Source: AA0mqf5uTvVnBHdKwwwbUrcJr64ru5e1u6RaQsYT4xjzaksk6gejGR0bIVcqsBioHBzWkQSquC8Cyg==
X-Received: by 2002:adf:d4c1:0:b0:242:6485:4cd7 with SMTP id
 w1-20020adfd4c1000000b0024264854cd7mr10491740wrk.1.1670866048390; 
 Mon, 12 Dec 2022 09:27:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p12-20020a056000018c00b002420a2cdc96sm9529634wrx.70.2022.12.12.09.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 09:27:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:27:23 +0100
Message-Id: <20221212172724.4364-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dHYI3KR26sTqtUmPH5xw7IjmxoWm8nhLoPjK+tl/TJs=;
 b=WANJRQt3xe5SgAlLhUOS7JphkxeruQENniT8g3vSdz2Qp16PzyNgX3UNBeSL/x9aka
 Syj151YoMiPs28ymbNpitfHNc1Eko5QFOJcRoh2C+Ne+pdFgb1YXw852xXce9DQe4dCK
 flhnsZzONqJeMziFpfRer1Up1OOsoOa9K3D2fbgJGQe6kF0RfPpwqlVPwkgXd9SaW8Uv
 Yg6uIDhSF7SagG+AYHMCTzBzW0bhHqZuPzBZbeYJFQ/NDThGvyRrQJk8/kS1Ux8fvmp2
 v7cBew8m8i49fMbumgCHET6hVFekTD5cqxaZq9ArV8NLy8/anSMqndozDMNFnxXcygxf
 G1tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WANJRQt3
Subject: [Buildroot] [PATCH 1/2] package/libmbim: fix license
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libmbim library is licensed under LGPL-2.1+ since at least version 1.8.0
and
https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/25cc3ed88d25b17c18fb32f46f96b560834387d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmbim/libmbim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 1c12b82298..e728cf58f9 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -6,7 +6,7 @@
 
 LIBMBIM_VERSION = 1.28.2
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
-LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
+LIBMBIM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
 LIBMBIM_CPE_ID_VENDOR = freedesktop
 LIBMBIM_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
