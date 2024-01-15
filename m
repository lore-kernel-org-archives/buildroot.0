Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3439BC3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC3C82BC3;
	Mon, 15 Jan 2024 21:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFC3C82BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sM3Uman92fSh; Mon, 15 Jan 2024 21:34:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41C03832EB;
	Mon, 15 Jan 2024 21:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41C03832EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 186CE1BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E527B61122
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E527B61122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpAH3Ch5lHcI for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:34:28 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBD66610AC
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD66610AC
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e6275e9beso22148565e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705354465; x=1705959265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Clj5a43wtwlS73l9fIL0xxUmB5HFzRFhVZavjd7l2l0=;
 b=KB92WhYPM/ls9IaaEONVq/wH6g68RhMHEx8ZA5PX9Pyy+EaFb+KZG40tGL6S3ThMPr
 iXXuAKN1jrXUU50+8c3542lw0igzahM4dKCkUxvPsrTMhOzxTpZfXW6eqIQ4SZqaSPax
 W7KWTjCBqn+Pq/8Hdc9cQlR88oh0KNR2x1WzXjkPR02DHf9/rBCgWkOoojUmcj9qPHVD
 W9nwmKkMf50DcNZqmv8vDhMMyUO1ljxaTa1tZYudx7RwoaEjbkJLYDYkFGAE7GR4onhV
 BYUxp55gY3nEVvNJ17qQhMLj4N/6XcI2bIHIfgePgYvZaNavHdDfdSEnnNAP96cFpkIP
 cN5Q==
X-Gm-Message-State: AOJu0YzINwbqBgDFaHAhvCGTK/sQ7Eha5dmIFRwwP7nAvy0yESdiMxJ7
 c24h/WRz07EF28kJ3WPH2TiX7b6L6ZY=
X-Google-Smtp-Source: AGHT+IFspuTs4igo2xgNl+rCdziT5SSs3h3pbMen1DB/SrumL/90lBCwJEotPhtMgv+Zk2uuJ4jtpw==
X-Received: by 2002:a05:600c:ad6:b0:40e:41a0:7648 with SMTP id
 c22-20020a05600c0ad600b0040e41a07648mr3166896wmr.52.1705354465461; 
 Mon, 15 Jan 2024 13:34:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fb11-20020a05600c520b00b0040e76228042sm5847121wmb.35.2024.01.15.13.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:34:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:34:14 +0100
Message-ID: <20240115213415.17439-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705354465; x=1705959265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Clj5a43wtwlS73l9fIL0xxUmB5HFzRFhVZavjd7l2l0=;
 b=PZhYqwWrA47U+BXGeJP4WC65ANKxDgEXCg0RgiRTSiLOcRzzq3MvQXVW0P1QhG0q4+
 nHOCNKpSBVeXx9/h/B+IndAot/pNj1047Bu5YmIEWj2gpLBxiVlzMXttBgiC/tIMOaay
 F3qnx/f4vGw5W0o7ByAq0z/HKPY41jTfItBTi32+7kH2tnJ29qgSRMo6fIe4EVgh0vF6
 0+N9Zu3OEVREAl5Uy0ekUnwWxwG/QuREJQcWu5w0mTBb98oVKmo1a5Vq8fHosWCO0vE4
 LhHacutxFxW6sHhJ10u00wRoKrHOdwCgCqU6Yd/wdTz4sVNMdvneCC7ob2SUmVKO9JZy
 juAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PZhYqwWr
Subject: [Buildroot] [PATCH 1/2] toolchain: add
 BR2_TOOLCHAIN_HAS_GCC_BUG_101766
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_TOOLCHAIN_HAS_GCC_BUG_101766 will be used to fix a build a build
failure on attr and elfutils with microblaze

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index f1f9212f25..dc4e52bb3d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -210,6 +210,14 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
 	bool
 	default y if BR2_sh
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
+# Microblaze gcc can't use .symver attribute leading to:
+# error: symver is only supported on ELF platforms
+# however __has_attribute(symver) returns true
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101766
+	bool
+	default y if BR2_microblaze || BR2_microblazeel
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
 # ICE: in extract_insn, at recog.c:2294 on microblaze.
 # This bug still exists in gcc = 12.1.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
