Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18146C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A7E040126;
	Thu, 23 Feb 2023 12:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A7E040126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKhajycfIU4T; Thu, 23 Feb 2023 12:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B54FB4046B;
	Thu, 23 Feb 2023 12:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B54FB4046B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A46B31BF573
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 12:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8683D4046B
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 12:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8683D4046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXum9cQy70FW for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 12:56:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E352F40126
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E352F40126
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 12:56:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id 6so10202719wrb.11
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 04:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8os3N8eGEMmNWFK2t4m+uNhDO/5Nomlm69qJtq2qkVg=;
 b=j67b3/rmufMr8WTOqr+DxVnaE7hy12v3PE1E6/j0nxF8dx8fIszWIxMjc5oLj3iv2O
 uzZuzW2JsB3iqmqiymWmXf/lxdjaQoA4nQJztvXOeHgqykBCXXUX2qGrrpD6SzO1cwDO
 RP7DBfbgM1QJtiXfhjgWoqqNlWIAbUoZmQinvV5k4U106gP3DBwfSqXtvHS6+C4eSdVE
 309bKdQITvvsh6Satsv4wJNk6RcY96KBtfQeJpAd3oiqiLg63BZsdxNFW6smtHAdrkgV
 zgZCAgPLb8u5OoT2h9Ah3b0LnHIJrvnwZeQN91+Bva2pS/3eiqH/vfeiY+p+vYbfmRMp
 uPXQ==
X-Gm-Message-State: AO0yUKVsXonmG41d+OQXaSo6b56EaKKhjDDF6NEQfX3VjWQ06ERhlfBI
 TF1ImB84itLh32g8kMm55cjhnAJSZPDmdLeif0U=
X-Google-Smtp-Source: AK7set8UJHgFAqeBjelg2xAtOeteqImYrJTJZEze8WWfWXxzNIbDaYG1kf8cLu6o4VtZYU1IVuQNyQ==
X-Received: by 2002:a5d:6105:0:b0:2c5:588c:84a8 with SMTP id
 v5-20020a5d6105000000b002c5588c84a8mr10240306wrt.19.1677156987456; 
 Thu, 23 Feb 2023 04:56:27 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 j22-20020a5d4536000000b002c5a07e940csm10224533wra.33.2023.02.23.04.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:56:27 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 13:56:12 +0100
Message-Id: <20230223125612.3156012-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CACXRmJhC6PHB4HJbj3rYQyoH=xSY6Ua_V8-+57G7LrL4gcGBPw@mail.gmail.com>
References: <CACXRmJhC6PHB4HJbj3rYQyoH=xSY6Ua_V8-+57G7LrL4gcGBPw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8os3N8eGEMmNWFK2t4m+uNhDO/5Nomlm69qJtq2qkVg=;
 b=cf0GPD3FqTtcrSIhigid2EW9SXAWJ6+wxy6elFJ5vx3mPVI0RD5DblvMoexc64PglC
 nT4J66Wkm1XF898wVVYNxp5aN9szUgULWykj1Xh854TmVuY/wLmTtUOujPDH4b7CAxSZ
 BBj3ssdJ6xLnEvOwuSOPAkGZrurzkBRN26Zpi5I3le/+5lKytUcKPWfMPg1FVyc+6ZXO
 HBOzfFyix41efBKTtyUmVVKwh9m3ViR8Y9tcyLXwiChP+zw0RmCy/MTt63PVz3Vazi60
 NJVpqcU2BpQ5uaIMJ8jdc0yAsrqYpa+Y0+VtiE9+mSrGDRE+0fapV59kT1SQRLG8GEzf
 IU0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cf0GPD3F
Subject: [Buildroot] [PATCH v4 4/4] package/libgtk3: fix update-icon-cache
 on empty directory
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If both, hicolor-icon-theme (selected by libgtk3-demo) and
adwaita-icon-theme is not selected, then the /usr/share/icons
folder is empty, causing find to fail.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v3:
 - rebased on https://patchwork.ozlabs.org/project/buildroot/list/?series=336254
 - needed to fix the webkitgtk 2.38.5 compilation
   (https://patchwork.ozlabs.org/project/buildroot/patch/20230220090923.2155635-2-thomas.devoogdt@barco.com/)
v4:
 - replace only update-icon-cache when the demos are built to a dir check
---
 package/libgtk3/libgtk3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 2821c7eb52..e2dc8eabfb 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -146,6 +146,7 @@ endef
 # Create icon-theme.cache for each of the icon directories/themes
 # It's not strictly necessary but speeds up lookups
 define LIBGTK3_UPDATE_ICON_CACHE
+[ ! -d $(TARGET_DIR)/usr/share/icons ] || \
 	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
 		-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
 endef
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
