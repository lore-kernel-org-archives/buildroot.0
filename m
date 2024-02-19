Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24A8C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 18:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ACF16065D;
	Mon, 19 Feb 2024 18:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoLhJM6nATmZ; Mon, 19 Feb 2024 18:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ACB46077A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ACB46077A;
	Mon, 19 Feb 2024 18:51:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED0C11BF5AA
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 18:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8EEC4010D
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 18:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHZN9Iwvo4Pm for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 18:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8F2D400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8F2D400E4
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8F2D400E4
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 18:51:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5129c8e651fso3178776e87.3
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 10:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708368686; x=1708973486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wwNDmypvzSC/YuPvz2iGJZAeFbZw1+Fv5yoJjRleGTM=;
 b=jVUJMnQIUOM5j0Z8VmTe3KHdEPXk4FlYk9B+nmBVl/9LGfQPxTS93cxNfsiwlXhaOi
 B/iJTnwRx/uzx40xIW6Ks42WRJqAWloLwGliFk1p94ew9ERC7dA6ZrVd0jYNYFbs7HzB
 kKvaUfVHdWh4rgsFTRQiFd/OHVCmwh2w67sHJu/9dDUc0CVcSp8wfHdPcbGD+AH6j2cO
 TECoJZJ3GazCRndSweM9hmLy6Ws8ZsHkuodLSC86qZTHpUd2blsNfu0OY6+OWdAS/gNw
 VldpSY/3NciswS4ZeWDlASMyfSAODUOiVWSytPhSQgUI0erRF71mP7gLtgnSdSryTOIT
 4hAg==
X-Gm-Message-State: AOJu0YxhC3kV96GExcgM5+XWOCHzs9/W4UDfFnVOWFkQNZIIGRCdujGR
 EK8a+RSmswa4XZFmnLaRk6NOuVhjXCSUZ/rp60zYjno3hkSIjQMwFaWDomKM
X-Google-Smtp-Source: AGHT+IFLg9VghYCBPJP34EncJtpDNAUOWV/fdXic2fSmJWshiDmcZovc4e6V19YmLZrUSuS0MVRlTw==
X-Received: by 2002:ac2:551c:0:b0:512:a785:53b with SMTP id
 j28-20020ac2551c000000b00512a785053bmr3829550lfk.46.1708368686371; 
 Mon, 19 Feb 2024 10:51:26 -0800 (PST)
Received: from LinkMed.fritz.box ([2a00:10:7f17:f01:158e:6095:a0bc:29ca])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a056402415000b005644e4fdf36sm1933974eda.6.2024.02.19.10.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 10:51:26 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 18:48:27 +0000
Message-ID: <20240219184827.790288-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708368686; x=1708973486; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wwNDmypvzSC/YuPvz2iGJZAeFbZw1+Fv5yoJjRleGTM=;
 b=PYua2VaWJmakON1w0z4GHGx8akFzFNKUTBhEeor/nSnzKW33jtl+9AxvTMUSPsa1CZ
 vLME70h8xXrwFzPgOb40Lsnn9Z5D5eSUAOj75Vuf5xei5cx9Uolskm1sALblBwxhArDo
 W53Jc/ESlOuoxSzh9qJ+phK5qJx0HoFBsUQLI8YKOAHN6O1J3Y1Dh6BQ0X7Q15AwUSJi
 G46DGrdlc+l3l88hknUixhF5gPfC9Ja3EpvehImoz22GwbWnw2O5VL36h58NhIugM/wu
 ypRU1VVMYY9bLTNjejF4ruO4EqqbREGosavyp6Fu4rCfobhNQYeX0Fdt0Q2SDPIbLjAn
 yxWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PYua2VaW
Subject: [Buildroot] [PATCH v1 1/1] package/slirp4netns: bump to version
 1.2.3
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/slirp4netns/slirp4netns.hash | 2 +-
 package/slirp4netns/slirp4netns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
index e3115c1be0..e310da1af2 100644
--- a/package/slirp4netns/slirp4netns.hash
+++ b/package/slirp4netns/slirp4netns.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b584edde686d3cfbac210cbdb93c4b0ba5d8cc0a6a4d92b9dfc3c5baec99c727  slirp4netns-1.2.0.tar.gz
+sha256  acce648fab8fe5f113c41a8fd6d20177708519b4ddaa60f845e1998a17b22ca5  slirp4netns-1.2.3.tar.gz
 sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
index 7ff594cc44..7fa992af6d 100644
--- a/package/slirp4netns/slirp4netns.mk
+++ b/package/slirp4netns/slirp4netns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLIRP4NETNS_VERSION = 1.2.0
+SLIRP4NETNS_VERSION = 1.2.3
 SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
 SLIRP4NETNS_LICENSE = GPL-2.0
 SLIRP4NETNS_LICENSE_FILES = COPYING
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
