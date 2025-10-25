Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14CACCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 14:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10DAC81185;
	Sat, 25 Oct 2025 14:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jn-cJWHOxE1H; Sat, 25 Oct 2025 14:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0886E81110
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0886E81110;
	Sat, 25 Oct 2025 14:35:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD1C4976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93547607DE
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmDRZo7vheZQ for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 14:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.49;
 helo=mail-ed1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E9D8607DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E9D8607DC
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E9D8607DC
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 14:35:21 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-63e0abe71a1so6181302a12.1
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 07:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761402919; x=1762007719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MKWlR2Bgv7O1M9FtTyHC4eMp3a8z8uH4e3uPF98mns8=;
 b=tIUqOwMLzoy6H7JKmByMujs5j+Ir2VN0X9EskNjiw0UFrs6d3i/lhojkD+RqR+HhSA
 aOKS55nHoxVSU9qlPuv7RehDGc9Pn6fCVzTE44bNxM67aUiM3S8f3uu+xPweGDBtUW3/
 ECc51EuMy6/xu65n1r3pYWn6UzzjfQjDmQfB2wjR8I5uTV2gLny9kTDODQ1M8+CM5t2N
 H/LKrxq7RajkMKFGgKL8WC8sUjcyi/M/9idG9m6///WyySEygR9BgGtkY5t6c7wc9Li7
 wH6giUX+U9junSwR4QvFwgRFx4u+EGLcCLh2DLJ6ZN12xanq+ET+1pq/Z+/Y3jSgXTg1
 3F7A==
X-Gm-Message-State: AOJu0YwyP58quNSz++Xo4ag+M6ttSHq0ZLq4a90PdWvjKmkhOZGviLG9
 1HjnuYz19RCJimKs2M/zu99WpAxT/HMiFnaNYurfCf/85k90P12pmdPlMOkkwg==
X-Gm-Gg: ASbGncs5UacbW4zMIcc787fY1jkWlPf/L1J51kv9+g7IPzx29BDFTr6CbsbfpBlpS0F
 kW5lOOYkBn3N2Oxp8uoCK5t04kuPvCQwG0RE8z5ZI9Cd98tQAS+luhTIzBp/UBEPa5xbFsPUmMr
 gea+wG3VbNUqVTDmlBKmpjbR6jI2v77lnGPC/OoHIzk2WagOubNs/+T72y9XgpOxvpBG7bLyxPX
 0CgbIBTZEKkg2d1JWVKR799fm622kXPaSEggdywa+3vI/z1/5OheZON1kE1XD51Z17w6lVsbrLf
 RbJpRebf+IQPw1nZydW20kzRY0FOi31WcYeBocrzhujo/gHoF3JW/f6plbrglO3M82a8J93JsXI
 8get3suHy8hF05i2/dU/+0AIW48nrHCNB2KK3hrClziQSDAJv6rPYY4kp46XNzNdONPxZEbN19s
 i8Pcl/+bkdRysHfDAVNIuVafJ7wzt58jgFHP624ViQGzlaQO52O+huCen0+UBzSpNt4isLDI2ut
 2K2Tw==
X-Google-Smtp-Source: AGHT+IGkrPBZ0rk7GUpRzrI32xM+Y0E3wz8OaIbSi648KyGMBPZA+vaMXuiK38czhcmXH7+wuYRS6w==
X-Received: by 2002:a05:6402:1e94:b0:634:544b:a755 with SMTP id
 4fb4d7f45d1cf-63e3e4783dbmr9287711a12.19.1761402918998; 
 Sat, 25 Oct 2025 07:35:18 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb6f:7900:7ce7:55f1:adbb:3618])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7ef6e777sm1855280a12.6.2025.10.25.07.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Oct 2025 07:35:17 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 16:35:12 +0200
Message-ID: <20251025143512.78812-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025143512.78812-1-thomas@devoogdt.com>
References: <20251025143512.78812-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/webkitgtk: disable internal ccache
 configuration
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

WebKit's auto-configured ccache results in 100% cache misses.
Disable WebKit's internal ccache setup [1] since Buildroot
already manages the ccache in toolchain/toolchain-wrapper.c.

[1] https://github.com/WebKit/WebKit/blob/webkitgtk-2.50.1/Source/cmake/WebKitCCache.cmake

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/webkitgtk/webkitgtk.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 0b6a1383ca..fecca3529d 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -19,6 +19,10 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
 
 WEBKITGTK_CMAKE_BACKEND = ninja
 
+# Buildroot adds support for ccache through its
+# toolchain-wrapper, so tell webkitgtk not to mess with it.
+WEBKITGTK_CONF_ENV = WK_USE_CCACHE=NO
+
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
 	-DENABLE_DOCUMENTATION=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
