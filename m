Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D767DC7115B
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 08:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95268607B9;
	Thu, 26 Jun 2025 08:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRjHeg82x5q9; Thu, 26 Jun 2025 08:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E2260DB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6E2260DB5;
	Thu, 26 Jun 2025 08:30:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D908610A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2D5B80D17
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7dJI5gNxYjA for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 08:30:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96CE7811DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CE7811DC
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96CE7811DC
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:30:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso642822f8f.3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 01:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750926616; x=1751531416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Glx5m9fnxIgu9769XaEbH72EKlRk1D91w/jccr/flH4=;
 b=EU02UFIVsCn7nXuwqFRyxxjvN+ru5ji4R5qenPrUhrbS8ML5+BFbUoFsk7geBf3bxG
 7EV3Z+2kl4bGHs9VlQtweYTnQ0vbTcTdLtZrXzouVMZYppG9xNyiRUO7j5WPXz63gkc9
 AM4u4t+ab28FX0UURd/LvhT1hjzs6ISpEy2SoP0j8kBInqdDih1qaN7ltY8icBkIS3fU
 w9NVJuzLVvGrOfpWlaFh/2Im5p+PN9uZvMGMyG8Jj+eIx+UB5dqnhEw/BEfzgAh+QZ1U
 rxhTJ6Qc+70t7TErK1u06XBnQNKZbH86dtEDkfqAQt6QWZh9uicEOAHaJY9eHZUzLee5
 yqmA==
X-Gm-Message-State: AOJu0YxjPmqsCCTDm0IjejDBIJ0bNRYNkGfm4yTB2QEiNynlC6NafMSa
 W38KzfWA4XiWVGGZPIQgwmO/YxlNlXDY5o4szjyI3BaUaB8u5559lZJV6YF8HtuG8LGso+beOIU
 4/05A
X-Gm-Gg: ASbGncuYWSWGjYAODrnpzbhmoNFPAcg2+bwhB7Uz06TJF6FCeHQ5FDHfdgyc5niJrdR
 FE82cvHGQyHIxqYGtSlF/PscD6fGSDLzuCqqQH0pV7UeAmfpJ4Mlx2nttDW7i/gy+sF84SHORK0
 hCHzw9pCuT+9SswVY/aI9hlG+DVCPbDJNbL8KotFdO2yXlk/qs9vDFZwWBHT9I+lLAx6UeSFBJT
 IdRywEAkmFICWI6OAh+qwzRgXYauqlzArpSNGJOltjAwx7ntcqNLzRnVUuM2lryFer+vDkYqkqe
 Me6svL5yGr6iV7l3fdvDLzp3tIVSyPtArkirNGiU0tCMB4mdREWO16ko58Js/QunJ2tPB9MpWgm
 ZOM1jMw+TXcDfWkKEKQ==
X-Google-Smtp-Source: AGHT+IE6noh29Y3esuAtX+72O5RvcZVkTNerTokXODtnZiF7byxOyf3Jb6RRoDFcbGSEE3BYJxpSEg==
X-Received: by 2002:a05:6000:2dc6:b0:3a6:ec1b:5742 with SMTP id
 ffacd0b85a97d-3a6ed5dd5famr5046492f8f.22.1750926616486; 
 Thu, 26 Jun 2025 01:30:16 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e810b5eesm6628823f8f.85.2025.06.26.01.30.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 01:30:16 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 10:30:05 +0200
Message-ID: <20250626083005.537882-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626083005.537882-1-titouan.christophe@mind.be>
References: <20250626083005.537882-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750926616; x=1751531416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Glx5m9fnxIgu9769XaEbH72EKlRk1D91w/jccr/flH4=;
 b=I+40pF4K08gW6R61Uq5DVliEYti8prZBwFlrqM1H4qKawNwZEmhM6lgWSzqJSeSx4j
 C7/HUX71GUaUdvns7YZrPhwpjwtA7U37/lo3Lt9JJGrgYkWpNQWHu/m/Gco4xStBfdoA
 YFReWokYz49ZiP4GiC0gmqTiiRQPFYvyiNN3IGFLfVKAkv5hVfAYbAZ5tJFhho8y5zZR
 CRTiE39UJTAw+3kNEV5bS8ZvDZOm3o1vKJ6VaFqwdqnXYwocm+ZlzhF4blFTlRJrv3HX
 BxcnGSYpoWnyCqRu3TdZQ76obSl7Ev/BGUZR9zGSXQby+erJ48aD9nTRlKBf7kOwY7a2
 noUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=I+40pF4K
Subject: [Buildroot] [PATCH 2/2] pacakge/libmpeg2: add CPE_ID_VENDOR
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the moment, package stats indicates that libmpeg2 is affected by
https://nvd.nist.gov/vuln/detail/CVE-2022-37416

However, this CVE applies to a completely different piece of software,
that has the same name "libmpeg2" [1].

To avoid the confusion, let's add a proper CPE vendor to Buildroot's libmpeg2.
The library itself does not clearly identify any vendor name, and there isn't
any existing CPE on the NVD website. Since this library is not updated for
many years (maybe even before the introduction of the CPE system), but the
code is somehow related to the Videolan project, let's add this as the
vendor, which sould solve the matched CVE issue.

[1] https://github.com/ittiam-systems/libmpeg2

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libmpeg2/libmpeg2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index cab800162c..ec23dff57b 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -16,6 +16,8 @@ LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_AUTORECONF = YES
 LIBMPEG2_CONF_OPTS = --without-x --disable-directx
 
+LIBMPEG2_CPE_ID_VENDOR = videolan
+
 ifeq ($(BR2_PACKAGE_SDL),y)
 LIBMPEG2_CONF_ENV += ac_cv_prog_SDLCONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 LIBMPEG2_CONF_OPTS += --enable-sdl
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
