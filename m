Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBEBC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63B23400F5;
	Tue, 23 Jul 2024 08:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6d8HwHEg-b6; Tue, 23 Jul 2024 08:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15CA440108
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15CA440108;
	Tue, 23 Jul 2024 08:36:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFA401BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA73381212
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWAGNqNSbnae for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:36:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3C9780C90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3C9780C90
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3C9780C90
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:36:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4266ed6c691so34667405e9.3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 01:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721723771; x=1722328571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DrFqb1FfmzHe3w8k/j68Cj/B+0C3argOoSMwjGGG2Uo=;
 b=bs2X6infs1L5EIUxk51S9pxgcoUW8EQl434xW61jaBvM97FDnPdDjaE7GTUoKT6UHC
 YjDLfCN/VyEMLV+qNAZLN3CcLuU5DzganvIAB1haX2K6EArt7FPhjntzNvheJKnAgjgl
 btyEuPUsM9sSbnbUifxH1BMf01cK/Z03J02KIoWKxQcC4avTvnIHGAYI1FN/7qMSFsR1
 wvPxrCIQGDg3V0042FAd7GyNN4bbmW/NH8JF/frisKSRTNren7JkbrSs6eBM4/y8ZHjw
 bjCKcPfIF4nPjkpZWhXEEdgD87vV9rvGBFySFpOglpepL5vv7vqJV/4VO6ijxDAGQ56l
 eTZg==
X-Gm-Message-State: AOJu0YyNcTxKSpWZNlGKMu+MEUxUYsknONG0Vh/l2B6cvlSYo+6r9hoY
 dxHrsHNLp3kKqoA2XHx7ZxV6Dr2PICAtLkfSCkVL6ue2/aj35b2YaByguw==
X-Google-Smtp-Source: AGHT+IHvPOh7rmUdWEhXdievl0nTGE0TYgs6cZD6AhM+Bt6qN5wLyS1QgAXzmmtVaXEKlt+u9Qkc2A==
X-Received: by 2002:a05:600c:1f87:b0:426:67ad:38e3 with SMTP id
 5b1f17b1804b1-427daa2135bmr62490615e9.3.1721723770921; 
 Tue, 23 Jul 2024 01:36:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d692976fsm161320165e9.33.2024.07.23.01.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 01:36:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:36:08 +0200
Message-ID: <20240723083608.701739-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721723771; x=1722328571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DrFqb1FfmzHe3w8k/j68Cj/B+0C3argOoSMwjGGG2Uo=;
 b=hHTgqzqI+JILKTodwcJjXCPbZOvSXaKsQ4T2EGW2Y0StcHDeaABA6ePEeCiLoOhkoL
 XRPO1URlRG1buiwYscgWaU92fgkxXmqdcaZ07GdVOvJFaeLgGFphSTh3c4oXPinJzKcy
 7pMPQWAbPih0abZEYK/gJ3Uen/dyDvDTv0vclzXzWwjEgNcEFVdwZ23aewOK/r44WUfM
 zW4AXj6u7G4mp3oZ6oyb9M1nBF84F+O3gg6OEMriLlVDzoUOAvIeeEziSQK/ch/HJBlw
 4Tu0Ay4RPEilmWMQLHT7ofzNEdpiPZqHoRZkkBQaiWUlIYz+25bW7PGD9CBfwpUSkxPE
 U8Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hHTgqzqI
Subject: [Buildroot] [PATCH 1/1] package/cwiid: fix build with gcc >= 14
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 14:

led.c: In function 'wmplugin_exec':
led.c:86:42: error: assignment to 'struct cwiid_btn_message *' from incompatible pointer type 'struct cwiid_btn_mesg *' [-Wincompatible-pointer-types]
   86 |                                 btn_mesg = &mesg[i].btn_mesg;
      |                                          ^

Fixes:
 - http://autobuild.buildroot.org/results/a3bde74ff2137d088f4261e62930859bfe460cb9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gins-led-led.c-fix-build-with-gcc-14.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/cwiid/0004-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch

diff --git a/package/cwiid/0004-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch b/package/cwiid/0004-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..49fa059e6e
--- /dev/null
+++ b/package/cwiid/0004-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch
@@ -0,0 +1,37 @@
+From a775fb452ce324ce5b5ff7bf380e72c1861967b1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 23 Jul 2024 10:31:32 +0200
+Subject: [PATCH] wminput/plugins/led/led.c: fix build with gcc >= 14
+
+Fix the following build failure with gcc >= 14:
+
+led.c: In function 'wmplugin_exec':
+led.c:86:42: error: assignment to 'struct cwiid_btn_message *' from incompatible pointer type 'struct cwiid_btn_mesg *' [-Wincompatible-pointer-types]
+   86 |                                 btn_mesg = &mesg[i].btn_mesg;
+      |                                          ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a3bde74ff2137d088f4261e62930859bfe460cb9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/abstrakraft/cwiid/pull/47
+---
+ wminput/plugins/led/led.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wminput/plugins/led/led.c b/wminput/plugins/led/led.c
+index 93b96d9..723a2db 100644
+--- a/wminput/plugins/led/led.c
++++ b/wminput/plugins/led/led.c
+@@ -83,7 +83,7 @@ struct wmplugin_data *wmplugin_exec(int mesg_count, union cwiid_mesg mesg[])
+ 		btn_mesg = NULL;
+ 		for (i=0; i < mesg_count; i++) {
+ 			if (mesg[i].type == CWIID_MESG_BTN) {
+-				btn_mesg = &mesg[i].btn_mesg;
++				btn_mesg = (struct cwiid_btn_message *) &mesg[i].btn_mesg;
+ 				button = mesg[i].btn_mesg.buttons;
+ 			}
+ 		}
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
