Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8895EEEAA77
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21FB74046F;
	Thu, 14 Sep 2023 21:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21FB74046F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGfWwRp-6Uwy; Thu, 14 Sep 2023 21:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AC6B41902;
	Thu, 14 Sep 2023 21:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AC6B41902
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46A851BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D9D041904
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D9D041904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xka5DMrcFcDu for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:11:38 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32FBD4046F
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32FBD4046F
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4018af103bcso9829235e9.1
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 14:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694725896; x=1695330696;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=56GZqKJOYUxLV84qO1wEQ93VLvZm1pSOqYA4sFBYDp0=;
 b=L8VDQg4TDR9AGLr7oPcNCKnLbl13nzn2Q2FHJ9AkBiVWTsDu5GDCEnBbsZ6qAatLXf
 Wg5HpI7R4SS8ncx93kdkTG185017GQTWHfAKklO//UqYcJMRuZl3JHDnAMYQb3X39AGw
 vwbh6O+qMHgZaEbikbPMfpvNIbe0AGduQWRSDaaioZTetQoXgETHv+86YB6Zo4S2jjCn
 0gHkk/QKnwV/XzZjtv+NyIsEl0KXk/1obTirJzpTsdLPBPfYLT84DX+DLqbqg7KCWzax
 mgvpNWC+TuNzi5/NY3Z+0MWeWo09pn6QgVXbd2xjwMjRrTcGG47ejqlxKrAxnLVk9SoR
 Hqkg==
X-Gm-Message-State: AOJu0Yz0ka3GgEnphg/f4nJI6BIirDs3BYf2YGmvpvGNWDfMp1+rNVdk
 TahepUsLVYoO8E+Y4wVaZb4aW0srFHU=
X-Google-Smtp-Source: AGHT+IHK6Bh0BpCj2UpmQrlss7nQy+VFOYijQfWDSXSHz9qZzOU2llUWzJgi/5e/bxflrKpykJv86A==
X-Received: by 2002:a05:600c:ac3:b0:3fb:c075:b308 with SMTP id
 c3-20020a05600c0ac300b003fbc075b308mr2481002wmr.12.1694725895624; 
 Thu, 14 Sep 2023 14:11:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n11-20020a5d484b000000b00317ddccb0d1sm2688460wrs.24.2023.09.14.14.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 14:11:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 23:11:33 +0200
Message-Id: <20230914211133.451932-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694725896; x=1695330696; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=56GZqKJOYUxLV84qO1wEQ93VLvZm1pSOqYA4sFBYDp0=;
 b=D2YRhTSiRib7BsWZw57gwducxZl+lfvhfo54HJJsjEFUuNClcranOMuMbpTNgukp40
 ZwUDo9X/ZCcXEUqkOToopROl5Zoug0P9vTJNcM3kuFqh+P3cfurxRZtIbCfbwsnLa3cw
 rv3SYMWMMJ8kJWexhtVg49Dex36GCoRrNhQxnfmShLLXxQ6Waa17upf/xXBIkCU1ueZ7
 19aqe1QPNkZ2W3YoPtsHzxjA5Ab5cvpRF699KY6oeALi1bxJI5ColsTK9hPjZ8dDbHCl
 sENjreXs3myTY/2hbqPEIIxYxtovQZ/Cej7UnPNvetLkauMaRVuH0pw/1zq8eSX66/Y3
 6oxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=D2YRhTSi
Subject: [Buildroot] [PATCH 1/1] package/zbar: add ZBAR_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Volkov Viacheslav <sv99@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:zbar_project:zbar is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/438B9E70-F8E2-4318-83B5-46A0DF320CE3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zbar/zbar.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index fb83fa01d5..2c933929cf 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -9,6 +9,7 @@ ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
 ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
 ZBAR_LICENSE = LGPL-2.1+
 ZBAR_LICENSE_FILES = LICENSE.md
+ZBAR_CPE_ID_VENDOR = zbar_project
 ZBAR_INSTALL_STAGING = YES
 ZBAR_DEPENDENCIES = libv4l jpeg $(TARGET_NLS_DEPENDENCIES)
 # uses C99 features
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
