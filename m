Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC5DEE7FED
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 12:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0020F415F8;
	Fri,  8 Sep 2023 12:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0020F415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FG04frObNEeD; Fri,  8 Sep 2023 12:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC72F41753;
	Fri,  8 Sep 2023 12:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC72F41753
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7BDF1BF2A2
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 12:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F42C415F8
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 12:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F42C415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NcgZI75pgI6B for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 12:54:18 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DF24414E4
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 12:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DF24414E4
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-401b0d97850so22535305e9.2
 for <buildroot@buildroot.org>; Fri, 08 Sep 2023 05:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694177656; x=1694782456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QMkWeEXa+j+mp47czUMzN1enOej39OXolOc4UEdP2lI=;
 b=vKgNWj0he2S580OCkWFIX+mfID94i1b4hLJIzE78FP5F2iL/3iWJI/cNFs2Xa/qZlw
 +Xj4wAGAGWpE1voXQSGjv/7xu0gHcGf0b2wxMtN8EpDaXkDmgMiuEbqGZSAgGhWalJ7K
 MoeL2v4s1AJRfEy16MiZ/EvFXzpml8YJFBfDCRYMkmxpoi6y7y9lIY3h+138/xS81QWB
 rUB11ejpmr+fDo/0SLC1jZBV1k7Y0MqERUiceDPkQaYABejhalxYmxNVaMUqttyO2c8e
 Xl8buAoBVDJnNpJnPslQdknRBwM9u20q7UJGA9BvyGE0A8QMEkAsukUEcfyj8r+KIL6E
 ww7w==
X-Gm-Message-State: AOJu0YwILLGoCV3o+LFj6M7Gi4tdz20t91jcQ6NBNUUsuPpVCrckgID5
 k8Bq+TH/O64/A0rs0wXyE0dbEYDycN9E1A==
X-Google-Smtp-Source: AGHT+IHIxnNB8wSlKHRAptTSQhY5rnGeynAm/2mtmRRdRChwtp7jehyXTTu8ZYcBr9zw4az+JwPYXw==
X-Received: by 2002:a1c:6a1a:0:b0:401:b1c6:97dc with SMTP id
 f26-20020a1c6a1a000000b00401b1c697dcmr2016552wmc.23.1694177655937; 
 Fri, 08 Sep 2023 05:54:15 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 w3-20020a05600c014300b003fefe70ec9csm5133890wmm.10.2023.09.08.05.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 05:54:15 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri,  8 Sep 2023 14:53:59 +0200
Message-ID: <20230908125400.3722455-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908125400.3722455-1-thomas.devoogdt@barco.com>
References: <20230413142927.3137190-1-aperez@igalia.com>
 <20230908125400.3722455-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694177656; x=1694782456; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMkWeEXa+j+mp47czUMzN1enOej39OXolOc4UEdP2lI=;
 b=iqZWMEtatvPt5utd89UCo4llUazjtG8nvh1ms7S1tzlfsjpz6GYRoxMCgOZSmGFA0q
 eG0Px9AxkAJPNLWd1hpkikIp0K3Aq5YD8X6V03ABjJPqFW9wHxwAgvn0rNgCxVU6OLSA
 6LTLSzhBNA1LUs0DhpsDTTqNUOfEerluHt7F7ss+C4f0fuy8C+Np6WsigqIVyDqhN0yC
 lLgHcHy07iChHdkCbQwhs45eHlg1GnHtygXl9UeCaln5d+dOrnCtQK0VUr9Mxr8h4Zxj
 lCMMHDa5VnmqolDsbwWTCtpAhKbSP4Xiex7V/jTrxaHbnrdUjSaeJynjbtmK82EO/hsC
 0Q6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iqZWMEta
Subject: [Buildroot] [PATCH v1 3/4] package/webkitgtk: make gbm support
 optional
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was added upstream in commit:
https://github.com/WebKit/WebKit/commit/22e4c0386605d84f42f2d46fd20bdc46e3078498

Only enable it BR2_PACKAGE_HAS_LIBGBM.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index be2d04054c..c096e3b3c1 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -89,6 +89,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=ON
+WEBKITGTK_DEPENDENCIES += libgbm
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
