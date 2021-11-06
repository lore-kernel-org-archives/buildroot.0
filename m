Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3D8C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:35:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBEA7611C1
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBEA7611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 564854019F;
	Sat,  6 Nov 2021 15:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RtF_O3TwL_m; Sat,  6 Nov 2021 15:35:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ABB840131;
	Sat,  6 Nov 2021 15:35:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E02661BF2A1
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE80040131
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKPPdQL6VO0w for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 15:35:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3C58400BD
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 15:35:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso417553wml.1
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yma1m1D3MM6FdOQUyaEjDjwaBE7Zph2hqcCOzinugC0=;
 b=YuxNMPNjZcB9eqjy+GHrQko5niZXvuwv1sZO1vE+Qkd6V+HG+OCwj1aTFj2WVDMw0j
 yUu7N6f6NeIeM2Pheu2banEipr8UFDP3dfacJpCkbQqXZvSR+7MrbMuUhvmyLzSMocY5
 ZCClxoAgcWGX7V3YOOKJw9oiJzLkPNbbs29tol1UiSekvhpejhTUvc+5HBDCTSpOQOJA
 UNnmhoYTTOTWN2qbb+15Al16JggArZdp3enqKzbFNf/PbFCDrkZ4+ymQ9rIJpcduesJy
 u896hKXQTCsqczA0uZTjBdF5g/t78dI2lA0meLCT47klSeCe+VoyFJ7Hfxu+VImkHRdi
 nEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yma1m1D3MM6FdOQUyaEjDjwaBE7Zph2hqcCOzinugC0=;
 b=a/GWV4vbqfFK4uPnP2iyDDYwsD6EhqabkWMyAvVFAxjIpVbnSQdywfOiMuiVd9LAfs
 iYhLXMVxwk7jkkdysCPO2QiwJMbl55fxG4SgAQHvgiYYiJjHQLfLDBm2BkeVrq4z/RsV
 1TSLgI1p8juroP/xnUyPxAemaP8LeyqGo5OtYjvIdhwF2EeYGT4JT6/pd+fdyA1ID+pY
 h7LVg1eOjNeWQHTbLiHTNr1piNHkm77SZ8SEwjy1DhiZy1dp47ylUrhOU0Wo9SaEmT6E
 2ugF4CgUque79R0j2+H/B57iIlSNWhug/TaFfI9HbmyM8YhqRorKRphwIsIP8qTjUAbj
 o/Hw==
X-Gm-Message-State: AOAM532S21BLF85diJlzjqmC1dl0PXvjjqLfg52ZFue2MPZSHmQinhcT
 IDnf7KpQlkXDbdRGTvLAmURNquBAXqg=
X-Google-Smtp-Source: ABdhPJyYXxUVsRDmUooqR++HUvHi3W4MGUrqpp5oQELnlQloOFdFfHZ1XUFfqAOak31j6WX/SIckWg==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr39962142wmp.165.1636212950846; 
 Sat, 06 Nov 2021 08:35:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h1sm10679273wmb.7.2021.11.06.08.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 08:35:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 16:34:03 +0100
Message-Id: <20211106153403.3188732-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lua: don't override dependencies
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

Don't override LUA_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lua/lua.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index b385b78b30..844e165df0 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -40,12 +40,12 @@ LUA_MYLIBS += -ldl
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_READLINE),y)
-LUA_DEPENDENCIES = readline ncurses
+LUA_DEPENDENCIES += readline ncurses
 LUA_MYLIBS += -lreadline -lhistory -lncurses
 LUA_CFLAGS += -DLUA_USE_READLINE
 else
 ifeq ($(BR2_PACKAGE_LUA_LINENOISE),y)
-LUA_DEPENDENCIES = linenoise
+LUA_DEPENDENCIES += linenoise
 LUA_MYLIBS += -llinenoise
 LUA_CFLAGS += -DLUA_USE_LINENOISE
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
