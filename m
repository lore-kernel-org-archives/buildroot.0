Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935A2CD4F54
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 16:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2762F42AAE;
	Thu, 28 May 2026 16:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCt8NOybImc4; Thu, 28 May 2026 16:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21EDF42AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779987532;
	bh=J4si3IqrXbsNgMKtwwMl6+3HWYmzW7mj8jrNxY/3/nQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XnnG28kkSYE5UZ6Zb1N/h/fJr0FKfKh+FO5DkAe7htfybs5e8mTUnBZQnhDRFxosB
	 opcuyrT6tprUP/nmssw8LWaA7Q623Q1e3vxTjRo1M1Ly389QqTkKI822lC4pwXaOXc
	 ow751BvU5jmVzUGsttV7LAoClms8yId8rb5/7yiWfM3n8rm0xnUpaRs2K+QfBcRy0D
	 zeLZzs3SHCOeWdrAZtZyT8YiY0LdppKSvuqFn6iuzaJHVM1CaEORavABAC/uSmuesm
	 BEFGcIp1dtyNP6Kyzrg3oXmbM4P9NvThOgVjGQLW17o+p9U8VqcmJlK6jdkpawVAMv
	 xL4l5kyhl1k4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21EDF42AB0;
	Thu, 28 May 2026 16:58:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE45D288
 for <buildroot@buildroot.org>; Thu, 28 May 2026 16:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9354C4256B
 for <buildroot@buildroot.org>; Thu, 28 May 2026 16:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRc63vnB-ycz for <buildroot@buildroot.org>;
 Thu, 28 May 2026 16:58:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C933404A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C933404A8
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C933404A8
 for <buildroot@buildroot.org>; Thu, 28 May 2026 16:58:49 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2ba856db1c0so95157345ad.3
 for <buildroot@buildroot.org>; Thu, 28 May 2026 09:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779987529; x=1780592329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gz2zo5P3C4Elz5ouri/zybdsAiO1nUUfktmSMCxSE50=;
 b=USLYsPCsejODHBsI41C8t3pQpow4sL4f2OsmVR8nuCJXIbROZaOuhO2tVZyK0qIXxj
 gSud7ao9E3bzGA+QgHb0UTF3Wfro2MHUBYXHsCDJZNEHstJXitEx9/rlDiyvTDGCiO1Q
 FqxhVSufyeO69ZdJ8SSl+2vT0rT/MJIMGsHDy48E1qtoeFZ7KkoU5E9R7MPSjyxBYzC6
 O9qbuFcqeKnzm32mh1t2vVxIre2s4275ydwpk1dI05O2HYgPEvl12ih+qMcKTo+7wXqg
 Kpc/tH+gVftYtjMH+EDN1QYRJt0MWrrAEm4kDOPzdLiWPUgjHs3T0Q/HF7ysR+I5kPrC
 wCVA==
X-Gm-Message-State: AOJu0Yym4VkF5KA3KoTMsGvDuJG2m9QkG6NBjnDJ24L79667yCYt+ML+
 83mbudHVWqkrBnK898Ei/lkjDieAA38hN4NIxC8d9LhoopgaVJJspJilgtKU9RIX
X-Gm-Gg: Acq92OGZoVaLoiGfyBml8N5Cuk+1f2c6OTdKDIo6YQ9iOTCP3MLBPM5ga+pA/FDKTw6
 WUrHUEFyorn5zwqx8BJI0Lg0PoUSNXNwmupLqYknb0PjSaWeTaXmQAYYrfDnryu7CjPnqgsjQvO
 HndrrlIxHgN6ETxV29rqYPpffi040Wtye1k6nOBte+2Wnl1Qdpb9pH1CKWziAyzeWjP08p8kYsk
 K4sYkNwojipbLU3Wr3R2csTBGmbxrMOE3AwD/t3hVtxGhn52fq7jd679NAuywHlsw+eiAQ8yb4E
 aalrOIBTCANo9kvy1CEYHDdyiMZnhVCxDnPcvuItCyqQo5T6zkHgPLccLNb3Jp5WNtT/PZCwIIm
 SGyy/BqO9UzUHhwVXTAopAvMKwcmX2SYp6wXTN1XGo+nC/1TdcBA9ZsDi7EgOBECuMaY9bRVjfk
 6Nro8n9Y+x+bTQoEzT6oAsT3zxlvD/t4zZpsq7ZZ7QAx8rbp/9ls2q766rsqE1HH2J/QNd3t08z
 bB3b+vy
