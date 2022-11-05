Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4255EC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC33160AB0;
	Sat,  5 Nov 2022 21:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC33160AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfWwqeFHaeeD; Sat,  5 Nov 2022 21:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 088B9607F6;
	Sat,  5 Nov 2022 21:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 088B9607F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAC3F1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1372408BD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1372408BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iEYryTWyuY3 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:57:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B583D40898
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B583D40898
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:57:23 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso7429481wme.5
 for <buildroot@buildroot.org>; Sat, 05 Nov 2022 14:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lh4+bumj/3hSFgKKEqVGr+mp+dnCBodv2/fhFK/wDZ8=;
 b=M97cPlTWBJdpvnupMgWmp0Mu697/yQm4WSXCy7bAhmLxEHOUQIoDyVbquK3dYF3rdq
 h/1WlEHsuSgEiy7AQWdnCxfYC7HmuO7eVyH+W28NY7ihat4uv89bWgaGCdVVa/LpR3fY
 alw8E/4jAm4WVTeCAr1QHmsPlouXMKHw3eIOMf8UHQZ9Y2WtPemNrWAr30BKG04DGriG
 Y3p7miL1QM6gJ7vmTdQ5Dm4V9DHKsXgLutrFZD/vqCRV5Lq6uaHAxW6UDptnA6XNDFjh
 FFOi0bW9WHyEoeIt7ZoYtqSwyExioYMEHjtyrU8mHwDw6HLYn24cIKLI7S8x5Y2g4ld2
 ERBQ==
X-Gm-Message-State: ACrzQf2GJRQzDo5Lem+P6102NtO88+PK5JmWrSO+JLfjulrs+lk4gCxj
 IW+hNObN1Noz9wRHAKEgP2mx/ke8iF8=
X-Google-Smtp-Source: AMsMyM4crKvusepc6zwnl5R0lr/wzQ5iOajqsD+0VlMB+4ZkB4EbVm9q8fK9N9f6ZxiEfQYbDO1uzA==
X-Received: by 2002:a05:600c:4e16:b0:3cf:a3e0:73e4 with SMTP id
 b22-20020a05600c4e1600b003cfa3e073e4mr71419wmq.21.1667685441624; 
 Sat, 05 Nov 2022 14:57:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g1-20020a7bc4c1000000b003b3365b38f9sm3681412wmk.10.2022.11.05.14.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 14:57:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Nov 2022 22:57:18 +0100
Message-Id: <20221105215718.647971-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lh4+bumj/3hSFgKKEqVGr+mp+dnCBodv2/fhFK/wDZ8=;
 b=YdMOCOXcJgoHnX6EB+KO3j796L5/5vs6PLJjas9Rl1hizriaMwWIpr6TDM/ewLQ0Ti
 UY4o3M2PkWEhfBJeYXbDPXLNl5Z6dZuQp1cQ3OcXPbGHJv2i/XqwdH2DAdYCJwGmVqxC
 MNjN7ohPcJGbl7k3Bj3qO+cK05h24JxdDA/C0CTJiXJ9aJLcKrxRtdfwighGoU4dY09O
 c/7QFnpFGtlmKqN/v0DiLQo0wgfwdhyyGhM2cIwI1gSk8YtfNU7NjZEFKqIbYB07asYV
 4+ieHu71QaFi7gEM0z/lgpa9PUtsYbn9ml9fu1Uq3CNSgGsKBKhQCOaV91jKdYxr6Ytw
 6cOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YdMOCOXc
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: perf needs threads
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised (at least) since linux 4.0 and
https://github.com/torvalds/linux/commit/459a3df76c99124fd222586be7f10f862547e7a9:

  CC      /home/autobuild/autobuild/instance-2/output-1/build/linux-6.0.1/tools/perf/builtin-bench.o
In file included from builtin-bench.c:22:
bench/bench.h:66:10: fatal error: pthread.h: No such file or directory
   66 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fies:
 - http://autobuild.buildroot.org/results/b6abd641f528101e74f9af33e54ccefe0731148f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 82e62f826e..8a0b6d5802 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -47,14 +47,15 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
 
 	  These tools are available only from kernel version 4.20.
 
-comment "perf needs a toolchain w/ dynamic library"
+comment "perf needs a toolchain w/ dynamic library, threads"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LINUX_TOOLS
 	help
 	  perf (sometimes "Perf Events" or perf tools, originally
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
