Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32A7C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 10:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 809C24162D;
	Mon, 27 Feb 2023 10:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 809C24162D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xo6_N7FQKBQZ; Mon, 27 Feb 2023 10:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0C9415F0;
	Mon, 27 Feb 2023 10:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C0C9415F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8BE81BF25F
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82CD0814AB
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82CD0814AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7z5AeWKiAGZk for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 10:58:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D12814A1
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0D12814A1
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 10:58:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso3373060wmb.0
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 02:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U7cBB6Lwyb6soNUTrFaP2+erd1S7iQihxWRuoi2cD7I=;
 b=EOoLZ9NXYCEr1Z1f3eE9IEQID9375dxRkyXQE4VizwrpCF4I18vWlLw8qD+oVgMH9x
 lXW7pjQt1AmLIb9H6Z+2V+YdUEaHhlJD+72Cf9Pauattm0+sdzzNDRMmLgTX11G5rcaU
 u1v1UzpRCsxT2CwF6oIpmwWgjYf0XcsC985JqYh+5qDdJzt5uR3SD9C8EqCmN0cV3v38
 Od35BAWl8uBANghfw60dTfuJINF3lyJyrjDEto5+BYJ8ej4puBSk6i/lHFD1IYgYOXiY
 klpnpX8Uh4qz0zHHYbd6eHZj8uZAF2cY7pRLLEXpHCQSfcZx/5KaYdGq0pQ4pBa/DWyU
 BH+A==
X-Gm-Message-State: AO0yUKWFxhr/FcJoqj0/HC/y+yKnpcMe3D7g5fghcvAwugdNoB6EncBv
 J2vWV0krVxX3UcU6c5yB4BwTIo4sLnAKNQ89
X-Google-Smtp-Source: AK7set8Pm23n+cIFViJAEwCsYNZVlReSQSLhsTo6sj4ZSc79YfmuypM0k90i+UphtCZm0/9dxSup+g==
X-Received: by 2002:a05:600c:6015:b0:3ea:f883:4f5 with SMTP id
 az21-20020a05600c601500b003eaf88304f5mr8973949wmb.17.1677495536848; 
 Mon, 27 Feb 2023 02:58:56 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 l1-20020a1ced01000000b003ea57808179sm12055048wmh.38.2023.02.27.02.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:58:56 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 11:58:38 +0100
Message-Id: <20230227105838.358916-5-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227105838.358916-1-thomas.devoogdt@barco.com>
References: <20230227105838.358916-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7cBB6Lwyb6soNUTrFaP2+erd1S7iQihxWRuoi2cD7I=;
 b=oWhgBPRwM9vgLLVlh6e0e6qM/QOLWct1sAp2EY4g88GmvRLvT+4VVOFya1OVlBjpmH
 Yg63nzUwnkVIKiTZhuIyA49Jbey/e7rzR+4UZt9K/c7XTw42/KGTnxSB8tS/ciB8G2xr
 r4iOEpvqjnZ5POUhEzQgdH6XJnWDvitHhpBdISKWahN9RAZpIWyGIFORvQ7/b2fsGDBL
 K4m8eG7iwp8w6yp8/DU3gFeLAVPqWcEu9MwhmT4xOiDoHorBAMHb2z93+KbUZrBjSHao
 FPQrySJRPnRVSoLEtD/KMoGlWBzui9UnF2RBzgU8ELzk/eBCkoayjwzLDrMIqbSM5Bh7
 X4bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oWhgBPRw
Subject: [Buildroot] [PATCH v5 5/5] package/libgtk3: fix update-icon-cache
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If both, hicolor-icon-theme (selected by libgtk3-demo) and
adwaita-icon-theme is not selected, then the /usr/share/icons
folder is empty, causing find to fail.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v5: 
 - Fixed indentation.
 - Grouped patches.
---
 package/libgtk3/libgtk3.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 2821c7eb52..191e28dda6 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -146,8 +146,9 @@ endef
 # Create icon-theme.cache for each of the icon directories/themes
 # It's not strictly necessary but speeds up lookups
 define LIBGTK3_UPDATE_ICON_CACHE
-	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
-		-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
+	[ ! -d $(TARGET_DIR)/usr/share/icons ] || \
+		find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
+			-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
 endef
 LIBGTK3_TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
