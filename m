Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DBFC3DA7D
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 09:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3138F60804;
	Sat, 31 Dec 2022 09:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3138F60804
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9TQI9R2SU1n; Sat, 31 Dec 2022 09:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC166061B;
	Sat, 31 Dec 2022 09:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CC166061B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32EA71BF83E
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 09:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05D2C402CE
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 09:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05D2C402CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzJNlkmO1G57 for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 09:33:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6660402C3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6660402C3
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 09:33:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso16915458wmp.3
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 01:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vkHsKq1/TJcJGzantEbcVi0NffJYipv6SLyT1lGtM8Y=;
 b=v3iBOgb4OSONb2WG8LtD8/1q/SdMU/vnP/71U6SIQC/IwK8hd9EInHg4MWj5TYpVXp
 RycJV2CVCBbHc2UI3qkT8+XQO1id6DUdl6rnFnbgqmApOwdbWxsGDjFi53g0BPmY3hAZ
 X3OQwwk0mgd6N3Wb74weeBz1Jo58TeYZ9SuZrNSowouCcJ8rx7Vd/tfsPRMjnBURtjFX
 PMlgORZaYU2BueYAjJzYJ6QnLMSJVZhtL/nAvOUGo4P38XxmULE/MAnr+8lSnaQAn4WH
 3qR1V0weAQ+Zq4LLBz5GHTRbUb3nn0YXKzOXeXr3iSkzZFLijhqYmLDOn+gc4kveBbuL
 Mv/w==
X-Gm-Message-State: AFqh2kqev0QwhtcreoHRIjItnYvQbRqBZ9Q1mBxklVsZSXKaZHGvjK/4
 pimnriDO10pc6WyMxLvjYMhQoqyEU70=
X-Google-Smtp-Source: AMrXdXtNg1nuyde5ZIluaAFW2MskszozYpes9fr4urrMYT2gcJwL0m6ibwBl3uG4kKnRwTsAkzwJ/g==
X-Received: by 2002:a05:600c:1e10:b0:3d1:f496:e25f with SMTP id
 ay16-20020a05600c1e1000b003d1f496e25fmr26381430wmb.16.1672479229330; 
 Sat, 31 Dec 2022 01:33:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b003d9876aa04asm23319103wmq.41.2022.12.31.01.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 01:33:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 10:33:46 +0100
Message-Id: <20221231093346.236891-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vkHsKq1/TJcJGzantEbcVi0NffJYipv6SLyT1lGtM8Y=;
 b=pK3u+ANItrdnhXdnzz+1eBMgIuHkZuTuzuqTxaJ66yvYVr5Qrrx6kMJIX646wBbLUt
 W/pbD1LfnsNdCcBLwKNQTTquT0oB4Hb7xCPURh9HHbntl4ZiAi5p0Gm/zhC5gk3aByhW
 sB1jEqxlUq2XEQ49KzIao9U4tdLDNjU8a+pcZU3PRuPYqdpiNdKWcIrBqlutj/c284Uj
 OKzETbEFWBMTHVamH1PFjIa9ih/bZI+ObP+DUzn/ClvKJL/m7fVE3YzCAKGOItyAQwlX
 BklHJ3d1ZcJhLM6wI1zA2pEuObX+UN8AA4V9f1oR6JNN0dHfc2wOe2sHWSbU0wA1D2DD
 +YQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pK3u+ANI
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: disable tests
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

tests can be disabled since version 1.20.0 and
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/commit/ba96ccc61587b7b6c31b94826ee7a3c44d795364

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/modem-manager/modem-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 8ef85b9b1d..5b8b9c5576 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -14,6 +14,7 @@ MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIE
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = \
 	-Dpowerd_suspend_resume=false \
+	-Dtests=false \
 	-Dudevdir=/usr/lib/udev
 
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
