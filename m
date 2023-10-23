Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63C9CDB474
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 09:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 891784150A;
	Mon, 23 Oct 2023 09:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 891784150A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkQNRJTzNZY7; Mon, 23 Oct 2023 09:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8428B414C7;
	Mon, 23 Oct 2023 09:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8428B414C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B238E1BF35D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98ACD80FB2
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98ACD80FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KJ_fSryDjM4 for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 09:25:11 +0000 (UTC)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACD0980EEC
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 09:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACD0980EEC
Received: by mail-lj1-x244.google.com with SMTP id
 38308e7fff4ca-2c50906f941so46275531fa.2
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 02:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698053108; x=1698657908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lu3JOxTBlO+Mf4ZYNWjOGJekB967Yl7LwWBFkKVNtsk=;
 b=nTZ642yrTuR3JXGp1aBHIdMVui9PKSY8ThMEjJ9iR+HCdK4K0EZooFl4oAxB9Y/2P/
 cuPpII9C6Dqp/hSzwrpz7qF9m2beHzfvbyhqAp7syXV65A/ZgLIGFOgvYv4D1NBJ1fnR
 ix7JNXceRZ8w1bQWwzfZtrQhv4O3SowuQZl2j/b28hAw6QAXu/yOaRYRxEw7THrfGMob
 HxiTPOxfm/apbD+XujORSl2scoDYHpDjCqbdV3/WyFpuRJIU60VPpGgCu2lTpYpIBBNz
 w7MN81wOBwwZWw4I1dMlgMbyCD84mlO4mWfzyMhWWFkX506+sajNetCsFPKQB9ya+5gI
 tk1g==
X-Gm-Message-State: AOJu0YyVbwBEvho30qOL6XwDDJmB1hPQ82egFsVy/uSALU5e9lYEApxY
 oD+9RSMG9zNfved3AAdQoI4Vp2QCgjV00X9rf/EA1HkarqoRzw==
X-Google-Smtp-Source: AGHT+IEKY9Bvvb98iL/07ZLtuRWjbykp/rYeHcq9HPOHni4Ey0oTka9WZzmYgPni7c38eHvWBsSTWQ==
X-Received: by 2002:a2e:b04b:0:b0:2c5:1b01:b67f with SMTP id
 d11-20020a2eb04b000000b002c51b01b67fmr5812475ljl.52.1698053108371; 
 Mon, 23 Oct 2023 02:25:08 -0700 (PDT)
Received: from fedora.. (host185138219236.static.fidoka.tech.
 [185.138.219.236]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b004042dbb8925sm13911859wms.38.2023.10.23.02.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:25:07 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 11:24:57 +0200
Message-ID: <20231023092501.481436-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698053108; x=1698657908;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lu3JOxTBlO+Mf4ZYNWjOGJekB967Yl7LwWBFkKVNtsk=;
 b=k/Z8GX2eCrjypZXsYhijq63UAvN6toUxSy6WQM7hrYRJRQTfq1MnS1CUaV7pzuMdaw
 RkSD0urGncs/90ntjPTESHioa+l64VPKRGRPEpvxTIVQ2Rt6zigShVmCaWahjqo9jIX7
 rGpVqTwXt2Z4VMM6JRHxyLEjfQ9LDMZ9AcIAc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=k/Z8GX2e
Subject: [Buildroot] [PATCH 4/8] package/opkg: add xz suspport
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/opkg/Config.in | 6 ++++++
 package/opkg/opkg.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index c3c2463393..679214beea 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -32,6 +32,12 @@ config BR2_PACKAGE_OPKG_GPG_SIGN
 
 comment "compression support"
 
+config BR2_PACKAGE_OPKG_XZ
+	bool "xz support"
+	select BR2_PACKAGE_XZ
+	help
+	  Enable xz compressor support.
+
 config BR2_PACKAGE_OPKG_ZSTD
 	bool "zstd support"
 	select BR2_PACKAGE_ZSTD
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 605d4de82f..e32dd1a84c 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -27,6 +27,13 @@ else
 OPKG_CONF_OPTS += --disable-gpg
 endif
 
+ifeq ($(BR2_PACKAGE_OPKG_XZ),y)
+OPKG_DEPENDENCIES += xz
+OPKG_CONF_OPTS += --enable-xz
+else
+OPKG_CONF_OPTS += --disable-xz
+endif
+
 ifeq ($(BR2_PACKAGE_OPKG_ZSTD),y)
 OPKG_DEPENDENCIES += zstd
 OPKG_CONF_OPTS += --enable-zstd
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
