Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D96C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 21:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA95760C09;
	Sun, 20 Feb 2022 21:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PK8PJLnzdsqM; Sun, 20 Feb 2022 21:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF44B60BB1;
	Sun, 20 Feb 2022 21:43:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D25671BF3D7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1348401B1
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FhdJbEFDHXL for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 21:42:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31566401A2
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 21:42:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m27so12057088wrb.4
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 13:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lJhJP+99G5qCoXpfyV8Gh9inq5mOgHFIxtI6i3fK4jM=;
 b=ojbvxPGJF3fgwzc5DElLMcHNPCZS2Edi8Qs+D9J905iLoZ5NbUflCm9N9OZ5XShwSM
 0Q7KxS15YTsjDV5hP9XXYU8p2jERVXEZxjSD78MG0r4Pf9drhD2hQraHlr1LThAh7g7s
 iwfV/gDLzVCVVtLppuanBlLNmPbQAkpQtbMI6ria/ip1POLYMDpcnXpjrOmOeoNHiiQq
 xEkGUTCJ986v+NqCA10BDTGwwZYBuThNT3ZuHKJQVLGnhTbMo8+f+5MYpTflqjteZYJ+
 JuCGbAIE8MXIqRU74r0krayaPIawDMvpn6btTaTv+uFC5VDsgH0CriqlDN9XKRuYR/AL
 WE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lJhJP+99G5qCoXpfyV8Gh9inq5mOgHFIxtI6i3fK4jM=;
 b=6RjUA2WzMUgdMa+bktO/kk/kBooY5qCJm+qkCwjB/QPpmu/VJm2sQIgQKr+BIRThEf
 tpz1Znd9xe+Lpv+G3GHMnIArpJtdMf+pAk+5MkNRl4CD56DF69I2WGMt7q3mW7C/t1nK
 K9ljxGufSkNwuTQIjJGgvpS8uWUZYesoQaGAwrdo0FLnpVl60WUDceRV3mBsRYlB99MQ
 SyYcOGA3aAXH6L9p8yTCrwIE7Z3TEPRfGtn+/IiGuxWtgAWG6qDYEYvvQqkyhcxJOpqe
 Wfa6GATNKhrOVHTyCzV6Dfzp59iqsYrW8c+sCxA8+CZ2VYk+tnbzi+0PBgqOqoehH6Ds
 R+eA==
X-Gm-Message-State: AOAM5320Nq1M9RlXgA0PjukubvMghyI03RVcGybI7TWBP/StimiYl1RX
 DLr/P0sxmbUjotzQW6yg9q+WlJmTNhU=
X-Google-Smtp-Source: ABdhPJxA43LUqwOZo8SEtja66OUIxtrQW6X5YiR9brKA60cN5x6TnDsq9LZzLpvWtHlYuspw8m7A0w==
X-Received: by 2002:a5d:64af:0:b0:1e4:c2af:7d44 with SMTP id
 m15-20020a5d64af000000b001e4c2af7d44mr13713106wrp.126.1645393376300; 
 Sun, 20 Feb 2022 13:42:56 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id s7sm13586725wri.5.2022.02.20.13.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 13:42:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 22:43:02 +0100
Message-Id: <20220220214302.1739087-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-savage:
 don't override XDRIVER_XF86_VIDEO_SAVAGE_CONF_OPTS
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

XDRIVER_XF86_VIDEO_SAVAGE_CONF_OPTS is wrongly overridden in a
conditional since commit c38103f2fe793ea5257d3f5b8413ece7a5c60538

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index d7311aa918..102aa2c48e 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -13,7 +13,7 @@ XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_SAVAGE_CONF_OPTS = --disable-dri
+XDRIVER_XF86_VIDEO_SAVAGE_CONF_OPTS += --disable-dri
 endif
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
