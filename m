Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A29C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6E2040442;
	Tue, 23 Jul 2024 09:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Ge4pujJUDIr; Tue, 23 Jul 2024 09:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AE614051C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AE614051C;
	Tue, 23 Jul 2024 09:24:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EEB61BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B094403EE
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7djK4V5QGuhQ for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE6DB40226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE6DB40226
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE6DB40226
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:24:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-426526d30aaso39449815e9.0
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 02:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721726653; x=1722331453;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0fQSUoK4OO0JiNrVtBuHAmYhNJEwUkP4wqPdHCeLKcc=;
 b=VUeZDJGuYvVc6G/z0QZGIh2REVsSoplQJSGonAjLO0IAR6z8KiZuzc/+yKng10t/1j
 DjkoBiVAkARFlj6/CVc5SQQB6ukhBIgL0Ai408GeNajR7A3YR4nFJ+Rm0ykuG0r1WaDj
 sf5WPnEGOCFAd0tnbgO4KuKoQ7GP36ddILFg0yUIROWSzFjSdFInMwgLDH3w81PyAPHF
 P7ESAFFiY1lhFrBixfw65e7fJHzm8afAH8DxcjL0sNsgqXL/eNaxREoniEgUjGfA8axB
 q8oe8Dnne8cKWIo8Y0zDBuw90HyAbnTAbE5MeA74nSZ21jaEvonM3GQ5xKtoEgVqV9U3
 0j9A==
X-Gm-Message-State: AOJu0Yy7uWrim8K5lmDmk3vGVmOocRv4eOYh+BH4VDXvb96sW/J01VqA
 dUDf4iRRXjtcq4y5WWnWYuRpiJhGf29kaERjT4hV4w87sxHADJvcK2Q8Zg==
X-Google-Smtp-Source: AGHT+IHbB6gLkU/McbqbHDdlrEkqab579UeLSFA70spDpCVkwgkQSbr93pbKmaD1EF0iwpF7OwauCg==
X-Received: by 2002:a05:6000:1284:b0:368:7564:5a1d with SMTP id
 ffacd0b85a97d-369bbbd886amr6439270f8f.35.1721726652936; 
 Tue, 23 Jul 2024 02:24:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ec6a8sm10857272f8f.95.2024.07.23.02.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 02:24:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 11:24:08 +0200
Message-ID: <20240723092408.762670-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721726653; x=1722331453; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0fQSUoK4OO0JiNrVtBuHAmYhNJEwUkP4wqPdHCeLKcc=;
 b=VpQaw3Tv12bUjiaNrORTdW3UoTCqSxwh/yaJx6iYP/AEC01RLDY7ZnOQ+r2O4zZQrG
 5TvQRBcdNv7u7x7eiQM/Znd1PjB0bX36ehEbJtdJwHhMRLfVfnYY5gCjnZ2aNtE8k7r/
 EQitZhB+/DWXaTFlbL4CnJ7vmr9EzkDOC/D9kXORbCO7N5xNLWtmtMKUIJuxZycyVvyg
 vzQ2oZrBN6Q0NzBlGl+5KknjNyLvo2//AieSJhY6pRUOONVM1d0fRh9wVYk16qIXJQWL
 W3O/4B8XC+OierUSjW53xuDB3+W4CYDz1McLEGxzgsAB7GnzbIbQy75VuOdqa7nP2IWF
 8BEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VpQaw3Tv
Subject: [Buildroot] [PATCH v2, 1/1] package/cwiid: fix build with gcc >= 14
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
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Fix variable declaration instead of adding a wrong cast

 ...gins-led-led.c-fix-build-with-gcc-14.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/cwiid/0004-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch

diff --git a/package/cwiid/0004-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch b/package/cwiid/0004-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..ba8121802b
--- /dev/null
+++ b/package/cwiid/0004-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch
@@ -0,0 +1,37 @@
+From 10106fdb4cc833faa3c2fcb980d0a4eb121fe19d Mon Sep 17 00:00:00 2001
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
+index 93b96d9..591f365 100644
+--- a/wminput/plugins/led/led.c
++++ b/wminput/plugins/led/led.c
+@@ -72,7 +72,7 @@ struct wmplugin_data *wmplugin_exec(int mesg_count, union cwiid_mesg mesg[])
+ {
+ 	int i;
+ 	uint8_t button;
+-	struct cwiid_btn_message *btn_mesg;
++	struct cwiid_btn_mesg *btn_mesg;
+ 
+ 	uint8_t led_state = (Led1 ? CWIID_LED1_ON : 0)
+ 	                  | (Led2 ? CWIID_LED2_ON : 0)
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
