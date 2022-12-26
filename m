Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B566C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 13:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC2B7812F4;
	Mon, 26 Dec 2022 13:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC2B7812F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIFXQ8ML6YaM; Mon, 26 Dec 2022 13:02:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1141E812F1;
	Mon, 26 Dec 2022 13:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1141E812F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA4A91BF313
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 13:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5F6C60AAE
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 13:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5F6C60AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8O4XDrtUEW0 for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 13:02:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9809607CE
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9809607CE
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 13:02:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n3so9227398wrc.5
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 05:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ERbR6KZivQi/bmMs7f1ATFjs5hdr2SdJgobRp97BqIk=;
 b=ZGhyz1gwrZ5c5SueacVdRNXa3JAqvrk1aVku/p+vsmI8daANi7+Bs1QhXH2UJG2B4v
 Jjoodi903zj4hbzokZy50raQJm72WXFLuU8svQAPEEMCKUGe4ue0A/azrE6IJxXg++t7
 PkuaXubtHuDWxtEf0Vs7lPN+A1hUurC+ud1IBrayi03H+wxirGU2GKULksE4A9RCVWP6
 LS4KBaGFUBUYw5PwsXkzfyX/WlyRr/TaNkLDu9iFcX4HaReqha6Us7CL0JdJ8319hqUO
 QXrivKW9B0M2nnq/STkxm9ympSE6lGlRPJ+oCKEJiPX/jvxDL5pjzAzxavBw5W/xTgnm
 mW9w==
X-Gm-Message-State: AFqh2kpRIjVePm7J++eiGRanMkayRUSC1SsXSgQSvZwZPhS5UIYvjAlu
 6euFuxV5uJQaijAl4coOGnpYBmu941E=
X-Google-Smtp-Source: AMrXdXsqa7zi7pv2XzvJwBDM2TG+TzIaiOKkprYR673zPo0jF1S0FqUhUeoXisNKsF54ic9u/4+Nxw==
X-Received: by 2002:a5d:4e04:0:b0:242:32d7:8605 with SMTP id
 p4-20020a5d4e04000000b0024232d78605mr12873959wrt.47.1672059731447; 
 Mon, 26 Dec 2022 05:02:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t15-20020a5d534f000000b002365254ea42sm10396715wrv.1.2022.12.26.05.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 05:02:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 14:02:07 +0100
Message-Id: <20221226130207.649502-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ERbR6KZivQi/bmMs7f1ATFjs5hdr2SdJgobRp97BqIk=;
 b=JGeVTn8KtBqw3ng9V1Z6pMOtM8Tp9Oh/OVBLXZo7HsTlannbziIFv9DZwIgvCalTQP
 7OtvoxRhIp9IAsSWsd1v2c/rxqFNLuZxNq84Sh+CbT4n+fkGY2VBRntjR2TmxkNt+Z0R
 4/FD98vfPWqqyhsHc/BIFKZ17ypvomJAsFC7EXKBrhmaGdXdpExnHUIBjKiy/PcNt/oy
 FyswBhii4hYNkZ+V4RDgZc8BtoVWO7enQJjlcugPxy/bLsGb/iPOGxuuSKLLuHlXLqif
 j6mC1WpWgbGEHromycPrn+HJYBNI36zb1hybrwSexa/PEMfgKFUwTVSU8VToOHweMCCR
 1DAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JGeVTn8K
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: drop patch
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop path and set SYSTEMD="" if needed following upstream feedback:
https://github.com/opensvc/multipath-tools/pull/34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ble-systemd-if-ENABLE_SYSTEMD-is-def.patch | 35 -------------------
 package/multipath-tools/multipath-tools.mk    |  3 +-
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch

diff --git a/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch b/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
deleted file mode 100644
index 133094a7f7..0000000000
--- a/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8370da992c752e4238de7a8b02ce0e179353c959 Mon Sep 17 00:00:00 2001
-From: Alexander Egorenkov <egorenar-dev@posteo.net>
-Date: Sun, 6 Sep 2020 10:37:41 +0200
-Subject: [PATCH] Makefile.inc: Enable systemd if ENABLE_SYSTEMD is defined
-
-systemd is disabled by default, to activate it set ENABLE_SYSTEMD.
-
-Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
----
- Makefile.inc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile.inc b/Makefile.inc
-index d4d1e0dd..32bc1846 100644
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -35,6 +35,7 @@ ifndef RUN
- 	endif
- endif
- 
-+ifdef ENABLE_SYSTEMD
- ifndef SYSTEMD
- 	ifeq ($(shell pkg-config --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
- 		SYSTEMD = $(shell pkg-config --modversion libsystemd)
-@@ -45,6 +46,7 @@ ifndef SYSTEMD
- 		endif
- 	endif
- endif
-+endif
- 
- ifndef SYSTEMDPATH
- 	SYSTEMDPATH=usr/lib
--- 
-2.28.0
-
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index df3d5138e8..d6abf68ca0 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -31,7 +31,8 @@ MULTIPATH_TOOLS_MAKE_OPTS = \
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MULTIPATH_TOOLS_DEPENDENCIES += systemd
-MULTIPATH_TOOLS_MAKE_OPTS += ENABLE_SYSTEMD=1
+else
+MULTIPATH_TOOLS_MAKE_OPTS += SYSTEMD=""
 endif
 
 define MULTIPATH_TOOLS_BUILD_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
