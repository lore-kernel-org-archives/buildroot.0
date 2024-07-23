Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F44EC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A78080FF8;
	Tue, 23 Jul 2024 09:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3x0XRzUj4bO; Tue, 23 Jul 2024 09:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4350081068
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4350081068;
	Tue, 23 Jul 2024 09:33:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1A0B1BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E056409E4
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMiieyhsMFG8 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 430F9409EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 430F9409EE
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 430F9409EE
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:33:19 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso76043701fa.1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 02:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721727197; x=1722331997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fFQ49i+JiycVn3eHoXLqZiNwX+c1lD7o26RI3Apswc=;
 b=oMXdci6LlblzLq4+YvXCyFA6rNbKExv3Nk4KhZWDiVIwdq1xw1NXlTDYwBPDFfFsTf
 0S2lrwYF691G9PftowHUN7Sr78hpiYx5H++EvCsRkZycS8MI0FE1Y3WkyvBXKDh7AyL2
 +EuEsXSRwcxC20zgny5uYQscSMNqDn5BUP2L4eQo6eenVEmZQSX3cnGh2nAsNv756Wco
 bWYRU/FPjwlAdoumxZWmR7NKNQaaTP3qG430fuTaqO5XXVHPl4wo7SlTtauj/7J0svFH
 Qqow0osM0MSFFUTw1Ulgbi5inRxGHRzHGYMPFpjuOKQJ04tHFoL3xrUan0yc3kvs//73
 THkw==
X-Gm-Message-State: AOJu0YwHIuK4YfZ4Jp4vizfeC1W+dSw73MlTgAAg6cZwc4nCk8AMdYMP
 TApCTPP8+x4p0MMDo8Sv/3GUoBqSSDTcQ6BcSC/+X3u0od++GPTj2Qoxwg==
X-Google-Smtp-Source: AGHT+IFJPeFwUSLi6b6Ae9XE9GxDeeoDEA1wW7xBSYxw+Ob4dxbHdXsXWRn/4Mqidm5+tjkSp6Fqsg==
X-Received: by 2002:a2e:870d:0:b0:2ec:89b8:3d2f with SMTP id
 38308e7fff4ca-2f01ea55e28mr16386991fa.19.1721727196379; 
 Tue, 23 Jul 2024 02:33:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ecec0sm10880896f8f.105.2024.07.23.02.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 02:33:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 11:33:12 +0200
Message-ID: <20240723093312.770586-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721727197; x=1722331997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9fFQ49i+JiycVn3eHoXLqZiNwX+c1lD7o26RI3Apswc=;
 b=FBFU6RVESjI2McdAwzpo9sKU7lHBe08dqgqoGEBsxLSdgt6sU2XVqIJq9fWOyKD39A
 QyugJ0ptUtoTX9Af+XfteDJfDTh14eftMvYByzxEeXKuvHpUaLx4hgUsgCFvTCnRrwts
 F0ajlSWxY0srBEmtfqlG/ldye7Pr5gZdxabmq/V2JClNtD6dzX+TsoGzHxuXPgWKIBa5
 1h9abmk7+2t+pzlOfWAArOyUaP4YttE06bVHjEeOH0bQmy1TGKsmlr7g7uRiu7ZLrgfc
 IfA2Tj8Qt9vuy7sQZW55+/QV3jZDa106nT4MALTalRP1BqYsPeoX9daGLrgNAyKyLLj0
 Bz1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FBFU6RVE
Subject: [Buildroot] [PATCH v3, 1/1] package/cwiid: fix build with gcc >= 14
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
Changes v2 -> v3:
 - Fix patch number
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Fix variable declaration instead of adding a wrong cast

 ...gins-led-led.c-fix-build-with-gcc-14.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/cwiid/0003-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch

diff --git a/package/cwiid/0003-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch b/package/cwiid/0003-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..ba8121802b
--- /dev/null
+++ b/package/cwiid/0003-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch
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
