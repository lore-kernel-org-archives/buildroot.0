Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DB2C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 12:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4807D80EA5;
	Mon, 27 Jan 2025 12:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfF9Mvs2VyYI; Mon, 27 Jan 2025 12:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5791A80EA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5791A80EA1;
	Mon, 27 Jan 2025 12:56:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ECD494A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 12:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 398B1403DB
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 12:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVT3bIzpzlU3 for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 12:56:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.48;
 helo=mail-wm1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2D854025E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2D854025E
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2D854025E
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 12:56:50 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso29226195e9.0
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 04:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737982608; x=1738587408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rSoi70m6+/JxxjR+R5/mRAYIFI9zKJrffIhq2ArC+MQ=;
 b=wdEukC6RRUjuQvcAETjDkUkv2pVwY9PNYzsLzNyMw7+WC13OgXwgdRhPRRKK0G7s8t
 p+1dY3hlgS8YdC5WrSPz+XP+nNTVgy4PYzkmi31n6LxpV/OWuvOLZjFEZVyQ8xIX7LZt
 P2UfS6FCejFXvrW8srrspyFpOjnIBdtYlJp0jpDT5TzNiGpXNuO/6m/UUw9MeTGPKdXo
 BWTBsv/OMr714XHjNUiELaULpgYTUM417Du6xZdMokmQsSpUfPOIYVWaEbiPYcMIlDp4
 5TYikNUqlw17t2ioqYFPwpDvDNDnehTPzo7e1Wt24lVT7ZeFllaFkKox5KbFoXu23nr6
 MdHQ==
X-Gm-Message-State: AOJu0YxeEY3ETfn+SHZanbTkmK5bzzoDTUQq12QmBj1+VoFPg8XW1CPZ
 WSCwGQUgoJ+C/a+iLs0umO5kNVyBP/lpKNpvMsLihzX4xTnqHKT3jN4vUg==
X-Gm-Gg: ASbGncus3CSHqLcdCMRz2q4kSJrIz46m2Iv9CPoAFGtXSiUJ/mcYo4DXdvy67SDdr+4
 8WK/3pLYZb7n8Rjwp3AJkM4dUFrbTFryx1Zwm4LSTsolKPCVAd8OoyOEbVRqm93x7o3JSJxTttq
 IDPsXL5+JD0AkUHUG4En3FddwkS4jaOjOAXLjvPBR0j+cYaY/zm10MPu++adkgSjEny1YpH8ZcM
 0zhmcq2LjD8Lmd0dFI451u9aCL1E28ZeQx8SAF466y4AbwKny6RpkFj8jspthXTcK0iIiIJHFfp
 vHDMuppCj2DEGm+7dIQQlDKgzL67aSJ7eDEVSfX+NMIMVPg/iZ3bYUQkkg==
X-Google-Smtp-Source: AGHT+IGHwl+yGniT2c9PXH75i5uvqdpkWPEtzQ8peqZiMb0GLII0Lcn8cVMymITTnpNuJ8L3ypF5Fg==
X-Received: by 2002:a05:600c:348c:b0:434:f1d5:1453 with SMTP id
 5b1f17b1804b1-438912dbfedmr403790735e9.0.1737982607738; 
 Mon, 27 Jan 2025 04:56:47 -0800 (PST)
Received: from thomas-Precision-7670.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4fa3e3sm133011635e9.3.2025.01.27.04.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 04:56:47 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 27 Jan 2025 13:56:42 +0100
Message-ID: <20250127125643.1758840-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <16d6d5fa0dc9be7c219a42b7f7046b2c@free.fr>
References: <16d6d5fa0dc9be7c219a42b7f7046b2c@free.fr>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH 1/2] package/fontconfig: fix compile issue if
 BR2_DEBUG_3 has been selected
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

src/fcobjshash.gperf:568:7: error: stray '#' in program
src/fcobjshash.gperf:1:18: error: expected '=', ',', ';', 'asm' or '__attribute__' before numeric constant
    1 | #define __STDC__ 1
      |                  ^

This issue has been raised upstream [1], and reported in buildroot [2].
Upstream has not yet defined a solution, so force it to -g2 for the time being.

Fixes:
 - https://autobuild.buildroot.org/results/6ae/6aef28611ad05d8db65105ab150ae980bc6bff4e/build-end.log
 - https://autobuild.buildroot.org/results/cc3/cc38846fdf63954422ec08d3ae57f2f09ebbf8c8/build-end.log
 - https://autobuild.buildroot.org/results/b7a/b7ad9a7ecb1d06b8a3d9e86d386195f3c212b9d8/build-end.log
 - ...

[1] https://gitlab.freedesktop.org/fontconfig/fontconfig/-/issues/436
[2] https://patchwork.ozlabs.org/comment/3450162/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/fontconfig/fontconfig.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index cc6ca88585..c6375979e8 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -20,5 +20,11 @@ FONTCONFIG_CONF_OPTS = \
 	-Dcache-dir=/var/cache/fontconfig \
 	-Ddoc=disabled
 
+FONTCONFIG_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_DEBUG_3),y)
+FONTCONFIG_CFLAGS += -g2
+endif
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
