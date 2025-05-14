Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEF5C3ABDD
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B9E4607AD;
	Wed, 14 May 2025 16:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5W4mQHjL21R; Wed, 14 May 2025 16:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C15FF606CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C15FF606CB;
	Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00DE712A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8D6B414B6
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1sNO5y_9X5O for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFB7641215
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFB7641215
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFB7641215
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:30 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so408555e9.3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241909; x=1747846709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qYr2s3/FvU9XfZQWTDneh7BRnPfYv5zGwAb9NkC8X+o=;
 b=L6mqe6MdmeXgAd2v3OTBmvr2Tg+WloHAAy9qcMFoVs7w9nsbcqTXy59dTfuHgTPHSm
 pVaVfiWY+uR8OSLVD4ZAkLxsKab1IE4MsHJyVW30B+PjiUMrtDuFva6/mZFjlvLgbBFr
 Fm6v3xhDwqUytTzw3MAjD+MAc0mfLefMfzImF1I4G+hIKuu3zW+RmyeLUT3WKYf6wQcN
 Zzoujkb/OD+lJqh8mscqP/02jA7HiwhsndKLZZpFW3WVx/aLWLgiR79EuqvQ4H+amne8
 5rHwcKySLvu+ziX26KgHcItp4TNy92q1eVhF/nhOZQfHUdM2tNs5WhqNvTdxXHHzw28X
 AD3Q==
X-Gm-Message-State: AOJu0Yx6MPn75iAzZqLInJuRQRvZBSNVnj83oeXLd92cHT025Kivp3Qm
 Uy2ARsriVqhIHylpG7IRxILz7zalFi7Hq0dcmSGgzZz9y0hslJt3RMHkeQ==
X-Gm-Gg: ASbGncvlqDaFFtHL3jxFx4eafApMbEDo2cTWy6W9d7HpphP2k3AdIp33m/+w+bjZ2Cn
 EppDx1vulh03xiPQLQaPnQLJP8cJoydTHDBE5/ZMz7k2BjdHC4ZUPzL/Wo1xtcVw5MClwOrBHNB
 alqPTzP5gOQTqS0qBmnssaQ4VGk3GLYv6SbBEAviuqW+4fSk6Zx9Q3RYZA4mUMA7trHE6H+Qo51
 UpNWAWbTKtoDIzKXPXF8x/dv/QrQ5tTSr3vegT+uVgBlwcI5EvgrWiE1Ix3AfJTJP9q4eEHHU6o
 +wOZunq8WAkg5aOqaeOESN3f66juB013mm8JXLVGRiXhrrC3pqSOkRYFcjIFow==
X-Google-Smtp-Source: AGHT+IE1PEAlRYofzjPnIiOpT27sAmUZuugh3/GBhxleeyaQ2IzFcd7NjgzFVgYyecAY8zP6GNmdTw==
X-Received: by 2002:a05:600c:1385:b0:442:cd03:3e2 with SMTP id
 5b1f17b1804b1-442f20b9acamr34065615e9.2.1747241908762; 
 Wed, 14 May 2025 09:58:28 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:28 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 14 May 2025 18:58:14 +0200
Message-ID: <02ca8ddc5778a98a4d3b1b12b3947625e8bcad53.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241909; x=1747846709; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYr2s3/FvU9XfZQWTDneh7BRnPfYv5zGwAb9NkC8X+o=;
 b=g1YmlR/n0LLJywqaAKy5h56I0OgbFfZ1q/uotpgsayHyep2qgt5+B+fEt4eMKa4row
 4E2QBT7tw0Qeejpu4TTi6IMv2Z/y1DBzJCaITo0AHcfzQrvxwI3nq8LqTQfQ7HFK6orr
 yNgi/lyyaUfXPdP3Nis7q6K9oV53DLR4yg6inkHbwTTxSsvbbFDHHG05kgADZPc+g+Oz
 eJ8NBLJlo0xfA/VlY1QBTrVqqhcleCYW6+qfuosvNlgaGfk1Bp0cm0wCEulTmJf8m40i
 SVifWtNHYQLtsvRc+vaJkTmGpamX8WoZSY/ilD6qxPekmPwQ63DxPMdmlKWCZ53LLs5/
 QD/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g1YmlR/n
Subject: [Buildroot] [PATCH 02/13] system: drop superfluous negative
 condition for default PATH
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kconfig applies the default values in the order they are defined, and
stops at the first which condition is met. In this case, the two
conditions are mutually exclusive, so we can drop the second one. This
also makes it obvious there actually is a default value.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index f747fdbc56..2499dc8208 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -534,7 +534,7 @@ endif # BR2_ROOTFS_SKELETON_DEFAULT
 config BR2_SYSTEM_DEFAULT_PATH
 	string "Set the system's default PATH"
 	default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
-	default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
+	default "/bin:/sbin:/usr/bin:/usr/sbin"
 	help
 	  Sets the system's default PATH. It is being used in
 	  /etc/profile in the skeleton-init-common package and by some
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
