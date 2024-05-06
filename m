Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CAEC25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6540F60A44;
	Mon,  6 May 2024 20:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffZP5l1MCour; Mon,  6 May 2024 20:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F08560A4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F08560A4D;
	Mon,  6 May 2024 20:52:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 907D81BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87DC5820F7
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5eP-yW53l5r for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9523E820DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9523E820DD
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9523E820DD
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:52:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41b79451145so17905415e9.3
 for <buildroot@buildroot.org>; Mon, 06 May 2024 13:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715028772; x=1715633572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pmfmPQFniduxf3DEtfSs0sNnHjqHzZ3JBiNrlVJtX1k=;
 b=lmPWe2I4rS33FJoh80BTt2fXo9Qw3zD7tHvjg4VymXHiYvaCISQuTMLNznFku1uvda
 zzw8wKbZ8Sa6jg6e06NOEVfrFQ4nXq+OGKdacM69IIn1K0CBIH9ueFbp15VTqsx54EHt
 tgTKErhmzydZrvHLbC/yZhcHS6BpQNacMr4sqvCFY6+G7oBJ02iBdEW9jb51EigA1HdI
 rWuj4H2uwC+gCvtxDjAO9XmechUOZzxARhShoYx58Zmw+8v+lPLJdgNaOKu5+pDLkqLF
 l4pCF7xjf9731Jz3u9wnjzJ8rfvl2ML5Peg6xQKk5qO1/C2IfRWhuCSejQpZWeHRXwOO
 VGpQ==
X-Gm-Message-State: AOJu0YyAvf92bWGayzc7WNL87wT4FhegHfo+Pvtrr3Bv9zTgG5MZ6z1t
 cQ/cMqZkIL+bAehU/UCYGoz5LLWOPmb8ZbLrbqJpQaqU3YFjgSCh08VUEg==
X-Google-Smtp-Source: AGHT+IECs29o9d73moTz3kyni0T/ES7zr/Rv7CNf8JKGuRC0x+ft9tHWA2QRMUKkUqxyj4QsteMlPA==
X-Received: by 2002:a05:600c:154d:b0:41d:7c48:5558 with SMTP id
 f13-20020a05600c154d00b0041d7c485558mr8540781wmg.4.1715028771944; 
 Mon, 06 May 2024 13:52:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c1d8c00b0041bcb898984sm17259189wms.31.2024.05.06.13.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 13:52:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 22:52:49 +0200
Message-ID: <20240506205250.1264901-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715028772; x=1715633572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pmfmPQFniduxf3DEtfSs0sNnHjqHzZ3JBiNrlVJtX1k=;
 b=M2GkeNPlqGwWdKiMucPxUFpSVORcgi3/OJwq+OsHxC/9wiHdFbJgCz9njYVwPb0nxO
 ZcFa1Fbugtx/3gF5mFi9yUd7vIRB6vo03zZo/RjkNgGa7/9HYYkNuVm6SDVI966tSWnA
 LuMqS0pUzMhpLgtrmCD/JDoKdxtEWOuE98HNcdTDHgukd3qpQiC4GtlNwhWqaJ5fgFJI
 NmSER0yq3wpZSEd50/JSUfWRVW3qKhc7spnfYC5MGTdahDAkFXk58CBq/KAtKJwBguyA
 0mc/NsSQ82WG1MolVuYKFYLY7Iip0/ToLrsgKQPRXWRjV3R/h88g9jW2Ic4D8dk11yvv
 Q30g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M2GkeNPl
Subject: [Buildroot] [PATCH 1/1] package/openocd: fix build with libgpiod2
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

openocd is not compatible with libgpiod2 resulting in the following
build failure since the addition of libgpiod2 in commit
57391fad2e619395340b81957ddceab1b1df2e20:

src/jtag/drivers/linuxgpiod.c: In function 'helper_get_line':
src/jtag/drivers/linuxgpiod.c:283:19: error: 'GPIOD_LINE_REQUEST_DIRECTION_INPUT' undeclared (first use in this function); did you mean 'GPIOD_LINE_DIRECTION_INPUT'?
  283 |         int dir = GPIOD_LINE_REQUEST_DIRECTION_INPUT, flags = 0, val = 0, retval;
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                   GPIOD_LINE_DIRECTION_INPUT

Fixes: 57391fad2e619395340b81957ddceab1b1df2e20
 - http://autobuild.buildroot.org/results/7195e8b76350f26ab3b963702d88b254512e6928

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openocd/openocd.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 78c6e10c58..b24d1eacf0 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -56,8 +56,14 @@ OPENOCD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
 	$(if $(BR2_PACKAGE_LIBHID),libhid) \
-	$(if $(BR2_PACKAGE_HIDAPI),hidapi) \
-	$(if $(BR2_PACKAGE_LIBGPIOD),libgpiod)
+	$(if $(BR2_PACKAGE_HIDAPI),hidapi)
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD),y)
+OPENOCD_DEPENDENCIES += libgpiod
+OPENOCD_CONF_OPTS += --enable-linuxgpiod
+else
+OPENOCD_CONF_OPTS += --disable-linuxgpiod
+endif
 
 # Adapters
 OPENOCD_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
