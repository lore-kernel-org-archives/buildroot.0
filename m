Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167B7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDC0F81496;
	Sat, 31 Dec 2022 16:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDC0F81496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oOJokzqLZSl7; Sat, 31 Dec 2022 16:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264448146B;
	Sat, 31 Dec 2022 16:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 264448146B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD4D1BF47D
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFE83814A9
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE83814A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMXGYE621ywQ for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:43:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 143BE81496
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 143BE81496
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:43:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso17665300wmb.0
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 08:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=debqqjTMjzEbTwq1dRH4II0XfY2+LuuntFATeMsluSQ=;
 b=Ksbu/QyqxljZmt3Wo9fQGu7U8Qlkgbjw89vDgZq8qBTw0qK8OUfFYHS504HqBvkEr+
 roz9HzZ5nANtwUNn8KGpfM/Cjlfy81LZaVF4iiwiv1HdwUGoqkW5foe9ZBvf1+dunPok
 9YGOFi1kZSQVAi6OahbH3/xo1lQYsP1umNBWEtmmJHJLkbIQ+qJkOV2qeV7nd4pBTuXe
 bv2kK/6UvBgZWfHPbUyoI5xjVzn0o0T3SLpturLgk6V4UKuisYGeteB773iG+GdN29Wv
 /jRxiIuHXgS3NI9kCG/XfAQGTlb+gfLyfnjNJnPXD86Bk+LAQ2vD4q6Idafd0LKAj9U9
 ALKQ==
X-Gm-Message-State: AFqh2kpXedTU3J+kU0u9qFlvuwVdda7R5zVP+G6NvDKBNNRC6nLnCG6u
 YMnvhomA046UegKgjl0SubfaREj2Ywk=
X-Google-Smtp-Source: AMrXdXtVhIoMAiyD7hcIYN0gbX/x4H9KYvL8GT3DELvw8iiJ5BmFHy4ve8ZvBhcz5i5JoNaQ1DC2VQ==
X-Received: by 2002:a05:600c:4e08:b0:3cf:a41d:844b with SMTP id
 b8-20020a05600c4e0800b003cfa41d844bmr25409392wmq.5.1672504993845; 
 Sat, 31 Dec 2022 08:43:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003cfbbd54178sm54611967wms.2.2022.12.31.08.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 08:43:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:43:09 +0100
Message-Id: <20221231164309.161268-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=debqqjTMjzEbTwq1dRH4II0XfY2+LuuntFATeMsluSQ=;
 b=YDD6+48gS+CemnhX2EeJriCKbGU6kRRT7jI+ZkdafIuJWK7qsDnIdTOp5t1jQZQjRz
 q4T/uqpMZ7/V5FDT5/fAIJm6qXhHr8HbGmkW0cQPamgOPR27bT/NoRKsir3hieoWqtqm
 oTem6OUU4HKSIdeKfUTquJ11gd4X0UsNxeww9PmU7zJ88Bu7UbDZdZ53nq4B36TDu/ga
 kFP9Vr/KRUg/tbD1hyqehoXo13/XsdTYKDU4rAhgFs/UHfoOhcYbYrye0TUgnJFtB12n
 JHFnBwnqA6QsCsHeYwDSfXGtuTHCP0e7fNojFiwPg5xSZ3Fxdr3nc/ejTn3FjheB7YEJ
 nGdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YDD6+48g
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: disable man pages
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/modem-manager/modem-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 5b8b9c5576..f1fc17523a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -13,6 +13,7 @@ MODEM_MANAGER_SELINUX_MODULES = modemmanager
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIES) host-libxslt
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = \
+	-Dman=false \
 	-Dpowerd_suspend_resume=false \
 	-Dtests=false \
 	-Dudevdir=/usr/lib/udev
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
