Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551CBC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E161940918;
	Mon, 18 Dec 2023 18:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E161940918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2oqcILW6BRpE; Mon, 18 Dec 2023 18:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C7AE40926;
	Mon, 18 Dec 2023 18:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C7AE40926
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11691BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AC2982236
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC2982236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfxgDBJHHBa8 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:45 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02E8682202
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E8682202
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6d7750e2265so733834b3a.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925684; x=1703530484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVgfWwlhZ29s/SxeP6jmxMZe3IZH1C9yMS5Mpjhv98w=;
 b=aNkt6b0SXJWE0SCuUawXKV1gPBUVl7MZnwZpDjRvwdmZxiPzGFv6PPF4lqi4oIEHrE
 2wi9K0ZFW26zcX5625GPoWmjkHbX/DwFN+D7TEMk4Hed0VbX7nj5qsu1WE814iVrQd+1
 hp9Fy08nupkGWFKtxZ1R5Cu1EhDcSvw8j3dlejcrewMAchgCOEHOWW2I+OYRQRuB7tX0
 VNegmaQQ9QqWXlqTe0N7+ZqQ09g2K4h7BKbU6WLCYAECO6betOqF2zN0WT1Fgp8d0JPg
 XFzupbxfRdhiDI/F8T5JqJ2qV6eloEfqbusYXgRxxt7ZwN+j71vUhGZnbJke9Alv9o1l
 vZhw==
X-Gm-Message-State: AOJu0YygVmfQnmBjJdyhJy8GYbuQnVzHgcfYqfXovWRglsFQ/fRo6apX
 NXHMjoOo7V8V0OCwCA09Mn3lNrZ2YkYRIpdN2FI=
X-Google-Smtp-Source: AGHT+IEZjWhCIRhbdIy0jsdF2sTlerpvmz1Mbr9JXJD6w1vteMb94A4nYLX0+2uOm1aZk5iW+EOBIw==
X-Received: by 2002:a05:6a20:6a03:b0:187:c662:9b7e with SMTP id
 p3-20020a056a206a0300b00187c6629b7emr8701778pzk.25.1702925683977; 
 Mon, 18 Dec 2023 10:54:43 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:43 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:28 -0700
Message-ID: <20231218185440.506995-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925684; x=1703530484;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVgfWwlhZ29s/SxeP6jmxMZe3IZH1C9yMS5Mpjhv98w=;
 b=KJ1woV5WG1iBp18hbnf1LTzYiNL7UqaYXOZ6SyjoQhpGuQQqZJKlERGlPY2NB9bssI
 qTd/JKP5mz8qipZwDkKdaBMa38Oql2N0s69pw5HszvCS8EPPojyPNUDajlpgQrVI1eh2
 eKccTV2alPMvjEXWLGZBg3b28vG8N+RXmob5E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KJ1woV5W
Subject: [Buildroot] [PATCH v2 02/13] package/Config.in: move flutter-gallery
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a graphic application not a graphic library

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index bfa73b848c..09e8700ea6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
+	source "package/flutter-gallery/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
@@ -346,7 +347,6 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
-	source "package/flutter-gallery/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
