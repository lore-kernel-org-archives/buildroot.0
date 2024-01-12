Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9DEC47077
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D07642E0A;
	Fri, 12 Jan 2024 00:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D07642E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-KILs7BixlH; Fri, 12 Jan 2024 00:58:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61DA842DFB;
	Fri, 12 Jan 2024 00:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61DA842DFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2D71BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DB4240648
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DB4240648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rczi4LuL53aD for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:32 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 717C140124
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 717C140124
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3bd576ec101so587790b6e.2
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021050; x=1705625850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xs3h80KbYK7p7IuenZHmNFRhfgvSjBnYHdK0O6ChcAg=;
 b=heDf2WKfZLq0SYfdVkynfAA6qyM5YwSMhegvwi/wGLdVHgiKRZ3oRlQlvDQTMgAxVk
 +KkGOkvrAfOxL90doFCoeI3n2sNKBlj+ukHFxqAuetScaB1urmIEuYWeyKUrR2F57GhD
 81ZC+NJEIhRqRGLAqsHXaMrF2BOofPcyisjNWK9ur1VV4GU1fy1WR7NpVSQlvnSdWtP8
 w9jio2ZUpDQKzr6OF2aT+D4FhfCpWYysz4aL5o0LzZXeQwiQ7XrsjaI6FPi8QO63Ze2r
 TaqgmBx5XWGBLb6gnzEEpv5IyrFisE/3Gs03hS1/GLZJdaIvhTctTuq6ypUinEkolR+H
 emOQ==
X-Gm-Message-State: AOJu0YxwgXIRIpuoIzih0cRXle2cxQ65fGVucMhBjlu8q/YR7cgkOLtg
 KaCpoB9CQ/uhig5hDPZB+il6XbIoHUkzJ8mmxFgGOjQCetY=
X-Google-Smtp-Source: AGHT+IFFnwIKOM2pU7kP6J145FFyy8VidcrVvdQsuQSEyXiJi1iXD6MTVNiKWwemFL9Ny8nq++MHAw==
X-Received: by 2002:a05:6808:1143:b0:3bd:4a74:1e76 with SMTP id
 u3-20020a056808114300b003bd4a741e76mr234724oiu.56.1705021050700; 
 Thu, 11 Jan 2024 16:57:30 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:30 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:14 -0700
Message-ID: <20240112005719.1082305-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
References: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021050; x=1705625850;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xs3h80KbYK7p7IuenZHmNFRhfgvSjBnYHdK0O6ChcAg=;
 b=BnIKz5bDvatUXgC+GRVUptLj24H+1tTPUNXwspEJtz+5ojkmghWaPgrQYbRUuSehs9
 WdcSeJ1i1ZB1ZhN2fhq1eWg0fnTyRNhNmPwcsbk8EmNLfCLc+J3OYgL1KUDkECPBdega
 a/iDHCqRVHKLIVEuf4IRHyA9BvveI9bNq7cms=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BnIKz5bD
Subject: [Buildroot] [PATCH 05/10] package/flutter-engine: bump version to
 3.16.6
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index e972612097..e7801f399a 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.16.5
+FLUTTER_ENGINE_VERSION = 3.16.6
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
