Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9817BC35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 15:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5399942706;
	Thu, 21 Dec 2023 15:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5399942706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obSEeH2LyMfX; Thu, 21 Dec 2023 15:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ED2B42844;
	Thu, 21 Dec 2023 15:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED2B42844
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 242A31BF381
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F24A1813F9
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F24A1813F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQIKh3sNw6-d for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 15:36:34 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37CF781393
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 15:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37CF781393
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d3ea5cc137so7776135ad.0
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703172993; x=1703777793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZpz3Ip+dBkVngL9nx6xSf8KP5YFXtERk1LuXYY9jgw=;
 b=ZSLb8I6UgN0qpXfyyjn98pX/3/DdTRgO8TSgeIHdaL91Z1/AAPS7oKbSQqrZB/8XA/
 klOJJR5vAmBW1HRcpfDmpyOLJeSBammtpOyqF/Oxu3T88TKAAIX1+tZqxIuyDjRFA5S/
 NtuMik+zAp4t0aHMsFscW31PAQimXYeRsCVVRWF6DuFCS4BO8kdNHj1pznIB/n7AhIgf
 WLt/tP540VcXKw/KNI2bje/SED9Yb4hMDtyjO6uRiDO+hL0nF/+cNnw34/npEanMXuuu
 VvOjhMTimnZIrD7Gx6cKU1tM/Y+xLoXZSK3iabgOcEVPa7Icx8On0JnFtQyn0iiq2mRE
 LLWw==
X-Gm-Message-State: AOJu0Yw8TGElBq9D216jdKjMxu/lJGt7jTnHw+sfT7AkBzO7Fc0Z3Xkp
 ZixnM6yK9hfK6R4axanz71METX9+DqlJiikrtog=
X-Google-Smtp-Source: AGHT+IEMe/+G+pDIWlOsZmcRRv/7/YOfAefne+sKtuvIUZ3ISh/JfyLDIEZKuN8z5/D/hkr40HexQA==
X-Received: by 2002:a17:903:22c7:b0:1d0:7965:f530 with SMTP id
 y7-20020a17090322c700b001d07965f530mr25183366plg.88.1703172992959; 
 Thu, 21 Dec 2023 07:36:32 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001d0c41b1d03sm1792029plj.32.2023.12.21.07.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:36:32 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 08:36:19 -0700
Message-ID: <20231221153620.237439-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703172993; x=1703777793;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZpz3Ip+dBkVngL9nx6xSf8KP5YFXtERk1LuXYY9jgw=;
 b=FVKS2PU9C1Pc9dMhVFbNYUppsS+ojc1x1YA4Zti72YEcI41FaQr6SGpGc1KY/FisWs
 zv27lNAullxIm0WlO6HLxkkFojMqAK5WJQgkSbYgCnoyBIrEF9bxEHjXAdD0swbwBISg
 SUfUQPsTIfhRsErV8w+ArS5GjB0huTUQYUumk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FVKS2PU9
Subject: [Buildroot] [PATCH v4 10/10] package/sway/Config.in: Add a help
 note about the default terminal
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

The default terminal used by sway is the foot terminal. Add a note in
the Config.in explaining that if a user is using the default sway config,
it is recommended to also enable the foot package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 21840dce17..26fc06f8d2 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -21,6 +21,10 @@ config BR2_PACKAGE_SWAY
 	select BR2_PACKAGE_XKEYBOARD_CONFIG # runtime
 	help
 	  i3-compatible Wayland compositor
+	  Note:
+	    The default sway config uses the foot package as the
+	    default terminal. If you plan on using the default
+	    config, it is recommended to select the foot package!
 
 	  https://github.com/swaywm/sway
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
