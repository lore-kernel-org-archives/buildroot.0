Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEB6C0218A
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 12:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56D0280EA1;
	Mon, 27 Jan 2025 12:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yME9QcrbAU1g; Mon, 27 Jan 2025 12:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60A3680EF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60A3680EF4;
	Mon, 27 Jan 2025 12:56:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54FAC71F
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 12:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 358D040526
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 12:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqESshKvVCMS for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 12:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.46;
 helo=mail-wm1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC02B402ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC02B402ED
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC02B402ED
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 12:56:53 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso27844305e9.1
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 04:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737982612; x=1738587412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H4qrGYa6b32m8SYrR657Rd4ZTfkG/CDn67VJXdYiHCM=;
 b=m2XTBlbfJ8D96+NagPVJTVCITMlZBUNjyhIKtlQOiqc7BzVcPSgNnMbjvou0CBcFk0
 wokc2lHBEnBxN6kG0WONl9b9QJ4n/6dUKuQVOZjgBfy9RuzHtv0Yuu9jHN4Lmjw0YJX/
 rrpe7fvmEvtrlkWTEj2k3b5ZL0H82/CKagwWVfi3WyQENHB42GVqgtbV+PRLmBGsA6ge
 /4FEf6/ngidL/bKVQq42DwmkUBqTnjg+/2RqJbrj5j2tT/kafDF7VfW8De1SUjJR55me
 vUcD6HwMcL5Yc4d3RmIayVE8YBYZAcAkcsX2uZvglPwjWWJxUlGfHFfs4nqW0YsBXARa
 etHw==
X-Gm-Message-State: AOJu0Yy9VjeKmfR6BlX1GlPLFNGozIp5Nhqry5fAbU3fx9npEqczpc4j
 /qfulFOnf/8vRcySlMk3I4Q1pzGOyLgXesgB92YCUIW3kDPsso08IOi6Bg==
X-Gm-Gg: ASbGncsl8RZeWpt+zsOWSr0lSR4nIcypM00wMAmE3tkrbIzZdCc3fsZJk8EeEc7VbiO
 xgOuYh0kuNuU7hjO21BeKnItjbG44kQ2HDszYIkA6h4YKCbLs5lhy11f6SljQRqDN+8ofZUaeun
 ZcMsrxj8+rvUTMaNNy5L+uidh162YjA4V1DANGbCbwWd/pu4h9BbklPQxT451YIIlzdStPFsKF6
 XbvdjFaJAIktDfDnXeYWzONl8McbUERCtQoOiUu8BaiORNgr+uapGeVHs+63DD848N7PPY/ITQw
 OfGz6rJorJZvqcSSkYJm54kslIFSp16WypSIJG4EU0N3JSiGdZMDtSkiqQ==
X-Google-Smtp-Source: AGHT+IFT7AVt3IWyp0c9rNQrqBt1Bkm4QyoesEyM5Fn3qkvVxjDOdEnHL38LOCWUTSRsMU+6aj7zKg==
X-Received: by 2002:a05:600c:3b87:b0:436:2155:be54 with SMTP id
 5b1f17b1804b1-438bd052e25mr111399435e9.1.1737982611635; 
 Mon, 27 Jan 2025 04:56:51 -0800 (PST)
Received: from thomas-Precision-7670.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4fa3e3sm133011635e9.3.2025.01.27.04.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 04:56:51 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 27 Jan 2025 13:56:43 +0100
Message-ID: <20250127125643.1758840-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127125643.1758840-1-thomas@devoogdt.com>
References: <16d6d5fa0dc9be7c219a42b7f7046b2c@free.fr>
 <20250127125643.1758840-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH 2/2] package/fontconfig: fix compilation on
 targets without pthread support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

The br-arm-full-nothread fails because meson (wrongly) assumes thread
support when cross-compiling. So add an explicit check on pthread support.

Fixes:
 - https://autobuild.buildroot.org/results/5b0/5b0ae4c858e9debddf9bd9bd86cfacb6951b4c3f/build-end.log

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...explicitly-check-for-pthread-support.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch

diff --git a/package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch b/package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch
new file mode 100644
index 0000000000..ca394ab7d5
--- /dev/null
+++ b/package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch
@@ -0,0 +1,37 @@
+From 3c9de31dda1a1d44fade7a61e66c989178d6c2a4 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 26 Jan 2025 10:15:39 +0100
+Subject: [PATCH] meson.build: explicitly check for pthread support
+
+Tested using buildroot. The br-arm-full-nothread fails
+because meson assumes thread support when cross-compiling.
+
+Dependency threads found: YES unknown (cached)
+Has header "pthread.h" : NO
+
+Upstream: https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/aad470dad519b6fe3459023b82941b4414b71313
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 4439758..07e242b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -383,8 +383,10 @@ endif
+ 
+ if host_machine.system() != 'windows'
+   thread_dep = dependency('threads')
+-  conf.set('HAVE_PTHREAD', 1)
+-  deps += [thread_dep]
++  if thread_dep.found() and cc.has_header('pthread.h')
++    conf.set('HAVE_PTHREAD', 1)
++    deps += [thread_dep]
++  endif
+ endif
+ 
+ fc_templatedir = get_option('template-dir')
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
