Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3B2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:13:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D3B61269
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70D3B61269
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4685A40425;
	Sun,  3 Oct 2021 08:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_jvCO-UES9Y; Sun,  3 Oct 2021 08:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90A7C4041A;
	Sun,  3 Oct 2021 08:13:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1BF1BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1813B848CC
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2DnwtlHiZh_X for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:13:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5901E848CA
 for <buildroot@busybox.net>; Sun,  3 Oct 2021 08:13:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m22so18740664wrb.0
 for <buildroot@busybox.net>; Sun, 03 Oct 2021 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHnuJNJ9RVT8sdHw8euWuH9/hF5Ioub7sfmOqLGPnNQ=;
 b=AJ2xmcv2T6Ba0d8zSmRSmV4lzKAfaDgut0P2I7WBzrkmd0COMJEP2Iqj52Qg5z4PDe
 h1UP9VBGxplUPALICjFg7xqTpIBrtFm90VzBDVPxgtvM6xhWrUU6keBWslLQ62I3IPTy
 COjXPjc9pKVdg9Ic8fkzVnB1sVNNHiu8l03P4eWdKSAEeNS4l+Tj70uzyp5m3dOmwOYV
 qDXaWqh0X/tUY/Jk3P0oTlBCxLpP1UDSAZJHbhleNMIgClCEahIVzwawzQouehY5hBt4
 tG/Zegz58ZdVQ6b4OQNPqAG8bC8pFzFG2ft5JgHtjF54U2RhNkqZjKhGx5p7gJruRh1C
 CI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qHnuJNJ9RVT8sdHw8euWuH9/hF5Ioub7sfmOqLGPnNQ=;
 b=IJaMqncBsjfefHqI+UroemuOciVZahKCLtXD60XhVVV2KqNj4uccEzIZ+b8/Z424fp
 vu3+P3QFKkIO8pf0rLqvdh9/HU6ndKHU4fTdlnYsJgNh7Wvwvtd+7V2duBHEwlenbefh
 y3ieQtB+DXzmcWogagfulbtzkrTplB/GomQH/IgbOBvsAs3yGYhen68atjI9H46M6aSE
 WFqV0GdEl89IYKhtwLKHbZU0ILAzhBm0L1LhxWdjcxk34A57SHIWW3tRt65TNgsnNfTM
 Dv8ExVm1ozWtoBXBfxs/lj0XYT62Cy6H60RdAIAUvXVzK/axCuuxyoIoPF/4i903XV9c
 ACBQ==
X-Gm-Message-State: AOAM531vD4GRSIVBKcA0AVky8Ai6dNWXMWRXRuAFuuJkOeYI695e76MQ
 hjju5vikPPhoAhVWkCkrm8u0lo0RLPg=
X-Google-Smtp-Source: ABdhPJwwCprC+YEiDezSm6EVnPf98LRspU2ch9srd20qwygD+pr/jFqt3P/9mpWd0iH3Yp+oseXdyQ==
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr7168786wrq.383.1633248829991; 
 Sun, 03 Oct 2021 01:13:49 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id v23sm10649304wmj.4.2021.10.03.01.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 01:13:49 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  3 Oct 2021 10:13:26 +0200
Message-Id: <20211003081326.465560-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211003081326.465560-1-francois.perrad@gadz.org>
References: <20211003081326.465560-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/htop: add optional dependency hwloc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 140d620f2..b5aab3c30 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -13,6 +13,13 @@ HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONF
 HTOP_LICENSE = GPL-2.0
 HTOP_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_HWLOC),y)
+HTOP_CONF_OPTS += --enable-hwloc
+HTOP_DEPENDENCIES += hwloc
+else
+HTOP_CONF_OPTS += --disable-hwloc
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 HTOP_CONF_OPTS += --enable-capabilities
 HTOP_DEPENDENCIES += libcap
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
