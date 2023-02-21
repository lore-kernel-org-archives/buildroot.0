Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CF0C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 13:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF69782951;
	Tue, 21 Feb 2023 13:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF69782951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HCxO73yjRAWH; Tue, 21 Feb 2023 13:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 032A2825CA;
	Tue, 21 Feb 2023 13:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 032A2825CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCBE91BF215
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96A4360FAE
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96A4360FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xUCvFgqTmuJ for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 13:57:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84AB961020
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84AB961020
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 13:57:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so1350430wmi.3
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 05:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AcXFAkrWShVczboREa5fxkPZniyhOPtZStyJX9SyFNc=;
 b=jAwbRiXsuvBT58aRg0bw6YxPC95oJ2qikVPfWjZviyvBIZWWtClsmDQv38j7hvHNBT
 TaJj40/tA9qpLmUBDyFwwGUFcZ6CQNAS7nmR7fjgcM3AjW/Fgn5GbjEmHuNpDooc7MEO
 Hq3bvEbIVyUa6/jiy07dsgxLztHeKx3IuzCUficJwB3AQFLKvoVMntFXwIfiW2fDvrXu
 KQp1nbJvkaceh7j5lw8D664XEovYr2uxNCqoOuiKObU+wOkFfah9pjKQkqOUAxk5h+lP
 IJmbHxcnLU0/HPnJ6403lAooANbihUGtVP+g6ffuAoFj/w2MFaaE1kceDVBZSdV0CPGP
 VPrA==
X-Gm-Message-State: AO0yUKXa/tTiwkX5nh/gbLD/ZjgMmB6dCivpIq+yvaCE2oOTR9qP4oth
 uNS8TrFFJHkVF34KIEEuf4ekY2og5Bg=
X-Google-Smtp-Source: AK7set939fsAE3Xdb2cRm8CeA3ap0dIFpxRqqVz8/w5LxENN0pZI+prUfkVjhEO3wMyiUd+1IOvisA==
X-Received: by 2002:a05:600c:16c9:b0:3e2:9b3:3cb4 with SMTP id
 l9-20020a05600c16c900b003e209b33cb4mr2081364wmn.5.1676987821348; 
 Tue, 21 Feb 2023 05:57:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y14-20020a7bcd8e000000b003e118684d56sm3704591wmj.45.2023.02.21.05.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 05:57:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 14:56:58 +0100
Message-Id: <20230221135658.1489271-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AcXFAkrWShVczboREa5fxkPZniyhOPtZStyJX9SyFNc=;
 b=Bshm+1jD0XKtcKTbhyydmHlQ2oRez1IqwosvMnf0U/ANp6CrdDSPqrNKNbsWYnsFqX
 Gk4hTmU6JlGT5ph9MJhKJZGPJJyZIbMcGEnV0Z10Mlrz3bmoft1tUHFtXW27EvhRlAIc
 mY4ixkXiKyq4SquqkuLahK8fnhbGTqtdrj9VqPfd3SZzPz/QAGGmwuaRLr8xHhxzEZMt
 v81onIAmxThEu3rrgTJwHGmvLXOtoL11uYNJr+LOqvWFRMZfqBuzaCeWH65cdTctz3Y2
 /CDs/ZU8Ggmz7mY919eMdEb1OyTJ550YYs3/1CXIa+r8XrOV+gM34uA5iBhztOcKO6sY
 ljFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Bshm+1jD
Subject: [Buildroot] [PATCH 1/1] package/nut: ensure time_t is defined
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ensure time_t is defined to fix the following collectd build failure on
musl:

src/nut.c:40:2: error: #error "Unable to determine the UPS connection type."
   40 | #error "Unable to determine the UPS connection type."
      |  ^~~~~
src/nut.c:46:3: error: unknown type name 'collectd_upsconn_t'
   46 |   collectd_upsconn_t *conn;
      |   ^~~~~~~~~~~~~~~~~~

libupsclient is an optional dependency of nut plugin since version
5.10.0 of collectd and
https://github.com/collectd/collectd/commit/bc2d94024d0250211c1e498db1b43bb4525324da

Fixes:
 - http://autobuild.buildroot.org/results/22b758097e8fb72c68e41329cbc7abc748d81ca6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...upsclient-h-ensure-time_t-is-defined.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch

diff --git a/package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch b/package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch
new file mode 100644
index 0000000000..c9fb04b8cd
--- /dev/null
+++ b/package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch
@@ -0,0 +1,35 @@
+From cafd77993ec5e16634b774b65bf6da9b34a21fc5 Mon Sep 17 00:00:00 2001
+From: Jim Klimov <jimklimov+nut@gmail.com>
+Date: Wed, 31 Aug 2022 11:24:19 +0200
+Subject: [PATCH] clients/upsclient.h: ensure time_t is defined
+
+[Retrieved from:
+https://github.com/networkupstools/nut/commit/cafd77993ec5e16634b774b65bf6da9b34a21fc5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ clients/upsclient.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/clients/upsclient.h b/clients/upsclient.h
+index 08574b8f8b..e346d8f519 100644
+--- a/clients/upsclient.h
++++ b/clients/upsclient.h
+@@ -41,6 +41,18 @@
+ 	#include <limits.h>
+ #endif
+ 
++/* Not including NUT timehead.h because this is part of end-user API */
++#ifdef TIME_WITH_SYS_TIME
++# include <sys/time.h>
++# include <time.h>
++#else
++# ifdef HAVE_SYS_TIME_H
++#  include <sys/time.h>
++# else
++#  include <time.h>
++# endif
++#endif
++
+ #ifdef __cplusplus
+ /* *INDENT-OFF* */
+ extern "C" {
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
