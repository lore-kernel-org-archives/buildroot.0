Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E37C54E55
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 19:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14DB841C96;
	Fri,  1 Mar 2024 19:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8qA4X59Jx1a; Fri,  1 Mar 2024 19:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 120DC4193F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 120DC4193F;
	Fri,  1 Mar 2024 19:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B64C1BF322
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 19:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 352A8834F2
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 19:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3T3I-8l9XGw for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 19:41:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22E9483330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22E9483330
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22E9483330
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 19:41:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-412b83cfac4so17621425e9.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 11:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709322062; x=1709926862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QC5gfu9GufcBW/NTDovzpshYGwRdFWJT27c7pGfExLI=;
 b=UYv6GXWdV9CN5dXJmMUllFLiUwY7yI4+88GXGTaDNsO5ih+bM83zXUuMMdRCBeI76N
 3gwD7LFqKl0SuIRhgaHj2Rxs/+u21wQ3U0Fexc6L4cnVE+3Ac99evHrg8LKcsrCJhUYE
 6syCZiUgtjc+iPnJF8jcSRM/ts23baULv1tibojNsNEfoXn/sH2fL+ufibFHpz4E5jUm
 SFdiApaD+HI90tJcnUix30WhKWk0d3VwIkdGSlpz27M4UUvKwiTH6jsj28y9DXAgIxBE
 6zPIJYx1rxBfAODhwgpF6TwG8+rVwFVPA0QprWc7h0LT/XzwSjU5/zPZVULfGMUiFo98
 RGEw==
X-Gm-Message-State: AOJu0YzIyaLGUUtXFYqIVTTyw99TiIa2/2LWNXYIvhtCLb+Y74Htn9jM
 hrTncXIIqK1d3r4kXHcYuQRU4inQJ1e331uUcN0uA75YLPpoP77utW36vKAs
X-Google-Smtp-Source: AGHT+IFc+evmVpqwLhehy8PZZTT9aef5P21NyCiDAunQ1Gn5ERLTla3fP2lL/dY+wuY+3kIoqMtAXQ==
X-Received: by 2002:a05:600c:a3a5:b0:412:a4a8:8173 with SMTP id
 hn37-20020a05600ca3a500b00412a4a88173mr2388786wmb.10.1709322062054; 
 Fri, 01 Mar 2024 11:41:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b00412a0ce903dsm6393505wmq.46.2024.03.01.11.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 11:41:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 20:40:51 +0100
Message-ID: <20240301194051.843662-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709322062; x=1709926862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QC5gfu9GufcBW/NTDovzpshYGwRdFWJT27c7pGfExLI=;
 b=jFbHASR7ogJeJ5WgJaJXmV3Tp/x8TUmkWkHkIfrUHlTyup0rIwCZKUSj3zHukOkth3
 OXvWrencZYMuRUWMADVE65TaNYlfGW8UQUeZD5BFaFaU/2xZYCfJupmug7erNgbroYbi
 RxjwnOXfuOCQHFykS8//jqw7oY1Hi/hkwQMxn/yrCm3ZIbSraJJ48DJinhpOdy60jIKU
 3lY00aBVeKfg2fvPBEtyOkKWYZS87J27citkIFEC0CHj/G5z7vU326/57wwlHiaHY6gS
 SnhE9oumCMccSG+Fbz+HZ22RYgygZk04xKH5a+Lk2uxVlcpJSLtfqXV7eYnjc3DYGQ8K
 64dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jFbHASR7
Subject: [Buildroot] [PATCH 1/1] package/newlib-bare-metal: add CPE variables
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
Cc: Neal Frager <neal.frager@amd.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:newlib_project:newlib is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/822D4AAB-314B-4148-BE10-FCC59D1649BD

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/newlib-bare-metal/newlib-bare-metal.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index f27da4284b..9f5d765751 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -15,6 +15,8 @@ NEWLIB_BARE_METAL_LICENSE_FILES = \
 	COPYING.LIB \
 	COPYING.LIBGLOSS \
 	COPYING.NEWLIB
+NEWLIB_BARE_METAL_CPE_ID_VENDOR = newlib_project
+NEWLIB_BARE_METAL_CPE_ID_PRODUCT = newlib
 
 NEWLIB_BARE_METAL_INSTALL_STAGING = YES
 NEWLIB_BARE_METAL_INSTALL_TARGET = NO
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
