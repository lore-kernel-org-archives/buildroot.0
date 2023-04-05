Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E182DC76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 08:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76DBB60B4E;
	Wed,  5 Apr 2023 08:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76DBB60B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZ4UgU3QkAkW; Wed,  5 Apr 2023 08:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7FE060B43;
	Wed,  5 Apr 2023 08:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7FE060B43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D11951BF3F6
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 08:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA6CF81761
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 08:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA6CF81761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JKQc6poJrVHn for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 08:18:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E433E81760
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E433E81760
 for <buildroot@busybox.net>; Wed,  5 Apr 2023 08:18:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id ew6so138965336edb.7
 for <buildroot@busybox.net>; Wed, 05 Apr 2023 01:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680682735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1i7R1kTNphnPCurGIJ99McaoEm/eYy5hrD/9wY/pWWM=;
 b=IC9PrLb9rIKPze6RSbBAYOAo9aCYcGnhR198GEAp/L0jysYl9+UQewFFzHQ/uTkiWt
 VP9hUx6JzwY2/XATCR7T+A2zqGaOAfm87UYPRP5YVw/qIWSCpc6DLTroagjdzBIv38R/
 4P5bc5TaCSp8TCb+7NS6FxWRzihjl9NNFomak5HuDHfzgNbTijOGKXd5gsb2ymgS/uJC
 nDm1PdFWWVYpshqJhjAz4LWVUO1dTudGvbz9xS7+QGlQzMhm3DdvphiNcQ6SXUc8CayM
 eoHEm6+lkyPsiXBOk4/9nUcg4U8q9Wn+m/IphwBy8TSfGx7sqrzl9JpTAy6d1VJo0L0c
 ehOg==
X-Gm-Message-State: AAQBX9du/69K3lolYGkgR9dJHlKPFe9SCpB9x2J3iNq8AbjIxE3xSSwK
 yN9+w5Sh4WnMTywPhvRYBpDRV23EuwU=
X-Google-Smtp-Source: AKy350YUjBjfIFBG5cS6ldwvU/04xYgrZx3IYIaV1c1xeE85ZMAwIVb+5kmF5iP3WgpQr5oVOZDIfA==
X-Received: by 2002:a17:906:74d9:b0:8dd:5710:a017 with SMTP id
 z25-20020a17090674d900b008dd5710a017mr2195985ejl.4.1680682734972; 
 Wed, 05 Apr 2023 01:18:54 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a170906749a00b0094780d3c34fsm7005942ejl.194.2023.04.05.01.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 01:18:54 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  5 Apr 2023 10:18:42 +0200
Message-Id: <20230405081842.244610-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405081842.244610-1-francois.perrad@gadz.org>
References: <20230405081842.244610-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680682735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1i7R1kTNphnPCurGIJ99McaoEm/eYy5hrD/9wY/pWWM=;
 b=bbsn+SfacjAU/u1FcHgyy7z4DKrymMxnB9Xbu09XBn4ajhryHABCbMWOcXQg+pHfHS
 Ox4/5TZWjz1CB/ysOz8YAA1Xzd+LmJsYfAupPNDhL6zF+otcDPn+jxwymx07mIMkSy9d
 H3A/C7oG6go8d0ckX4DqumEgxS7S0tBhdEKj7EsslvvKlf1PuXREJVQQ+wLICFE3XGuF
 Bz4D+StofHjFak3hYTpu3eMyVCBM0SP1k9Jqyx+hUc5HbNp/hwROVyjYJTqfL6rsYxBI
 UO7Dv0rQRIPzdsz8lV5doziTFf8raEh1uMLJh4B2ewZ1VCohmyeUOshubgb3PLTK2DGh
 DMpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bbsn+Sfa
Subject: [Buildroot] [PATCH 2/2] configs/olimex_a20_olinuxino_lime*:
 configure eth0 with DHCP
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
 configs/olimex_a20_olinuxino_lime2_defconfig | 1 +
 configs/olimex_a20_olinuxino_lime_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index a8260a7ea..a38f3a1c5 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -15,6 +15,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 65a78f535..74b6a764c 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -15,6 +15,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
