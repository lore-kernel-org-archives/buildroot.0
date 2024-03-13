Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13579C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D273240B2D;
	Wed, 13 Mar 2024 09:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1HAY4c6hVxw; Wed, 13 Mar 2024 09:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6E4D40B91
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6E4D40B91;
	Wed, 13 Mar 2024 09:15:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 440891BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29AA2813F2
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-s1l9K1dRuZ for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C180C81380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C180C81380
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C180C81380
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:30 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso101107991fa.2
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321268; x=1710926068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kWSF4ItjpAduCyVT/W006jS+XPiWqrMaeCilMv7npw=;
 b=OSkptWAalP78KYLvCh9biHCElIox+RAeI+4f0+/Cg/XZPc+7vhChWz3kjvZn9KYsfx
 VrKJDhMTilb1UK6yV/Upkeg2UiYd+MvdYe/Y1fut2WFgT6I4BKjHDRYESuq87r9dhDZp
 Nf21dxAdpnJMwV9ieIL+dUAb8Fqv7QtGpYn8xzvW1+Nsfm04lpqQfYy8UHrQru/psZia
 VwBNxtYkhtNmRH2fUGEAehIYk6xd7YqMc0zP/ur0Zd9KQL7Lv8aD4U8MxZ661qYFtX26
 1m5N8xW/OL3ffn8VK6upB6GjEntEic8Ete6DaF4fkgzBY2LldkaHZP9bgmMwb7jWQ38c
 KmzQ==
X-Gm-Message-State: AOJu0YwqdMCanKO1IPjzMsjibStM0eIu3ydFX/YU6I9uZsWrI5ADmQ70
 ERX9BHyownjJDFyeJ/PmjqiYdxadrQ7Deq5ZUij/N/Glms6Zv1RFVDd0x13v6CI=
X-Google-Smtp-Source: AGHT+IGVQl2X50WBIRmuAT3Z/VzHTC+D0sVM/KpsJiFER9u/0KkFImgi/GQZUVAMxtukGCt5XptOjA==
X-Received: by 2002:a2e:9e8a:0:b0:2d2:346a:f199 with SMTP id
 f10-20020a2e9e8a000000b002d2346af199mr7187752ljk.47.1710321268447; 
 Wed, 13 Mar 2024 02:14:28 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:54 +0100
Message-Id: <20240313091412.20865-13-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321268; x=1710926068; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kWSF4ItjpAduCyVT/W006jS+XPiWqrMaeCilMv7npw=;
 b=Dz7b8b4lbiDMcHPuxPE3LzHc1IoihA9eZfd1IYI3s+uFYYjGJoFYBMtt5fcYhV9/3Q
 WWME5/EP2E50QjJ4iO05CJYXzEDx6tmp9+EohAtdmbNV/PLJKMkuMxmjEcePjZpAVdom
 hVaW2NXOXlb9BDdBxZpRX5AYFJvHfBQWJpSx/g4ag/6PlMdDrtxrVYGweqJQzlVDg/hQ
 7rL2ofP/fBVnXQ5upHk9gf7AlDkoczecbRtcdB6U8qtvIA7y63WZcZyqgh7G0tRB83++
 AAEySakWM14B5cqzoNsQi4zkZ3E79hlBW4knB9tnJ0hnTBrypausPLUkoV5/afuefpyk
 FQVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Dz7b8b4l
Subject: [Buildroot] [PATCH 13/31] package/ifenslave: disable busybox
 ifenslave
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
 package/ifenslave/ifenslave.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ifenslave/ifenslave.mk b/package/ifenslave/ifenslave.mk
index b51aa7205..f3cca2b52 100644
--- a/package/ifenslave/ifenslave.mk
+++ b/package/ifenslave/ifenslave.mk
@@ -16,4 +16,8 @@ define IFENSLAVE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/ifenslave $(TARGET_DIR)/sbin/ifenslave
 endef
 
+define IFENSLAVE_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_IFENSLAVE)
+endef
+
 $(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
