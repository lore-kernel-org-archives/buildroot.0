Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27911C61D99
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8972E81F53;
	Thu, 23 Nov 2023 00:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8972E81F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NdrQmM4yxv9Y; Thu, 23 Nov 2023 00:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E19D281F11;
	Thu, 23 Nov 2023 00:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E19D281F11
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCF0B1BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A512981EDD
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A512981EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iyb4iScNLgtR for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:26 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5EFA81ED5
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5EFA81ED5
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6c3363a2b93so374773b3a.3
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698104; x=1701302904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b3BPVwTOhHAQ0NUuvGX7Mlqr/X2hLN+ruCVeznMtu4M=;
 b=Nv13duY+/Q8SHfwKDwA4wo76XOUTS/hwe83Bg0utT3XDrrtUFincw/48MuFADayNbB
 X+4/fXzXVuBcwy7DLTPW99I/jF3Js4WdAdlrLMGv/sFRfQ9khNbqPTmPzVcoaknUmBuu
 NbPY5uvhKDgmujLJ9wqE5Kq8mDcZcomCSCxaryhQbA5fyjC5OtF1rDpF33OA2fqocxqh
 gyL8tqhzWvq75DdnTAIRdaISFX5iQwhwB5+/in1GiEOr9zVq864ElbXQ+Z2bPVV8clj0
 +7EdwBzVDMXzAT8haw92aqVWZysyZZHVOnbHlwbN1sQqLyL2AW+n0NNMY6N3BfozbqEy
 FUDg==
X-Gm-Message-State: AOJu0YzqT/eDi2qOm3eTLBN7vbGTqi58/X/e72qcQPscU+iFe7e0CgdA
 L4fwCfD6REZu57WPty2E6Lrbk9CnwCrRk+AT9O4=
X-Google-Smtp-Source: AGHT+IGQwvzxXZDryhrGeh/ndRmiX3zmPmmWvUtoGWcQwZh0ehaWK29bzLPYkwqr2IpB//qJv9W/jQ==
X-Received: by 2002:a05:6a20:e30b:b0:186:ff2d:f964 with SMTP id
 nb11-20020a056a20e30b00b00186ff2df964mr4384806pzb.36.1700698104317; 
 Wed, 22 Nov 2023 16:08:24 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:23 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:07 -0700
Message-ID: <20231123000819.488595-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
References: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698104; x=1701302904;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b3BPVwTOhHAQ0NUuvGX7Mlqr/X2hLN+ruCVeznMtu4M=;
 b=TkBP9EtheeOXVpy1dK7Xt+IE1ZN3KQ8L4YRsuJ/k288jv5yFIJbXxwE1UgHQtxtqXw
 +SBEh1f0+vbEDkswv3gaSbRWFnij4yjvurn7rQ7PQ8FUUJwrSdxsXUnHphvWgyewIufE
 EuDgarNsCKvtaz0IBfwVQtIDyvtxS5RZkPDWs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TkBP9Eth
Subject: [Buildroot] [PATCH/next 01/13] package/sway/Config.in: select
 BR2_PACKAGE_XKEYBOARD_CONFIG
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Much like weston, this is a runtime dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index f8d073520f..7c1e849bbc 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_SWAY
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_XKEYBOARD_CONFIG # Runtime dependency
 	help
 	  i3-compatible Wayland compositor
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