X-Received: by 2002:a17:903:1a23:b0:2b4:5cea:f61c with SMTP id
 d9443c01a7336-2beb0631933mr331209925ad.4.1779987528518; 
 Thu, 28 May 2026 09:58:48 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:11fc:6ef9:8efe:5b07:2a87:801f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf13d83264sm12309415ad.17.2026.05.28.09.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 09:58:47 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 28 May 2026 22:28:36 +0530
Message-ID: <20260528165838.14156-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779987529; x=1780592329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gz2zo5P3C4Elz5ouri/zybdsAiO1nUUfktmSMCxSE50=;
 b=jE3XX9J6QnlcHfK7u608zUdkj/PUSeC2cKw7R0jNlEZvX4jUx3sDMEu0qlv9SOECxS
 LESvA27k7aM6B5ZW3dyPnDj7FnVeF+v0U56sTz2Uzqe1caYGS1asMw8u6AglLejfLrNw
 /4oDCRAjbmV8XVc//aKNQ+m5y6Q+XFwJYnr+tj1FdTl2zMcPjWbrBPmqXbriglj98nQv
 3kVE1no8YSSxCZ+B72gEU4qxKq/GDVGOLOD2JYGYTEccvQVen6R2xuVBmgT7f3e7M3dr
 hlBqrkJALCX5jBT7v+RbG/lIhEBMTgowmV5u6deDExiCUGDXWURTRZnr7QOF+dAbfbRk
 9wKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jE3XX9J6
Subject: [Buildroot] [PATCH] package/libapparmor: bump version to 5.0.0
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

AppArmor 5.0 is a major new release of the AppArmor that is in development.

Changelog:
- https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_5.0.0

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/apparmor/apparmor.hash       | 4 ++--
 package/apparmor/apparmor.mk         | 4 ++--
 package/libapparmor/libapparmor.hash | 4 ++--
 package/libapparmor/libapparmor.mk   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index ef7dd81aaf..43c4b10de1 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.1
-sha256  f125aae32964e4e84443fec005f37f37abd5164f30620239c42864655a1b0281  apparmor-v4.1.1.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/releases/v5.0.0
+sha256  37494c3640baeca9301879baa6f741272c57ac121ec1fc3bc42b4a27f5bb93be  apparmor-v5.0.0.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index febd1d5eb0..54261d028f 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, please also update the libapparmor package
-APPARMOR_VERSION_MAJOR = 4.1
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).1
+APPARMOR_VERSION_MAJOR = 5.0
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).0
 APPARMOR_SOURCE = apparmor-v$(APPARMOR_VERSION).tar.gz
 APPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(APPARMOR_VERSION)
 APPARMOR_DL_SUBDIR = apparmor
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index d0603c0a3a..6e8391adfb 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.1
-sha256  f125aae32964e4e84443fec005f37f37abd5164f30620239c42864655a1b0281  apparmor-v4.1.1.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/releases/v5.0.0
+sha256  37494c3640baeca9301879baa6f741272c57ac121ec1fc3bc42b4a27f5bb93be  apparmor-v5.0.0.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 64442fcc16..a6dad38c74 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, please also update the apparmor package
-LIBAPPARMOR_VERSION_MAJOR = 4.1
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).1
+LIBAPPARMOR_VERSION_MAJOR = 5.0
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).0
 LIBAPPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
 LIBAPPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)
 LIBAPPARMOR_LICENSE = LGPL-2.1
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
