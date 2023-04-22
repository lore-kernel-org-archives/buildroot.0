Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08E8C7618E
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 13:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F8BA60BA1;
	Sat, 22 Apr 2023 13:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F8BA60BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hI1-GNScSvnG; Sat, 22 Apr 2023 13:36:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5BAD60DCA;
	Sat, 22 Apr 2023 13:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5BAD60DCA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D24271C2909
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 13:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6F1B405BA
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 13:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6F1B405BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPtkQ_CFoev8 for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 13:36:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBDC8403C4
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBDC8403C4
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 13:36:22 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94a34a0b9e2so367069266b.1
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 06:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682170580; x=1684762580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9wVVaTxuwr05VV6Y2+Uu9CAa1M6U3mUzUObjDEJVNzQ=;
 b=Dl07PVJ2nRLdELBfqniNlv6Mv7KiLsXImpCDVpKgEGdDUd/+hPhkuhC+yPF8jpQILS
 33ZeRs9HOYxdrpOfDplKK35a5+EIBlUg3TSKKbD9ttFzrQP7sCSYv3rAfgNannx1BCfy
 +iCgcgLPsZPWsNoI5zcs91GKbZv61MS3lmUKmg6EUnDpC7W3j6ypWJFS21kyOqmHzkL6
 I53uACtJSrc8dfLY5iLufA/nn/gn9Sewt4wHFJVXIQsSAzgglURgJBdBTS11lMwTejed
 BxHXqVr/YACeIjCdn0hnoZtEzmpfPVeYbJoLcluhf/w1bsAA0OyWs3IbjDLI5axS/agT
 AZEg==
X-Gm-Message-State: AAQBX9egc21piAx8LBavOZSfZuJBkwRd4gkKskGXNzY+Dp65vduafRno
 0n/axYca+1yBnbFpu6q+F5iI7fpeQx4Yf9h1xMosqQ==
X-Google-Smtp-Source: AKy350YUfTG4jgnqsLfxk9HYeg7WUvKo12+XvnTJKSup7Fjieq0lnOmO5MEaN5zVwexRgv+ARLbGCQ==
X-Received: by 2002:a17:906:128f:b0:94e:de35:79c5 with SMTP id
 k15-20020a170906128f00b0094ede3579c5mr5291306ejb.70.1682170580111; 
 Sat, 22 Apr 2023 06:36:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-99-194.retail.telecomitalia.it. [87.5.99.194])
 by smtp.gmail.com with ESMTPSA id
 jy7-20020a170907762700b00947740a4373sm3275936ejc.81.2023.04.22.06.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 06:36:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 15:36:07 +0200
Message-Id: <20230422133607.607954-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682170580; x=1684762580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9wVVaTxuwr05VV6Y2+Uu9CAa1M6U3mUzUObjDEJVNzQ=;
 b=gMr5OKLhlOHUBLKmdmRjcRstgSWHLlmh+CuI3MkSWSvvFKDTOEHaE9hVB0UaHj1Qgm
 1f9FN68mffsCkFYppUp4n16rJf7EOeF5biP0+CTr4k0we5vYV11AJ5ekuHKUIO0Cfqg4
 l3tTxrLAea4zNlHy1l1BRfazvCOwizKZbqYAA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gMr5OKLh
Subject: [Buildroot] [PATCH 1/1] package/openocd: add the eCos exception to
 the GPL-2.0+ license
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
Cc: dario.binacchi@amarulasolutions.com,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As noted by Yann E. MORIN in [1] only the src/flash/nand/ecc.c file
refers to the eCos license.

The SPDX identifier for that file is:
SPDX-License-Identifier: GPL-2.0-or-later WITH eCos-exception-2.0

The file is part of the openocd executable via libopenocd.la, which being
a static library it is not installed.

Based on this, becomes more natural to associate the eCos exception with
the GPL 2.0+ license, rather than considering it separately as a license.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20230411203930.2455301-1-dario.binacchi@amarulasolutions.com/
Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/openocd/openocd.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 9973498cf568..78c6e10c58e4 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -8,14 +8,13 @@ OPENOCD_VERSION = 0.12.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
 OPENOCD_LICENSE = \
-	eCos-exception-2.0, \
 	BSD-1-clause, \
 	BSD-2-clause, \
 	BSD-2-Clause-Views, \
 	BSD-3-clause, \
 	BSD-Source-Code, \
 	GFDL-1.2-no-invariants-or-later (docs), \
-	GPL-2.0+ (code), \
+	GPL-2.0+ with eCos-exception-2.0 (code), \
 	GPL-3.0+ (stand-alone code), \
 	MIT
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
